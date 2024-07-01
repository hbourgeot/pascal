import { fail } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";
import { passwordAction } from "$lib/server/changePassword";

export const load = (async ({ params, locals: { controlEstudio, client } }) => {
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
    return { message: "Modificado!" };
  },

  ...passwordAction,
};
