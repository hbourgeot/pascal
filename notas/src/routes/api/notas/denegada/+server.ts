import type { RequestHandler } from "@sveltejs/kit";
import { fail, json } from "@sveltejs/kit";

export const POST: RequestHandler = async ({ locals: { client }, request }) => {
  let obj: any = Object.fromEntries(await request.formData());

  const { ok: okPeticion, data: dataPeticion } = await client.PATCH(
    `/api/peticiones/update/${obj.peticion}`,
    { estado: "Denegado Terminado" }
  );
  if (!okPeticion) return json({ message: dataPeticion.message, status: 400 });

  return json({ message: "Modificado!" });
};
