-- Identify invoices with suspiciously high or low amounts compared to vendor averages in previous years history

WITH vendor_stats AS (
    SELECT 
        vendor_id,
        AVG(invoice_amount) AS avg_amount,
        STDDEV(invoice_amount) AS std_amount
    FROM invoices
    GROUP BY vendor_id
),
scored AS (
    SELECT 
        i.invoice_id,
        i.vendor_id,
        i.invoice_amount,
        v.avg_amount,
        v.std_amount,
        (i.invoice_amount - v.avg_amount) / NULLIF(v.std_amount, 0) AS z_score
    FROM invoices i
    LEFT JOIN vendor_stats v
        ON i.vendor_id = v.vendor_id
)
SELECT *
FROM scored
WHERE ABS(z_score) > 3
ORDER BY z_score DESC;
