CREATE DATABASE IF NOT EXISTS retail_pricing;
USE retail_pricing;

SELECT 
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    SUM(TotalSales) AS total_revenue,
    AVG(Discount) AS avg_discount,
    AVG(ProfitMargin) AS avg_margin
from sales_enriched;