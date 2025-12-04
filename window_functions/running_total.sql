SELECT 
    employee_id,
    pay_period,
    amount,
    SUM(amount) OVER (
        PARTITION BY employee_id
        ORDER BY pay_period
    ) AS running_pay_total
FROM payroll;
