/* Target: DepartmentPreference_Step1_FullTransactionList */
SELECT DISTINCT TLI.LOYALTY_CARD_NUM AS LoyaltyNumber, ITM.DEPARTMENT, SUM(TLI.SALES_DOLLARS) as TotalSales
FROM [EDAP_TransactionLineItem_LastYear] TLI
INNER JOIN [EDAP_TransactionSummary_LastYear] TSUM ON TLI.TXN_ID = TSUM.TXN_ID
INNER JOIN [EDAP_Item] ITM ON TLI.ITEM_CODE = ITM.ITEM_CODE
WHERE TSUM.HAS_RETURN = 0
AND TLI.Business_Date >= DateAdd(day,-540,GetDate())
GROUP BY TLI.LOYALTY_CARD_NUM, ITM.DEPARTMENT

/*Target: DepartmentPreference_Step2_FindMaxSales */
SELECT VTL.LoyaltyNumber, MAX(VTL.TotalSales) AS MaxSales
FROM [DepartmentPreference_Step1_FullTransactionList] VTL
WHERE VTL.LoyaltyNumber != ''
GROUP BY VTL.LoyaltyNumber


/* Target: DepartmentPreference_Step3_GoToDepartmentAssignment (OLD:Step3 GoToType) */
SELECT OT.LoyaltyNumber ,VTL.Department, VTL.TotalSales
FROM [DepartmentPreference_Step1_FullTransactionList] VTL
INNER JOIN [DepartmentPreference_Step2_FindMaxSales] OT ON (VTL.TotalSales = OT.MaxSales AND VTL.LoyaltyNumber =  OT.LoyaltyNumber)
WHERE VTL.Type IS NOT NULL
AND OT.MaxSales IS NOT NULL