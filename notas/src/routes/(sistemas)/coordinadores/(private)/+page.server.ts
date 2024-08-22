import { fail } from "@sveltejs/kit";
import type { PageServerLoad, Actions } from "./$types";
import { passwordAction } from "$lib/server/changePassword";

export const load = (async ({ locals: { coordinador } }) => {
  return { coordinador };
}) satisfies PageServerLoad;

export const actions: Actions = {
  ...passwordAction
};
