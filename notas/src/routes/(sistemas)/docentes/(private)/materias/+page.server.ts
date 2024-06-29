import { systemLogger } from "$lib/server/logger";
import type { PageServerLoad } from "./$types";

export const load = (async ({ locals: { client, docente } }) => {
  const { ok, status, data } = await client.GET(
    `/api/docente/${docente.cedula}`
  );
  if (!ok) return { docente: null, materias: [] };

  systemLogger.info(
    `${docente.nombre} ha entrado a ver las materias que imparte`
  );
  return { docente: data.docente, materias: data.materias };
}) satisfies PageServerLoad;
