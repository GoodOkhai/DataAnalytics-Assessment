
WITH monthly_transactions AS
(
SELECT owner_id, 
COUNT(*) AS trans_count,
DATE_FORMAT(transaction_date, '%Y-%m') AS month 
FROM adashi_staging.savings_savingsaccount
GROUP BY owner_id, month
),
avg_trans AS(
SELECT owner_id, 
AVG(trans_count) AS avg_transactions_per_month
FROM monthly_transactions
GROUP BY owner_id
), 
customer_category AS
( SELECT CASE
WHEN avg_transactions_per_month >= 10 THEN 'High Frequency'
WHEN avg_transactions_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
ELSE 'Low Frequency'
END AS frequency_category,
COUNT(owner_id) AS customer_count, 
avg_transactions_per_month
FROM avg_trans
WHERE avg_transactions_per_month <> 0
GROUP BY owner_id
)
SELECT frequency_category, 
COUNT(*) AS customer_count,
ROUND(AVG(avg_transactions_per_month), 1) AS avg_trans_per_month 
FROM customer_category
GROUP BY frequency_category
ORDER BY avg_trans_per_month DESC;