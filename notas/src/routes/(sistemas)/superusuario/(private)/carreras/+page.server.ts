import { fail } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";
import { passwordAction } from "$lib/server/changePassword";

export const load = (async ({ locals: { client, superUsuario } }) => {
  const {
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

    return { message: "Modificado exitosamente!" };
  },

  ...passwordAction,
};
