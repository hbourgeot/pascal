import { systemLogger } from "$lib/server/logger";
import type { PageServerLoad } from "./$types";

export const load = (async ({ fetch, locals: { client, user }, params }) => {
  const response = await fetch(
    "https://api.exchangedyn.com/markets/quotes/usdves/bcv"
  );
  const { ok, data } = await client.GET(`/api/pagos/${params.pago}`);
  if (!ok) {
    return {};
  }

  const {
    estudiante,
    fecha_pago: fechaPago,
    metodo_pago: metodoPago,
    monto,
  }: {
    estudiante: string;
    fecha_pago: string;
    metodo_pago: { descripcion: string; id: number; nombre: string };
    monto: { concepto: string; id: number; monto: string };
  } = data;

  const { ok: okey, data: est } = await client.GET(
    `/api/students/${estudiante}`
  );
  if (!okey) {
    return {};
  }

  const { nombre } = est;

  const currency = await response.json();
  const bcv = currency.sources.BCV.quote;

  const { ok: okFa, data: dataFa } = await client.GET("/api/factura");
  if (!okFa) {
    return {};
  }
  let { nroFactura } = dataFa;
  nroFactura = nroFactura.toString().padStart(4, "0");

  systemLogger.info(user.nombre + " ha generado la factura nro. " + nroFactura)
  return {
    bcv: bcv,
    estudiante,
    fechaPago,
    metodoPago,
    monto,
    nombreEstudiante: nombre,
    nroFactura: nroFactura,
  };
}) satisfies PageServerLoad;
