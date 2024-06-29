import { client } from "$lib/server/fetch";
import type { Handle } from "@sveltejs/kit";
import { sequence } from "@sveltejs/kit/hooks";
import type {
  ControlEstudio,
  Coordinacion,
  Docente,
  Estudiante,
  SuperUsuario,
} from "./app";
import { getAccessToken, getConfig, getUser } from "$lib/server/auth";
import jwt from "jsonwebtoken";
const { decode } = jwt;
let i = 0;
const authHandler: Handle = async ({ event, resolve }) => {
  function isLoginRoute(url: string): boolean {
    return [
      "/coordinadores/login",
      "/estudiantes/login",
      "/docentes/login",
    ].includes(url);
  }

  event.locals.config = await getConfig();

  if (!event.url.pathname.includes("/logout")) {
    const accessToken = getAccessToken(event);
    const verifyToken = accessToken?.split(" ")[1] ?? "";

    if (accessToken) {
      try {
        const decodedToken = decode(verifyToken) as {
          exp: number;
          rol: string;
        };
        const currentTime = Math.floor(Date.now() / 1000);
        const rol = decodedToken.rol;
        if (
          currentTime <= decodedToken.exp ||
          isLoginRoute(event.url.pathname)
        ) {
          switch (rol) {
            case "CE":
              event.locals.controlEstudio = (await getUser(
                accessToken,
                "control"
              )) as unknown as ControlEstudio;
              break;
            case "CO":
              event.locals.coordinador = (await getUser(
                accessToken,
                "coordinacion"
              )) as unknown as Coordinacion;
              break;
            case "D":
              event.locals.docente = (await getUser(
                accessToken,
                "docente"
              )) as unknown as Docente;
              break;
            case "E":
              event.locals.estudiante = (await getUser(
                accessToken,
                "students"
              )) as unknown as Estudiante;
              break;
            case "S":
              event.locals.superUsuario = (await getUser(
                accessToken,
                "superUsuario"
              )) as unknown as SuperUsuario;
              break;
          }
        } else {
          let redirectUrl = "";

          switch (rol) {
            case "CE":
              redirectUrl = "/control_estudio/login?exp=true";
            case "CO":
              redirectUrl = "/coordinadores/login?exp=true";
              break;
            case "D":
              redirectUrl = "/docentes/login?exp=true";
              break;
            case "E":
              redirectUrl = "/estudiantes/login?exp=true";
              break;
            case "S":
              redirectUrl = "/superusuario/login?exp=true";
              break;
          }

          if (redirectUrl) {
            if (i < 1) {
              i++;
              return new Response(null, {
                status: 302,
                headers: {
                  Location: redirectUrl,
                },
              });
            }
          }
        }
      } catch (e) {
        console.log(e);
      }
    }
  }
  return await resolve(event);
};

const clientHandler: Handle = async ({ event, resolve }) => {
  event.locals.client = {
    GET: async (endpoint: string, body?: object, headers?: any) =>
      await client(endpoint, "GET", body, headers),
    POST: async (endpoint: string, body?: object, headers?: any) =>
      await client(endpoint, "POST", body, headers),
    PUT: async (endpoint: string, body?: object, headers?: any) =>
      await client(endpoint, "PUT", body, headers),
    PATCH: async (endpoint: string, body?: object, headers?: any) =>
      await client(endpoint, "PATCH", body, headers),
    DELETE: async (endpoint: string, body?: object, headers?: any) =>
      await client(endpoint, "DELETE", body, headers),
  };

  return await resolve(event);
};

export const handle = sequence(authHandler, clientHandler);
