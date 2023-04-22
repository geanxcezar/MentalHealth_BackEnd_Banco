-- CreateTable
CREATE TABLE "Usuarios" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,

    CONSTRAINT "Usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Psicologos" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "registro_profissional" TEXT,
    "email" TEXT,
    "telefone" TEXT,
    "endereco" TEXT,
    "descricao" TEXT,
    "data_cadastro" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "bloqueado" BOOLEAN DEFAULT false,

    CONSTRAINT "Psicologos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Colaboradores" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "usuarioId" INTEGER,
    "departamento" TEXT,
    "cargo" TEXT,
    "endereco" TEXT,
    "salraio" DOUBLE PRECISION,
    "data_contratacao" TIMESTAMP(3),
    "bloqueado" BOOLEAN DEFAULT false,

    CONSTRAINT "Colaboradores_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuarios_email_key" ON "Usuarios"("email");

-- AddForeignKey
ALTER TABLE "Colaboradores" ADD CONSTRAINT "Colaboradores_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuarios"("id") ON DELETE SET NULL ON UPDATE CASCADE;
