import { fail } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";
import type { Docente, Materia } from "../../../../../app";
import { passwordAction } from "$lib/server/changePassword";

export const load = (async ({ locals: { client, coordinador, config } }) => {
  const { ok, data } = await client.GET("/api/docente");
  if (!ok) {
    return { docentes: [], materias: [], autocom: [] };
  }

  let docentes: Docente[] = data.docente
    .map((docente: Docente) => ({
      cedula: docente.cedula,
      nombre: docente.nombre,
    }))
    .filter(
      (docente: Docente, index: any, self: any) =>
        index === self.findIndex((t: Docente) => t.cedula === docente.cedula)
    );

  const { ok: okey, data: dataMat } = await client.GET("/api/materias");
  if (!okey) {
    return { docentes: docentes, materias: [], autocom: [] };
  }

  const materias: string[] = dataMat.materias
    .filter((materia: Materia) => materia.id !== null)
    .map((materia: Materia) => materia.id);

  const materiasAutocomplete = dataMat.materias
    .filter((materia: Materia) => materia.id !== null)
    .map((materia: Materia) => ({
      nombre: materia.nombre,
      id: materia.id,
      disponible: materia.cantidad_estudiantes !== materia.maximo,
      semestre: materia.semestre,
    }));

  const {
    data: { carreras },
  } = await client.GET("/api/carreras");

  return {
    docentes,
    materias,
    list: materiasAutocomplete,
    carreras: carreras,
    tableMaterias: dataMat.materias.filter(
      (materia: Materia) => materia.id !== null
    ),
  };
}) satisfies PageServerLoad;

export const actions: Actions = {
  submit: async ({ locals: { client }, request }) => {
    const materia: any = Object.fromEntries(await request.formData());
    console.log(materia);

    const { ok, data } = await client.PUT(
      "/api/materias/update/" + materia.id,
      materia
    );

    console.log(ok, data);

    if (!ok) return fail(400, { message: data.message });

    return { message: "Modificado exitosamente!" };
  },

  ...passwordAction,
};
