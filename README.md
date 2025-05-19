# Data Analytics Assessment done by Okhai Raphael
**Cowrywise SQL Proficiency Assessment**



## Query 1: High-Value Customers with Multiple Products
**Approach/Pseudocode:**

i. I combined customer identification(customer id, first name & last name) with:
  - Savings/investment counts (via subqueries) in plans_plan table
  - Personal deposit totals (via SUM aggregation)

ii. I then filtered for active customers (deposits > 0).

iii. Lastly, I ordered by deposit amount.

**Challenges:**
- Differentiating between savings and investment plan. I eventually discovered the hints in the attached assessment document.



## Query 2: Transaction Frequency Analysis
**Approach/Pseudocode:**

i. I created a 3-step CTE(Common Table Expression) pipeline to generate the:
  - Monthly transaction counts ie. monthly_transactions
  - Average monthly transactions per customer ie. avg_trans
  - Categorized customers by frequency tiers ie. customer_category

ii. And then, I did a final aggregation by frequency category.

**Challenges:**
- I had a challenge determining how to integrate the requested frequency thresholds. I did a lttle research and decided on using CASE.
- I initially did not exclude zero-transaction customers. But after going through the results again, I noticed this would affect it and so I filtered with <> 0 condition).



## Query 3: Account Inactivity Alert
**Approach/Pseudocode:**

i. I identified dormant accounts by calculating days since last transaction.

ii. I filtered for inactivity > 365 days using HAVING clause.

iii. And then, I joined account and plan tables to include investment type information.

**Challenges:**
- Deciding between WHERE vs HAVING for date filtering. I chose HAVING as it requires aggregation. I also used the MAX() function to make transaction_date an aggregated column for the filter to work.



## Query 4: Customer Lifetime Value (CLV) Estimation
**Approach/Pseudocode:**

i. I used a CTE to calculate customer metrics (tenure, transaction counts, average profit).

ii. I then calculated estimated CLV using the given formula: (avg profit/transaction) × 12 × (transactions/month).

iii. I formatted currency values with ROUND() to give the results as seen in Expected output table.

**Challenges:**
- Handling potential division by zero with tenure_months. I resolved by ensuring all customers had valid join dates.
- Deciding between COUNT(*) vs COUNT(confirmed_amount) for accurate transaction counting. I did a test for both and chose COUNT(confirmed_amount) after I investigated both outputs. 





**Thank you Cowrywise for the opportunity to be a part of this Technical Assessment. I'm grateful.**
