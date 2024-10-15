/*
  Warnings:

  - The primary key for the `Products` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "Purchases" DROP CONSTRAINT "Purchases_productId_fkey";

-- DropForeignKey
ALTER TABLE "Sales" DROP CONSTRAINT "Sales_salesProductId_fkey";

-- DropIndex
DROP INDEX "Purchases_productId_key";

-- DropIndex
DROP INDEX "Sales_salesProductId_key";

-- AlterTable
ALTER TABLE "Products" DROP CONSTRAINT "Products_pkey",
ALTER COLUMN "productId" DROP DEFAULT,
ALTER COLUMN "productId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Products_pkey" PRIMARY KEY ("productId");
DROP SEQUENCE "Products_productId_seq";

-- AlterTable
ALTER TABLE "Purchases" ALTER COLUMN "productId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Sales" ALTER COLUMN "salesProductId" SET DATA TYPE TEXT;

-- AddForeignKey
ALTER TABLE "Sales" ADD CONSTRAINT "Sales_salesProductId_fkey" FOREIGN KEY ("salesProductId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchases" ADD CONSTRAINT "Purchases_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;
