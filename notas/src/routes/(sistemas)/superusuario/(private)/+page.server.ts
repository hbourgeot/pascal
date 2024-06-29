import type { PageServerLoad } from "./$types";

export const load = (async ({ locals: { superUsuario } }) => {
  return { superUsuario };
}) satisfies PageServerLoad;
