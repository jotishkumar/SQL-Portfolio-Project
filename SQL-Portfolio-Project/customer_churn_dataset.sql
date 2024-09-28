create database project;
select * from customer_churn_dataset;

ALTER TABLE customer_churn_dataset 
CHANGE `Monthly Charge` `Monthly_Charge` double;
ALTER TABLE customer_churn_dataset 
CHANGE `Customer Status` `Customer_Status` text;

SELECT 

    Customer_ID, Age,
    Gender,
    Contract,
    AVG(Monthly_Charge) AS Avg_Monthly_Charge
FROM 
    customer_churn_dataset
WHERE 
    Customer_Status = 'Churned'
GROUP BY 
    Customer_ID, Age, Gender, Contract
ORDER BY 
    Avg_Monthly_Charge DESC
LIMIT 5;


ALTER TABLE customer_churn_dataset 
CHANGE `Customer ID` `Customer_ID` TEXT;
ALTER TABLE customer_churn_dataset 
CHANGE `Churn Reason` `Churn_Reason` TEXT;
ALTER TABLE customer_churn_dataset 
CHANGE `Satisfaction Score` `Satisfaction_Score` TEXT;
ALTER TABLE customer_churn_dataset 
CHANGE `Churn Category` `Churn_Category` TEXT;


SELECT 
    Customer_ID,
    Churn_Reason,
    Satisfaction_Score,
    Churn_Category
FROM 
    customer_churn_dataset
WHERE 
    Customer_Status = 'Churned';
    
    
    ALTER TABLE customer_churn_dataset 
CHANGE `Churn Score` `Churn_Score` int;
    SELECT 
    `Payment Method`, 
    COUNT(CASE WHEN `Customer_Status` = 'Churned' THEN 1 END) AS Churned_Customers,
    AVG(Satisfaction_Score) AS Average_Satisfaction_Score,
    AVG(Churn_Score) AS Average_Churn_Score
FROM 
    customer_churn_dataset
GROUP BY 
    `Payment Method`
ORDER BY 
    Churned_Customers DESC;
    
    
    
SELECT Churn_Reason, COUNT(*) AS complaint_count
FROM customer_churn_dataset
WHERE Customer_Status = 'Churned'
GROUP BY Churn_Reason
ORDER BY complaint_count DESC;






