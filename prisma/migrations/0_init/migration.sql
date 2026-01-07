-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "wearescanme";

-- CreateEnum
CREATE TYPE "wearescanme"."AnimalType" AS ENUM ('DOG', 'CAT');

-- CreateEnum
CREATE TYPE "wearescanme"."AnimalStatus" AS ENUM ('OWNED', 'STREET', 'LOST', 'FOUND');

-- CreateTable
CREATE TABLE "wearescanme"."Animal" (
    "id" TEXT NOT NULL,
    "qrCode" TEXT NOT NULL,
    "name" TEXT,
    "type" "wearescanme"."AnimalType" NOT NULL,
    "status" "wearescanme"."AnimalStatus" NOT NULL DEFAULT 'OWNED',
    "breed" TEXT,
    "color" TEXT,
    "description" TEXT,
    "imageUrl" TEXT,
    "ownerId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Animal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "wearescanme"."User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT,
    "preferredLang" TEXT NOT NULL DEFAULT 'en',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "wearescanme"."Scan" (
    "id" TEXT NOT NULL,
    "animalId" TEXT NOT NULL,
    "scannedBy" TEXT,
    "latitude" DOUBLE PRECISION,
    "longitude" DOUBLE PRECISION,
    "location" TEXT,
    "notes" TEXT,
    "scannedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Scan_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Animal_qrCode_key" ON "wearescanme"."Animal"("qrCode");

-- CreateIndex
CREATE INDEX "Animal_qrCode_idx" ON "wearescanme"."Animal"("qrCode");

-- CreateIndex
CREATE INDEX "Animal_ownerId_idx" ON "wearescanme"."Animal"("ownerId");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "wearescanme"."User"("email");

-- CreateIndex
CREATE INDEX "User_email_idx" ON "wearescanme"."User"("email");

-- CreateIndex
CREATE INDEX "Scan_animalId_idx" ON "wearescanme"."Scan"("animalId");

-- CreateIndex
CREATE INDEX "Scan_scannedAt_idx" ON "wearescanme"."Scan"("scannedAt");

-- AddForeignKey
ALTER TABLE "wearescanme"."Animal" ADD CONSTRAINT "Animal_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "wearescanme"."User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wearescanme"."Scan" ADD CONSTRAINT "Scan_animalId_fkey" FOREIGN KEY ("animalId") REFERENCES "wearescanme"."Animal"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wearescanme"."Scan" ADD CONSTRAINT "Scan_scannedBy_fkey" FOREIGN KEY ("scannedBy") REFERENCES "wearescanme"."User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

