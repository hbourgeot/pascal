import { passwordAction } from "$lib/server/changePassword";
import { fail } from "@sveltejs/kit";
import type { Docente, Materia } from "../../../../../app";
import type { Actions, PageServerLoad } from "./$types";

export const load: PageServerLoad = async ({
  locals: { client }
}) => {
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
      disponible: materia?.cantidad_estudiantes !== materia?.maximo,
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
  };
};

export const actions: Actions = {
  submit: async ({ locals: { client }, request }) => {
    const materia: Materia = Object.fromEntries(
      await request.formData()
    ) as unknown as Materia;

    const { ok, data } = await client.POST(
      "/api/materias/add",
      materia
    );
    if (!ok) {
      return fail(400, data);
    }

    return { message: "Materia registrada!" };
  },

  ...passwordAction,
};
