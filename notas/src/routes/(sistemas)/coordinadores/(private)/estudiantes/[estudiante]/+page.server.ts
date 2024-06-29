import type { PageServerLoad } from "./$types";
import type { Estudiante, Notas } from "../../../../../../app";
import { systemLogger } from "$lib/server/logger";

export const load: PageServerLoad = async ({
  locals: { client, coordinador },
  params,
}) => {
  const { ok, data } = await client.GET(`/api/students/${params.estudiante}`);

  if (!ok) return { estudiante: null, notas: [] };

  systemLogger.info(
    `${coordinador.nombre} ha entrado a ver las notas del estudiante con cédula ${params.estudiante}`
  );

  const estudiante: Estudiante = data;

  const { ok: okMa, data: dataMa } = await client.GET(
    `/api/coordinacion/materias/${params.estudiante}`
  );
  if (!okMa) return { estudiante: estudiante, notas: [] };

  const notas: Notas[] = dataMa.notas;

  return { estudiante, notas };
};
