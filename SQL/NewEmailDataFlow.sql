/* WINE Subcategory Pref */
/* feeds to: 4StarWine_SubcategoryMatch*/
SELECT VA.LoyaltyNumber, STA.Subcategory
FROM [Step3_GoToVarietal_Assignment] VA 
INNER JOIN [4StarWines] STA on VA.Varietal = STA.Subcategory
WHERE STA.Subcategory IS NOT NULL

/* Spirits Pref */
/* feeds to: 4StarSpirits_SubcategoryMatch*/
SELECT SA.LoyaltyNumber, STA.Subcategory
FROM [Step3_Spirit_GoToVarietal_Assignment] SA
INNER JOIN [4StarSpirits] STA on SA.Varietal = STA.Subcategory
WHERE STA.Subcategory IS NOT NULL
