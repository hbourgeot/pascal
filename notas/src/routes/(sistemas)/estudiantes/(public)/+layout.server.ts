import { redirect } from "@sveltejs/kit";
import type { LayoutServerLoad } from "./$types";

export const load = (async ({ locals: { estudiante } }) => {
  if (estudiante) {
    throw redirect(302, "/estudiantes");
  }
}) satisfies LayoutServerLoad;
