-- Creating Database 
CREATE DATABASE retail_pricing;
USE retail_pricing;

-- Creating table 
CREATE TABLE sales_data (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice FLOAT,
    CustomerID INT,
    Country VARCHAR(50)
);
