import { fail } from "@sveltejs/kit";
import type { Coordinacion, Docente } from "../../../../../app";
import type { Actions, PageServerLoad } from "./$types";

export const load: PageServerLoad = async ({ locals: { client } }) => {
  const { ok, data } = await client.GET("/api/coordinacion");

  if (!ok) return {};

  const coordinadores: Coordinacion[] = data.filter(
    (coordinador: Docente, index: any, self: any) =>
      index === self.findIndex((t: Docente) => t.cedula === coordinador.cedula)
  );

  return { coordinadores };
};

export const actions: Actions = {
  default: async ({ locals: { client }, request }) => {
    const coordinador: Coordinacion = Object.fromEntries(
      await request.formData()
    ) as unknown as Docente;

    const payload = {
      cedula: coordinador.cedula,
      fullname: coordinador.nombre,
      correo: coordinador.correo,
      password: coordinador.cedula.replace(/^(V-|E-)/g, ""),
      telefono: coordinador.telefono,
    };

    const { ok, status, data } = await client.POST(
      "/api/coordinacion/add",
      payload
    );
    if (!ok) {
      return fail(400, data);
    }

    return { message: "Coordinador creado!" };
  },
};
