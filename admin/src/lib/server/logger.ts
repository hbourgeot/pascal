import {createLogger, format, transports} from "winston";

const logger = createLogger({
  level: process.env.LOG_LEVEL || "info",
  format: format.combine(format.timestamp({format: "DD-MM-YYYY HH:mm:ss"}), format.json()),
  transports: [
    new transports.Console(),
    new transports.File({ filename: "sistema.log" }),
  ],
  exitOnError: false
});

export const systemLogger = {
  info: (message: string) => logger.info(message),
  warn: (message: string) => logger.warn(message),
  error: (message: string) => logger.error(message)
}
