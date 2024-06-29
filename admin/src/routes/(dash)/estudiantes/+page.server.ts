import { fail, redirect } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";
import { systemLogger } from "$lib/server/logger";

type Carrera = { id: string; nombre: string };

export const load: PageServerLoad = async ({ locals: { client, user } }) => {
  const [{ ok, data: estudiantes }, { ok: isOk, data }] = await Promise.all([
    client.GET("/api/students"),
    client.GET("/api/carreras"),
  ]);

  if (!ok || !isOk) {
    systemLogger.error("Error cargando datos desde la API");
    return { estudiantes: [], carreras: [] };
  }

  systemLogger.info(`${user.nombre} ha entrado al módulo de los estudiantes`);

  const carreras: Carrera[] = data.carreras
    .map((carrera: Carrera) => ({ ...carrera }))
    .filter(
      (carrera: Carrera, index: number, self: Carrera[]) =>
        index === self.findIndex((t) => t.id === carrera.id)
    );

  return { estudiantes, carreras };
};

export const actions: Actions = {
  default: async ({ locals: { client, user }, request }) => {
    let obj = Object.fromEntries(await request.formData()) as unknown as {
      nombre: string;
      cedula: string;
      carrera: string;
    };
    const studentInfo = {
      ...obj,
      fullname: obj.nombre,
      password: obj.cedula.replace(/^(V-|E-)/g, ""),
    };

    const { ok, data } = await client.POST("/api/students/add", studentInfo);
    systemLogger.warn(
      `${
        user.nombre
      } ha registrado al estudiante ${studentInfo.fullname.toUpperCase()}`
    );

    if (!ok) {
      return fail(400, { message: data.message });
    }

    return { message: "Estudiante creado exitosamente!" };
  },
};
