import { fail, redirect } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";
import { systemLogger } from "$lib/server/logger";

let ciclo = "";
export const load = (async ({ params, locals: { client, docente } }) => {
  const { ok, data } = await client.GET(`/api/materias/${params.materia}`);
  if (!ok || data.materia.id === "") throw redirect(300, "/docentes/materias");

  systemLogger.info(
    `El docente ${docente.nombre} está viendo su materia ${params.materia}`
  );

  const carrera = data.materia.carrera;
  const estudiantes = data.materia.estudiantes;
  ciclo = data.ciclo;
  const materia = {
    id: data.materia.id,
    nombre: data.materia.nombre,
  };

  return { carrera, estudiantes, materia, ciclo };
}) satisfies PageServerLoad;

export const actions: Actions = {
  notas: async ({ params, cookies, request, locals: { client, docente } }) => {
    const campo = ["nota1", "nota2", "nota3"];
    let obj: any = Object.fromEntries(await request.formData());

    obj = {
      ...obj,
      nombre_campo: campo[obj.nombre_campo - 1],
      materia: params.materia,
    };

    let headers = {
      Accept: "*/*",
      "Content-Type": "application/json",
      Authorization: cookies.get("access_token"),
    };

    const { ok, data } = await client.PATCH(
      "/api/docente/upload",
      obj,
      headers
    );

    if (!ok) return fail(400, { message: data.message });

    systemLogger.warn(
      `El docente ${docente.nombre} está subiendo notas del estudiante ${obj.cedula_estudiante}`
    );
    return { message: "Modificado!" };
  },

  carga: async ({ request, locals: { client, docente }, params }) => {
    // @ts-ignore
    const { files } = Object.fromEntries(
      await request.formData()
    ) as unknown as File;

    const formData = new FormData();
    formData.append("file", files, "planificacion.pdf");
    formData.append("folder", params.materia);
    formData.append("ciclo", ciclo);

    const { ok, data } = await client.POST(`/api/archivos/upload`, formData);

    systemLogger.info(
      `El docente ${docente.nombre} cargó su planificación en formato PDF`
    );
  },

  peticion: async ({ params, locals: { client, docente }, request }) => {
    const campo = ["nota1", "nota2", "nota3"];
    let obj: any = Object.fromEntries(await request.formData());

    obj = {
      ...obj,
      campo: campo[obj.nombre_campo - 1],
      id_materia: params.materia,
      estado: "Pendiente",
      id_docente: docente.cedula,
    };

    const { ok, data } = await client.POST("/api/peticiones/add", obj);
    systemLogger.warn(
      `El docente ${docente.nombre} realizó una petición de modificación de nota del corte nro ${obj.nombre_campo} en la materia ${params.materia} para el estudiante ${obj.id_estudiante}`
    );
    if (!ok)
      return {
        message:
          "Hubo un problema al realizar la petición, por favor intente de nuevo",
      };

    return { message: "Petición realizada" };
  },
};
