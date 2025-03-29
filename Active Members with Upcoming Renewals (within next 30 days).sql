SELECT 
    u.user_id,
    u.username,
    u.email,
    m.membership_type,
    m.renewal_date
FROM 
    Users u
JOIN 
    Members m ON u.user_id = m.member_id
WHERE 
    u.is_active = 1
    AND m.renewal_date BETWEEN GETDATE() AND DATEADD(DAY, 30, GETDATE())
ORDER BY 
    m.renewal_date;
