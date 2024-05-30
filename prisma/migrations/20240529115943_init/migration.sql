-- CreateTable
CREATE TABLE "Mock" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "base_salary" INTEGER NOT NULL,
    "total_salary" INTEGER NOT NULL,
    "date" DATE NOT NULL,
    "time_in" TIME(0) NOT NULL,
    "time_out" TIME(0) NOT NULL,

    CONSTRAINT "Mock_pkey" PRIMARY KEY ("id")
);
