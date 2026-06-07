WITH FirstOrder AS (
    SELECT
        customer_id,
        MIN(order_date) first_order_date
    FROM Delivery
    GROUP BY customer_id
)
SELECT
    ROUND(SUM(CASE WHEN customer_pref_delivery_date = order_date THEN 1.0 ELSE 0 END) / COUNT(d.customer_id) * 100, 2) immediate_percentage
FROM FirstOrder f
JOIN Delivery d
ON f.customer_id = d.customer_id
AND f.first_order_date = d.order_date;