import { fail, redirect } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";
import { passwordAction } from "$lib/server/changePassword";

let ciclo = "";
export const load = (async ({ params, locals: { client, docente } }) => {
  const { ok, data } = await client.GET(`/api/materias/${params.materia}`);
  if (!ok || data.materia.id === "") throw redirect(300, "/docentes/materias");

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

    if (!ok) return fail(400, { message: data.message });

    return { message: "Carga exitosa" };
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
    
    if (!ok)
      return {
        message:
          "Hubo un problema al realizar la petición, por favor intente de nuevo",
      };

    return { message: "Petición realizada" };
  },

  ...passwordAction,
};
