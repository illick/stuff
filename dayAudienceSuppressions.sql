SELECT DISTINCT AD.subscriberKey from [20241003_Promo_Seasonal_AdventCalendar_Crosscategory_Manual_None_Send] AD
left join [20241005_Promo_Seasonal_GemsofScottlandWhiskey_SD_Manual_LTA - 20241002_031439] GM on AD.subscriberkey = GM.subscriberkey
left join [20241005_Promo_LTA_LTAFranceOffer_WD_Manual_LTA_Send] FR on FR.Subscriberkey = AD.subscriberkey
left join [global_suppression] GS on AD.subscriberkey = GS.subscriberkey
left join [Michigan Customers] MI on AD.subscriberkey = MI.subscriberkey
left join [New York - ALL Customers - for suppression] NY on AD.subscriberkey = NY.subscriberkey
where GM.subscriberkey is NULL 
AND GS.subscriberkey is NULL 
AND MI.subscriberkey is NULL 
AND NY.subscriberkey is NULL 
AND FR.subscriberkey is NULL




SELECT DISTINCT HB.subscriberKey from [20241014_Promo_Seasonal_HalloweenBeer_Other_Manual_None] HB
left join [20241014_Loyalty__PriorityAccessFallResultsLaunchReminder_import] PA on HB.EmailAddress = PA.EmailAddress
left join [global_suppression] GS on HB.subscriberkey = GS.subscriberkey
left join [Michigan Customers] MI on HB.subscriberkey = MI.subscriberkey
left join [New York - ALL Customers - for suppression] NY on HB.subscriberkey = NY.subscriberkey
where PA.EmailAddress is NULL 
AND GS.subscriberkey is NULL 
AND MI.subscriberkey is NULL 
AND NY.subscriberkey is NULL 


SELECT DISTINCT ED.subscriberKey from [20241014_Promo_Misc_ExpressDelivery_Delivery_Manual_None] ED 
left join [20241014_Promo_Seasonal_HalloweenBeer_Other_Manual_None] HB on HB.SubscriberKey = ED.SubscriberKey
left join [20241014_Loyalty__PriorityAccessFallResultsLaunchReminder_import] PA on ED.EmailAddress = PA.EmailAddress
left join [global_suppression] GS on ED.subscriberkey = GS.subscriberkey
left join [Michigan Customers] MI on ED.subscriberkey = MI.subscriberkey
left join [New York - ALL Customers - for suppression] NY on ED.subscriberkey = NY.subscriberkey
where PA.EmailAddress is NULL 
AND GS.subscriberkey is NULL 
AND MI.subscriberkey is NULL 
AND NY.subscriberkey is NULL
AND HB.subscriberKey is NULL
