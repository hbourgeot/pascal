import { fail, redirect } from "@sveltejs/kit";
import type { PageServerLoad, Actions } from "./$types";
import { logInControlEstudio } from "$lib/server/auth";

export const load = (async ({ locals: { controlEstudio } }) => {
  if (controlEstudio) {
    throw redirect(302, "/control_estudio");
  }

  return {};
}) satisfies PageServerLoad;

export const actions: Actions = {
  default: async (event) => {
    const { username, password }: { username?: string; password?: string } =
      Object.fromEntries(await event.request.formData());

    const { ok, data } = await logInControlEstudio(event, {
      username,
      password,
    });

    if (!ok) {
      return fail(400, { message: data.message });
    }
  },
};
