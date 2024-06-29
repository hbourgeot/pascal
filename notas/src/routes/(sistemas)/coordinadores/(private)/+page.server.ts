import type { PageServerLoad } from "./$types";

export const load = (async ({ locals: { coordinador } }) => {
  return { coordinador };
}) satisfies PageServerLoad;
