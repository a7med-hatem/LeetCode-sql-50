SELECT
    user_id,
    CONCAT(UPPER(LEFT(name, 1)), (LOWER(SUBSTRING(name, 2, LEN(name))))) name
FROM Users
ORDER BY user_id