import { redirect } from "@sveltejs/kit";
import type { LayoutServerLoad } from "./$types";
import type { Peticiones } from "../../../../app";

export const load = (async ({ locals: { docente, client } }) => {
  if (!docente) {
    throw redirect(302, "/docentes/login");
  }

  const { ok, data } = await client.GET("/api/peticiones");
  if (!ok) return { peticion: null, nombre: docente.nombre, aprobado: "a" };

  let peticion: Peticiones = data.find(
    (peticion: Peticiones) =>
      peticion.peticion.id_docente == docente.cedula &&
      peticion.peticion.estado === "Aprobado"
  );
  if (peticion)
    return {
      peticion: peticion.peticion,
      docente,
      nombre: docente.nombre,
      aprobado: true,
    };

  peticion = data.find(
    (peticion: Peticiones) =>
      peticion.peticion.id_docente == docente.cedula &&
      peticion.peticion.estado === "Denegado"
  );

  if (peticion)
    return {
      peticion: peticion.peticion,
      docente,
      nombre: docente.nombre,
      aprobado: false,
    };
  return { peticion: null, nombre: docente.nombre, aprobado: null };
}) satisfies LayoutServerLoad;
