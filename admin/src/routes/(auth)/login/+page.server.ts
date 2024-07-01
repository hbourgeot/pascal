import { fail, redirect } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";

export const load: PageServerLoad = async ({ locals: { user } }) => {
  if (user) {
    throw redirect(300, "/inicio");
  }

  return {};
};

export const actions: Actions = {
  default: async ({cookies, request, locals:{client}}) => {
    const { username, password }: { username: string; password: string } =
      Object.fromEntries(await request.formData()) as {
        username: string;
        password: string;
      };

    const { ok, data } = await client.POST("/api/usuario/login", {
      usuario: username,
      clave: password,
    });

    console.log(ok,data);
    if (!ok) {
      return fail(400, {message: 'Correo y/o clave incorrectos'})
    }

    cookies.set("access_token", data.access_token, {
      httpOnly: true,
      path: "/",
    });

    throw redirect(300, "/inicio");
  },
};
