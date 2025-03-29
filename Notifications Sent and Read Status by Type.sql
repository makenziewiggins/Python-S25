SELECT 
    type AS notification_type,
    COUNT(*) AS total_sent,
    SUM(CASE WHEN read_status = 1 THEN 1 ELSE 0 END) AS total_read,
    CAST(
        100.0 * SUM(CASE WHEN read_status = 1 THEN 1 ELSE 0 END) / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS read_rate_percent
FROM 
    Notifications
GROUP BY 
    type
ORDER BY 
    total_sent DESC;
