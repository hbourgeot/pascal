import { baseURL } from "$env/static/private";
import type { RequestEvent } from "@sveltejs/kit";
import { getAccessToken } from "./auth";

export const client = async (
  event: RequestEvent,
  endpoint: string,
  method: string,
  raw?: object,
  headers?: any
) => {
  let body;

  if (raw instanceof FormData) {
    body = raw;
  } else {
    body = raw ? JSON.stringify(raw) : null;
    headers = headers ?? {
      Accept: "*/*",
      "Content-Type": "application/json",
    };
  }

  const token = event.locals.token ?? getAccessToken(event);
  if (token) {
    headers["Authorization"] = token;
  }

  let res: any;
  try {
    res = await fetch(baseURL + endpoint, { method, body, headers });
    const contentType = res.headers.get("content-type");
    if (contentType && contentType.indexOf("application/json") !== -1) {
      return await res.json();
    } else {
      const file = await res.blob();
      return file;
    }
  } catch (error) {
    console.log("error en fetch", error);
  }
};
