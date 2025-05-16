Question 1: Achieving 1NF
-- Create a new 1NF table
CREATE TABLE OrderProducts_1NF AS
SELECT 
    OrderID,
    CustomerName,
    TRIM(value) AS Product
FROM 
    ProductDetail,
    STRING_SPLIT(Products, ',');


Question 2: Achieving 2NF

-- Create Orders table (removes partial dependency)
CREATE TABLE Orders_2NF AS
SELECT DISTINCT 
    OrderID, 
    CustomerName
FROM 
    OrderDetails;

-- Create OrderProducts table (contains only full dependencies)
CREATE TABLE OrderProducts_2NF AS
SELECT 
    OrderID, 
    Product, 
    Quantity
FROM 
    OrderDetails;

-- Add primary keys
ALTER TABLE Orders_2NF ADD PRIMARY KEY (OrderID);
ALTER TABLE OrderProducts_2NF ADD PRIMARY KEY (OrderID, Product);
