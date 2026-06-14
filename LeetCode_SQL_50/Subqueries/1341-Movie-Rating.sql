WITH TopUser AS (
    SELECT TOP 1 u.name AS results
    FROM MovieRating AS mr
    JOIN Users AS u ON mr.user_id = u.user_id
    GROUP BY u.name
    ORDER BY COUNT(*) DESC, u.name ASC
),
TopMovie AS (
    SELECT TOP 1 m.title AS results
    FROM MovieRating AS mr
    JOIN Movies AS m ON mr.movie_id = m.movie_id
    WHERE YEAR(mr.created_at) = 2020 AND MONTH(mr.created_at) = 2
    GROUP BY m.title
    ORDER BY AVG(mr.rating * 1.0) DESC, m.title ASC
)

SELECT results FROM TopUser
UNION ALL
SELECT results FROM TopMovie;