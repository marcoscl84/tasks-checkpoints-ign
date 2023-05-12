/*
  Warnings:

  - You are about to drop the column `day_id` on the `day_habit` table. All the data in the column will be lost.
  - You are about to drop the column `habit_id` on the `day_habit` table. All the data in the column will be lost.
  - Added the required column `day_Id` to the `day_habit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `habit_Id` to the `day_habit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `habitId` to the `habit_week_days` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_day_habit" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "day_Id" TEXT NOT NULL,
    "habit_Id" TEXT NOT NULL,
    CONSTRAINT "day_habit_day_Id_fkey" FOREIGN KEY ("day_Id") REFERENCES "day" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "day_habit_habit_Id_fkey" FOREIGN KEY ("habit_Id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_day_habit" ("id") SELECT "id" FROM "day_habit";
DROP TABLE "day_habit";
ALTER TABLE "new_day_habit" RENAME TO "day_habit";
CREATE UNIQUE INDEX "day_habit_day_Id_habit_Id_key" ON "day_habit"("day_Id", "habit_Id");
CREATE TABLE "new_habit_week_days" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "habit_id" TEXT NOT NULL,
    "week_day" TEXT NOT NULL,
    "habitId" TEXT NOT NULL,
    CONSTRAINT "habit_week_days_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_habit_week_days" ("habit_id", "id", "week_day") SELECT "habit_id", "id", "week_day" FROM "habit_week_days";
DROP TABLE "habit_week_days";
ALTER TABLE "new_habit_week_days" RENAME TO "habit_week_days";
CREATE UNIQUE INDEX "habit_week_days_habit_id_week_day_key" ON "habit_week_days"("habit_id", "week_day");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
