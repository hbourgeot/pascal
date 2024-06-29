import { baseURL } from "$env/static/private";

export const client = async (
  endpoint: string,
  method: string,
  raw?: object,
  headers?: any
) => {
  let body;

  if (raw instanceof FormData) {
    // No need to set 'Content-Type': 'multipart/form-data' header,
    // it's automatically set by the browser along with the correct 'boundary'
    body = raw;
  } else {
    body = raw ? JSON.stringify(raw) : null;
    headers = headers ?? {
      Accept: "*/*",
      "Content-Type": "application/json",
    };
  }

  let res: any;
  try {
    res = await fetch(baseURL + endpoint, { method, body, headers });
    const contentType = res.headers.get("content-type");
    if (contentType && contentType.indexOf("application/json") !== -1) {
      return await res.json();
    } else {
      // Assuming 'blob' for file data
      const file = await res.blob();
      return file;
    }
  } catch (error) {
    console.log("error en fetch", error);
  }
};
