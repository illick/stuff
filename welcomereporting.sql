SELECT i.EmailAddress, su.SubscriberKey FROM OracleJoined20250102 i INNER JOIN ENT._Subscribers su on i.EmailAddress = su.EmailAddress 

/*zOracleJoined20250102_WSK*/

SELECT i.SubscriberKey, i.EmailAddress FROM [zOracleJoined20250102_WSK] i INNER JOIN [WasSentAT001AT002AT003AT004] s on i.subscriberKey = s.subscriberkey

/*ReceivedWelcomeJoined20250102*/


_____________


SELECT i.EmailAddress, su.SubscriberKey FROM OracleJoined20250102 i 
INNER JOIN ENT._Subscribers su on i.EmailAddress = su.EmailAddress 
INNER JOIN [WasSentAT001AT002AT003AT004] s on su.subscriberKey = s.subscriberkey
/*ReceivedWelcomeJoined20250102*/
