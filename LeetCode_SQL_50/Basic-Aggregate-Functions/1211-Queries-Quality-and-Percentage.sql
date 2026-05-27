SELECT
    query_name,
    ROUND(AVG(CAST(rating AS FLOAT)/position), 2) quality,
    ROUND(AVG(CASE WHEN rating < 3 THEN 100.0 ELSE 0.00 END), 2)  poor_query_percentage
FROM Queries
GROUP BY query_name