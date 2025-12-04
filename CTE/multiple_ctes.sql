WITH employee_total AS (
    SELECT 
        employee_id,
        SUM(pay_amount) AS total_pay
    FROM payroll
    GROUP BY employee_id
),
high_earners AS (
    SELECT 
        employee_id,
        total_pay
    FROM employee_total
    WHERE total_pay > 5000
)
SELECT *
FROM high_earners
ORDER BY total_pay DESC;
