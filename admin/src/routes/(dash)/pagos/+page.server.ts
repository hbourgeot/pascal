import { fail, redirect } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";
import type { Estudiante, Pago } from "../../../app";
import { systemLogger } from "$lib/server/logger";

export const load: PageServerLoad = async ({ locals: { client, user } }) => {
  const { ok, data } = await client.GET("/api/pagos");
  const { ok: okey, data: estudiantes } = await client.GET("/api/students");
  
  if (!ok || !okey) {
    return {};
  }

  let cedulas: string[] = Array.from(
    new Set(data.map((dat: any) => dat.estudiante))
  );

  console.log(cedulas, cedulas.length);
  if (cedulas.length == 0) {
    return {estudiantes: undefined, ok: false}
  }
  let estudiantesOptions: Estudiante[] = []
  for (const cedula of cedulas) {
    estudiantesOptions.push(estudiantes.find((estudiante: Estudiante) => estudiante.cedula == cedula))
  }

  systemLogger.info(user.nombre + " ha entrado al módulo de los pagos")

  return { estudiantes: estudiantesOptions, ok: true };
};