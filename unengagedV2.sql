/* Apple group */
SELECT SP.SUBSCRIBERKEY FROM [9999_Store_Preference] SP
WHERE EXISTS (
            Select 1 from [_open] O 
            WHERE SP.SubscriberKey = O.SubscriberKey
            AND O.Domain IN ('iCloud.com','me.com')
            )

/* Microsoft group */
SELECT SP.SUBSCRIBERKEY FROM [9999_Store_Preference] SP
WHERE EXISTS (
            Select 1 from [_open] O 
            WHERE SP.SubscriberKey = O.SubscriberKey
            AND O.Domain IN ('hotmail.com', 'msn.com', 'outlook.com', 'live.com')
            )

/* YahooVMG group */
SELECT SP.SUBSCRIBERKEY FROM [9999_Store_Preference] SP
WHERE EXISTS (
            Select 1 from [_open] O 
            WHERE SP.SubscriberKey = O.SubscriberKey
            AND O.Domain IN ('yahoo.com','ymail.com','aol.com','verizon.net')
            )
/* Misc group */
SELECT SP.SUBSCRIBERKEY FROM [9999_Store_Preference] SP
WHERE EXISTS (
            Select 1 from [_open] O 
            WHERE SP.SubscriberKey = O.SubscriberKey
            AND O.Domain NOT IN ('gmail.com','iCloud.com','me.com','hotmail.com', 'msn.com', 'outlook.com', 'live.com','yahoo.com','ymail.com','aol.com','verizon.net')
            )
                                    
/* Gmail Group Needed */







