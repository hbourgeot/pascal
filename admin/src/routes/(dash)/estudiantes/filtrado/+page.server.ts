import { systemLogger } from "$lib/server/logger";
import type { PageServerLoad } from "./$types";

export const load: PageServerLoad = async ({ locals: { client, user }, url }) => {
  const { ok, data: estudiantes } = await client.GET("/api/students");
  const { ok: isOk, data: { carreras } } = await client.GET("/api/carreras");
  console.log(ok, isOk);
  if (!ok || !isOk) {
    return { estudiantes: [], carreras: [] };
  }

  systemLogger.info(user.nombre + " ha entrado a ver la lista de los estudiantes");
  return { estudiantes: estudiantes, carreras, query: url.searchParams.get("s") };
};