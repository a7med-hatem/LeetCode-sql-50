SELECT 
    c.category, 
    COUNT(a.account_id) AS accounts_count
FROM (VALUES ('Low Salary'), ('Average Salary'), ('High Salary')) AS c(category)
LEFT JOIN Accounts a 
    ON (c.category = 'Low Salary' AND a.income < 20000)
    OR (c.category = 'Average Salary' AND a.income BETWEEN 20000 AND 50000)
    OR (c.category = 'High Salary' AND a.income > 50000)
GROUP BY c.category;