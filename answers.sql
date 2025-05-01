-- question 1--
-- given data without following 1NF
CREATE DATABASE products;
USE products;
CREATE TABLE ProductDetail(
OrderID  BIGINT PRIMARY KEY,
CustomerName VARCHAR(100),
Products VARCHAR(100)
);

INSERT INTO ProductDetail(OrderID,CustomerName,Products) 
VALUES(101,	"John Doe",	"Laptop, Mouse"),
(102,"Jane Smith","Tablet, Keyboard, Mouse"),
(103, "Emily Clark","Phone");

---
SELECT * FROM ProductDetail;
-- deleting a column
ALTER TABLE ProductDetail
DROP COLUMN Products;

-- -- retrive data from books table

SELECT * FROM ProductDetail
-- QUESTION 1 ANSWER
-- achieving 1NF--

-- Create products table
CREATE TABLE Products(
product_id INT PRIMARY KEY AUTO_INCREMENT,
ProductsName VARCHAR(100),
Order_ID BIGINT,
FOREIGN KEY(Order_ID) REFERENCES ProductDetail(OrderID));

-- insert data

INSERT INTO Products(ProductsName,Order_ID)
VALUES("Laptop",101),
("Mouse",101),
("Tablet", 102),
("Keyboard",102),
("Mouse",102),
("Phone",103);
-- RETREIVE DATA
SELECT * FROM Products;

-- question2---
-- GIVEN DATA--
CREATE DATABASE Orders;
USE Orders;

-- Drop the table if it exists
-- DROP TABLE IF EXISTS OrderDetails;

-- Create table with composite primary key
CREATE TABLE OrderDetails(
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, Product)  -- Both columns together form the primary key
);

-- Now the inserts will work
INSERT INTO OrderDetails(OrderID, CustomerName, Product, Quantity) 
VALUES
    (101, "John Doe", "Laptop", 2),
    (101, "John Doe", "Mouse", 1),
    (102, "Jane Smith", "Tablet", 3),
    (102, "Jane Smith", "Keyboard", 1),
    (102, "Jane Smith", "Mouse", 2),
    (103, "Emily Clark", "Phone", 1);

SELECT * FROM OrderDetails;
DROP TABLE OrderDetails;  -- dropping the entire table and recreating using 2NF

-- Question 2 ANSWER
-- 2NF AT WORK--
-- --- - CREATE TABLE Customer Orders
 CREATE TABLE CustomerOrders(
OrderID INT PRIMARY KEY,
CustomerName VARCHAR(100));


CREATE TABLE OrderedProducts(
OrderID INT,
Product VARCHAR(100),
Quantity INT NOT NULL,
PRIMARY KEY(OrderID, Product),
FOREIGN KEY(OrderId) REFERENCES CustomerOrders(OrderID)
);

-- -- INSERTING DATA TO CustomerOrders
INSERT INTO CustomerOrders(OrderID,CustomerName)
VALUES(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- -- INSERTING DATA TO OrderedProducts

INSERT INTO OrderedProducts(OrderID,Product,Quantity)
VALUES(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

SELECT * FROM OrderedProducts;
SELECT* FROM CustomerOrders