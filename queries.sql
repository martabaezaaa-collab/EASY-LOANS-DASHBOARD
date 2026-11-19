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

