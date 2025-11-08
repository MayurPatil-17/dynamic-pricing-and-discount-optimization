-- Top 10 loss leaders.
SELECT 
    StockCode,
    Description,
    ROUND(AVG(ProfitMargin), 2) AS avg_margin,
    SUM(TotalSales) AS total_sales
FROM
    sales_enriched
GROUP BY StockCode , Description
HAVING COUNT(*) > 20
ORDER BY avg_margin ASC
LIMIT 10;