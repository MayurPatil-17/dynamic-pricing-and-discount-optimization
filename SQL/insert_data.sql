CREATE DATABASE IF NOT EXISTS retail_pricing;
USE retail_pricing;

-- Loading our main csv file
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\data_clean.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country);

-- Displaying the data
select * from sales_data limit 10;