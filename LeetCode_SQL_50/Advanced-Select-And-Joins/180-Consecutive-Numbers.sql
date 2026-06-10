SELECT DISTINCT num AS ConsecutiveNums
FROM(
    SELECT
        num,
        CASE  WHEN num = LEAD(num,1) OVER(ORDER BY id) 
            AND num =  LEAD(num,2) OVER(ORDER BY id) THEN 'ACCEPT'
            ELSE 'REJECT' 
        END ConsecutiveNums
    FROM Logs
)t
WHERE ConsecutiveNums = 'ACCEPT'