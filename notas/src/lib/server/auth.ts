import { baseURL } from "$env/static/private";
import { error, redirect, type RequestEvent } from "@sveltejs/kit";
import type { Coordinacion, Docente, Estudiante } from "../../app";

export const logInStudent = async (
  { locals: { client }, cookies }: RequestEvent,
  { username, password }: { username?: string; password?: string }
) => {
  const { ok, status, data } = await client.POST("/api/students/login", {
    usuario: username,
    clave: password,
  });
  if (!ok) {
    return { ok, data };
  }

  cookies.set("access_token", data.access_token, {
    httpOnly: true,
    path: "/estudiantes",
  });

  return { ok, status, data };
};

export const logInControlEstudio = async (
  { locals: { client }, cookies }: RequestEvent,
  { username, password }: { username?: string; password?: string }
) => {
  const { ok, status, data } = await client.POST("/api/control/login", {
    usuario: username,
    clave: password,
  });
  if (!ok) {
    return { ok, data };
  }


  cookies.set("access_token", data.access_token, {
    httpOnly: true,
    path: "/control_estudio",
  });

  return { ok, status, data };
};

export const logInDocente = async (
  { locals: { client }, cookies }: RequestEvent,
  { username, password }: { username?: string; password?: string }
) => {
  const { ok, status, data } = await client.POST("/api/docente/login", {
    usuario: username,
    clave: password,
  });
  if (!ok) {
    return { ok, data };
  }

  cookies.set("access_token", data.access_token, {
    httpOnly: true,
    path: "/docentes",
  });

  return { ok, status, data };
};

export const logInCoordinacion = async (
  { locals: { client }, cookies }: RequestEvent,
  { username, password }: { username?: string; password?: string }
) => {
  const { ok, status, data } = await client.POST("/api/coordinacion/login", {
    usuario: username,
    clave: password,
  });
  if (!ok) {
    return { ok, data };
  }

  cookies.set("access_token", data.access_token, {
    httpOnly: true,
    path: "/coordinadores",
  });

  return { ok, status, data };
};

export const logInSuperUsuario = async (
  { locals: { client }, cookies }: RequestEvent,
  { username, password }: { username?: string; password?: string }
) => {
  const { ok, status, data } = await client.POST("/api/superUsuario/login", {
    usuario: username,
    clave: password,
  });
  if (!ok) {
    return { ok, data };
  }

  cookies.set("access_token", data.access_token, {
    httpOnly: true,
    path: "/superusuario",
  });

  return { ok, status, data };
};

export const getAccessToken = (event: RequestEvent) => {
  const { cookies } = event;

  const access_token = cookies.get("access_token");

  if (access_token) {
    return access_token;
  }
};

export const getUser = async (token: string, endpoint: string) => {
  try {
    let headers = {
      Accept: "*/*",
      Authorization: token,
    };

    const res: Response = await fetch(`${baseURL}/api/${endpoint}/refresh`, {
      method: "GET",
      headers,
    });

    const { data: user } = await res.json();


    return user;
  } catch (error) {
    console.error(error);
  }
};

export const getConfig = async () => {
  try {
    const res: Response = await fetch(`${baseURL}/api/config/1`);
    const { data: config } = await res.json();

    return config;
  } catch (error) {
    console.error(error);
  }
};

export const logOut = async (
  event: RequestEvent,
  { path }: { path: string }
) => {
  try {
    const { cookies } = event;
    cookies.delete("access_token", { path: path });
  } catch (e) {
    console.error(e);
  } finally {
    throw redirect(302, path + "/login")
  }
};