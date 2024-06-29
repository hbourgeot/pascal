import type { PageServerLoad } from "./$types";
import { promises as fs } from "node:fs";
export const load = (async () => {
  interface Log {
    level: string;
    message: string;
    timestamp: string;
  }
  let logs: Log[] = [];
  const data = await fs.readFile(`sistema.log`, "utf8");
  data
    .split("\r")
    .forEach((line) =>
      line != "\n" ? logs.push(JSON.parse(line) as Log) : ""
    );
  return { logs };
}) satisfies PageServerLoad;
