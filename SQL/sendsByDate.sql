select
CONVERT(date,s.EventDate) as SendDate,
count(s.SubscriberKey) as Deliveries
FROM _Sent s
INNER JOIN _job j on s.JobID=j.JobID
WHERE J.EmailName IN (
'AT014_Loyalty_AppDownload_PostTransaction_Acquisition_Automation_None',
'AT013_Loyalty_AppDownload_PostWelcome_Acquisition_Automation_None'
)
AND s.EventDate > '9/1/2024'
group by CONVERT(date,s.EventDate)




select
CONVERT(date,s.EventDate) as SendDate,
count(s.SubscriberKey) as Deliveries
FROM _Sent s
INNER JOIN _job j on s.JobID=j.JobID
WHERE (J.EmailName LIKE 'AT001%' OR J.EmailName LIKE 'AT002%' OR J.EmailName LIKE 'AT003%' OR J.EmailName LIKE 'AT004%')
AND s.EventDate > '11/24/2024'
group by CONVERT(date,s.EventDate)


select
CONVERT(date,s.EventDate) as SendDate,
count(s.SubscriberKey) as Deliveries
FROM _Sent s
INNER JOIN _job j on s.JobID=j.JobID
WHERE J.EmailName LIKE 'AT014%'
AND s.EventDate > '12/1/2024'
group by CONVERT(date,s.EventDate)