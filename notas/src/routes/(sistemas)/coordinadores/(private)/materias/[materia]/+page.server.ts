import { fail, redirect } from "@sveltejs/kit";
import type { PageServerLoad, Actions } from "./$types";
import { passwordAction } from "$lib/server/changePassword";

export const load = (async ({ params, locals: { client } }) => {
  if (params.materia === "editar") throw redirect(302, "/materias/editar");
  
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
  ...passwordAction
}
