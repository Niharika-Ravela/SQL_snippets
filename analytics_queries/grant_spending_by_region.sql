-- Total grant spending by region with Year over Year comparison

WITH spending AS (
    SELECT 
        region,
        fiscal_year,
        SUM(amount) AS total_spent
    FROM grant_expenditures
    GROUP BY region, fiscal_year
),
yoy AS (
    SELECT 
        s1.region,
        s1.fiscal_year,
        s1.total_spent,
        s2.total_spent AS prev_year_spent,
        (s1.total_spent - s2.total_spent) AS difference,
        ROUND(((s1.total_spent - s2.total_spent) / NULLIF(s2.total_spent,0)) * 100, 2) AS pct_change
    FROM spending s1
    LEFT JOIN spending s2
        ON s1.region = s2.region
       AND s1.fiscal_year = s2.fiscal_year + 1
)
SELECT *
FROM yoy
ORDER BY region, fiscal_year;
