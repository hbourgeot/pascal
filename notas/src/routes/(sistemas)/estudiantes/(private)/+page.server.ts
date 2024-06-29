import type { PageServerLoad } from "./$types";
import type { Materia, Notas } from "../../../../app";

export const load = (async ({ locals: { estudiante, client }, cookies }) => {
  let headers = {
    Accept: "*/*",
    Authorization: cookies.get("access_token"),
  };

  const { ok, data } = await client.GET(
    "/api/students/materias",
    null,
    headers
  );

  const {
    ok: carOk,
    data: { carreras },
  } = await client.GET("/api/carreras");
  const carrera: { id: string; nombre: string } = carreras.find(
    (carrera: { id: string; nombre: string }) =>
      carrera.id == estudiante.carrera
  );

  if (!ok) return { estudiante, materias: [] };

  return {
    estudiante,
    materias: data.notas.map((materia: Notas) => ({
      materia: materia.materia,
      id: materia.id,
      download: "",
    })),
    ciclo: data.ciclo,
    carrera,
  };
}) satisfies PageServerLoad;
