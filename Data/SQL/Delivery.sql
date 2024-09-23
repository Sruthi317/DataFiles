CREATE DATABASE delivery;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity)
VALUES
(1, 'Laptop', 'Electronics', 75000.00, 10),
(2, 'Smartphone', 'Electronics', 25000.00, 25),
(3, 'Headphones', 'Accessories', 2000.00, 50),
(4, 'Desk Chair', 'Furniture', 5000.00, 15),
(5, 'Monitor', 'Electronics', 12000.00, 8);

select * from Orders;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, ProductID, OrderDate, Quantity, TotalAmount)
VALUES
(1, 1, '2024-08-01', 2, 150000.00),
(2, 2, '2024-08-02', 3, 75000.00),
(3, 3, '2024-08-03', 5, 10000.00),
(4, 4, '2024-08-04', 1, 5000.00),
(5, 2, '2024-08-05', 1, 25000.00);

Select ProductName, Category, Price
FROM Products
JOIN Orders
ON Products.ProductID = Orders.ProductID

Select ProductName, Category, Price, OrderDate, Quantity, totalAmount
FROM Products
LEFT JOIN Orders
ON Products.ProductID = Orders.ProductID

Select ProductName, Category, Price, OrderDate, Quantity, totalAmount
FROM Products
RIGHT JOIN Orders
ON Products.ProductID = Orders.ProductID

Select ProductName, Category, Price, OrderDate, Quantity, totalAmount
FROM Products
FULL JOIN Orders
ON Products.ProductID = Orders.ProductID

-------------

select ProductName, SUM(Quantity) AS TotalQuantitySold
From Products
Join Orders
ON Products.ProductID = Orders.ProductID
GROUP BY ProductName
ORDER BY TotalQuantitySold DESC


select Products.ProductID, ProductName, Category
From Products
LEFT JOIN Orders
ON Products.ProductID = Orders.ProductID
WHERE Orders.ProductID IS NULL;


Select OrderID, ProductName, OrderDate,Quantity, TotalAmount
From Orders 
INNER JOIN Products
ON Products.ProductId = Orders.ProductID
WHERE OrderDate > '2023-01-01';

select ProductName,
Sum(Quantity) AS TotalQuantitySold,
Sum(TotalAmount) AS TotalSalesAmount
From Orders
INNER JOIN Products 
ON Orders.ProductID = Products.ProductID
GROUP BY ProductName;

Select ProductName, Category, Price
From Products
Where category IN('Electronics','Furniture');


Select Distinct Category
from Products;

Select ProductName, Category, Price
from Products
Where Category = 'Electronics' AND Price >2000;

Select ProductName , Category, StockQuantity
From Products
Where Category = 'Furniture' OR StockQuantity < 10;

Select ProductName, Category, Price
from Products
Where Price Between 5000 And 20000;

Select ProductName, Category, Price
from Products
Where ProductName LIKE 's%';

Select ProductName, Category, Price
from Products
Where ProductName LIKE '%phone%';

Select ProductName AS Name, Price AS Cost,StockQuantity AS QuantityAvailable
FROM Products;

Select p.productname, o.orderId, o.quantity
From Products AS p
INNER JOIN Orders AS o ON p.productID = o.productId
Where p.category = 'Electronics'

Select  p.productName, p.Category, p.price, o.orderDate
From Products AS p
Inner Join Orders As o ON p.productID = o.OrderID
Where p.Category In ('Electronics', 'Furniture')
And o.OrderDate > '2024-01-01'
And p.Price BETWEEN 5000 AND 50000
AND p.productName LIKE 'S%';

select p1.productName AS Product1, p2.ProductName AS Product2, p1.Category
FROM Products p1
INNER JOIN Products p2 ON p1.Category = p2.Category AND p1.ProductID <> p2.ProductID;

SELECT p.Category, SUM(o.Quantity) AS TotalQuantity
From Orders o
INNER JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.Category
HAVING SUM(o.Quantity) >3;


23/08/2024- Friday


SELECT ProductName, Price, Price%5 AS ModuloPrice
FROM Products;

SELECT 
    ProductName, price,
    ROUND(price * 0.85, 2) AS DiscountedPrice,
    CEILING(ROUND(price * 0.85, 2)) AS ceiling_price,
    FLOOR(ROUND(price * 0.85, 2)) AS floor_price
FROM 
    products;

1. Calculate the total amount spent by each customer.

SELECT  c.customerid,c.customername, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN 
    orders o ON c.customerid = o.customerid
GROUP BY 
    c.customerid, c.customername;

2. Find customers who have spent more than $1,000 in total.

   SELECT 
    c.customerid,
    c.customername,
    SUM(o.total_amount) AS total_spent
FROM 
    customers c
JOIN 
    orders o ON c.customerid = o.customerid
GROUP BY 
    c.customerid, c.customername
HAVING 
    SUM(o.total_amount) > 1000;
 
3. Find Product Categories with More Than 5 Products
 SELECT 
    category,
    COUNT(productid) AS product_count
FROM 
    products
GROUP BY 
    category
HAVING 
    COUNT(productid) > 5;
 
4. Calculate the total number of products for each category and supplier combination.
   SELECT 
    category,
    supplierid,
    COUNT(productid) AS product_count
FROM 
    products
GROUP BY 
    category, 
    supplierid;

 
5. Summarize total sales by product and customer, and also provide an overall total.
 
 SELECT 
    p.productname,
    c.customername,
    SUM(od.quantity * od.unit_price) AS total_sales
FROM 
    orders o
JOIN 
    order_details od ON o.orderid = od.orderid
JOIN 
    products p ON od.productid = p.productid
JOIN 
    customers c ON o.customerid = c.customerid
GROUP BY 
    ROLLUP(p.productname, c.customername);

CREATE PROCEDURE GetAllProducts
AS
 BEGIN
    SELECT * FROM Products;
END;

CREATE PROCEDURE GetProductByID
     @ProductID INT
AS
BEGIN
    SELECT *
	FROM Products
	WHERE ProductID = @ProductID;
END

CREATE PROCEDURE GetProductsByCategoryAndPrice
  @Category VARCHAR(50),
  @MinPrice DECIMAL(10,2)
AS 
BEGIN
   SELECT *
   FROM Products
   WHERE Category = @Category
   AND Price >= @MinPrice;
END;

24/08/24

create table Customer(
CustomerID int,
Firstname varchar(50),
LastName varchar(50),
Email varchar(100),
PhoneNumber varchar(50));

INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity)
VALUES
(1, 'Laptop', 'Electronics', 75000.00, 10),
(2, 'Smartphone', 'Electronics', 25000.00, 25),
(3, 'Headphones', 'Accessories', 2000.00, 50),
(4, 'Desk Chair', 'Furniture', 5000.00, 15),
(5, 'Monitor', 'Electronics', 12000.00, 8);

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES
(1, 'amit', 'sharma', 'amit.sharma@example.com', 9876543210),
(2, 'priya', 'mehta', 'priya.mehta@example.com', 8765432109),
(3, 'rohit', 'kumar', 'rohit.kumar@example.com', 7654321098),
(4, 'neha', 'verma', 'neha.verma@example.com', 6543210987),
(5, 'siddharth', 'singh', 'siddharth.singh@example.com', 5432109876),
(6, 'asha', 'rao', 'asha.rao@example.com', 4321098765)



UPDATE Customer
SET FirstName = LTRIM(RTRIM(LOWER(FirstName))),
    LastName = LTRIM(RTRIM(LOWER(LastName)));

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    ManagerID INT NULL
);

INSERT INTO Employees (EmployeeName, ManagerID)

VALUES 

('Amit Sharma', NULL),  -- Top manager

('Priya Mehta', 1),     -- Reports to Amit

('Rohit Kumar', 1),     -- Reports to Amit

('Neha Verma', 2),      -- Reports to Priya

('Siddharth Singh', 2), -- Reports to Priya

('Asha Rao', 3);        -- Reports to Rohit

 
INSERT INTO Employees (EmployeeName, ManagerID)

VALUES 

('Vikram Gupta', 4),  -- Reports to Neha

('Rajesh Patel', 5);  -- Reports to Siddharth

 
