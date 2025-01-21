/* Hybris_NewCustomer_WithChanges */
	SELECT
	CU.[Email Type Key],
	CU.[Email Address],
	CU.[First Name],
	CASE WHEN ATT.[How Received] = '' THEN CU.[How Received]
								WHEN ATT.[How Received] IS NULL THEN CU.[How Received]
								ELSE ATT.[How Received] END AS [How Received],
	CU.[Loyalty Number],
	CU.[ChannelMemberID],
	CU.[Account Type],
	CU.[Preferred Store],
	CASE WHEN CU.[Preferred Store] = '9999' THEN '9999'
					ELSE ST.price_zone_key END AS [Price Zone],
	CU.[URL - customer update preferences],
	CU.[URL - unsubscribe],
	CU.[Promotions and Offers],
	CU.[Events and News],
	CU.[Product Preferences - Wine],
	CU.[Product Preferences - Beer],
	CU.[Product Preferences - Spirits],
	CU.[ProductType_Accessories],
	CU.[Product Preferences - Cigars],
	CU.[CategoryPreferences - Sparkling Wine],
	CU.[CategoryPreferences - Bordeaux],
	CU.[CategoryPreferences - Red Wine],
	CU.[CategoryPreferences - White Wine],
	CU.[CategoryPreferences - New World Wine],
	CU.[CategoryPreferences - Old World Wine],
	CU.[CategoryPreferences - Import Beer],
	CU.[CategoryPreferences - Domestic Beer],
	CU.[CategoryPreferences - Vodka],
	CU.[CategoryPreferences - Rum],
	CU.[CategoryPreferences - Gin],
	CU.[CategoryPreferences - Tequila],
	CU.[CategoryPreferences - Whiskey],
	CU.[CategoryPreferences - Single Malt Scotch],
	CU.[CategoryPreferences - Cognac],
	CU.[CategoryPreferences - Craft Beer],
	CU.[CategoryPreferences - Burgundy],
	 CASE
					WHEN CU.[Customer Status] = 'Active' AND SUBS.status = 'active' THEN 'active'
					WHEN CU.[Customer Status] = 'Active' AND SUBS.status = 'unsubscribed' THEN 'unsubscribed'
					WHEN CU.[Customer Status] = 'Unsubscribe' AND SUBS.status = 'active' THEN 'unsubscribed'
					WHEN CU.[Customer Status] = 'Unsubscribe' AND SUBS.status = 'unsubscribed' THEN 'unsubscribed'
					WHEN CU.[Customer Status] = 'Unsubscribed' AND SUBS.status = 'active' THEN 'unsubscribed'
					WHEN CU.[Customer Status] = 'Unsubscribed' AND SUBS.status = 'unsubscribed' THEN 'unsubscribed'
					WHEN CU.[Customer Status] = 'Active' AND SUBS.status = 'held' THEN ''
					WHEN CU.[Customer Status] = 'Active' AND SUBS.status = 'bounced' THEN ''
					WHEN CU.[Customer Status] = 'Unsubscribed' AND SUBS.status = 'held' THEN ''
					WHEN CU.[Customer Status] = 'Unsubscribed' AND SUBS.status = 'bounced' THEN ''
					WHEN CU.[Customer Status] = 'Unsubscribe' AND SUBS.status = 'held' THEN ''
					WHEN CU.[Customer Status] = 'Unsubscribe' AND SUBS.status = 'bounced' THEN ''
					ELSE CU.[Customer Status] END as [Customer Status],
	CS.SubscriberKey AS [Subscriber Key],
	CASE 
		WHEN CU.[Shipping State] = 'AL' THEN 'Alabama'
		WHEN CU.[Shipping State] = 'AK' THEN 'Alaska'
		WHEN CU.[Shipping State] = 'AZ' THEN 'Arizona'
		WHEN CU.[Shipping State] = 'AR' THEN 'Arkansas'
		WHEN CU.[Shipping State] = 'CA' THEN 'California'
		WHEN CU.[Shipping State] = 'CO' THEN 'Colorado'
		WHEN CU.[Shipping State] = 'CT' THEN 'Connecticut'
		WHEN CU.[Shipping State] = 'DE' THEN 'Delaware'
		WHEN CU.[Shipping State] = 'DC' THEN 'District of Columbia'
		WHEN CU.[Shipping State] = 'FL' THEN 'Florida'
		WHEN CU.[Shipping State] = 'GA' THEN 'Georgia'
		WHEN CU.[Shipping State] = 'HI' THEN 'Hawaii'
		WHEN CU.[Shipping State] = 'ID' THEN 'Idaho'
		WHEN CU.[Shipping State] = 'IL' THEN 'Illinois'
		WHEN CU.[Shipping State] = 'IN' THEN 'Indiana'
		WHEN CU.[Shipping State] = 'IA' THEN 'Iowa'
		WHEN CU.[Shipping State] = 'KS' THEN 'Kansas'
		WHEN CU.[Shipping State] = 'KY' THEN 'Kentucky'
		WHEN CU.[Shipping State] = 'LA' THEN 'Louisiana'
		WHEN CU.[Shipping State] = 'ME' THEN 'Maine'
		WHEN CU.[Shipping State] = 'MD' THEN 'Maryland'
		WHEN CU.[Shipping State] = 'MA' THEN 'Massachusetts'
		WHEN CU.[Shipping State] = 'MI' THEN 'Michigan'
		WHEN CU.[Shipping State] = 'MN' THEN 'Minnesota'
		WHEN CU.[Shipping State] = 'MS' THEN 'Mississippi'
		WHEN CU.[Shipping State] = 'MO' THEN 'Missouri'
		WHEN CU.[Shipping State] = 'MT' THEN 'Montana'
		WHEN CU.[Shipping State] = 'NE' THEN 'Nebraska'
		WHEN CU.[Shipping State] = 'NV' THEN 'Nevada'
		WHEN CU.[Shipping State] = 'NH' THEN 'New Hampshire'
		WHEN CU.[Shipping State] = 'NJ' THEN 'New Jersey'
		WHEN CU.[Shipping State] = 'NM' THEN 'New Mexico'
		WHEN CU.[Shipping State] = 'NY' THEN 'New York'
		WHEN CU.[Shipping State] = 'NC' THEN 'North Carolina'
		WHEN CU.[Shipping State] = 'ND' THEN 'North Dakota'
		WHEN CU.[Shipping State] = 'OH' THEN 'Ohio'
		WHEN CU.[Shipping State] = 'OK' THEN 'Oklahoma'
		WHEN CU.[Shipping State] = 'OR' THEN 'Oregon'
		WHEN CU.[Shipping State] = 'PA' THEN 'Pennsylvania'
		WHEN CU.[Shipping State] = 'RI' THEN 'Rhode Island'
		WHEN CU.[Shipping State] = 'SC' THEN 'South Carolina'
		WHEN CU.[Shipping State] = 'SD' THEN 'South Dakota'
		WHEN CU.[Shipping State] = 'TN' THEN 'Tennessee'
		WHEN CU.[Shipping State] = 'TX' THEN 'Texas'
		WHEN CU.[Shipping State] = 'UT' THEN 'Utah'
		WHEN CU.[Shipping State] = 'VT' THEN 'Vermont'
		WHEN CU.[Shipping State] = 'VA' THEN 'Virginia'
		WHEN CU.[Shipping State] = 'WA' THEN 'Washington'
		WHEN CU.[Shipping State] = 'WV' THEN 'West Virginia'
		WHEN CU.[Shipping State] = 'WI' THEN 'Wisconsin'
		WHEN CU.[Shipping State] = 'WY' THEN 'Wyoming'
	END AS [Shipping State],
	CU.HybrisEmailChangeUnsub,
	CU.HybrisEmailChangeCreate,
	ATT.Bordeaux_Futures,
	ATT.Concierge_Sales,
	CU.[URL - welcome email type]
FROM Hybris_NewCustomer_IMPORT CU
LEFT JOIN STORE ST on CU.[Preferred Store] = ST.store_key
INNER JOIN Ent.[Contact_Salesforce_Shared] CS on CU.[Email Address]=CS.Email
LEFT JOIN Ent._subscribers SUBS on CS.[subscriberkey] = SUBS.SubscriberKey
LEFT JOIN Ent.[_EnterpriseAttribute] ATT on SUBS.SubscriberID = ATT._SubscriberID
WHERE (SUBS.status in ('active','unsubscribed','bounced','held') or SUBS.status is null)
AND SUBS.SubscriberKey IS NULL

/* Hybris_CustomerUpdates_WithChanges */
	SELECT
	CU.[Birth Date],
	CU.[Email Address],
	CU.[First Name],
	CASE WHEN ATT.[How Received] = '' THEN CU.[How Received]
								WHEN ATT.[How Received] IS NULL THEN CU.[How Received]
								ELSE ATT.[How Received] END AS [How Received],
	CU.[Last Name],
	CU.[Loyalty Date],
	CU.[Loyalty ID],
	CU.[Phone Number],
	CU.[PreferredStore],
	CASE WHEN CU.[PreferredStore] = '9999' THEN '9999'
					ELSE ST.price_zone_key END AS [PriceZone],
	CU.[URL Preferences],
	CU.[URL Unsubscribe],
	CU.[Offers],
	CU.[Events],
	CU.[ProductType_Wine],
	CU.[ProductType_Beer],
	CU.[ProductType_Spirits],
	CU.[ProductType_Accessories],
	CU.[ProductType_Cigars],
	CU.[Category_SparklingWine],
	CU.[Category_Bordeaux],
	CU.[Category_RedWine],
	CU.[Category_WhiteWine],
	CU.[Category_NewWorldWine],
	CU.[Category_OldWorldWine],
	CU.[Category_ImportBeer],
	CU.[Category_DomesticBeer],
	CU.[Category_Vodka],
	CU.[Category_Rum],
	CU.[Category_Gin],
	CU.[Category_Tequila],
	CU.[Category_Whisky],
	CU.[Category_SingleMaltScotch],
	CU.[Category_Cognac],
	CU.[Category_CraftBeer],
	CU.[Category_Burgundy],
	CU.[Shipping State],
	 CASE
					WHEN CU.status = 'Active' AND SUBS.status = 'active' THEN 'active'
					WHEN CU.status = 'Active' AND SUBS.status = 'unsubscribed' THEN 'unsubscribed'
					WHEN CU.status = 'Unsubscribe' AND SUBS.status = 'active' THEN 'unsubscribed'
					WHEN CU.status = 'Unsubscribe' AND SUBS.status = 'unsubscribed' THEN 'unsubscribed'
					WHEN CU.status = 'Unsubscribed' AND SUBS.status = 'active' THEN 'unsubscribed'
					WHEN CU.status = 'Unsubscribed' AND SUBS.status = 'unsubscribed' THEN 'unsubscribed'
					WHEN CU.status = 'Active' AND SUBS.status = 'held' THEN ''
					WHEN CU.status = 'Active' AND SUBS.status = 'bounced' THEN ''
					WHEN CU.status = 'Unsubscribed' AND SUBS.status = 'held' THEN ''
					WHEN CU.status = 'Unsubscribed' AND SUBS.status = 'bounced' THEN ''
					WHEN CU.status = 'Unsubscribe' AND SUBS.status = 'held' THEN ''
					WHEN CU.status = 'Unsubscribe' AND SUBS.status = 'bounced' THEN ''
					ELSE CU.status END as [status],
	CS.SubscriberKey AS [Subscriber Key],
	CASE 
		WHEN CU.[PreferredState] = 'AL' THEN 'Alabama'
		WHEN CU.[PreferredState] = 'AK' THEN 'Alaska'
		WHEN CU.[PreferredState] = 'AZ' THEN 'Arizona'
		WHEN CU.[PreferredState] = 'AR' THEN 'Arkansas'
		WHEN CU.[PreferredState] = 'CA' THEN 'California'
		WHEN CU.[PreferredState] = 'CO' THEN 'Colorado'
		WHEN CU.[PreferredState] = 'CT' THEN 'Connecticut'
		WHEN CU.[PreferredState] = 'DE' THEN 'Delaware'
		WHEN CU.[PreferredState] = 'DC' THEN 'District of Columbia'
		WHEN CU.[PreferredState] = 'FL' THEN 'Florida'
		WHEN CU.[PreferredState] = 'GA' THEN 'Georgia'
		WHEN CU.[PreferredState] = 'HI' THEN 'Hawaii'
		WHEN CU.[PreferredState] = 'ID' THEN 'Idaho'
		WHEN CU.[PreferredState] = 'IL' THEN 'Illinois'
		WHEN CU.[PreferredState] = 'IN' THEN 'Indiana'
		WHEN CU.[PreferredState] = 'IA' THEN 'Iowa'
		WHEN CU.[PreferredState] = 'KS' THEN 'Kansas'
		WHEN CU.[PreferredState] = 'KY' THEN 'Kentucky'
		WHEN CU.[PreferredState] = 'LA' THEN 'Louisiana'
		WHEN CU.[PreferredState] = 'ME' THEN 'Maine'
		WHEN CU.[PreferredState] = 'MD' THEN 'Maryland'
		WHEN CU.[PreferredState] = 'MA' THEN 'Massachusetts'
		WHEN CU.[PreferredState] = 'MI' THEN 'Michigan'
		WHEN CU.[PreferredState] = 'MN' THEN 'Minnesota'
		WHEN CU.[PreferredState] = 'MS' THEN 'Mississippi'
		WHEN CU.[PreferredState] = 'MO' THEN 'Missouri'
		WHEN CU.[PreferredState] = 'MT' THEN 'Montana'
		WHEN CU.[PreferredState] = 'NE' THEN 'Nebraska'
		WHEN CU.[PreferredState] = 'NV' THEN 'Nevada'
		WHEN CU.[PreferredState] = 'NH' THEN 'New Hampshire'
		WHEN CU.[PreferredState] = 'NJ' THEN 'New Jersey'
		WHEN CU.[PreferredState] = 'NM' THEN 'New Mexico'
		WHEN CU.[PreferredState] = 'NY' THEN 'New York'
		WHEN CU.[PreferredState] = 'NC' THEN 'North Carolina'
		WHEN CU.[PreferredState] = 'ND' THEN 'North Dakota'
		WHEN CU.[PreferredState] = 'OH' THEN 'Ohio'
		WHEN CU.[PreferredState] = 'OK' THEN 'Oklahoma'
		WHEN CU.[PreferredState] = 'OR' THEN 'Oregon'
		WHEN CU.[PreferredState] = 'PA' THEN 'Pennsylvania'
		WHEN CU.[PreferredState] = 'RI' THEN 'Rhode Island'
		WHEN CU.[PreferredState] = 'SC' THEN 'South Carolina'
		WHEN CU.[PreferredState] = 'SD' THEN 'South Dakota'
		WHEN CU.[PreferredState] = 'TN' THEN 'Tennessee'
		WHEN CU.[PreferredState] = 'TX' THEN 'Texas'
		WHEN CU.[PreferredState] = 'UT' THEN 'Utah'
		WHEN CU.[PreferredState] = 'VT' THEN 'Vermont'
		WHEN CU.[PreferredState] = 'VA' THEN 'Virginia'
		WHEN CU.[PreferredState] = 'WA' THEN 'Washington'
		WHEN CU.[PreferredState] = 'WV' THEN 'West Virginia'
		WHEN CU.[PreferredState] = 'WI' THEN 'Wisconsin'
		WHEN CU.[PreferredState] = 'WY' THEN 'Wyoming'
	END AS [PreferredState],
	CU.HybrisEmailChangeUnsub,
	CU.HybrisEmailChangeCreate,
	ATT.Bordeaux_Futures,
	ATT.Concierge_Sales
FROM Hybris_CustomerUpdates_IMPORT CU
LEFT JOIN STORE ST on CU.PreferredStore = ST.store_key
INNER JOIN Ent.[Contact_Salesforce_Shared] CS on CU.[Email Address]=CS.Email
LEFT JOIN Ent._subscribers SUBS on CS.[subscriberkey] = SUBS.SubscriberKey
LEFT JOIN Ent.[_EnterpriseAttribute] ATT on SUBS.SubscriberID = ATT._SubscriberID
WHERE SUBS.status in ('active','unsubscribed','bounced','held') or SUBS.status is null




/* Hybris_NewCustomer_AllLoyalty */ 
select DISTINCT(i.[Subscriber Key]),
i.[Account Type],
i.[Email Type Key],
i.[Customer Status],
i.[How Received],
i.[Email Address],
i.[First Name],
i.[Preferred Store],
i.[Price Zone],
i.[Promotions and Offers],
i.[Events and News],
i.[Product Preferences - Wine],
i.[Product Preferences - Beer],
i.[Product Preferences - Spirits],
i.[Product Preferences - Cigars],
i.[CategoryPreferences - Sparkling Wine],
i.[CategoryPreferences - Bordeaux],
i.[CategoryPreferences - Red Wine],
i.[CategoryPreferences - White Wine],
i.[CategoryPreferences - New World Wine],
i.[CategoryPreferences - Old World Wine],
i.[CategoryPreferences - Import Beer],
i.[CategoryPreferences - Domestic Beer],
i.[CategoryPreferences - Vodka],
i.[CategoryPreferences - Rum],
i.[CategoryPreferences - Gin],
i.[CategoryPreferences - Tequila],
i.[CategoryPreferences - Whiskey],
i.[CategoryPreferences - Single Malt Scotch],
i.[CategoryPreferences - Cognac],
i.[CategoryPreferences - Craft Beer],
i.[CategoryPreferences - Burgundy],
i.[URL - customer update preferences],
i.[URL - welcome email type],
i.[URL - unsubscribe],
i.[Loyalty Number],
i.[Shipping State],
i.[ProductType_Accessories],
i.[ChannelMemberID],
i.[HybrisEmailChangeUnsub],
i.[HybrisEmailChangeCreate],
i.[Bordeaux_Futures],
i.[Concierge_Sales]
from [Hybris_NewCustomer_WithChanges] i
inner join store s on i.[Price Zone] = s.price_zone_key
where s.loyalty_type = 'andmore'
and i.[Email Type Key] != 5
and i.[Email Type Key] <> 5
