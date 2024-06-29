import { fail, redirect } from "@sveltejs/kit";
import type { Estudiante } from "../../../../app";
import type { Actions, PageServerLoad } from "./$types";
import { systemLogger } from "$lib/server/logger";

export const load = (async ({ locals: { client,user } }) => {
  const { ok: okey, data: estudiantes } = await client.GET("/api/students");
  if (!okey) {
    return { estudiantes: [] };
  }
  let estudiantesCedula: { cedula: string; nombre: string }[] = estudiantes.map((estudiante: Estudiante) => ({cedula: estudiante.cedula, nombre: estudiante.nombre}));

  const response = await fetch(
    "https://api.exchangedyn.com/markets/quotes/usdves/bcv"
  );
  const currency = await response.json();
  const bcv = currency.sources.BCV.quote;

  systemLogger.warn("Atención, " + user.nombre + " puede que registre un pago");

  return { estudiantes: estudiantesCedula, tasa: parseFloat(bcv) };
}) satisfies PageServerLoad;

export const actions: Actions = {
  default: async ({ locals: { client, user }, request }) => {
    const form = await request.formData();
    let payload = Object.fromEntries(form);
    
    const { ok, data } = await client.POST("/api/pagos/add", payload)
    if (!ok) {
      return fail(400, {message: data.message})
    }
    
    const { pagoId } = data;
    
    if (payload.metodo == "Efectivo") {
      //@ts-ignore
      let billetes = form.getAll("billetes").map((bi: string) => JSON.parse(bi))
      billetes = billetes.map(bill => ({...bill, pago_id: pagoId}))
      for (const billete of billetes) {
        const {ok, data} = await client.POST("/api/billetes/add", billete)
        if (!ok) {
          return fail(400, {message: data.message})
        }
      }
    }

    systemLogger.warn(user.nombre + " ha registrado un pago del estudiante de C.I. N° " + payload.cedula_estudiante + " por concepto '" + payload.descripcion + "'")

    throw redirect(302, `/factura/${data.pagoId}`)
  },
};
