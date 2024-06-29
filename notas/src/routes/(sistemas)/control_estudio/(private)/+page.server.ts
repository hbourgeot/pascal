import type { PageServerLoad } from "./$types";

export const load = (async ({ locals: { controlEstudio } }) => {
  return { controlEstudio };
}) satisfies PageServerLoad;
