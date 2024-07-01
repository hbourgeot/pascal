import type { PageServerLoad, Actions } from "./$types";
import { passwordAction } from "$lib/server/changePassword";

export const load = (async ({ locals: { client, docente } }) => {
  const { ok, status, data } = await client.GET(
    `/api/docente/${docente.cedula}`
  );
  if (!ok) return { docente: null, materias: [] };

  return { docente: data.docente, materias: data.materias };
}) satisfies PageServerLoad;

export const actions: Actions = {
  ...passwordAction
}