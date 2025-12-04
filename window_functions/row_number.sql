SELECT 
    employee_id,
    pay_period,
    amount,
    ROW_NUMBER() OVER (
        PARTITION BY employee_id
        ORDER BY pay_period DESC
    ) AS rn
FROM payroll;
