/*
  Warnings:

  - The primary key for the `ExpenseSummary` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Expenses` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `PurchaseSummary` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Purchases` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Sales` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `SalesSummary` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "ExpenseByCategory" DROP CONSTRAINT "ExpenseByCategory_expenseSummaryId_fkey";

-- AlterTable
ALTER TABLE "ExpenseByCategory" ALTER COLUMN "expenseSummaryId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "ExpenseSummary" DROP CONSTRAINT "ExpenseSummary_pkey",
ALTER COLUMN "expenseSummaryId" DROP DEFAULT,
ALTER COLUMN "expenseSummaryId" SET DATA TYPE TEXT,
ADD CONSTRAINT "ExpenseSummary_pkey" PRIMARY KEY ("expenseSummaryId");
DROP SEQUENCE "ExpenseSummary_expenseSummaryId_seq";

-- AlterTable
ALTER TABLE "Expenses" DROP CONSTRAINT "Expenses_pkey",
ALTER COLUMN "expenseId" DROP DEFAULT,
ALTER COLUMN "expenseId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY ("expenseId");
DROP SEQUENCE "Expenses_expenseId_seq";

-- AlterTable
ALTER TABLE "PurchaseSummary" DROP CONSTRAINT "PurchaseSummary_pkey",
ALTER COLUMN "purchaseSummaryId" DROP DEFAULT,
ALTER COLUMN "purchaseSummaryId" SET DATA TYPE TEXT,
ADD CONSTRAINT "PurchaseSummary_pkey" PRIMARY KEY ("purchaseSummaryId");
DROP SEQUENCE "PurchaseSummary_purchaseSummaryId_seq";

-- AlterTable
ALTER TABLE "Purchases" DROP CONSTRAINT "Purchases_pkey",
ALTER COLUMN "purchaseId" DROP DEFAULT,
ALTER COLUMN "purchaseId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Purchases_pkey" PRIMARY KEY ("purchaseId");
DROP SEQUENCE "Purchases_purchaseId_seq";

-- AlterTable
ALTER TABLE "Sales" DROP CONSTRAINT "Sales_pkey",
ALTER COLUMN "saleId" DROP DEFAULT,
ALTER COLUMN "saleId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Sales_pkey" PRIMARY KEY ("saleId");
DROP SEQUENCE "Sales_saleId_seq";

-- AlterTable
ALTER TABLE "SalesSummary" DROP CONSTRAINT "SalesSummary_pkey",
ALTER COLUMN "salesSummaryId" DROP DEFAULT,
ALTER COLUMN "salesSummaryId" SET DATA TYPE TEXT,
ADD CONSTRAINT "SalesSummary_pkey" PRIMARY KEY ("salesSummaryId");
DROP SEQUENCE "SalesSummary_salesSummaryId_seq";

-- AddForeignKey
ALTER TABLE "ExpenseByCategory" ADD CONSTRAINT "ExpenseByCategory_expenseSummaryId_fkey" FOREIGN KEY ("expenseSummaryId") REFERENCES "ExpenseSummary"("expenseSummaryId") ON DELETE RESTRICT ON UPDATE CASCADE;
