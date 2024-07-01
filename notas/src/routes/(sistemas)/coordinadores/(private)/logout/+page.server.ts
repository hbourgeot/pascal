import { logOut } from "$lib/server/auth";
import { redirect } from "@sveltejs/kit";
import type { Actions } from "./$types";

export const actions: Actions = {
  default: async (event) => {
    await logOut(event, { path: "/coordinadores" });

    throw redirect(302, `/coordinadores/login`);
  },
};
