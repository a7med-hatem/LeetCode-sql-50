WITH PolicyCounts AS(
    SELECT 
        tiv_2016,
        COUNT(*) OVER(PARTITION BY tiv_2015) AS shared_2015_count,
        COUNT(*) OVER(PARTITION BY lat, lon) AS shared_location_count
    FROM Insurance 
)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM PolicyCounts
WHERE shared_2015_count > 1 AND
shared_location_count = 1