CREATE DATABASE IF NOT EXISTS retail_pricing;
USE retail_pricing;

-- Monthly sales and discount trends.
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS monthly_sales,
    SUM(TotalSales) AS total_sales,
    SUM(Profit) AS total_profit,
    AVG(Discount) AS avg_discount,
    AVG(ProfitMargin) AS avg_margin
FROM
    sales_enriched
GROUP BY monthly_sales
ORDER BY monthly_sales
LIMIT 10;

-- ------------------------------------------------------------------------------------------------------------

-- Exporting the data into csv
(
SELECT 'month_sales','total_sales','total_profit','avg_discount','avg_margin'
)
UNION ALL
(
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS month_sales,
    SUM(TotalSales) AS total_sales,
    SUM(Profit) AS total_profit,
    AVG(Discount) AS avg_discount,
    AVG(ProfitMargin) AS avg_margin
FROM sales_enriched
GROUP BY month_sales
ORDER BY month_sales
)
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\monthly_sales.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

