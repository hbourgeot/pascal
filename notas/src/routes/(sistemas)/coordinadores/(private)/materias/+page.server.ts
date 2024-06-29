import { systemLogger } from "$lib/server/logger";
import type { PageServerLoad } from "./$types";

export const load = (async ({ locals: { client, coordinador, config } }) => {
  systemLogger.info(`${coordinador.nombre} ha entrado a ver las materias`);

  const { ok, data } = await client.GET("/api/carreras");

  let carreras: { id: string; nombre: string }[] = data.carreras
    .map((carrera: { id: string; nombre: string }) => ({ ...carrera }))
    .filter(
      (carrera: { id: string; nombre: string }, index: any, self: any) =>
        index ===
        self.findIndex(
          (t: { id: string; nombre: string }) => t.id === carrera.id
        )
    );

  return { carreras };
}) satisfies PageServerLoad;
