import { fail } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";
import type { Docente, Materia } from "../../../../../app";
import { systemLogger } from "$lib/server/logger";

export const load: PageServerLoad = async ({
  locals: { client, estudiante, config },
  cookies,
}) => {
  let headers = {
    Accept: "*/*",
    Authorization: cookies.get("access_token"),
  };

  let inicio = new Date(config.horario_inicio);
  let final = new Date(config.horario_fin);
  let hoy = new Date();

  if (hoy < inicio) {
    systemLogger.info(
      `El estudiante ${estudiante.nombre} ha intentado entrar al apartado de inscribir materias cuando aún no ha comenzado dicho proceso`
    );
    return {
      materias: [],
      estudiante: null,
      message: `Aun no puede inscribir materias. espere al ${inicio.getDate()}-${
        inicio.getMonth() + 1
      }`,
    };
  }

  if (hoy > final) {
    systemLogger.info(
      `El estudiante ${estudiante.nombre} ha intentado entrar al apartado de inscribir materias cuando ya ha finalizado dicho proceso`
    );
    return {
      materias: [],
      estudiante: null,
      message: `El periodo para inscribir materias ha acabado.`,
    };
  }

  const { ok, data } = await client.GET(
    `/api/materias/inscribir/${estudiante.cedula}`
  );

  if (!ok) {
    if (data.message.includes("Usted")) {
      const {
        ok,
        data: { materias },
      } = await client.GET("/api/students/horario", null, headers);
      console.log(materias);

      return { materias, estudiante, horarioHecho: true };
    }
    return { materias: [], message: data.message };
  }

  let materias: Materia[] = data.materias;

  const {
    ok: okey,
    data: { docente: docentes },
  }: { ok: boolean; data: { docente: Docente[] } } = await client.GET(
    "/api/docente"
  );
  // console.log(okey,docentes);
  if (!okey) {
    return { materias, estudiante, message: "", horarioHecho: false };
  }

  materias = materias.map((mat) => ({
    ...mat,
    disponible: mat?.cantidad_estudiantes !== mat?.maximo,
    docente: docentes.find((doc: Docente) => doc.cedula == mat.id_docente)
      ?.nombre,
  }));

  console.log(materias);

  systemLogger.warn(
    `El estudiante ${estudiante.nombre} entró a registrar su horario`
  );

  return {
    materias: materias,
    estudiante,
    message: "",
    horarioHecho: false,
  };
};

export const actions: Actions = {
  default: async ({ locals: { client, estudiante }, request, cookies }) => {
    const materiasIDs: string[] = (await request.formData()).getAll(
      "materias"
    ) as unknown as string[];

    let headers = {
      Accept: "*/*",
      Authorization: cookies.get("access_token"),
    };

    const {
      ok,
      data: { materias: materiasData },
    } = await client.GET(`/api/materias/inscribir/${estudiante.cedula}`);
    if (!ok) return fail(400, { message: "Error desconocido" });

    let materias = [];
    for (const materia of materiasIDs) {
      materias.push(materiasData.find((mat: Materia) => mat.id == materia));
    }

    // Primer bucle para verificar conflictos
    for (const materia of materiasIDs) {
      const currentMateria = materias.find((mat) => mat.id === materia);

      const materiaEnConflicto = checkMateriaConflict(currentMateria, materias); // Usando la función que definimos antes

      if (materiaEnConflicto) {
        return fail(400, {
          message: `La materia ${currentMateria.nombre} choca con ${materiaEnConflicto.nombre}`,
        });
      }
    }

    // Segundo bucle para hacer el POST si todo está bien
    for (const materia of materiasIDs) {
      const { ok, data } = await addMateria(client, materia, headers); // Usando la función que definimos antes
      if (!ok) {
        return fail(400, { message: data.message });
      }
    }

    systemLogger.warn(
      `El estudiante ${estudiante.nombre} ha terminado de registrar su horario satisfactoriamente`
    );

    return { message: "¡Su horario ha sido inscrito exitosamente!" };
  },
};

// Función para comprobar si hay conflicto de horarios entre materias
function checkMateriaConflict(currentMateria: Materia, materias: Materia[]) {
  const demasMaterias = materias.filter(
    (mat) => mat.id !== currentMateria.id && mat.dia === currentMateria.dia
  );

  const [currentHoraInicioH, currentHoraInicioM] = currentMateria.hora_inicio
    .split(":")
    .map(Number);
  const [currentHoraFinalH, currentHoraFinalM] = currentMateria.hora_fin
    .split(":")
    .map(Number);

  return demasMaterias.find((mat) => {
    const [matHoraInicioH, matHoraInicioM] = mat.hora_inicio
      .split(":")
      .map(Number);
    const [matHoraFinalH, matHoraFinalM] = mat.hora_fin.split(":").map(Number);

    return (
      ((matHoraInicioH > currentHoraInicioH ||
        (matHoraInicioH === currentHoraInicioH &&
          matHoraInicioM >= currentHoraInicioM)) &&
        (matHoraInicioH < currentHoraFinalH ||
          (matHoraInicioH === currentHoraFinalH &&
            matHoraInicioM < currentHoraFinalM))) ||
      ((matHoraFinalH > currentHoraInicioH ||
        (matHoraFinalH === currentHoraInicioH &&
          matHoraFinalM > currentHoraInicioM)) &&
        (matHoraFinalH < currentHoraFinalH ||
          (matHoraFinalH === currentHoraFinalH &&
            matHoraFinalM <= currentHoraFinalM)))
    );
  });
}

// Función para hacer el POST a la API
async function addMateria(client: any, materia: string, headers: object) {
  const { ok, data } = await client.POST(
    `/api/students/add-materia/${materia}`,
    null,
    headers
  );
  return { ok, data };
}
