-- Find mismatches and inconsistencies between timesheet hours and payroll hours

WITH timesheet_hours AS (
    SELECT 
        employee_id,
        SUM(hours_worked) AS total_timesheet_hours
    FROM timesheets
    GROUP BY employee_id
),
payroll_hours AS (
    SELECT 
        employee_id,
        SUM(hours_paid) AS total_payroll_hours
    FROM payroll
    GROUP BY employee_id
)
SELECT 
    t.employee_id,
    t.total_timesheet_hours,
    p.total_payroll_hours,
    (t.total_timesheet_hours - p.total_payroll_hours) AS hour_difference
FROM timesheet_hours t
LEFT JOIN payroll_hours p
    ON t.employee_id = p.employee_id
WHERE ABS(t.total_timesheet_hours - p.total_payroll_hours) > 5;
