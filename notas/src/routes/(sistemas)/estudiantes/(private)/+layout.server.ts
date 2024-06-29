import { redirect } from "@sveltejs/kit";
import type { LayoutServerLoad } from "./$types";

export const load = (async ({ locals: { estudiante } }) => {
  if (!estudiante) {
    throw redirect(302, "/estudiantes/login");
  }

  return { nombre: estudiante.nombre };
}) satisfies LayoutServerLoad;
