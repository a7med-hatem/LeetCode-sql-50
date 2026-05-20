SELECT E.name
FROM Employee E
LEFT JOIN Employee EE
ON E.id = EE.managerId
GROUP BY
    E.name,
    E.id
HAVING COUNT(EE.managerId) >= 5