SELECT 
    e.employee_id,
    e.employee_name,
    p.pay_period,
    p.amount
FROM employees e
LEFT JOIN payroll p
    ON e.employee_id = p.employee_id
ORDER BY e.employee_id;
