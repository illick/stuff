SELECT TOP 1750000 SS.SubscriberKey, SS.EmailAddress, SS.PreferredStore, SS.PriceZone, SS.[Loyalty Number], 'Gmail' AS Domain
FROM [Sendable_subscribers] SS
INNER JOIN [GmailDomain_Sendable] GO ON SS.SubscriberKey=GO.SubscriberKey
INNER JOIN [STORE] S ON SS.PreferredStore = S.store_key
INNER JOIN [20240507_LTA_LTAExpiringOffers_MAY_SEND] SND on SS.SubscriberKey = SND.SubscriberKey
LEFT JOIN [global_suppression] GS ON SS.SubscriberKey=GS.SubscriberKey
LEFT JOIN [No Offers] NOFF ON SS.SubscriberKey=NOFF.SubscriberKey
WHERE
GS.SubscriberKey IS NULL
AND NOFF.SubscriberKey IS NULL
AND S.State NOT IN ('CT','MI', 'KS')


UNION
SELECT TOP 800000 SS.SubscriberKey, SS.EmailAddress, SS.PreferredStore, SS.PriceZone, SS.[Loyalty Number], 'VMG' AS Domain
FROM [Sendable_subscribers] SS
INNER JOIN [VMG-Opened Last 30 Days] GO ON SS.SubscriberKey=GO.SubscriberKey
INNER JOIN [STORE] S ON SS.PreferredStore = S.store_key
INNER JOIN [20240507_LTA_LTAExpiringOffers_MAY_SEND] SND on SS.SubscriberKey = SND.SubscriberKey
LEFT JOIN [global_suppression] GS ON SS.SubscriberKey=GS.SubscriberKey
LEFT JOIN [No Offers] NOFF ON SS.SubscriberKey=NOFF.SubscriberKey
WHERE
GS.SubscriberKey IS NULL
AND NOFF.SubscriberKey IS NULL
AND S.State NOT IN ('CT','MI', 'KS')

UNION
SELECT TOP 50000 SS.SubscriberKey, SS.EmailAddress, SS.PreferredStore, SS.PriceZone, SS.[Loyalty Number], 'MSFT-Click' AS Domain
FROM [Sendable_subscribers] SS
INNER JOIN 	[Microsoft-ClickedLast30Days] GO ON SS.SubscriberKey=GO.SubscriberKey
INNER JOIN [STORE] S ON SS.PreferredStore = S.store_key
INNER JOIN [20240507_LTA_LTAExpiringOffers_MAY_SEND] SND on SS.SubscriberKey = SND.SubscriberKey
LEFT JOIN [global_suppression] GS ON SS.SubscriberKey=GS.SubscriberKey
LEFT JOIN [No Offers] NOFF ON SS.SubscriberKey=NOFF.SubscriberKey
WHERE
GS.SubscriberKey IS NULL
AND NOFF.SubscriberKey IS NULL
AND S.State NOT IN ('CT','MI', 'KS')

UNION /*Additional MSFT from Openers to fill */
SELECT TOP 150000 SS.SubscriberKey, SS.EmailAddress, SS.PreferredStore, SS.PriceZone, SS.[Loyalty Number], 'MSFT-Open' AS Domain
FROM [Sendable_subscribers] SS
INNER JOIN 	[Microsoft-Opened Last 30 Days] GO ON SS.SubscriberKey=GO.SubscriberKey
INNER JOIN [STORE] S ON SS.PreferredStore = S.store_key
INNER JOIN [20240507_LTA_LTAExpiringOffers_MAY_SEND] SND on SS.SubscriberKey = SND.SubscriberKey
LEFT JOIN [global_suppression] GS ON SS.SubscriberKey=GS.SubscriberKey
LEFT JOIN [No Offers] NOFF ON SS.SubscriberKey=NOFF.SubscriberKey
LEFT JOIN [Microsoft-ClickedLast30Days] CL ON SS.SubscriberKey = CL.Subscriberkey
WHERE
GS.SubscriberKey IS NULL
AND NOFF.SubscriberKey IS NULL
AND S.State NOT IN ('CT','MI', 'KS')
AND CL.SubscriberKey IS NULL

UNION
SELECT TOP 80000 SS.SubscriberKey, SS.EmailAddress, SS.PreferredStore, SS.PriceZone, SS.[Loyalty Number], 'APPL' AS Domain
FROM [Sendable_subscribers] SS
INNER JOIN [AppleDomain_Sendable] GO ON SS.SubscriberKey=GO.SubscriberKey
INNER JOIN [STORE] S ON SS.PreferredStore = S.store_key
INNER JOIN [20240507_LTA_LTAExpiringOffers_MAY_SEND] SND on SS.SubscriberKey = SND.SubscriberKey
LEFT JOIN [global_suppression] GS ON SS.SubscriberKey=GS.SubscriberKey
LEFT JOIN [No Offers] NOFF ON SS.SubscriberKey=NOFF.SubscriberKey
WHERE
GS.SubscriberKey IS NULL
AND NOFF.SubscriberKey IS NULL
AND S.State NOT IN ('CT','MI', 'KS')


UNION 
SELECT TOP 450000 SS.SubscriberKey, SS.EmailAddress, SS.PreferredStore, SS.PriceZone, SS.[Loyalty Number], 'MiscGen' AS Domain
FROM [Sendable_subscribers] SS
INNER JOIN [MiscDomains_Sendable] GO ON SS.SubscriberKey=GO.SubscriberKey
INNER JOIN [STORE] S ON SS.PreferredStore = S.store_key
INNER JOIN [20240507_LTA_LTAExpiringOffers_MAY_SEND] SND on SS.SubscriberKey = SND.SubscriberKey
LEFT JOIN [global_suppression] GS ON SS.SubscriberKey=GS.SubscriberKey
LEFT JOIN [No Offers] NOFF ON SS.SubscriberKey=NOFF.SubscriberKey
WHERE
GS.SubscriberKey IS NULL
AND NOFF.SubscriberKey IS NULL
AND S.State NOT IN ('CT','MI', 'KS')