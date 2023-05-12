/*
  Warnings:

  - You are about to drop the `Agendamentos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Psicologos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Usuarios` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Agendamentos" DROP CONSTRAINT "Agendamentos_psicologoId_fkey";

-- DropForeignKey
ALTER TABLE "Agendamentos" DROP CONSTRAINT "Agendamentos_usuarioId_fkey";

-- DropTable
DROP TABLE "Agendamentos";

-- DropTable
DROP TABLE "Psicologos";

-- DropTable
DROP TABLE "Usuarios";

-- CreateTable
CREATE TABLE "Usuario" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Psicologo" (
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

    CONSTRAINT "Psicologo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Paciente" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "management" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "sectionsWeek" TEXT NOT NULL,
    "avatarUrl" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "bloqueado" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Paciente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Agendamento" (
    "id" SERIAL NOT NULL,
    "dataagenda" TIMESTAMP(3) NOT NULL,
    "horaagenda" TIMESTAMP(3) NOT NULL,
    "psicologoId" INTEGER NOT NULL,
    "pacienteId" INTEGER NOT NULL,

    CONSTRAINT "Agendamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_PsicologoToUsuario" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PacienteToUsuario" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_PsicologoToUsuario_AB_unique" ON "_PsicologoToUsuario"("A", "B");

-- CreateIndex
CREATE INDEX "_PsicologoToUsuario_B_index" ON "_PsicologoToUsuario"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PacienteToUsuario_AB_unique" ON "_PacienteToUsuario"("A", "B");

-- CreateIndex
CREATE INDEX "_PacienteToUsuario_B_index" ON "_PacienteToUsuario"("B");

-- AddForeignKey
ALTER TABLE "Agendamento" ADD CONSTRAINT "Agendamento_psicologoId_fkey" FOREIGN KEY ("psicologoId") REFERENCES "Psicologo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Agendamento" ADD CONSTRAINT "Agendamento_pacienteId_fkey" FOREIGN KEY ("pacienteId") REFERENCES "Paciente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PsicologoToUsuario" ADD CONSTRAINT "_PsicologoToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "Psicologo"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PsicologoToUsuario" ADD CONSTRAINT "_PsicologoToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "Usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PacienteToUsuario" ADD CONSTRAINT "_PacienteToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "Paciente"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PacienteToUsuario" ADD CONSTRAINT "_PacienteToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "Usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE;
