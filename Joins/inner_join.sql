SELECT 
    e.employee_id,
    e.employee_name,
    p.pay_period,
    p.amount
FROM employees e
INNER JOIN payroll p
ON e.employee_id = p.employee_id;
