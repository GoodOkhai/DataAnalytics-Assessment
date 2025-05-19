
SELECT plan_id, savings_savingsaccount.owner_id, plans_plan.description AS type, 
MAX(transaction_date) AS last_transaction_date, 
(DATEDIFF(CURDATE(), MAX(transaction_date)))
AS inactivity_days
FROM adashi_staging.savings_savingsaccount 
JOIN adashi_staging.plans_plan ON plans_plan.id = savings_savingsaccount.plan_id
GROUP BY plan_id, owner_id
HAVING inactivity_days > 365;
