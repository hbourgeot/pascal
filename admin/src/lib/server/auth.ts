import { baseURL } from "$env/static/private";
import type { RequestEvent } from "@sveltejs/kit";
import { systemLogger } from "./logger";

export const getUser = async (token: string) => {
  try {
    let headers = {
      Accept: "*/*",
      Authorization: token,
    };

    const res: Response = await fetch(`${baseURL}/api/usuario/refresh`, {
      method: "GET",
      headers,
    });
    const { data: user } = await res.json();

    return user;
  } catch (error) {
    console.error(error);
  }
};
export const getAccessToken = (event: RequestEvent) => {
  const { cookies } = event;

  const access_token = cookies.get("access_token");

  if (access_token) {
    return access_token;
  }
};

export const logOut = async (
  event: RequestEvent
) => {
  try {
    const { cookies } = event;
    cookies.delete("access_token", { path: '/' });
  } catch (e) {
    console.error(e);
  }
};