SELECT SS.SubscriberKey,SS.EmailAddress, SS.PreferredStore, SS.PriceZone, SS.[Loyalty Number], LTA.HybrisPromotionId AS FirstOfferHybris 
FROM [Sendable_Subscribers] SS
INNER JOIN [store] S on SS.PreferredStore=S.Store_key
INNER JOIN [LTA_OFFERS_IMPORT] LTA ON LTA.LoyaltyCardNumber=SS.[Loyalty Number]
INNER JOIN 
(
	SELECT LoyaltyCardNumber, MIN(DisplayOrder) AS LowestDisplayOrder FROM [LTA_OFFERS_IMPORT]
) LTA ON LTA.LoyaltyCardNumber=SS.[Loyalty Number]
WHERE S.LTA = 1 
AND LTA.HybrisPromotionId LIKE 'LTA_%'
AND LTA.HybrisPromotionId NOT LIKE 'LTA_QUOTIENT_CB%'
AND LTA.OfferStatus IN ('active','eligible')
AND LTA.ExpirationDate > GetDate()
AND LTA.LowestDisplayOrder = LTA.DisplayOrder



INNER JOIN
  (
    SELECT Id, MIN(Point) MinPoint
    FROM TableName
    GROUP BY Id
  ) tbl1
  ON tbl1.id = tbl.id
WHERE tbl1.MinPoint = tbl.Point





SELECT SS.SubscriberKey,SS.EmailAddress, SS.PreferredStore, SS.PriceZone, SS.[Loyalty Number], LTA.HybrisPromotionId AS FirstOfferHybris 
FROM [Sendable_Subscribers] SS
INNER JOIN [store] S on SS.PreferredStore=S.Store_key
INNER JOIN 
(
	SELECT LoyaltyCardNumber, HybrisPromotionId, OfferStatus, ExpirationDate, DisplayOrder, MIN(DisplayOrder) AS LowestDisplayOrder 
	FROM [LTA_OFFERS_IMPORT] D1 
	GROUP BY LoyaltyCardNumber, HybrisPromotionId, OfferStatus, ExpirationDate, DisplayOrder
) LTA 
ON LTA.LoyaltyCardNumber=SS.[Loyalty Number]
WHERE S.LTA = 1 
AND LTA.HybrisPromotionId LIKE 'LTA_%'
AND LTA.HybrisPromotionId NOT LIKE 'LTA_QUOTIENT_CB%'
AND LTA.OfferStatus IN ('active','eligible')
AND LTA.ExpirationDate > GetDate()
AND LTA.LowestDisplayOrder = LTA.DisplayOrder