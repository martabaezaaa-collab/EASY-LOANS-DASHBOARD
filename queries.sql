-- Set the working context
USE WAREHOUSE BADGER_WH;
USE DATABASE MASTER_UNED;
USE SCHEMA EASY_LOANS;

-- Operations analysis by country and state
SELECT COUNT(order_id) AS Total_Transactions,
ROUND(AVG(amount), 2) AS Average_Amount,
country,
status, 
created_at
FROM Orders
WHERE created_at >'2015-07-01' AND
country IN ('Francia', 'Espana', 'Portugal') AND 
amount BETWEEN 100 AND 1500
GROUP BY country, status
ORDER BY Average_Amount DESC;

-- Identification of countries with the highest transaction volume
SELECT COUNT(order_id) AS Total_Transactions,
MAX(amount) AS Maximum_Amount,
MIN(amount) AS Minimum_Amount,
country
FROM Orders
WHERE status NOT IN ('Delinquent', 'Cancelled') AND amount > 100
GROUP BY country
ORDER BY Total_Transactions DESC
LIMIT 3;

-- Analysis of transactions and refunds by merchant
SELECT o.country,
m.name AS Merchant,
m.merchant_id,
COUNTo.(order_id) AS Total_Transactions,
ROUND(AVG(o.amount), 2) AS Average_Amount,
COUNT(r.order_id) AS Total_Refunds,
  CASE
  WHEN COUNT(r.order_id) > 0 THEN 'Sí'
  ELSE 'No'
  END AS Accepts_Refunds
From Orders AS o
JOIN Merchants AS m
ON o.merchant_id = m.merchant_id
LEFT JOIN Refunds AS r
ON o.order_id = r.order_id
WHERE o.country IN ('Marruecos', 'Italia', 'Espana', 'Portugal')
GROUP BY m.name, m.merchant_id, o.country
HAVING COUNT(o.order_id) > 10
ORDER BY o.country, Total_Transactions DESC;

-- Data consolidation into a view
CREATE OR REPLACE VIEW easy_loans_view AS
SELECT o.order_id,
o.created_at,
o.status,
o.amount,
o.merchant_id,
o.country,
m.name AS Merchant,
COUNT(r.order_id) AS Total_Refunds,
COALESCE (SUM(r.amount),0) AS Total_Amount_Refunds
FROM Orders AS o
LEFT JOIN Merchants AS m
ON o.merchant_id = m.merchant_id
LEFT JOIN Refunds AS r
ON o.order_id = r.order_id
GROUP BY o.order_id,
o.created_at,
o.status,
o.amount,
o.merchant_id,
o.country,
m.name;



