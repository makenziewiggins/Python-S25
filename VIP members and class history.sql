SELECT 
    u.username AS member_name,
    c.name AS class_name,
    c.schedule_time,
    emp.position AS instructor_position,
    iu.username AS instructor_name,
    ca.attended_at
FROM 
    Members m
JOIN 
    Users u ON m.member_id = u.user_id
JOIN 
    Class_Attendance ca ON m.member_id = ca.member_id
JOIN 
    Classes c ON ca.class_id = c.class_id
JOIN 
    Employees emp ON c.instructor_id = emp.employee_id
JOIN 
    Users iu ON emp.employee_id = iu.user_id
WHERE 
    m.membership_type = 'VIP'
ORDER BY 
    u.username, ca.attended_at DESC;
