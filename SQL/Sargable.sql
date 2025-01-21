/* Non-SARGable */
SELECT SS.EmailAddress, SS.PriceZone, SS.PreferredStore, SS.[Loyalty Number] FROM [Sendable_Subscribers] SS 
INNER JOIN [EDAP_TransactionLineItem] TLI ON SS.EmailAddress = TLI.EMAIL_ADDR
INNER JOIN [EDAP_Item] ITM ON TLI.ITEM_CODE = ITM.ITEM_CODE
INNER JOIN [EDAP_TransactionSummary_LastYear] TSUM ON TLI.TXN_ID = TSUM.TXN_ID
WHERE ITM. PRODUCT_TYPE = 'Red Wine'
AND TSUM.HAS_RETURN = 0
AND DATEDIFF(day,TLI.BUSINESS_DATE, GETDATE()) <= 365


/* SARGable fix */
SELECT SS.EmailAddress, SS.PriceZone, SS.PreferredStore, SS.[Loyalty Number] FROM [Sendable_Subscribers] SS 
INNER JOIN [EDAP_TransactionLineItem_LastYear] TLI ON SS.[Loyalty Number] = TLI.LOYALTY_CARD_NUM
INNER JOIN [EDAP_Item] ITM ON TLI.ITEM_CODE = ITM.ITEM_CODE
INNER JOIN [EDAP_TransactionSummary_LastYear] TSUM ON TLI.TXN_ID = TSUM.TXN_ID
WHERE ITM. PRODUCT_TYPE = 'Red Wine'
AND TSUM.HAS_RETURN = 0
AND TLI.Business_Date >= DateAdd(day,-365,GetDate())


