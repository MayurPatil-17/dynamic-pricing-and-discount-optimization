CREATE DATABASE IF NOT EXISTS retail_pricing;
USE retail_pricing;

-- Country-Level Profit Summary
SELECT 
    Country,
    ROUND(SUM(TotalSales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(ProfitMargin), 2) AS avg_margin,
    ROUND(AVG(Discount), 2) AS avg_discount
FROM
    sales_enriched
GROUP BY Country
ORDER BY total_profit DESC;

-- ------------------------------------------------------------------------------------------------------------

-- Exporting data into csv
(
SELECT 'Country','total_sales','total_profit','avg_margin','avg_discount'
)
UNION ALL
(
SELECT 
    Country,
    ROUND(SUM(TotalSales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(ProfitMargin), 2) AS avg_margin,
    ROUND(AVG(Discount), 2) AS avg_discount
FROM sales_enriched
GROUP BY Country
ORDER BY total_profit DESC
)
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\country_profit_summary.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';