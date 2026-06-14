SELECT 
    Department,
    Employee,
    Salary
FROM(
    SELECT 
        e.name AS Employee,
        d.name AS Department,
        salary,
        DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) SalaryRank
    FROM Employee e
    LEFT JOIN Department d
    ON e.departmentId = d.id
)t WHERE SalaryRank <= 3