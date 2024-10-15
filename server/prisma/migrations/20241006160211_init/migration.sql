/*
  Warnings:

  - You are about to drop the column `salesProductId` on the `Sales` table. All the data in the column will be lost.
  - Added the required column `productId` to the `Sales` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Sales" DROP CONSTRAINT "Sales_salesProductId_fkey";

-- AlterTable
ALTER TABLE "Sales" DROP COLUMN "salesProductId",
ADD COLUMN     "productId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Sales" ADD CONSTRAINT "Sales_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;
