SELECT Cs.Email, 
CS._ContactKey AS SubscriberKey, 
CS.AccountID, 
AA.Name AS Concierge_Agent_Name, 
CS.ID,
AB.NAME AS CreatedByName, 
CS.HasOptedOutOfEmail, 
AC.NAME AS LastModifiedByName, 
CS.Loyalty_Profile__c AS Loyalty_Profile, 
CS.MasterRecordID, 
AD.NAME AS OwnerName,
BA.Name AS Preferred_Store_Name, 
CS.Store_Number__c AS Preferred_Store_Number, 
CS.ReportsToId, 
CA.ProductCode AS Top_Item_1_ItemCode, 
CB.ProductCode AS Top_Item_2_ItemCode, 
CC.ProductCode AS Top_Item_3_ItemCode, 
CD.ProductCode AS Top_Item_4_ItemCode, 
CE.ProductCode AS Top_Item_5_ItemCode, 
CF.ProductCode AS Top_Product_Recommendation_Above_50_1_ItemCode, 
CG.ProductCode AS Top_Product_Recommendation_Above_50_2_ItemCode, 
CH.ProductCode AS Top_Product_Recommendation_Above_50_3_ItemCode, 
CI.ProductCode AS Top_Spirits_Item_1_ItemCode, 
CJ.ProductCode AS Top_Spirits_Item_2_ItemCode, 
CK.ProductCode AS Top_Spirits_Item_3_ItemCode, 
CL.ProductCode AS Top_Spirits_Item_4_ItemCode, 
CM.ProductCode AS Top_Spirits_Item_5_ItemCode, 
CN.ProductCode AS Top_WD_Product_Recommendation_Below_50_ItemCode, 
CO.ProductCode AS WD_Product_Recommendation_1_ItemCode, 
CP.ProductCode AS WD_Product_Recommendation_2_ItemCode, 
CQ.ProductCode AS WD_Product_Recommendation_3_ItemCode, 
CS.Phone, 
CS.FirstName, 
CS.LastName, 
CS.Email_Opt_In_Status__c AS Email_Opt_In_Status, 
CS.Hybris_ID__c AS Hybris_ID, 
CS.Loyalty_Number__c AS Loyalty_Number, 
CS.Signup_Date__c AS Signup_Date, 
CS.SFMC_Sync_Flag__c AS SFMC_Sync_Flag, 
CS.Marketable_Contact__c AS Marketable_Contact, 
CS.Home_State__c AS Home_State,
CS.First_Purchase_Date__c as First_Purchase_Date__c,
CS.Total_Sales__c as Total_Sales__c,
CS.Trips__c as Trips__c,
CS.ATV__c as ATV__c,
CS.AUP__c as AUP__c,
CS.Earned_Reward_Point__c as Earned_Reward_Point__c,
CS.Oracle_ID__c as Oracle_ID__c,
CS.Points_to_Next_Reward__c as Points_to_Next_Reward__c,
CS.YTD_Tier_Point_Balance__c as YTD_Tier_Point_Balance__c,
CS.Reward_Balance__c as Reward_Balance__c



FROM [Contact_Salesforce] CS

LEFT JOIN [user_Salesforce] AA ON AA.ID=CS.Concierge_Agent__c 
LEFT JOIN [user_Salesforce] AB ON AB.ID=CS.CreatedByID 
LEFT JOIN [user_Salesforce] AC ON AC.ID=CS.LastModifiedByID 
LEFT JOIN [user_Salesforce] AD ON AD.ID=CS.OwnerID 

LEFT JOIN [Store__C_Salesforce] BA ON BA.ID=CS.Preferred_Store__c

LEFT JOIN [Product2_Salesforce] CA ON CA.ID=CS.Top_Item_1__c 
LEFT JOIN [Product2_Salesforce] CB ON CB.ID=CS.Top_Item_2__c 
LEFT JOIN [Product2_Salesforce] CC ON CC.ID=CS.Top_Item_3__c
LEFT JOIN [Product2_Salesforce] CD ON CD.ID=CS.Top_Item_4__c
LEFT JOIN [Product2_Salesforce] CE ON CE.ID=CS.Top_Item_5__c
LEFT JOIN [Product2_Salesforce] CF ON CF.ID=CS.Top_Product_Recommendation_Above_50_1__c
LEFT JOIN [Product2_Salesforce] CG ON CG.ID=CS.Top_Product_Recommendation_Above_50_2__c
LEFT JOIN [Product2_Salesforce] CH ON CH.ID=CS.Top_Product_Recommendation_Above_50_3__c
LEFT JOIN [Product2_Salesforce] CI ON CI.ID=CS.Top_Spirits_Item_1__c
LEFT JOIN [Product2_Salesforce] CJ ON CJ.ID=CS.Top_Spirits_Item_2__c
LEFT JOIN [Product2_Salesforce] CK ON CK.ID=CS.Top_Spirits_Item_3__c
LEFT JOIN [Product2_Salesforce] CL ON CL.ID=CS.Top_Spirits_Item_4__c
LEFT JOIN [Product2_Salesforce] CM ON CM.ID=CS.Top_Spirits_Item_5__c
LEFT JOIN [Product2_Salesforce] CN ON CN.ID=CS.Top_WD_Product_Recommendation_Below_50__c
LEFT JOIN [Product2_Salesforce] CO ON CO.ID=CS.WD_Product_Recommendation_1__c
LEFT JOIN [Product2_Salesforce] CP ON CP.ID=CS.WD_Product_Recommendation_2__c
LEFT JOIN [Product2_Salesforce] CQ ON CQ.ID=CS.WD_Product_Recommendation_3__c

WHERE CS._ContactKey IS NOT NULL
AND CS.Store_Number__c != 'ssc'