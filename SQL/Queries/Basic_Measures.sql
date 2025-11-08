CREATE DATABASE IF NOT EXISTS retail_pricing;
USE retail_pricing;

CREATE TABLE sales_enriched AS SELECT *,
    (Quantity * UnitPrice) AS TotalSales,
    (RAND() * 0.25 + 0.05) AS Discount,
    (Quantity * UnitPrice) * (1 - (RAND() * 0.25 + 0.05)) AS Profit FROM
    sales_data;

ALTER TABLE sales_enriched ADD COLUMN ProfitMargin FLOAT;

UPDATE sales_enriched 
SET 
    ProfitMargin = CASE
        WHEN TotalSales = 0 THEN 0
        ELSE Profit / TotalSales
    END;

SELECT * FROM sales_enriched LIMIT 10;

-- ----------------------------------------------------------------------------------

(SELECT 
    'InvoiceNo',
    'StockCode',
    'Description',
    'Quantity',
    'InvoiceDate',
    'UnitPrice',
    'CustomerID',
    'Country',
    'TotalSales',
    'Discount',
    'Profit',
    'ProfitMargin')
UNION ALL 
(SELECT 
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    TotalSales,
    Discount,
    Profit,
    ProfitMargin
FROM sales_enriched)
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sales_enriched.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

