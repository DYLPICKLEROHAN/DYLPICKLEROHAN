CREATE DATABASE ecomerceDB;

CREATE TABLE customer (
CustomerID INT, 
FirstName VARCHAR(255),
LastName VARCHAR(255), 
Email VARCHAR(255), 
Phone INT, 
RegistrationDate DATETIME2,
PRIMARY KEY (CustomerID)
);

ALTER TABLE customer
ALTER COLUMN Phone VARCHAR(255);

CREATE TABLE supplier (
SupplierID INT,
SupplierName VARCHAR(255),
ContactName VARCHAR(255),
ContactEmail VARCHAR(255),
ContactPhone INT,
PRIMARY KEY (SupplierID)
);

ALTER TABLE supplier
ALTER COLUMN ContactPhone VARCHAR(255);

CREATE TABLE product(
ProductID INT,
ProductName VARCHAR(255),
Category VARCHAR(255),
Price INT,
StockQuantity INT,
SupplierID INT,
PRIMARY KEY (ProductID),
FOREIGN KEY (SupplierID) REFERENCES supplier
);

CREATE TABLE orders(
OrderID INT, 
CustomerID INT,
OrderDate DATETIME2,
PRIMARY KEY (OrderID),
FOREIGN KEY (CustomerID) REFERENCES customer
);

CREATE TABLE OrderItem(
OrderItemID INT,
OrderID INT,
ProductID INT,
Quantity INT,
PRIMARY KEY (OrderItemID),
FOREIGN KEY (OrderID) REFERENCES orders,
FOREIGN KEY (ProductID) REFERENCES product
);


--INSERT Customers--
INSERT INTO customer(CustomerID, FirstName,LastName, Email, Phone, RegistrationDate)
VALUES(1, 'Mary','Johnson','maryjohnson@example.com','987-654-3210','2022-09-01');
GO
INSERT INTO customer(CustomerID, FirstName,LastName, Email, Phone, RegistrationDate)
VALUES(2, 'David','Brown','davidbrown@example.com','555-123-4567','2022-10-10');
GO
INSERT INTO customer(CustomerID, FirstName,LastName, Email, Phone, RegistrationDate)
VALUES(3, 'Sarah','Davis','sarahdavis@example.com','777-888-9999','2022-11-20');
GO
INSERT INTO customer(CustomerID, FirstName,LastName, Email, Phone, RegistrationDate)
VALUES(4, 'Michael','Wilson','michaelwilson@example.com','111-222-3333','2022-12-05');


--INSERT Suppliers
INSERT INTO supplier(SupplierID, SupplierName,ContactName, ContactEmail, ContactPhone)
VALUES(1, 'ABC Supplier','John Smith','johnsmith@example.com','123-456-7890');
GO
INSERT INTO supplier(SupplierID, SupplierName,ContactName, ContactEmail, ContactPhone)
VALUES(2, 'XYZ Supplier','Bob Smith','bobsmith@example.com','987-654-7899');
GO
INSERT INTO supplier(SupplierID, SupplierName,ContactName, ContactEmail, ContactPhone)
VALUES(3, 'DEF Supplier','Grace Lee','gracelee@example.com','233-556-8878');
GO
INSERT INTO supplier(SupplierID, SupplierName,ContactName, ContactEmail, ContactPhone)
VALUES(4, 'GHI Supplier','Amar Nath','amarnath@example.com','343-876-9000');
GO
INSERT INTO supplier(SupplierID, SupplierName,ContactName, ContactEmail, ContactPhone)
VALUES(5, 'JKS Supplier','Almus Smith','almussmith@example.com','765-878-8810');

--INSERT Products
INSERT INTO product(ProductID, ProductName, Category, Price, StockQuantity, SupplierID)
VALUES(1, 'Laptop', 'Electronics', 1000,20, 1);
GO
INSERT INTO product(ProductID, ProductName, Category, Price, StockQuantity, SupplierID)
VALUES(2, 'SmartPhone', 'Electronics', 800,15, 2);
GO
INSERT INTO product(ProductID, ProductName, Category, Price, StockQuantity, SupplierID)
VALUES(3, 'T-Shirt', 'Clothing', 20,100, 3);
GO
INSERT INTO product(ProductID, ProductName, Category, Price, StockQuantity, SupplierID)
VALUES(4, 'Watch', 'Accessories', 150,10, 4);
GO
INSERT INTO product(ProductID, ProductName, Category, Price, StockQuantity, SupplierID)
VALUES(5, 'Headphones', 'Electronics', 80,30, 5);

--INSERT Orders
INSERT INTO orders(OrderID, CustomerID, OrderDate)
VALUES(1,1, '2023-01-15');
GO
INSERT INTO orders(OrderID, CustomerID, OrderDate)
VALUES(2,2, '2023-02-02');
GO
INSERT INTO orders(OrderID, CustomerID, OrderDate)
VALUES(3,3, '2023-03-10');
GO
INSERT INTO orders(OrderID, CustomerID, OrderDate)
VALUES(4,4, '2023-04-20');
GO
INSERT INTO orders(OrderID, CustomerID, OrderDate)
VALUES(5,3, '2023-05-05');

--INSERT OrderItem
INSERT INTO OrderItem(OrderItemID, OrderID, ProductID, Quantity)
VALUES (1, 2, 2, 2);
GO
INSERT INTO OrderItem(OrderItemID, OrderID, ProductID, Quantity)
VALUES (2, 1, 3, 5);
GO
INSERT INTO OrderItem(OrderItemID, OrderID, ProductID, Quantity)
VALUES (3, 2, 2, 3);
GO
INSERT INTO OrderItem(OrderItemID, OrderID, ProductID, Quantity)
VALUES (4, 3, 4 , 1);
GO
INSERT INTO OrderItem(OrderItemID, OrderID, ProductID, Quantity)
VALUES (5,  4, 5, 4);


--Retrieve all Customers.
SELECT * FROM customer

--Retrieve customers with the last name "Brown".
SELECT * FROM customer
WHERE LastName = 'Brown';

--Retrieve Products with a price greater than $50.
SELECT * FROM product
WHERE Price > 50;

-- Retrieve orders placed on a specific date, for example, '2023-05-15'.
SELECT * FROM orders
WHERE OrderDate = '2023-01-15';

--Retrieve Suppliers with contact email containing 'example.com'.
SELECT * FROM supplier
WHERE ContactEmail LIKE '%example.com';

--Retrieve Customers registered after a specific date, for example, '2022-07-01'.
SELECT * FROM customer
WHERE RegistrationDate > '2022-07-01';

--Retrieve Products with a stock quantity less than or equal to 10.
SELECT * FROM product
WHERE StockQuantity <= 10;

--Retrieve Orders for a specific customer, for example, CustomerID of 1.
SELECT * From orders
WHERE CustomerID = 1;

--Retrieve Orders containing a specific Product, for example, ProductID of 4.
SELECT * FROM OrderItem
WHERE ProductID = 4; 

--Retrieve all the products from 'Electronics' and 'Accessories' Categories.
SELECT * FROM product
WHERE Category = 'Electronics' OR Category = 'Accessories';

--Retrieve all the orders made between two dates, say '2023-01-01' to '2023-06-30'.
SELECT * FROM orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-06-30';

--Retrieve all the products that are not Electronics.
SELECT * FROM product
WHERE Category <> 'Electronics';

SELECT category, AVG(price) AS avg_price FROM product
Group BY Category;

SELECT category, COUNT (productID) AS products_per_category FROM Product
GROUP BY category
HAVING COUNT(productID) >= 2;

-- Find the total number of customers.
SELECT count(customerid) as customer_count FROM customer;

-- Calculate the average price of products in each category.
SELECT Category, AVG(price) as avg_price FROM product
GROUP BY Category;

--Retrieve the maximum stock quantity among all products.
SELECT  MAX(StockQuantity) Max_stocked_item FROM product;

--Find the number of orders placed on each date.
SELECT OrderDate, count(orderid) as daily_orders FROM orders
GROUP BY OrderDate;

--Retrieve the category and the minimum price of products for categories with at least 2 products.
SELECT Category, MIN(price) FROM product
GROUP BY Category
HAVING count(ProductID) > 2;

SELECT supplier.SupplierName, product.ProductName FROM product
join supplier ON supplier.SupplierID = product.SupplierID;

--Store procedure
CREATE PROCEDURE customer_date AS 
SELECT CONCAT(customer.FirstName, ' ', customer.LastName), orders.OrderDate FROM customer
JOIN orders ON orders.CustomerID = customer.CustomerID;

EXEC customer_date

--Transactions

--BEGIN TRANSACTION [Tran1]
  --BEGIN TRY
    --  INSERT INTO [Test].[dbo].[T1] ([Title], [AVG])
      --VALUES ('Tidd130', 130), ('Tidd230', 230)

      --UPDATE [Test].[dbo].[T1]
      --SET [Title] = N'az2' ,[AVG] = 1
      --WHERE [dbo].[T1].[Title] = N'az'

--      COMMIT TRANSACTION [Tran1]
  --END TRY

  --BEGIN CATCH

    --  ROLLBACK TRANSACTION [Tran1]

  --END CATCH 