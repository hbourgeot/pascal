import { systemLogger } from "$lib/server/logger";
import { fail } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";

export const load = (async ({ locals: { client, superUsuario } }) => {
  systemLogger.info(
    `${superUsuario.nombre} va a ver, editar y/o crear carreras`
  );
  const {
    ok: carOk,
    data: { carreras },
  } = await client.GET("/api/carreras");

  return { carreras: carreras as { id: string; nombre: string }[] };
}) satisfies PageServerLoad;

export const actions: Actions = {
  post: async ({ request, locals: { client, superUsuario } }) => {
    const carrera: any = Object.fromEntries(await request.formData());

    const { ok, data } = await client.POST("/api/carreras/add", carrera);

    console.log(ok, data);

    if (!ok) return fail(400, { message: data.message });
    systemLogger.info(`${superUsuario.nombre} ha agregado una nueva carrera`);

    return { message: "Modificado exitosamente!" };
  },

  put: async ({ locals: { client, superUsuario }, request }) => {
    const carrera: any = Object.fromEntries(await request.formData());
    console.log(carrera);

    const { ok, data } = await client.PUT(
      "/api/carreras/update/" + carrera.id,
      carrera
    );

    console.log(ok, data);

    if (!ok) return fail(400, { message: data.message });

    systemLogger.info(
      `${superUsuario.nombre} ha editado la carrera ${carrera.id}`
    );

    return { message: "Modificado exitosamente!" };
  },
};
