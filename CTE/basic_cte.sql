WITH payroll_summary AS (
    SELECT 
        employee_id,
        SUM(hours_worked) AS total_hours,
        SUM(pay_amount) AS total_pay
    FROM payroll
    GROUP BY employee_id
)
SELECT *
FROM payroll_summary
ORDER BY total_pay DESC;
