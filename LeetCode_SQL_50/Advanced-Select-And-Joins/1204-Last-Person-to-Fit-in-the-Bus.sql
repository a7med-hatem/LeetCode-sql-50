SELECT 
    TOP 1 person_name
FROM (
    SELECT *,
    SUM(weight) OVER(ORDER BY turn) total_weight 
    FROM Queue
)t
WHERE total_weight <= 1000
ORDER BY total_weight DESC