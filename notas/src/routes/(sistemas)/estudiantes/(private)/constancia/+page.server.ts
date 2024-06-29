import { systemLogger } from "$lib/server/logger";
import { EvStation } from "@steeze-ui/material-design-icons";
import type { PageServerLoad } from "./$types";
export const load: PageServerLoad = async ({
  locals: { estudiante, client },
}) => {
  const { ok, data } = await client.GET("/api/carreras");
  if (!ok) return { cedula: "", carrera: "", nombre: "" };

  let carrera: string = data.carreras.find(
    (carrera: { id: string; nombre: string }) =>
      carrera.id === estudiante.carrera
  ).nombre;

  systemLogger.info(
    `El estudiante ${estudiante.nombre} ha generado su constancia de estudios`
  );

  return {
    cedula: estudiante.cedula,
    carrera,
    nombre: estudiante.nombre,
    semestre: getSemester(estudiante.semestre),
  };
};

const getSemester = (semester: number | string): string => {
  let semestre = "";

  switch (semester) {
    case 1:
    case "1":
      semestre = "I";
      break;
    case 2:
    case "2":
      semestre = "II";
      break;
    case 3:
    case "3":
      semestre = "III";
      break;
    case 4:
    case "4":
      semestre = "IV";
      break;
    case 5:
    case "5":
      semestre = "V";
      break;
    case 6:
    case "6":
      semestre = "VI";
      break;
  }

  return semestre;
};
