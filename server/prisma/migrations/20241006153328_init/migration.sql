/*
  Warnings:

  - The primary key for the `ExpenseSummary` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `expenseSummaryId` column on the `ExpenseSummary` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Expenses` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `expenseId` column on the `Expenses` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Products` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `productId` column on the `Products` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `PurchaseSummary` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `purchaseSummaryId` column on the `PurchaseSummary` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Purchases` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `purchaseId` column on the `Purchases` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Sales` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `productId` on the `Sales` table. All the data in the column will be lost.
  - The `saleId` column on the `Sales` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `SalesSummary` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `salesSummaryId` column on the `SalesSummary` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `userId` column on the `Users` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - A unique constraint covering the columns `[productId]` on the table `Purchases` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[salesProductId]` on the table `Sales` will be added. If there are existing duplicate values, this will fail.
  - Changed the type of `expenseSummaryId` on the `ExpenseByCategory` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `productId` on the `Purchases` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `salesProductId` to the `Sales` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ExpenseByCategory" DROP CONSTRAINT "ExpenseByCategory_expenseSummaryId_fkey";

-- DropForeignKey
ALTER TABLE "Purchases" DROP CONSTRAINT "Purchases_productId_fkey";

-- DropForeignKey
ALTER TABLE "Sales" DROP CONSTRAINT "Sales_productId_fkey";

-- AlterTable
ALTER TABLE "ExpenseByCategory" DROP COLUMN "expenseSummaryId",
ADD COLUMN     "expenseSummaryId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "ExpenseSummary" DROP CONSTRAINT "ExpenseSummary_pkey",
DROP COLUMN "expenseSummaryId",
ADD COLUMN     "expenseSummaryId" SERIAL NOT NULL,
ADD CONSTRAINT "ExpenseSummary_pkey" PRIMARY KEY ("expenseSummaryId");

-- AlterTable
ALTER TABLE "Expenses" DROP CONSTRAINT "Expenses_pkey",
DROP COLUMN "expenseId",
ADD COLUMN     "expenseId" SERIAL NOT NULL,
ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY ("expenseId");

-- AlterTable
ALTER TABLE "Products" DROP CONSTRAINT "Products_pkey",
DROP COLUMN "productId",
ADD COLUMN     "productId" SERIAL NOT NULL,
ADD CONSTRAINT "Products_pkey" PRIMARY KEY ("productId");

-- AlterTable
ALTER TABLE "PurchaseSummary" DROP CONSTRAINT "PurchaseSummary_pkey",
DROP COLUMN "purchaseSummaryId",
ADD COLUMN     "purchaseSummaryId" SERIAL NOT NULL,
ADD CONSTRAINT "PurchaseSummary_pkey" PRIMARY KEY ("purchaseSummaryId");

-- AlterTable
ALTER TABLE "Purchases" DROP CONSTRAINT "Purchases_pkey",
DROP COLUMN "purchaseId",
ADD COLUMN     "purchaseId" SERIAL NOT NULL,
DROP COLUMN "productId",
ADD COLUMN     "productId" INTEGER NOT NULL,
ADD CONSTRAINT "Purchases_pkey" PRIMARY KEY ("purchaseId");

-- AlterTable
ALTER TABLE "Sales" DROP CONSTRAINT "Sales_pkey",
DROP COLUMN "productId",
ADD COLUMN     "salesProductId" INTEGER NOT NULL,
DROP COLUMN "saleId",
ADD COLUMN     "saleId" SERIAL NOT NULL,
ADD CONSTRAINT "Sales_pkey" PRIMARY KEY ("saleId");

-- AlterTable
ALTER TABLE "SalesSummary" DROP CONSTRAINT "SalesSummary_pkey",
DROP COLUMN "salesSummaryId",
ADD COLUMN     "salesSummaryId" SERIAL NOT NULL,
ADD CONSTRAINT "SalesSummary_pkey" PRIMARY KEY ("salesSummaryId");

-- AlterTable
ALTER TABLE "Users" DROP CONSTRAINT "Users_pkey",
DROP COLUMN "userId",
ADD COLUMN     "userId" SERIAL NOT NULL,
ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Purchases_productId_key" ON "Purchases"("productId");

-- CreateIndex
CREATE UNIQUE INDEX "Sales_salesProductId_key" ON "Sales"("salesProductId");

-- AddForeignKey
ALTER TABLE "Sales" ADD CONSTRAINT "Sales_salesProductId_fkey" FOREIGN KEY ("salesProductId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchases" ADD CONSTRAINT "Purchases_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExpenseByCategory" ADD CONSTRAINT "ExpenseByCategory_expenseSummaryId_fkey" FOREIGN KEY ("expenseSummaryId") REFERENCES "ExpenseSummary"("expenseSummaryId") ON DELETE RESTRICT ON UPDATE CASCADE;
