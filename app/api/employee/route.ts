// app/api/main/route.ts

import { NextResponse, NextRequest } from "next/server";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export async function GET() {
  try {
    const employee = await prisma.employee.findMany();
    return NextResponse.json(employee);
  } catch (error) {
    console.error("Error fetching mocks:", error);
    return NextResponse.json(
      { error: "Failed to fetch mocks" },
      { status: 500 }
    );
  } finally {
    await prisma.$disconnect();
  }
}

export async function POST(request: NextRequest) {
  try {
    const data = await request.json();
    const { name, position, base_salary, allowance, time_in, time_out } = data;

    // Ensure the necessary fields are present
    if (!name || !position || !base_salary || allowance || !time_in || !time_out) {
      return NextResponse.json({ error: "Missing fields" }, { status: 400 });
    }

    // Calculate base_salary and total_salary
    const daily_rate = Math.floor(base_salary / 21);
    const overtime_rate = Math.floor(base_salary / 173);

    const timeIn = new Date(time_in);
    const timeOut = new Date(time_out);

    // Create a new mock record in the database
    const newEmployee = await prisma.employee.create({
      data: {
        name,
        position,
        base_salary,
        allowance,
        time_in: timeIn,
        time_out: timeOut,
      },
    });

    return NextResponse.json(newEmployee, { status: 201 });
  } catch (error) {
    console.error("Error creating mock:", error);
    return NextResponse.json(
      { error: "Failed to create mock" },
      { status: 500 }
    );
  } finally {
    await prisma.$disconnect();
  }
}
