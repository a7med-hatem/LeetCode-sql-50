SELECT 
    p.product_id,
    ISNULL(ROUND(SUM(p.price * Un.units * 1.0) / NULLIF(SUM(Un.units), 0), 2), 0) average_price
FROM Prices p
LEFT JOIN UnitsSold Un
    ON  P.product_id = Un.product_id
    AND Un.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id