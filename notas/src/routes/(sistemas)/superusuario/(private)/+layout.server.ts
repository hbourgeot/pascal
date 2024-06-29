import { redirect } from "@sveltejs/kit";
import type { LayoutServerLoad } from "./$types";

export const load = (async ({ locals: { superUsuario } }) => {
  if (!superUsuario) {
    throw redirect(302, "/superusuario/login");
  }

  return { nombre: superUsuario.nombre };
}) satisfies LayoutServerLoad;
