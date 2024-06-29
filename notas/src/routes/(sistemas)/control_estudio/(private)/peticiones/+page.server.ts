import { systemLogger } from "$lib/server/logger";
import type { Peticiones } from "../../../../../app";
import type { Actions, PageServerLoad } from "./$types";

export const load = (async ({ locals: { client, controlEstudio } }) => {
  systemLogger.info(`${controlEstudio.nombre} ha entrado a ver las peticiones`);
  const { ok, data } = await client.GET("/api/peticiones");
  if (!ok) return { peticiones: [] };

  const peticiones: Peticiones[] = data;

  console.log(peticiones);

  return { peticiones };
}) satisfies PageServerLoad;

export const actions: Actions = {
  aprobar: async ({ locals: { client, controlEstudio }, request }) => {
    const { peticion }: { peticion?: string } = Object.fromEntries(
      await request.formData()
    );

    systemLogger.info(
      `${controlEstudio.nombre} ha aprobado la peticion #${peticion}`
    );

    const payload = {
      estado: "Aprobado",
    };

    const { ok, data } = await client.PATCH(
      `/api/peticiones/update/${peticion}`,
      payload
    );
  },

  denegar: async ({ locals: { client, controlEstudio }, request }) => {
    const { peticion }: { peticion?: string } = Object.fromEntries(
      await request.formData()
    );

    systemLogger.info(
      `${controlEstudio.nombre} ha denegado la peticion #${peticion}`
    );

    const payload = {
      estado: "Denegado",
    };

    const { ok, data } = await client.PATCH(
      `/api/peticiones/update/${peticion}`,
      payload
    );
  },
};
