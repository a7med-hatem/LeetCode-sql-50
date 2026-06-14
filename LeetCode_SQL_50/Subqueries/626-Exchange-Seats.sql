SELECT 
    new_id AS id,
    student
FROM(
    SELECT 
        id,
        student,
        CASE 
            WHEN id % 2 <> 0  AND id = (SELECT MAX(id) FROM Seat) THEN id
            WHEN id % 2 <> 0 THEN id + 1
            WHEN id % 2 = 0 THEN id - 1
        END new_id
    FROM Seat
)t ORDER BY new_id