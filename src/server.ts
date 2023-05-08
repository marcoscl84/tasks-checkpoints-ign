import Fastify from "fastify";
import { PrismaClient } from "@prisma/client";
import cors from "@fastify/cors";

const app = Fastify();
const prisma = new PrismaClient();

app.register(cors, {
  // registra as rotas do front-end que podem acessar o back-end
  origin: ["http://localhost:3333/"],
});

app.get("/hello", async () => {
  const habits = await prisma.habit.findMany({
    where: {
      title: {
        startsWith: "beber",
      },
    },
  });

  return habits;
});

app
  .listen({
    port: 3333,
  })
  .then(() => {
    console.log("Server is running my bro!");
  });
