SELECT 
    product_id,
    new_price AS Price
FROM(
    SELECT
        product_id,
        new_price,
        ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) Rank_price
    FROM Products
    WHERE change_date <= '2019-08-16'
)t WHERE Rank_price = 1
UNION

SELECT 
    product_id,
    10 AS Price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16'