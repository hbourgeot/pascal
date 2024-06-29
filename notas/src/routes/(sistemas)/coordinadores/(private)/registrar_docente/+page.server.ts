import { fail } from "@sveltejs/kit";
import type { Docente } from "../../../../../app";
import type { Actions, PageServerLoad } from "./$types";
import { systemLogger } from "$lib/server/logger";

export const load: PageServerLoad = async ({
  locals: { client, coordinador },
}) => {
  let { ok, data } = await client.GET("/api/docente");

  if (!ok) return {};

  systemLogger.info(
    `${coordinador.nombre} ha entrado a ver los docentes registrados y puede que registre uno`
  );

  let docentes: Docente[] = data.docente.filter(
    (docente: Docente, index: any, self: any) =>
      index === self.findIndex((t: Docente) => t.cedula === docente.cedula)
  );

  return { docentes };
};

export const actions: Actions = {
  default: async ({ locals: { client, coordinador }, request }) => {
    const docente: Docente = Object.fromEntries(
      await request.formData()
    ) as unknown as Docente;

    const payload = {
      cedula: docente.cedula,
      fullname: docente.nombre,
      correo: docente.correo,
      password: docente.cedula.replace(/^(V-|E-)/g, ""),
      telefono: docente.telefono,
    };

    const { ok, status, data } = await client.POST("/api/docente/add", payload);
    if (!ok) {
      return fail(400, data);
    }

    systemLogger.info(
      `${coordinador.nombre} ha registrado a un docente llamado ${payload.fullname}`
    );

    return { message: "Docente creado!" };
  },
};
