# Data Analytics-Assessment
This repository contains SQL solutions for a data analytics assessment focused on customer behavior, transaction patterns, and product usage. Each SQL file answers a specific question using clean, efficient queries with simplified logic.

## Questions & Approaches
## Q1: High-Value Customers with Multiple Products
- Goal: Identify users with at least one funded savings plan and one funded investment plan, and rank them by total deposits.
- Approach: Used conditional aggregation to count savings and investment plans per customer, summed confirmed deposits, and filtered users who have both.

## Q2: Transaction Frequency Analysis
- Goal: Categorize users based on how often they transact each month.
- Approach: Calculated each user’s average monthly transaction count using the first and last transaction date, then categorized into High, Medium, or Low frequency.

## Q3: Account Inactivity Alert
- Goal: Flag accounts (savings or investment) that haven't had any transactions in over one year.
- Approach: Queried max transaction date per plan and compared it with the current date to identify plans with 365+ days of inactivity.

## Q4: Customer Lifetime Value (CLV) Estimation
- Goal: Estimate CLV using account tenure and total transaction volume.

- Approach: Calculated account tenure in months and estimated CLV using the formula:
(total_transactions / tenure_months) * 12 * 0.1%

## Challenges faced and the Resolutions
- Complex Joins Simplified: Used CTEs and conditional aggregations instead of multiple joins for better readability.
- Division by Zero: Prevented errors by using NULLIF() when dividing by tenure.
- Data Units: Converted transaction amounts from kobo to naira using division by 100.

