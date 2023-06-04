import { PrismaClient } from "@prisma/client";

export const prisma = new PrismaClient({
  log: ["query"], // mostra no console todas as queries feitas no banco
});
