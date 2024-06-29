// See https://kit.svelte.dev/docs/types#app
// for information about these interfaces
import { client } from "/server/fetch";
import { logger } from "$lib/server/logger";
declare global {
  namespace App {
    // interface Error {}
    interface Locals {
      client: client;
      estudiante: Estudiante;
      docente: Docente;
      coordinador: Coordinacion;
      controlEstudio: ControlEstudio;
      config: Config;
      superUsuario: SuperUsuario;
    }
  }
}
interface Estudiante {
  cedula: string;
  correo: string;
  nombre: string;
  semestre: number | string;
  telefono: string;
  estado: string;
  carrera: string;
}

interface Coordinacion {
  cedula: string;
  nombre: string;
  correo: string;
  telefono: string;
}

interface ControlEstudio {
  cedula: string;
  nombre: string;
  correo: string;
  telefono: string;
}

interface Docente {
  cedula: string;
  nombre: string;
  correo: string;
  telefono: string;
}

interface Materia {
  id: string;
  nombre: string;
  prelacion: string;
  unidad_credito: number;
  hp: number;
  ht: number;
  semestre: number;
  id_carrera: string;
  id_docente: string;
  dia: string;
  hora_inicio: string;
  hora_fin: string;
  dia2: string;
  hora_inicio2: string;
  hora_fin2: string;
  maximo: number;
  modalidad: string;
  cantidad_estudiantes?: number;
  ciclo: string;
  disponible?: boolean;
}

interface Config {
  id: string;
  ciclo: string;
  porc1: number;
  porc2: number;
  porc3: number;
  horario_inicio: string;
  horario_fin: string;
  cuota1: string;
  cuota2: string;
  cuota3: string;
  cuota4: string;
  cuota5: string;
}

interface Notas {
  materia: string;
  nota1: number;
  nota2: number;
  nota3: number;
  promedio: number;
  id: string | number;
}

interface Peticiones {
  docente: {
    cedula: string;
    nombre: string;
  };
  estudiante: {
    cedula: string;
    nombre: string;
  };
  materia: {
    id: string;
    nombre: string;
  };
  peticion: {
    campo: string | null;
    descripcion: string;
    estado: string;
    id: number;
    id_docente: string;
    id_estudiante: string;
    id_materia: string;
  };
}

interface SuperUsuario {
  cedula: string;
  nombre: string;
  correo: string;
}

export {
  Estudiante,
  Coordinacion,
  Docente,
  Materia,
  ControlEstudio,
  Config,
  Notas,
  Peticiones,
  SuperUsuario,
};
