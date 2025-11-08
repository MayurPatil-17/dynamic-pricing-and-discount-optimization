CREATE DATABASE IF NOT EXISTS retail_pricing;
USE retail_pricing;

-- Top 10 high-margin products
SELECT 
    StockCode,
    Description,
    ROUND(AVG(ProfitMargin), 2) AS avg_margin,
    SUM(TotalSales) AS total_sales
FROM
    sales_enriched
GROUP BY StockCode , Description
HAVING COUNT(*) > 20
ORDER BY avg_margin DESC
LIMIT 10;