SELECT OfferID, LoyaltyCardNumber, HybrisPromotionId, ExpirationDate, OfferStatus, DisplayOrder, Store 
FROM
[LTA_OFFERS_IMPORT] 
WHERE
HybrisPromotionId IN 
(
'LTA_FLASH_2022_08_20PCT_3ORMOREWD',
'LTA_FLASH_2022_08_20PCT_6ORMOREWD',
'LTA_FLASH_2022_08_20PCT_9ORMOREWD',
'LTA_FLASH_2023_12_20PCT_12ORMOREWD',
'LTA_FLASH_2023_04_15OFF_75WD')
AND ExpirationDate >= GETDATE()