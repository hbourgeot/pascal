import type { PageServerLoad, Actions } from "./$types";
import { passwordAction } from "$lib/server/changePassword";

export const load: PageServerLoad = async ({ locals: { client }, url }) => {
  const { ok, data: estudiantes } = await client.GET("/api/students");
  const { ok: isOk, data } = await client.GET("/api/carreras");
  if (!ok || !isOk) {
    return { estudiantes: [], carreras: [] };
  }

  const carreras: {
    id: string;
    nombre: string;
  }[] = data.carreras
    .map((carrera: { id: string; nombre: string }) => ({ ...carrera }))
    .filter(
      (carrera: { id: string; nombre: string }, index: any, self: any) =>
        index ===
        self.findIndex(
          (t: { id: string; nombre: string }) => t.id === carrera.id
        )
    );
  return {
    estudiantes: estudiantes,
    carreras,
    query: url.searchParams.get("s"),
  };
};

export const actions: Actions = {
  ...passwordAction,
};
