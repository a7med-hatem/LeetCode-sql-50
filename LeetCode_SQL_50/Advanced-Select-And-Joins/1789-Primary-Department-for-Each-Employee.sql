SELECT 
    employee_id,
    department_id
FROM(
    SELECT *,
    COUNT(*) OVER(PARTITION BY employee_id) employee_count,
    CASE WHEN primary_flag = 'Y' THEN 'Accept'
        WHEN COUNT(*) OVER(PARTITION BY employee_id) = 1 THEN 'Accept'
        ELSE 'Reject' 
    END is_pimary
    FROM Employee
)t
WHERE is_pimary = 'Accept'