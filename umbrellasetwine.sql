SELECT D1.[ITEM_CODE],  D2.[ITEM_NAME], D2.[PRODUCT_TYPE], D3.[STORE_KEY] AS Preferredstore, SUM(D1.[SALES_DOLLARS]) as SumofSales, D2. COUNTRY_STATE, D2.[STYLE], D2.[TASTE_1],D2.[TASTE_2], D2.[TASTE_3], D4.[INVENTORY],
CASE
    WHEN (D4.[Price]  < 20) THEN 'Under20'
    WHEN (D4.[Price] >= 20 AND D4.[Price] < 30) THEN 'Under30'        
    WHEN (D4.[Price] >= 30 AND D4.[Price] < 50) THEN 'Under50'
WHEN (D4.[Price] >= 50) THEN '50Plus'       
ELSE 'Under30'
END AS PRICERANGE

FROM [EDAP_TransactionLineItem_LastYear] D1
INNER JOIN  [EDAP_Item] D2
ON D1.[ITEM_CODE]= D2.[ITEM_CODE]
INNER JOIN [store] D3
on D1.[STORE_KEY]=D3.[STORE_KEY]
INNER JOIN [EDAP_ItemStore_RealTimeInventory] D4
ON (D1.[ITEM_CODE]=D4.[ITEM_CODE]) AND (D1.[STORE_KEY]=D4.[STORE_KEY])
INNER JOIN [HybrisImageURLs_Target] D5  ON D2.[ITEM_CODE] = D5.[ItemCode]
WHERE
(D2.[DEPARTMENT] = 'Spirits' AND D4.[SALES_STRATEGY] IN ('WD','WP'))
AND D4.[INVENTORY] > 5
AND (D4.[PRICE] > 10 AND D4.[PRICE] < 75)
AND (D2.[PACKAGE_TYPE] = '750ml' OR D2.[PACKAGE_TYPE] = '1.5L') 
AND (D4.[WEB_APPROVED] = 1) AND (D2.COUNTRY_STATE IS NOT NULL AND  D2.PRODUCT_TYPE IS NOT NULL)
AND DATEDIFF(day,D1.[BUSINESS_DATE], GETDATE()) <= 740
AND D2.COUNTRY_STATE != 'Russia'
AND D5.[Image_140x196] IS NOT NULL
GROUP BY D1.[ITEM_CODE], D3.[STORE_KEY], D2.[ITEM_NAME], D2.[PRODUCT_TYPE], D4.[Price], D2. COUNTRY_STATE, D2.[STYLE],D2.[TASTE_1],D2.[TASTE_2], D2.[TASTE_3], D4.[INVENTORY]





WINE


SELECT TLI.ITEM_CODE,  ITM.ITEM_NAME, ITM.PRODUCT_TYPE, TLI.STORE_KEY AS Preferredstore, SUM(TLI.SALES_DOLLARS) as SumofSales, ITM.VARIETAL_TYPE_DESC, ITM.REGION
FROM [EDAP_TransactionLineItem_LastYear] TLI
INNER JOIN  [EDAP_Item] ITM ON TLI.ITEM_CODE=ITM.ITEM_CODE
INNER JOIN [EDAP_ItemStore_RealTimeInventory] INV ON (TLI.ITEM_CODE=INV.ITEM_CODE) AND (TLI.STORE_KEY=INV.STORE_KEY)
WHERE ITM.DEPARTMENT = 'Wine' 
AND INV.SALES_STRATEGY = 'WD'
AND INV.INVENTORY > 5
AND INV.PRICE > 10 
AND INV.PRICE < 75
AND INV.WEB_APPROVED = 1
AND ITM.VARIETAL_TYPE_DESC IS NOT NULL 
AND ITM. REGION IS NOT NULL
AND (ITM.[PACKAGE_TYPE] = '750ml' OR ITM.[PACKAGE_TYPE] = '1.5L') 
GROUP BY TLI.[ITEM_CODE], TLI.[STORE_KEY], ITM.[ITEM_NAME], ITM.[PRODUCT_TYPE], INV.[Price], ITM.VARIETAL_TYPE_DESC, ITM.REGION