import { systemLogger } from "$lib/server/logger";
import { fail } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";

export const load = (async ({ params, locals: { controlEstudio, client } }) => {
  systemLogger.info(
    `${controlEstudio.nombre} ha entrado a ver la materia ${params.materia}`
  );
  const { ok, data } = await client.GET(`/api/materias/${params.materia}`);
  if (!ok) return { materia: null };

  const carrera = data.materia.carrera;
  const estudiantes = data.materia.estudiantes;
  const materia = {
    id: data.materia.id,
    nombre: data.materia.nombre,
  };
  return { carrera, estudiantes, materia };
}) satisfies PageServerLoad;

export const actions: Actions = {
  default: async ({
    params,
    cookies,
    request,
    locals: { client, controlEstudio },
  }) => {
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
    const cortes = ["primer corte", "segundo corte", "tercer corte"];
    systemLogger.warn(
      `¡Atención! ${controlEstudio.nombre} ha cambiado una nota del ${
        cortes[obj.nombre_campo - 1]
      } perteneciente al estudiante con cédula ${
        obj.id_estudiante
      } de la materia ${params.materia}`
    );
    return { message: "Modificado!" };
  },
};
