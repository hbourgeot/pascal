import type { RequestHandler } from "@sveltejs/kit";
import { json } from "@sveltejs/kit";

export const GET: RequestHandler = async ({ locals: { client }, url }) => {
  const ciclo = url.searchParams.get("ciclo") ?? "2023-i";
  const folder = url.searchParams.get("folder") ?? "";
  const file = await client.GET(
    `/api/archivos/download/planificacion.pdf?folder=${folder}&ciclo=${ciclo}`
  );
  if (file.ok) {
    return json({ message: file.data.message });
  }

  return new Response(file);
};
