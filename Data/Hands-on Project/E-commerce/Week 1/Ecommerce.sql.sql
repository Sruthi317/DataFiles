create database ECommerce

CREATE TABLE CustomerData (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(255),
location VARCHAR(255)
);

INSERT INTO CustomerData (customer_id, customer_name, location) VALUES 
(1001, 'Alice Johnson', 'New York, USA'),
(1002, 'Bob Smith', 'Los Angeles, USA'),
(1003, 'Charlie Davis', 'London, UK'),
(1004, 'Diana Adams', 'Toronto, Canada'),
(1005, 'Eve Thompson', 'Sydney, Australia'),
(1006, 'Frank Wright', 'Berlin, Germany'),
(1007, 'Grace Lee', 'Paris, France'),
(1008, 'Hank Morgan', 'Tokyo, Japan'),
(1009, 'Ivy Wilson', 'São Paulo, Brazil'),
(1010, 'Jack Mart', 'Dubai, UAE');

CREATE TABLE ProductData (
product_id INT PRIMARY KEY,
product_name VARCHAR(255),
category VARCHAR(255)
);


INSERT INTO ProductData (product_id, product_name, category) VALUES 
(2001, 'iPhone 14', 'Electronics'),
(2002, 'Samsung Galaxy S21', 'Electronics'),
(2003, 'Sony WH-1000XM4', 'Accessories'),
(2004, 'Nike Air Max', 'Footwear'),
(2005, 'Adidas Ultraboost', 'Footwear'),
(2006, 'Dell XPS 13', 'Computers'),
(2007, 'MacBook Pro', 'Computers'),
(2008, 'Apple Watch', 'Wearables'),
(2009, 'Fitbit Charge 4', 'Wearables'),
(2010, 'GoPro Hero 9', 'Cameras');

select * from ProductData

CREATE TABLE OrderData (
order_id INT PRIMARY KEY,
product_id INT,
customer_id INT,
quantity INT,
order_amount DECIMAL(10, 2),
order_date DATETIME,
FOREIGN KEY (product_id) REFERENCES ProductData(Product_id),
FOREIGN KEY (customer_id) REFERENCES CustomerData(customer_id)
);

INSERT INTO OrderData (order_id, product_id, customer_id, quantity, order_amount, order_date) VALUES 
(3001, 2001, 1001, 1, 599.99, '2024-09-01 08:15:30'),  -- Example for a single product order
(3002, 2002, 1002, 2, 1199.98, '2024-09-01 09:30:45'),  -- Example for two products order
(3003, 2003, 1003, 1, 299.00, '2024-09-02 10:45:20'),  -- Example for another single product order
(3004, 2004, 1004, 3, 450.00, '2024-09-02 11:15:50'),  -- Example for three products order
(3005, 2005, 1005, 1, 150.00, '2024-09-03 12:25:00'),  -- Example for a single product order
(3006, 2006, 1006, 1, 1199.99, '2024-09-03 13:35:10'), -- Example for another single product order
(3007, 2007, 1007, 1, 1999.99, '2024-09-04 14:40:30'), -- Example for a high-value single product order
(3008, 2008, 1008, 2, 799.98, '2024-09-04 15:15:45'),  -- Example for two products order
(3009, 2009, 1009, 1, 129.99, '2024-09-05 16:20:10'),  -- Example for a single product order
(3010, 2010, 1010, 1, 499.99, '2024-09-05 17:30:25');  -- Example for another single product order

select * from OrderData


