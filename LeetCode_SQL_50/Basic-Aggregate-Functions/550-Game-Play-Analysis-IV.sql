WITH first_logged AS(
    SELECT
        player_id,
        MIN(event_date) first_logged
    FROM Activity
    GROUP BY player_id
)
SELECT
    ROUND(COUNT(a.player_id) * 1.0/ COUNT(f.Player_id), 2) fraction
FROM first_logged f
LEFT JOIN Activity a
ON f.player_id = a.player_id AND
a.event_date = DATEADD(DAY, 1, f.first_logged)