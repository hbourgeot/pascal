import { fail, redirect } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";

type Carrera = { id: string; nombre: string };

export const load: PageServerLoad = async ({ locals: { client, user } }) => {
  const [{ ok, data: estudiantes }, { ok: isOk, data }] = await Promise.all([
    client.GET("/api/students"),
    client.GET("/api/carreras"),
  ]);

  if (!ok || !isOk) {
    return { estudiantes: [], carreras: [] };
  }

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

    if (!ok) {
      return fail(400, { message: data.message });
    }

    return { message: "Estudiante creado exitosamente!" };
  },
};
