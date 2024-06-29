// See https://kit.svelte.dev/docs/types#app
// for information about these interfaces
import { client } from "\/server/fetch";
declare global {
	namespace App {
		// interface Error {}
		interface Locals {
			client: client,
			user: Usuario,
		}
		// interface PageData {}
		// interface Platform {}
	}

	
}


export interface RootObject {
  data: Data;
  ok: boolean;
  status: number;
}

export interface Data {
  estudiante: Estudiante;
  metodo: Metodo;
  monto: Monto;
  pago: Pago;
}

export interface Estudiante {
  carrera: string;
  cedula: string;
  correo: string;
  direccion: string;
  edad: number;
  estado: string;
  fecha_nac: string;
  nombre: string;
  promedio: number;
  semestre: number;
  sexo: string;
  telefono: string;
}

interface Pago{
	id: number;
	pre_inscripcion: string;
	inscripcion: string;
	cuota1: string;
	cuota2: string;
	cuota3: string;
	cuota4: string;
	cuota5: string;
	cedula_estudiante: string;
	montoPreInscripcion: number;
	montoInscripcion: number;
	montoCuota1: number;
	montoCuota2: number;
	montoCuota3: number;
	montoCuota4: number;
	montoCuota5: number;
	id_pago: number
}

interface Usuario {
	user: string,
	nombre: string
}

export {Estudiante, Pago, Usuario};
