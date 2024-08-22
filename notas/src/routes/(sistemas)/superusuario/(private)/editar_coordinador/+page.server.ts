import { fail } from "@sveltejs/kit";
import type { Coordinacion, Docente } from "../../../../../app";
import type { Actions, PageServerLoad } from "./$types";
import { passwordAction } from "$lib/server/changePassword";

export const load: PageServerLoad = async ({ locals: { client } }) => {
  const { ok, data } = await client.GET("/api/coordinacion");

  if (!ok) return {};

  const coordinacion: Coordinacion[] = data.filter(
    (coordinacion: Docente, index: any, self: any) =>
      index === self.findIndex((t: Docente) => t.cedula === coordinacion.cedula)
  );

  return { coordinacion };
};

export const actions: Actions = {
  submit: async ({ locals: { client }, request }) => {
    const coordinacion: Coordinacion = Object.fromEntries(
      await request.formData()
    ) as unknown as Docente;

    const payload = {
      cedula: coordinacion.cedula,
      fullname: coordinacion.nombre,
      correo: coordinacion.correo,
      password: coordinacion.cedula.replace(/^(V-|E-)/g, ""),
      telefono: coordinacion.telefono,
    };

    const { ok, status, data } = await client.PUT(
      "/api/coordinacion/update/" + coordinacion.cedula,
      payload
    );
    if (!ok) {
      return fail(400, data);
    }

    return { message: "Docente creado!" };
  },

  ...passwordAction,
};
