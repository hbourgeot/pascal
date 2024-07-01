import type { PageServerLoad, Actions } from "./$types";
import moment from "moment";
export const load = (async ({locals: {client}}) => {
  interface Log {
    level: string;
    message: string;
    timestamp: string;
    usuario?: string;
    modulo?: string;
  }

  const { ok, data }: {
    ok: boolean, data: {
      nivel_alerta: number,
      accion: string,
      fecha: string,
      usuario: string,
      modulo: string,
    }[]
  } = await client.GET('/api/trazabilidad/');

  if (!ok) {
    return { logs: [] };
  }

  const nivelesAlerta = ["Información", "Advertencia", "Error", "Crítico"];


  let logs: Log[] = data
    .filter((item) => ["Administracion", "Global", "Autenticacion"].includes(item.modulo) && item.usuario === "caja_pascal")
    .map((item) => ({
      level: nivelesAlerta[item.nivel_alerta - 1],
      message: item.accion,
      timestamp: moment(item.fecha).format("DD/MM/YYYY HH:mm:ss"),
      usuario: item.usuario,
      modulo: item.modulo,
    }));

  console.log(logs);
  return { logs };
}) satisfies PageServerLoad;