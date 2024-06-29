import { fail } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";
import { systemLogger } from "$lib/server/logger";
import moment from "moment";

export const load = (async ({ locals: { client, coordinador } }) => {
  systemLogger.info(
    `${coordinador.nombre} está viendo las configuraciones del sistema`
  );
  const { ok, data } = await client.GET("/api/config/1");
  console.log(ok, data)

  if (!ok) return {};

  return {
    config: {
      ...data,
      cuota1: moment(data.cuota1).format("YYYY-MM-DD"),
      cuota2: moment(data.cuota2).format("YYYY-MM-DD"),
      cuota3: moment(data.cuota3).format("YYYY-MM-DD"),
      cuota4: moment(data.cuota4).format("YYYY-MM-DD"),
      cuota5: moment(data.cuota5).format("YYYY-MM-DD"),
      horario_inicio: moment(data.horario_inicio).format("YYYY-MM-DD"),
      horario_fin: moment(data.horario_fin).format("YYYY-MM-DD"),
  } };
}) satisfies PageServerLoad;

export const actions: Actions = {
  default: async ({ request, locals: { client, coordinador } }) => {
    const obj: any = Object.fromEntries(await request.formData());

    const { ok, data } = await client.PUT("/api/config/update/1", obj);
    if (!ok) return fail(400, { message: data.message });

    systemLogger.info(
      `${coordinador.nombre} cambió la configuración del sistema`
    );

    return { message: "Configuración cambiada!", ok: true };
  },
};
