import { passwordAction } from "$lib/server/changePassword";
import { systemLogger } from "$lib/server/logger";
import type { Estudiante, Notas } from "../../../../../../app";
import type { PageServerLoad, Actions } from "./$types";

export const load: PageServerLoad = async ({
  locals: { client, controlEstudio },
  params,
}) => {
  const { ok, data } = await client.GET(`/api/students/${params.estudiante}`);
  if (!ok) return { estudiante: null, notas: [] };

  systemLogger.info(
    `${controlEstudio.nombre} ha entrado a ver las notas del estudiante con cédula ${params.estudiante}`
  );
  const estudiante: Estudiante = data;

  const { ok: okMa, data: dataMa } = await client.GET(
    `/api/coordinacion/materias/${params.estudiante}`
  );
  if (!okMa) return { estudiante: estudiante, notas: [] };

  const notas: Notas[] = dataMa.notas;

  return { estudiante, notas };
};

export const actions: Actions = {
  ...passwordAction,
};