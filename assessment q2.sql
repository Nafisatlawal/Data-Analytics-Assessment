-- Categorize users by how often they transact monthly

WITH txn_counts AS (
    SELECT 
        owner_id,
        COUNT(*) AS total_txns,
        TIMESTAMPDIFF(MONTH, MIN(transaction_date), MAX(transaction_date)) + 1 AS active_months
    FROM savings_savingsaccount
    GROUP BY owner_id
),
categorized AS (
    SELECT 
        owner_id,
        ROUND(total_txns / active_months, 1) AS avg_txn_per_month,
        CASE
            WHEN total_txns / active_months >= 10 THEN 'High Frequency'
            WHEN total_txns / active_months BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category
    FROM txn_counts
)
SELECT 
    frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_txn_per_month), 1) AS avg_transactions_per_month
FROM categorized
GROUP BY frequency_category;
