import { redirect } from "@sveltejs/kit";
import type { LayoutServerLoad } from "./$types";

export const load = (async ({ locals: { coordinador } }) => {
  if (!coordinador) {
    throw redirect(302, "/coordinadores/login");
  }

  return { nombre: coordinador.nombre };
}) satisfies LayoutServerLoad;
