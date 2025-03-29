SELECT 
    c.name AS class_name,
    COUNT(ca.attendance_id) AS total_attendance
FROM 
    Classes c
JOIN 
    Class_Attendance ca ON c.class_id = ca.class_id
GROUP BY 
    c.class_id, c.name
ORDER BY 
    total_attendance DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;  -- For SQL Server
