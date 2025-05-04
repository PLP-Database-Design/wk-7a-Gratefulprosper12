
-- QUESTION 1 ANSWER
-- achieving 1NF--

-- Create ProductDetail table
CREATE TABLE ProductDetail(
 OrderID INT,
CustomerName VARCHAR (100),
Products VARCHAR(100)
);

INSERT INTO ProductDetail(OrderID,CustomerName,Products)
VALUES(101,"John Doe","Laptop"),
(101,"John Doe","Mouse"),
(102,"Jane Smith","Tablet"),
(102,"Jane Smith","Keyboard"),
(102,"Jane Smith", "Mouse"),
(103,"Emily Clark",	"Phone");
-- RETREIVE DATA
SELECT * FROM ProductDetail;

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