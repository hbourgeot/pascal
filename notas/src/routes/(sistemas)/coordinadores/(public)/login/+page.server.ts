import { fail, redirect } from "@sveltejs/kit";
import type { PageServerLoad, Actions } from "./$types";
import { logInCoordinacion } from "$lib/server/auth";

export const load = (async ({ locals: { estudiante } }) => {
  if (estudiante) {
    throw redirect(302, "/estudiantes");
  }

  return {};
}) satisfies PageServerLoad;

export const actions: Actions = {
  default: async (event) => {
    const { username, password }: { username?: string; password?: string } =
      Object.fromEntries(await event.request.formData());

    const { ok, data } = await logInCoordinacion(event, { username, password });

    if (!ok) {
      return fail(400, { message: data.message });
    }
  },
};
