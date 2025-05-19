-- Estimate CLV using total transactions and account tenure (in months)

WITH user_txns AS (
    SELECT 
        owner_id,
        COUNT(*) AS total_transactions,
        SUM(confirmed_amount) AS total_value
    FROM savings_savingsaccount
    GROUP BY owner_id
),
tenure AS (
    SELECT 
        id AS customer_id,
        name,
        TIMESTAMPDIFF(MONTH, date_joined, CURDATE()) AS tenure_months
    FROM users_customuser
),
clv AS (
    SELECT 
        t.customer_id,
        t.name,
        t.tenure_months,
        u.total_transactions,
        ROUND((u.total_transactions / NULLIF(t.tenure_months, 0)) * 12 * 0.001, 2) AS estimated_clv
    FROM tenure t
    LEFT JOIN user_txns u ON u.owner_id = t.customer_id
)
SELECT * 
FROM clv
ORDER BY estimated_clv DESC;
