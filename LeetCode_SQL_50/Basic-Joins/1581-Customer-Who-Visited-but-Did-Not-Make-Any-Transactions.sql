SELECT 
V.customer_id,
COUNT(V.visit_id) AS count_no_trans
FROM Visits V
LEFT JOIN Transactions AS T
ON V.visit_id = T.visit_id 
WHERE ISNULL(T.transaction_id)
GROUP BY V.customer_id