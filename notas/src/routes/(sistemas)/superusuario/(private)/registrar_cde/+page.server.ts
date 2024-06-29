import { fail } from "@sveltejs/kit";
import type { ControlEstudio, Docente } from "../../../../../app";
import type { Actions, PageServerLoad } from "./$types";
import { systemLogger } from "$lib/server/logger";

export const load: PageServerLoad = async ({
  locals: { client, superUsuario },
}) => {
  const { ok, data } = await client.GET("/api/control");

  if (!ok) return {};

  systemLogger.info(
    `${superUsuario.nombre} ha entrado a ver al personal de control de estudios registrado y puede que registre uno`
  );

  const controlEstudio: ControlEstudio[] = data.filter(
    (control: ControlEstudio, index: any, self: any) =>
      index === self.findIndex((t: Docente) => t.cedula === control.cedula)
  );

  return { controlEstudio };
};

export const actions: Actions = {
  default: async ({ locals: { client, superUsuario }, request }) => {
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

    systemLogger.info(
      `${superUsuario.nombre} ha registrado a un control llamado ${payload.fullname}`
    );

    return { message: "Personal creado!" };
  },
};
