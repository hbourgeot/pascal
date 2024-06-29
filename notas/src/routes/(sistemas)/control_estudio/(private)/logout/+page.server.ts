import { logOut } from "$lib/server/auth";
import { redirect } from "@sveltejs/kit";
import type { Actions } from "./$types";
import { systemLogger } from "../../../../../lib/server/logger";

export const actions: Actions = {
  default: async (event) => {
    await logOut(event, { path: "/control_estudio" });
    const nombre = event.url.searchParams.get("nombre") ?? "";
    systemLogger.info(
      `El personal de control de estudio ${nombre} ha cerrado sesión`
    );

    throw redirect(302, `/control_estudio/login`);
  },
};
