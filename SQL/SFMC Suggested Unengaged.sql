Select distinct
s.SubscriberKey,
su.EmailAddress,
su.DateJoined
from [_sent] s
join _subscribers su on su.SubscriberID = s.SubscriberID
left join [_open] o
on s.SubscriberID = o.SubscriberID
left join [_click] c
on s.SubscriberID = c.SubscriberID
where (o.SubscriberID is NULL and c.SubscriberID is NULL)
and su.DateJoined < dateadd(dd,-180,getdate())