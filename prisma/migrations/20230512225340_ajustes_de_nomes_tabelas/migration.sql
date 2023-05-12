/*
  Warnings:

  - You are about to drop the `Agendamento` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Paciente` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Psicologo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Usuario` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_PacienteToUsuario` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_PsicologoToUsuario` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Agendamento" DROP CONSTRAINT "Agendamento_pacienteId_fkey";

-- DropForeignKey
ALTER TABLE "Agendamento" DROP CONSTRAINT "Agendamento_psicologoId_fkey";

-- DropForeignKey
ALTER TABLE "_PacienteToUsuario" DROP CONSTRAINT "_PacienteToUsuario_A_fkey";

-- DropForeignKey
ALTER TABLE "_PacienteToUsuario" DROP CONSTRAINT "_PacienteToUsuario_B_fkey";

-- DropForeignKey
ALTER TABLE "_PsicologoToUsuario" DROP CONSTRAINT "_PsicologoToUsuario_A_fkey";

-- DropForeignKey
ALTER TABLE "_PsicologoToUsuario" DROP CONSTRAINT "_PsicologoToUsuario_B_fkey";

-- DropTable
DROP TABLE "Agendamento";

-- DropTable
DROP TABLE "Paciente";

-- DropTable
DROP TABLE "Psicologo";

-- DropTable
DROP TABLE "Usuario";

-- DropTable
DROP TABLE "_PacienteToUsuario";

-- DropTable
DROP TABLE "_PsicologoToUsuario";

-- CreateTable
CREATE TABLE "Usuarios" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,

    CONSTRAINT "Usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Psicologos" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "crp" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "media" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "totalReviews" TEXT NOT NULL,
    "notaEstrelas" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "bloqueado" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Psicologos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pacientes" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "management" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "sectionsWeek" TEXT NOT NULL,
    "avatarUrl" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "bloqueado" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Pacientes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Agendamentos" (
    "id" SERIAL NOT NULL,
    "dataagenda" TIMESTAMP(3) NOT NULL,
    "horaagenda" TIMESTAMP(3) NOT NULL,
    "psicologoId" INTEGER NOT NULL,
    "pacienteId" INTEGER NOT NULL,

    CONSTRAINT "Agendamentos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_PsicologosToUsuarios" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PacientesToUsuarios" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_PsicologosToUsuarios_AB_unique" ON "_PsicologosToUsuarios"("A", "B");

-- CreateIndex
CREATE INDEX "_PsicologosToUsuarios_B_index" ON "_PsicologosToUsuarios"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PacientesToUsuarios_AB_unique" ON "_PacientesToUsuarios"("A", "B");

-- CreateIndex
CREATE INDEX "_PacientesToUsuarios_B_index" ON "_PacientesToUsuarios"("B");

-- AddForeignKey
ALTER TABLE "Agendamentos" ADD CONSTRAINT "Agendamentos_psicologoId_fkey" FOREIGN KEY ("psicologoId") REFERENCES "Psicologos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Agendamentos" ADD CONSTRAINT "Agendamentos_pacienteId_fkey" FOREIGN KEY ("pacienteId") REFERENCES "Pacientes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PsicologosToUsuarios" ADD CONSTRAINT "_PsicologosToUsuarios_A_fkey" FOREIGN KEY ("A") REFERENCES "Psicologos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PsicologosToUsuarios" ADD CONSTRAINT "_PsicologosToUsuarios_B_fkey" FOREIGN KEY ("B") REFERENCES "Usuarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PacientesToUsuarios" ADD CONSTRAINT "_PacientesToUsuarios_A_fkey" FOREIGN KEY ("A") REFERENCES "Pacientes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PacientesToUsuarios" ADD CONSTRAINT "_PacientesToUsuarios_B_fkey" FOREIGN KEY ("B") REFERENCES "Usuarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;
