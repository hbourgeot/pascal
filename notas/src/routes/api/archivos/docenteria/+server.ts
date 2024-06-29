import type { RequestHandler } from "@sveltejs/kit";
import { json } from "@sveltejs/kit";

export const GET: RequestHandler = async ({ locals: { client } }) => {
  const file = await client.GET(`/api/generar_ficha/docenteria`);
  if (file.ok) {
    return json({ message: file.data.message });
  }

  return new Response(file);
};
