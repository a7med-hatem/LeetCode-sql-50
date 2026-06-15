WITH DailyTotals AS (
    SELECT 
        visited_on,
        SUM(amount) daily_amount
    FROM Customer
    GROUP BY visited_on
),
MovingAverages AS (
    SELECT
        visited_on,
        SUM(daily_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        ROUND(AVG(CAST(daily_amount AS FLOAT)) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount,
        ROW_NUMBER() OVER(ORDER BY visited_on) AS rn
    FROM DailyTotals
)

SELECT
    visited_on,
    amount,
    average_amount
FROM MovingAverages
WHERE rn >= 7
ORDER BY visited_on