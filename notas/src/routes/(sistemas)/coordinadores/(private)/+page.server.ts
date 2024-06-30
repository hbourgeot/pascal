import { fail } from "@sveltejs/kit";
import type { PageServerLoad, Actions } from "./$types";
import { passwordAction } from "$lib/server/changePassword";

export const load = (async ({ locals: { coordinador } }) => {
  return { coordinador };
}) satisfies PageServerLoad;

export const actions: Actions = {
  default: async ({ locals: { client }, request }) => {
    const {
      endpoint,
      ...obj
    }: {
      current_password?: string;
      new_password?: string;
      endpoint?: string;
    } = Object.fromEntries(await request.formData()) as any;

    const { ok, status, data } = await client.PATCH(
      `/api/${endpoint}/update-password`,
      obj,
    );

    console.log(ok, status, data, "data")

    if (!ok) return fail(status, data.message);

    return { message: "Contraseña actualizada correctamente" };
  },

  ...passwordAction
};
