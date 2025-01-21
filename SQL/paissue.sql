SELECT S.SubscriberKey, SU.EmailAddress, SU.PreferredStore, J.EmailName, S.EventDate FROM _sent S
INNER JOIN _job J on S.JobID = J.JobID
INNER JOIN [9999_Store_preference] SU on S.SubscriberKey = SU.SubscriberKey
WHERE J.EmailName LIKE '%PriorityAccess%'
AND SU.PreferredStore = '2901'