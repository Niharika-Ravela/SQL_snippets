WITH RECURSIVE calendar_dates AS (
    SELECT DATE '2024-01-01' AS day
    UNION ALL
    SELECT day + INTERVAL '1 day'
    FROM calendar_dates
    WHERE day < DATE '2024-01-31'
)
SELECT *
FROM calendar_dates;
