import { fail } from "@sveltejs/kit";
import type { ControlEstudio, Docente } from "../../../../../app";
import type { Actions, PageServerLoad } from "./$types";
import { passwordAction } from "$lib/server/changePassword";

export const load: PageServerLoad = async ({ locals: { client } }) => {
  const { ok, data } = await client.GET("/api/control");

  if (!ok) return {};

  const controlEstudio: ControlEstudio[] = data.filter(
    (control: ControlEstudio, index: any, self: any) =>
      index === self.findIndex((t: Docente) => t.cedula === control.cedula)
  );

  return { controlEstudio };
};

export const actions: Actions = {
  default: async ({ locals: { client }, request }) => {
    const control: ControlEstudio = Object.fromEntries(
      await request.formData()
    ) as unknown as ControlEstudio;

    const payload = {
      cedula: control.cedula,
      fullname: control.nombre,
      correo: control.correo,
      password: control.cedula.replace(/^(V-|E-)/g, ""),
      telefono: control.telefono,
    };

    const { ok, status, data } = await client.POST("/api/control/add", payload);
    if (!ok) {
      return fail(400, data);
    }

    return { message: "Personal creado!" };
  },

  ...passwordAction,
};
