import dayjs from "dayjs";
import { prisma } from "./lib/prisma";
import { FastifyInstance } from "fastify";
import { z } from "zod";

export async function appRoutes(app: FastifyInstance) {
  app.post("/habits", async (request) => {
    const createHabitBody = z.object({
      title: z.string(),
      weekDays: z.array(z.number().min(0).max(6)), // dias de domingo a sábado
    });

    const { title, weekDays } = createHabitBody.parse(request.body);

    // retorna data atual com horas, minutos e segundos zerados
    const today = dayjs().startOf("day").toDate();

    await prisma.habit.create({
      data: {
        title,
        created_at: today,
        weekDays: {
          create: weekDays.map((weekday) => {
            return {
              week_day: weekday,
            };
          }),
        },
      },
    });
  });
}
