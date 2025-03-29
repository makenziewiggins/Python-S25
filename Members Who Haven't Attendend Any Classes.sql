SELECT 
    u.user_id,
    u.username,
    u.email,
    m.membership_type
FROM 
    Members m
JOIN 
    Users u ON m.member_id = u.user_id
LEFT JOIN 
    Class_Attendance ca ON m.member_id = ca.member_id
WHERE 
    ca.attendance_id IS NULL
    AND u.is_active = 1;
