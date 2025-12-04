-- KPI: Percentage of equipment delivered vs equipment allocated per county

WITH allocations AS (
    SELECT 
        county,
        COUNT(*) AS allocated_items
    FROM equipment_allocations
    GROUP BY county
),
deliveries AS (
    SELECT 
        county,
        COUNT(*) AS delivered_items
    FROM equipment_delivery
    GROUP BY county
)
SELECT 
    a.county,
    a.allocated_items,
    d.delivered_items,
    ROUND((d.delivered_items::decimal / NULLIF(a.allocated_items,0)) * 100, 2) AS delivery_rate_pct
FROM allocations a
LEFT JOIN deliveries d
    ON a.county = d.county
ORDER BY delivery_rate_pct ASC;
