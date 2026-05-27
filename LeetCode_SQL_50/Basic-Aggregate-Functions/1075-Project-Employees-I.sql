SELECT
    p.project_id,
    ROUND(AVG(CAST(e.experience_years AS DECIMAL(5,2))), 2) average_years
FROM Project p
LEFT JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY project_id