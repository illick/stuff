/* Old */
SELECT DISTINCT o.SubscriberKey FROM _Open o
WHERE o.domain = 'gmail.com' 
AND o.EventDate >= DateAdd(day,-15,getdate())

SELECT DISTINCT o.SubscriberKey FROM _Open o
WHERE o.domain = 'gmail.com' 
AND o.EventDate < DateAdd(day,-15,getdate())
AND o.EventDate >= DateAdd(day,-30,getdate())


SELECT DISTINCT o.SubscriberKey FROM _Open o
WHERE oDomain IN ('live.com','msn.com','outlook.com','outlook.sa')
AND o.EventDate >= DateAdd(day,-15,getdate())
Results: Timeout


SELECT SP.SUBSCRIBERKEY FROM [MicrosoftSubscribers] SP
WHERE EXISTS (
            Select 1 from [_open] O 
            WHERE SP.SubscriberKey = O.SubscriberKey
            AND o.EventDate >= DateAdd(day,-15,getdate())
            )
Results: 416,878 in 28min            