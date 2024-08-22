import { redirect } from "@sveltejs/kit";
import type { LayoutServerLoad } from "./$types";

export const load = (async ({ locals: { superUsuario } }) => {
  if (superUsuario && superUsuario?.message === undefined) {
    throw redirect(302, "/superusuario");
  }
}) satisfies LayoutServerLoad;
