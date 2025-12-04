SELECT 
    department,
    employee_id,
    total_sales,
    RANK() OVER (PARTITION BY department ORDER BY total_sales DESC) AS sales_rank,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY total_sales DESC) AS sales_dense_rank
FROM sales_summary;
