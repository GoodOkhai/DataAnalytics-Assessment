
SELECT savings_savingsaccount.owner_id,
CONCAT(users_customuser.first_name, ' ', users_customuser.last_name) AS name, 
(SELECT COUNT(*) FROM adashi_staging.plans_plan WHERE plans_plan.is_regular_savings = 1) AS savings_count, 
(SELECT COUNT(*) FROM adashi_staging.plans_plan WHERE plans_plan.is_a_fund = 1) AS investment_count,
SUM(savings_savingsaccount.new_balance) AS total_deposits
FROM adashi_staging.users_customuser JOIN
adashi_staging.savings_savingsaccount ON users_customuser.id = savings_savingsaccount.owner_id
JOIN adashi_staging.plans_plan ON savings_savingsaccount.owner_id = plans_plan.owner_id
GROUP BY savings_savingsaccount.owner_id
HAVING total_deposits > 0
ORDER BY total_deposits;





