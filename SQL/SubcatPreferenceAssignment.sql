SELECT DISTINCT TLI.LOYALTY_CARD_NUM as LoyaltyNumber,ITM.SUBCATEGORY, ITM.Class, SUM(TLI.TOTAL_UNIT_SALES_QUANTITY) as Frequency
FROM [EDAP_TransactionLineItem_LastYear] TLI
INNER JOIN [EDAP_Item] ITM ON TLI.Item_Code = ITM.ITEM_Code
WHERE TLI.Business_Date >= DateAdd(day,-540,GetDate())
GROUP BY TLI.LOYALTY_CARD_NUM, ITM.SUBCATEGORY, ITM.Class


SELECT VTL.LoyaltyNumber, MAX(VTL.Frequency) AS Frequency
FROM [SubcatPreference_Step1_FullTransactionList] VTL
WHERE VTL.LoyaltyNumber != ''
AND VTL.Frequency >= 2
GROUP BY VTL.LoyaltyNumber


SELECT OT.LoyaltyNumber ,VTL.Subcategory, OT.Frequency, VTL.Class
FROM [SubcatPreference_Step1_FullTransactionList] VTL
INNER JOIN [SubcatPreference_Step2_FindMaxFrequency] OT ON (VTL.Frequency = OT.Frequency AND VTL.loyaltynumber =  OT.loyaltynumber)
WHERE
VTL.Subcategory IS NOT NULL
AND
OT.Frequency IS NOT NULL