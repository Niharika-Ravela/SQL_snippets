SELECT 
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    SUM(p.amount) AS total_payroll
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
LEFT JOIN payroll p
    ON e.employee_id = p.employee_id
GROUP BY d.department_name
ORDER BY total_payroll DESC;
