import { redirect } from "@sveltejs/kit";
import type { LayoutServerLoad } from "./$types";

export const load = (async ({ locals: { controlEstudio } }) => {
  if (controlEstudio) {
    throw redirect(302, "/control_estudio");
  }
}) satisfies LayoutServerLoad;
