import type { RequestHandler } from "@sveltejs/kit";
import { fail, json } from "@sveltejs/kit";

export const POST: RequestHandler = async ({ locals: { client }, request }) => {
  let obj: any = Object.fromEntries(await request.formData());

  obj = {
    ...obj,
    materia: obj.materia,
  };

  const { ok, data } = await client.PATCH("/api/docente/upload", obj);

  if (!ok) return json({ message: data.message, status: 400 });

  const { ok: okPeticion, data: dataPeticion } = await client.PATCH(
    `/api/peticiones/update/${obj.peticion}`,
    { estado: "Terminado" }
  );
  if (!okPeticion) return json({ message: data.message, status: 400 });

  return json({ message: "Modificado!" });
};
