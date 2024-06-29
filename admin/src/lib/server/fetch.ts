import { baseURL } from "$env/static/private"

export const client = async (endpoint: string, method: string, raw?: object, headers?: any) => {

    let body = raw? JSON.stringify(raw):null

  headers = headers ?? {
    "Accept": "*/*",
    "Content-Type": "application/json"
  }

  let res: any;
  try {
    res = await fetch(baseURL + endpoint, { method, body, headers })
    return await res.json()
  } catch (error) {
    console.log("error en fetch", error);
  }

}