import {
  moneyBsConverter,
  moneyUsdConverter,
} from "$lib/resources/moneyConverter";
import moment from "moment";
import type { Estudiante, Pago } from "../../../../app";
import type { PageServerLoad } from "./$types";

export const load = (async ({ locals: { client }, params, url }) => {
  const { ok, data } = await client.GET("/api/pagos");
  const { ok: okey, data: estudiantes } = await client.GET("/api/students");
  const response = await fetch(
    "https://api.exchangedyn.com/markets/quotes/usdves/bcv"
  );
  const currency = await response.json();
  const bcv = currency.sources.BCV.quote;
  let startDate = url.searchParams.get("fi") ?? undefined;
  let endDate = url.searchParams.get("ff") ?? undefined;

  let filtro = url.searchParams.get("f") ?? "";
  let pdfData: PDFData = [];
  if (params.reporte !== "dia") {
    pdfData = fillPDFData(
      data,
      estudiantes,
      params.reporte,
      parseFloat(bcv),
      filtro,
      startDate,
      endDate
    );
  } else {
    let dia = url.searchParams.get("d") ?? undefined;
    pdfData = fillPDFData(
      data,
      estudiantes,
      params.reporte,
      parseFloat(bcv),
      filtro,
      dia
    );
  }
  return { pdfData, param: params.reporte, filtro: filtro ?? "nada", bcv: bcv };
}) satisfies PageServerLoad;

type PDFData = {
  fecha: string;
  cedula: string;
  nombre: string;
  pago: string;
  monto: string;
  montoNum: number;
  metodo: string;
}[];

function fillPDFData(
  data: any[],
  estudiantes: any[],
  type: string,
  bcv: number,
  filter?: string,
  fechaInicio?: string,
  fechaFinal?: string
): PDFData {
  let pdfData: PDFData = [];

  // Si es de tipo 'dia', puedes convertir la fecha en un formato comparable
  const fechaDia = fechaInicio
    ? moment(fechaInicio, "YYYY-MM-DD").startOf("day").valueOf()
    : null;
  const fechaStart = fechaInicio
    ? moment(fechaInicio, "DD-MM-YYYY").startOf("day").valueOf()
    : null;
  const fechaEnd = fechaFinal
    ? moment(fechaFinal, "DD-MM-YYYY").startOf("day").valueOf()
    : null;

  data.forEach((pago) => {
    const fechaPago = moment(pago.fecha_pago, "ddd, DD MMM YYYY HH:mm:ss [GMT]")
      .startOf("day")
      .valueOf();
    const estudiante = estudiantes.find((e) => e.cedula === pago.estudiante);

    // Comprobación para el filtro
    if (filter && pago.metodo_pago.nombre !== filter) return;

    // Comprobaciones para el tipo de reporte
    switch (type) {
      case "dia":
        if (fechaDia && fechaPago !== fechaDia) return;
        break;
      case "fechas":
        if (
          fechaStart &&
          fechaEnd &&
          (fechaPago < fechaStart || fechaPago > fechaEnd)
        )
          return;
        break;
      // No se necesita una comprobación adicional para 'montos'
    }

    // Asegurarse de que el estudiante exista
    if (estudiante) {
      pdfData.push({
        fecha: moment(
          pago.fecha_pago,
          "ddd, DD MMM YYYY HH:mm:ss [GMT]"
        ).format("DD-MM-YYYY"),
        cedula: estudiante.cedula,
        nombre: estudiante.nombre,
        pago: pago.metodo_pago.descripcion,
        monto: pago.monto.monto,
        montoNum:
          pago.metodo_pago.nombre !== "Efectivo" || filter === "Efectivo"
            ? parseFloat(pago.monto.monto)
            : parseFloat(pago.monto.monto) * bcv,
        metodo: pago.metodo_pago.nombre,
      });
      console.log(pdfData);
    }
  });

  return pdfData;
}
