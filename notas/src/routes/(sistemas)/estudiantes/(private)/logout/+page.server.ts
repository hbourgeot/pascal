import { logOut } from "$lib/server/auth";
import { redirect } from "@sveltejs/kit";
import type { Actions } from "./$types";

export const actions: Actions = {
  default: async (event) => {
    try {
      await logOut(event, { path: "/estudiantes" });
    } catch (e) {
      console.log(e);
    }
    throw redirect(302, `/estudiantes/login`);
  },
};
