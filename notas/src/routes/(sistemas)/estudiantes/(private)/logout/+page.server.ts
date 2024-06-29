import { logOut } from "$lib/server/auth";
import { redirect } from "@sveltejs/kit";
import type { Actions } from "./$types";
import { systemLogger } from "$lib/server/logger";

export const actions: Actions = {
  default: async (event) => {
    const nombre = event.url.searchParams.get("nombre") ?? "";
    try {
      await logOut(event, { path: "/estudiantes" });
      systemLogger.info(`El estudiante ${nombre} ha cerrado sesión`);
    } catch (e) {
      console.log(e);
    }
    throw redirect(302, `/estudiantes/login`);
  },
};
