import { systemLogger } from "$lib/server/logger";
import type { PageServerLoad } from "./$types";

export const load: PageServerLoad = async ({
  locals: { estudiante, client },
  cookies,
}) => {
  let headers = {
    Accept: "*/*",
    Authorization: cookies.get("access_token"),
  };

  const { ok, data } = await client.GET(
    "/api/students/materias",
    null,
    headers
  );
  if (!ok)
    return {
      estudiante: null,
      message: "No tienes materias registradas",
      materias: [],
    };

  systemLogger.info(`${estudiante.nombre} ha entrado a ver sus notas`);
  return { estudiante, materias: data.notas };
};
