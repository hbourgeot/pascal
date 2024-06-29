import { fail } from "@sveltejs/kit";
import type { Coordinacion, Docente } from "../../../../../app";
import type { Actions, PageServerLoad } from "./$types";
import { systemLogger } from "$lib/server/logger";

export const load: PageServerLoad = async ({
  locals: { client, superUsuario },
}) => {
  const { ok, data } = await client.GET("/api/coordinacion");

  if (!ok) return {};

  systemLogger.info(
    `${superUsuario.nombre} ha entrado a ver los coordinadores registrados y puede que registre uno`
  );

  const coordinacion: Coordinacion[] = data.filter(
    (coordinacion: Docente, index: any, self: any) =>
      index === self.findIndex((t: Docente) => t.cedula === coordinacion.cedula)
  );

  return { coordinacion };
};

export const actions: Actions = {
  default: async ({ locals: { client, superUsuario }, request }) => {
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

    systemLogger.info(
      `${superUsuario.nombre} ha registrado a un coordinacion llamado ${payload.fullname}`
    );

    return { message: "Docente creado!" };
  },
};
