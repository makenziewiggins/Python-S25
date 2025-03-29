SELECT 
    SUM(amount) AS total_revenue,
    COUNT(*) AS total_transactions
FROM 
    Billing
WHERE 
    payment_status = 'Paid'
    AND MONTH(billing_date) = MONTH(GETDATE())
    AND YEAR(billing_date) = YEAR(GETDATE());
