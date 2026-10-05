-- Query 1: Total number of mutual funds
SELECT COUNT(*) AS total_funds
FROM fund_master;

-- Query 2: List all fund categories
SELECT DISTINCT category
FROM fund_master;

-- Query 3: Top 10 funds by NAV
SELECT amfi_code, nav
FROM nav_history
ORDER BY nav DESC
LIMIT 10;

-- Query 4: Average NAV
SELECT AVG(nav) AS average_nav
FROM nav_history;

-- Query 5: Maximum NAV
SELECT MAX(nav) AS highest_nav
FROM nav_history;

-- Query 6: Minimum NAV
SELECT MIN(nav) AS lowest_nav
FROM nav_history;

-- Query 7: Number of transactions by type
SELECT transaction_type, COUNT(*) AS total_transactions
FROM investor_transactions
GROUP BY transaction_type;

-- Query 8: Total transaction amount by type
SELECT transaction_type, SUM(amount) AS total_amount
FROM investor_transactions
GROUP BY transaction_type;

-- Query 9: Average expense ratio
SELECT AVG(expense_ratio) AS average_expense_ratio
FROM scheme_performance;

-- Query 10: Number of funds in each category
SELECT category, COUNT(*) AS total_funds
FROM fund_master
GROUP BY category;