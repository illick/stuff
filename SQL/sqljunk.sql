SELECT S.SubscriberKey,S.EmailAddress,S.Domain FROM [Microsoft-Domains] S
WHERE EXISTS (
            Select 1 from _OPEN O WHERE O.SubscriberKey=S.SubscriberKey
            AND O.[eventdate] < GETDATE()
            AND O.[eventdate] > DATEADD(day, -15,GETDATE())
            )


SELECT LTA.LoyaltyCardNumber, LTA.HybrisPromotionId, LTA.ExpirationDate, LTA.DisplayOrder, LTA.OfferStatus, LTA.OfferId, LTA.Store, LTA.VisibleStartDate
FROM [TEMP_LTA_OFFERS_IMPORT] LTA
WHERE EXISTS (
            Select 1 from [Sendable_Subscribers] SS WHERE SS.SubscriberKey=LTA.SubscriberKey
            )