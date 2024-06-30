import { baseURL } from "$env/static/private";
import type { RequestEvent } from "@sveltejs/kit";
import { getAccessToken } from "./auth";

export const client = async (
  event: RequestEvent,
  endpoint: string,
  method: string,
  raw?: object,
  headers?: any,
) => {
  const token = getAccessToken(event);
  let body = raw ? JSON.stringify(raw) : null;

  headers = headers ?? {
    Accept: "*/*",
    "Content-Type": "application/json",
  };

  if (token) {
    headers["Authorization"] = token;
  }

  let res: any;
  try {
    res = await fetch(baseURL + endpoint, { method, body, headers });
    return await res.json();
  } catch (error) {
    console.log("error en fetch", error);
  }
};
