import type { Actions } from "@sveltejs/kit";

export const passwordAction: Actions = {
  changePassword: async ({ locals: { client }, request }) => {
    const {
      endpoint,
      token,
      ...obj
    }: {
      current_password?: string;
      new_password?: string;
      endpoint?: string;
      token?: string;
    } = Object.fromEntries(await request.formData()) as any;

    const { ok, status, data } = await client.PATCH(
      `/api/${endpoint}/update-password`,
      obj,
      {
        headers: {
          Authorization: token,
        },
      }
    );

    if (!ok) return { status, errors: { message: data.message } };

    return { message: "Contraseña actualizada correctamente" };
  },
};
