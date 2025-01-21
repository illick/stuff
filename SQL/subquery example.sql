SELECT IM.ItemCode, IM.CompRetail, RTI.price, RTI.Store_key, IM.CompRetail - RTI.Price AS Discount, IM.ShopDate, IM.Group
FROM [20240422_Promo_Misc_PricePerception_ItemImport] IM
INNER JOIN [EDAP_ItemStore_RealTimeInventory] RTI on IM.ItemCode = RTI.ITEM_CODE AND 
INNER JOIN [store] S on S.store_key = RTI.Store_key
WHERE RTI.STORE_QTY >= 12
AND RTI.Store_key IN 
(SELECT s.Store_key FROM [store] s
INNER JOIN [20240422_Promo_Misc_PricePerception_ItemImport] im on s.price_zone_key = im.target)