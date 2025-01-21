/* OLD Final Step Unengaged: */
SELECT su.SubscriberKey 
FROM ENT._Subscribers su 
LEFT JOIN [BaseOpeners_NoLegacy] bao ON su.SubscriberKey = bao.SubscriberKey
LEFT JOIN [GmailOpeners_NoLegacy] gmo ON su.SubscriberKey = gmo.SubscriberKey
LEFT JOIN [YahooOpeners_NoLegacy] yao ON su.SubscriberKey = yao.SubscriberKey
LEFT JOIN [Clickers] cl ON su.SubscriberKey = cl.SubscriberKey
LEFT JOIN [WelcomeRecipients] wr ON su.SubscriberKey = wr.SubscriberKey
LEFT JOIN [non_openers_exclusions_keyed_sorted] ex ON su.SubscriberKey = ex.SubscriberKey
WHERE bao.SubscriberKey IS NULL 
      AND gmo.SubscriberKey IS NULL 
      AND yao.SubscriberKey IS NULL 
      AND cl.SubscriberKey IS NULL
      AND wr.SubscriberKey IS NULL
      AND (su.Status = 'active' OR su.Status = 'bounced')
      AND su.DateJoined <= getdate()-180
      AND (ex.SubscriberKey IS NULL OR ex.[end] < getdate())                                    





/* Sendable Modified */
SELECT D1.*, D2.[SubscriberKey] AS GBSubscriberKey, D3.[Status] FROM [9999_store_preference] D1

LEFT JOIN [global_suppression_testing] D2 ON D1.[SubscriberKey]=D2.[SubscriberKey] 

LEFT JOIN ENT._Subscribers  D3 ON D1.[SubscriberKey]=D3.[SubscriberKey]

WHERE D2.[SubscriberKey] IS NULL

AND (D3.[Status] = 'active' OR D3.[Status] = 'bounced')
AND D1.subscriberkey NOT LIKE '%@%'





/* Global Supp Modified */
SELECT P.SubscriberKey FROM [9999_store_preference] P
LEFT JOIN [store] S ON P.PreferredStore=S.store_key
WHERE P.PreferredStore in ('9999','9998','212','2251') 
OR P.Pricezone in ('42','36') 
OR S.[store_open] >= getdate()
OR P.emailaddress LIKE '%seed%@totalwine.com%'
OR P.Subscriberkey LIKE '%@%'

UNION

SELECT SubscriberKey
FROM [UnengagedSubscribers_Testing]

UNION

SELECT SubscriberKey
FROM [GlobalHoldoutForTesting]

UNION

SELECT SubscriberKey
FROM [HardBounceSuppression]

/*UNION

SELECT NewSubKey AS SubscriberKey
FROM ENT.[Legacy_BounceDataView_newsubkey]
*/

/*Subscriber Pause System - not in use
UNION

SELECT SubscriberKey
FROM [subscriber_pause]
WHERE pause_start <= getdate()
AND pause_end >= getdate()
*/