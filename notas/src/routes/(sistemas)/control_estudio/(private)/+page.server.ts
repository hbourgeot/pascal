import type { PageServerLoad, Actions } from "./$types";
import { passwordAction } from "$lib/server/changePassword";

export const load = (async ({ locals: { controlEstudio } }) => {
  return { controlEstudio };
}) satisfies PageServerLoad;

export const actions: Actions = {
  ...passwordAction
}