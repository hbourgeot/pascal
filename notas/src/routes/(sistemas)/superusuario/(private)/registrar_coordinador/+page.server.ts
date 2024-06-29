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
    `${superUsuario.nombre} ha entrado a ver los coordinadors registrados y puede que registre uno`
  );

  const coordinadores: Coordinacion[] = data.filter(
    (coordinador: Docente, index: any, self: any) =>
      index === self.findIndex((t: Docente) => t.cedula === coordinador.cedula)
  );

  return { coordinadores };
};

export const actions: Actions = {
  default: async ({ locals: { client, superUsuario }, request }) => {
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

    systemLogger.info(
      `${superUsuario.nombre} ha registrado a un coordinador llamado ${payload.fullname}`
    );

    return { message: "Coordinador creado!" };
  },
};
