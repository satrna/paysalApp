-- CreateTable
CREATE TABLE "Employee" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "base_salary" INTEGER NOT NULL,
    "allowance" INTEGER NOT NULL DEFAULT 0,
    "daily_rate" INTEGER NOT NULL,
    "overtime_rate" INTEGER NOT NULL,
    "time_in" TIME(0) NOT NULL,
    "time_out" TIME(0) NOT NULL,

    CONSTRAINT "Employee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Attendance" (
    "id" SERIAL NOT NULL,
    "time_in" TIME(0) NOT NULL,
    "time_out" TIME(0) NOT NULL,
    "current_daily_rate" INTEGER NOT NULL,
    "date" DATE NOT NULL,
    "employeeId" INTEGER NOT NULL,

    CONSTRAINT "Attendance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Overtime" (
    "id" SERIAL NOT NULL,
    "hours" DOUBLE PRECISION NOT NULL,
    "current_overtime_rate" INTEGER NOT NULL,
    "total_overtime_paycheck" INTEGER NOT NULL,
    "date" DATE NOT NULL,
    "employeeId" INTEGER NOT NULL,

    CONSTRAINT "Overtime_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AddOnPay" (
    "id" SERIAL NOT NULL,
    "bonus" INTEGER NOT NULL DEFAULT 0,
    "deduction" INTEGER NOT NULL DEFAULT 0,
    "date" DATE NOT NULL,
    "employeeId" INTEGER NOT NULL,

    CONSTRAINT "AddOnPay_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Attendance" ADD CONSTRAINT "Attendance_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Overtime" ADD CONSTRAINT "Overtime_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AddOnPay" ADD CONSTRAINT "AddOnPay_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
