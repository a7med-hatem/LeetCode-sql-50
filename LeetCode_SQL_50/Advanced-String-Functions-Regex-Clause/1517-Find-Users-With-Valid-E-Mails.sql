SELECT 
    user_id,
    name,
    mail
FROM Users
WHERE 
    mail LIKE '%@leetcode.com' COLLATE SQL_Latin1_General_CP1_CS_AS
    AND LEFT(mail, 1) LIKE '[a-zA-Z]' COLLATE SQL_Latin1_General_CP1_CS_AS
    AND LEFT(LOWER(mail), LEN(mail) - 13) NOT LIKE '%[^a-z0-9._-]%'