WITH cust_total_avg_profit AS
(
SELECT savings_savingsaccount.owner_id AS customer_id, 
CONCAT(users_customuser.first_name, ' ', users_customuser.last_name) AS name,
TIMESTAMPDIFF(MONTH, MIN(date_joined), CURDATE()) AS tenure_months,
COUNT(confirmed_amount) AS total_transactions, 
AVG(0.1 * savings_savingsaccount.confirmed_amount) AS avg_profit_per_transaction
FROM adashi_staging.savings_savingsaccount
JOIN adashi_staging.users_customuser ON users_customuser.id = savings_savingsaccount.owner_id
GROUP BY customer_id, name
) 
SELECT customer_id, 
name, tenure_months, total_transactions, 
ROUND((avg_profit_per_transaction * 12 * (total_transactions/tenure_months)), 2) AS estimated_clv	
FROM cust_total_avg_profit;
