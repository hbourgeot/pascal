import { fail, redirect } from "@sveltejs/kit";
import type { PageServerLoad, Actions } from "./$types";
import { logInDocente } from "$lib/server/auth";

export const load = (async ({ locals: { docente } }) => {
  if (docente) {
    throw redirect(302, "/docentes");
  }

  return {};
}) satisfies PageServerLoad;

export const actions: Actions = {
  default: async (event) => {
    const { username, password }: { username?: string; password?: string } =
      Object.fromEntries(await event.request.formData());

    const { ok, data } = await logInDocente(event, { username, password });
    if (!ok) {
      return fail(400, { message: data.message });
    }
  },
};
