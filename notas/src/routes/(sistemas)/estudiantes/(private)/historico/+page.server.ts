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
    "/api/students/historico",
    null,
    headers
  );
  if (!ok)
    return {
      estudiante: null,
      message: "No tienes materias registradas",
      materias: [],
    };

  return { estudiante, materias: data.notas };
};
