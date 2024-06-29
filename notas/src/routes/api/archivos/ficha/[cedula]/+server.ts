import type { RequestHandler } from "@sveltejs/kit";
import { json } from "@sveltejs/kit";

export const GET: RequestHandler = async ({ locals: { client }, params }) => {
  const file = await client.GET(`/api/generar_ficha/${params.cedula}`);
  if (file.ok) {
    return json({ message: file.data.message });
  }

  return new Response(file);
};
