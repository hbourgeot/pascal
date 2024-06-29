import type { PageServerLoad } from './$types';
import {readFileSync} from "node:fs"
export const load = (async () => {
  interface Log {
    level: string;
    message: string;
    timestamp: string;
  }
  let logs: Log[] = [];
  const data = readFileSync('sistema.log', 'utf8');
  const lines = data.split('\n');
  lines.forEach((line: any) => {
    if (line.trim() !== '') {
      logs.push(JSON.parse(line) as Log);
    }
  });
  return { logs };
}) satisfies PageServerLoad;