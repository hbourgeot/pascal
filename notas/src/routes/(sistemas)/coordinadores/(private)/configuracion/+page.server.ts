import { passwordAction } from "$lib/server/changePassword";
import { fail } from "@sveltejs/kit";
import moment from "moment";
import type { Actions, PageServerLoad } from "./$types";

export const load = (async ({ locals: { client, coordinador } }) => {
  const { ok, data } = await client.GET("/api/config/1");
  console.log(ok, data);

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
    },
  };
}) satisfies PageServerLoad;

export const actions: Actions = {
  default: async ({ request, locals: { client } }) => {
    const obj: any = Object.fromEntries(await request.formData());

    const { ok, data } = await client.PUT("/api/config/update/1", obj);
    if (!ok) return fail(400, { message: data.message });

    return { message: "Configuración cambiada!", ok: true };
  },

  ...passwordAction,
};
