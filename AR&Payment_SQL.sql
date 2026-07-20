USE myassignment;
alter table customer_master DROP COLUMN MyUnknownColumn;
SELECT * FROM `customer_master` LIMIT 10;
ALTER TABLE invoice 
DROP COLUMN `MyUnknownColumn`,
DROP COLUMN `MyUnknownColumn_[0]`,
DROP COLUMN `MyUnknownColumn_[1]`;
SELECT * FROM `invoice` LIMIT 10;
SELECT * FROM `payment` LIMIT 10;
ALTER TABLE sales
DROP COLUMN `MyUnknownColumn`;
SELECT * FROM `sales` LIMIT 10;
ALTER TABLE credit_limits
DROP COLUMN `MyUnknownColumn`;
SELECT * FROM `credit_limits` LIMIT 10;

SELECT COUNT(*) FROM customer_master;
SELECT COUNT(*) FROM invoice;
SELECT COUNT(*) FROM payment;
SELECT COUNT(*) FROM sales;
SELECT COUNT(*) FROM credit_limits;

SELECT
    i.Invoice_ID,
    c.Customer_Name,
    i.Invoice_Amount,
    p.Amount_Paid,
    cl.Credit_Limit,
    cl.Risk_Rating
FROM invoice i
INNER JOIN customer_master c
ON i.Customer_ID = c.Customer_ID
LEFT JOIN payment p
ON i.Invoice_ID = p.Invoice_ID
LEFT JOIN credit_limits cl
ON c.Customer_ID = cl.Customer_ID;

# Business Analysis Queries
## 1.Total Invoice Amount
SELECT
SUM(Invoice_Amount) AS Total_Invoice
FROM invoice;

## 2.Total Amount Collected
SELECT
SUM(Amount_Paid) AS Total_Collected
FROM payment;

## 3.Outstanding Amount
SELECT
SUM(Invoice_Amount)
FROM invoice
WHERE Status='Outstanding';

## 4.Number of Outstanding Invoices
SELECT COUNT(*)
FROM invoices
WHERE Status='Outstanding';

## 5.Invoice Status Distribution
SELECT
Status,
COUNT(*) AS Total_Invoices
FROM invoice
GROUP BY Status;

## 6.Top 10 Customers by Invoice Value
SELECT
c.Customer_Name,
SUM(i.Invoice_Amount) AS Total_Sales
FROM invoice i
JOIN customer_master c
ON i.Customer_ID=c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

##7.Top 10 Customers by Outstanding Amount
SELECT
c.Customer_Name,
SUM(i.Invoice_Amount) AS Outstanding
FROM invoice i
JOIN customer_master c
ON i.Customer_ID=c.Customer_ID
WHERE Status='Outstanding'
GROUP BY c.Customer_Name
ORDER BY Outstanding DESC
LIMIT 10;

##8.Average Collection Days
SELECT
ROUND(AVG(DATEDIFF(p.Payment_Date,i.Invoice_Date)),2)
AS Avg_Collection_Days
FROM invoice i
JOIN payment p
ON i.Invoice_ID=p.Invoice_ID;

##9.Late Payments
SELECT
COUNT(*) AS Late_Payments
FROM invoice i
JOIN payment p
ON i.Invoice_ID=p.Invoice_ID
WHERE p.Payment_Date > i.Due_Date;

ALTER TABLE payment
MODIFY COLUMN Payment_Date DATE;
## 10.Monthly Cash Collection 
SELECT
YEAR(Payment_Date) AS Year,
MONTH(Payment_Date) AS Month,
SUM(Amount_Paid) AS Cash_Collected
FROM payment
GROUP BY YEAR(Payment_Date), MONTH(Payment_Date)
ORDER BY YEAR(Payment_Date), MONTH(Payment_Date);

##11. Outstanding by Region
SELECT
c.Region,
SUM(i.Invoice_Amount) AS Outstanding
FROM invoice i
JOIN customer_master c
ON i.Customer_ID=c.Customer_ID
WHERE Status='Outstanding'
GROUP BY c.Region
ORDER BY Outstanding DESC;

##12. Customers Exceeding Credit Limit
SELECT
c.Customer_Name,
cl.Credit_Limit,
cl.Current_Exposure
FROM credit_limits cl
JOIN customer_master c
ON cl.Customer_ID=c.Customer_ID
WHERE cl.Current_Exposure > cl.Credit_Limit;

## 13.Risk Rating Distribution
SELECT
Risk_Rating,
COUNT(*) AS Customers
FROM credit_limits
GROUP BY Risk_Rating;

##14. Payment Method Analysis
SELECT
Payment_Method,
COUNT(*) AS Transactions,
SUM(Amount_Paid) AS Total_Collected
FROM payment
GROUP BY Payment_Method
ORDER BY Total_Collected DESC;

##15. Collection Rate
SELECT
ROUND(
(SUM(p.Amount_Paid)/SUM(i.Invoice_Amount))*100,
2
) AS Collection_Rate
FROM invoice i
JOIN payment p
ON i.Invoice_ID=p.Invoice_ID;