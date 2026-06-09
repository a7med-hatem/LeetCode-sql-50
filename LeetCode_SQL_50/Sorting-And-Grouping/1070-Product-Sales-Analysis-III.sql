SELECT
    product_id,
    first_year,
    quantity,
    price
FROM (
    SELECT *,
    MIN(year) OVER(PARTITION BY product_id) first_year
    FROM Sales
) AS sales_subquery
WHERE year = first_year

