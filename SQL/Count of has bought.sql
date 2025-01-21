SELECT COUNT(DISTINCT SS.Subscriberkey) FROM [Sendable_subscribers] SS
INNER JOIN [EDAP_TransactionLineItem_LastYear] TLI on SS.[Loyalty NUmber] = TLI.LOYALTY_CARD_NUM
INNER JOIN [EDAP_Item] ITM ON TLI.Item_Code = ITM.Item_Code
INNER JOIN [EDAP_TransactionSummary_LastYear] TSUM ON TLI.TXN_ID = TSUM.TXN_ID
WHERE
ITM.Department = 'Wine' 
AND ITM.Subcategory LIKE '%sweet%'
AND TSUM.Has_return = 0
