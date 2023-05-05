-- CreateTable
CREATE TABLE "Usuarios" (
    "id" SERIAL NOT NULL,
    "address" TEXT NOT NULL,
    "avatarUrl" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "management" TEXT NOT NULL,
    "sectionsWeek" TEXT NOT NULL,
    "bloqueado" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Psicologos" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "description" TEXT NOT NULL,
    "media" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "totalReviews" TEXT NOT NULL,
    "notaEstrelas" TEXT NOT NULL,
    "bloqueado" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Psicologos_pkey" PRIMARY KEY ("id")
);
