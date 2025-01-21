/*Feeds to 4StarProducts */
SELECT BVM.ProductID AS ItemCode, BVM.DisplayableReviews, BVM.AverageRating, ITM.DEPARTMENT, ITM.SUBCATEGORY,
CASE
  WHEN ITM.DEPARTMENT = 'Wine' THEN
    CASE
      WHEN (INV.Price  < 15) THEN 'Under15'
      WHEN (INV.Price >= 15 AND INV.Price < 25) THEN '15-25'
      WHEN (INV.Price >= 25 AND INV.Price < 40) THEN '25-40' 
    ELSE 'Over40'
    END 
  WHEN ITM.DEPARTMENT = 'Spirits' THEN
    CASE
      WHEN (INV.Price  < 30) THEN 'Under30'
      WHEN (INV.Price >= 30 AND INV.Price < 50) THEN '30-50'
    ELSE 'Over50'
    END
  ELSE ''
END AS ProductPriceGroup
FROM [BazaarVoiceMasterImport] BVM 
INNER JOIN [EDAP_Item] ITM on BVM.ProductID = ITM.ITEM_CODE
INNER JOIN [EDAP_ItemStore_RealTimeInventory] INV ON BVM.ProductID = INV.ITEM_CODE 
WHERE
BVM.AverageRating > 4
AND BVM.DisplayableReviews > 10
AND ITM.PACKAGE_TYPE IN ('700ml', '750ml', '800ml', '900ml', '950ml', '1L', '1LBox', '1.5L', '1.5LBox', '1.75L' , '1.8L')
AND ITM.VARIETAL_TYPE_DESC IS NOT NULL
AND ITM.DEPARTMENT IS NOT NULL
AND INV.PRICE IS NOT NULL

/* Supplemental Queries */

/* Feeds to: 4StarWines */
SELECT * FROM [4StarProducts] STA
WHERE STA.Department = 'Wine'
/* Create a list of Wine Items (query efficiency)*/

/* Feeds to: 4StarSpirits */
SELECT * FROM [4StarProducts] STA
WHERE STA.Department = 'Spirits'
/* Create a list of Spirits Items (query efficiency)*/

