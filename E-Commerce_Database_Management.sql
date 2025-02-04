-- **********************************E-Commerce Database Management *****************************************
-- Creating DATABASE (Name: Wildcart)
CREATE DATABASE Wildcart;
USE Wildcart;

-- Categories Table 
CREATE TABLE Categories
(CategoryID INTEGER AUTO_INCREMENT PRIMARY KEY,
CategoryName VARCHAR(100) NOT NULL,
Description TEXT);

-- Insert records into Categories
INSERT INTO Categories (CategoryName, Description) VALUES 
('Electronics', 'Electronic gadgets and accessories'),
('Fashion', 'Men and women apparel and accessories'),
('Home Appliances', 'Household electronic items'), 
('Books', 'Fiction and non-fiction books'),
('Furniture', 'Home and office furniture'), 
('Health', 'Medicines for all health conditions'),
('Beauty', 'Styling and cosmectic items'),
('Groceries', 'Packaged foods and fresh veggies and fruits');

-- Products Table
CREATE TABLE Products
(ProductID INTEGER AUTO_INCREMENT PRIMARY KEY,
ProductName VARCHAR(300) NOT NULL, 
CategoryID INTEGER, Price DECIMAL(10,2), Stock INTEGER, 
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID));

-- Insert records into Products
INSERT INTO Products (ProductName, CategoryID, Price, Stock) VALUES 
('Smartphone', 1, 22599, 50), ('Laptop', 1, 74999, 20), ('Smartwatch',1, 2599, 25),
('Men T-Shirt', 2, 1499, 100), ('Jeans', 2, 2399, 75), ('Chudidar',2,499, 150), ('Sweaters',2,1399,70), 
('Footwear', 2, 799, 60), ('Eyewear',2,1599,30), ('Wallets',2,899,30), ('Microwave', 3, 9999, 15), 
('Refrigerator', 3, 19349, 20), ('Water Heater', 3, 8999, 15), ('Electric Kettle', 3, 499, 40),
('Smart LED TV', 3, 25999, 20), ('Ceiling Fan', 3, 4599, 25), ('Dune', 4, 899, 30), 
('Redwall', 4, 449, 10), ('The Hobbit', 4, 1399, 20), 
('Stephen Hawking', 4, 699, 45), ('Textbook of Surgery', 4, 2399, 8), ('Sofa', 5, 19999, 10), 
('Chair', 5, 1249, 100), ('Dinning Table', 5, 8999, 10), ('Office Table', 5, 5999, 10), 
('Queen Size Cot', 5, 25999, 10), ('Cofsils Cough Syrup', 6, 145, 50), ('Zedex Cough Syrup', 6, 178, 20), 
('Aspirin', 6, 59, 40), ('Amoxicillin', 6, 67, 20), ('Cetcip-L', 6, 76, 15),
('Lipstick', 7, 999, 40), ('Shampoo', 7, 199, 40), ('Face Wash', 7, 349, 30), ('Soap', 7, 59, 100),
('Nail Polish', 7, 179, 40), ('Talcum Powder', 7, 148, 55), ('Perfumes', 7, 149, 50), ('Body Wash', 7, 139, 30), 
('Shaving Cream', 7, 99, 25), ('Capsicum', 8, 99, 15), ('Carrot', 8, 69, 20), ('Tomato', 8, 39, 30), 
('Onion', 8, 49, 30), ('Apple', 8, 199, 20), ('Orange', 8, 89, 15), ('Doritos', 8, 50, 200), 
('Lays', 8, 30, 150), ('Good Day', 8, 60, 250), ('Dark Fantasy', 8, 79, 170);

SELECT * FROM Products;
SELECT * FROM Categories;

-- Customers Table
CREATE TABLE Customers
(CustomerID INTEGER AUTO_INCREMENT PRIMARY KEY, FirstName VARCHAR(50) NOT NULL, 
LastName VARCHAR(50) NOT NULL, Email VARCHAR(50) UNIQUE NOT NULL,
Phone VARCHAR(20));

-- Insert records into Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone) VALUES 
('John', 'Doe', 'john.doe@example.com', '6534776545'),
('Jane', 'Smith', 'jane.smith@example.com', '7987654321'),
('Alice', 'Brown', 'alice.brown@example.com', '6122334455'),
('Michael', 'Johnson', 'michael.johnson@example.com', '8233445566'),
('Emma', 'Wilson', 'emma.wilson@example.com', '6344556677'),
('Liam', 'Martinez', 'liam.martinez@example.com', '8455667788'),
('Olivia', 'Anderson', 'olivia.anderson@example.com', '9566778899'),
('William', 'Garcia', 'william.garcia@example.com', '8677889900'),
('Sophia', 'Thomas', 'sophia.thomas@example.com', '7788990011'),
('James', 'Moore', 'james.moore@example.com', '8899001122'),
('Troye', 'Sivan', 'troye.sivan@example.com', '8885537114'),
('Miley', 'Cyrus', 'miley.cyrus@example.com', '7733654216');

SELECT * FROM Customers;

-- Orders Table
CREATE TABLE Orders (OrderID INTEGER AUTO_INCREMENT PRIMARY KEY,
CustomerID INTEGER, OrderDate DATE, TotalAmount DECIMAL(10,2),
Status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending');
    
-- Insert records into Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status) VALUES 
(1, '2025-01-03', 2599, 'Delivered'), (3, '2025-01-10', 2045, 'Delivered'), (5, '2025-01-13', 1947, 'Delivered'),
(4, '2025-01-14', 25999, 'Delivered'), (8, '2025-01-14', 74999, 'Cancelled'), (6, '2025-01-16', 7398, 'Delivered'),
(11, '2025-01-17',2298, 'Delivered'), (2, '2025-01-20', 8999, 'Delivered'),(9, '2025-01-27', 25999, 'Shipped'),
(12, '2025-01-27', 19349, 'Shipped'), (7, '2025-01-29', 4599, 'Pending'), (10, '2025-01-30',22758, 'Pending');

SELECT * FROM Orders;

-- OrderDetails Table
CREATE TABLE OrderDetails 
(OrderDetailID INTEGER AUTO_INCREMENT PRIMARY KEY,
OrderID INTEGER, ProductID INT,
Quantity INTEGER NOT NULL,
Subtotal DECIMAL(10,2) NOT NULL,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));

-- Insert records into OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Subtotal) VALUES 
(1, 3, 1, 2599), (2, 9, 1, 1599), (2, 28, 1, 178), (2, 45, 1, 199), (2, 42, 1, 69),
(3, 19, 1, 1399), (3, 33, 1, 199), (3, 34, 1, 349), (4, 1, 1, 22599),
(5, 2, 1, 74999), (6, 7, 1, 1399), (6, 25, 1, 5999),
(7, 8, 1, 799), (7, 4, 1, 1499), (8, 24, 1, 8999),
(9, 15, 1, 25999),(10, 12, 1, 19349), (11, 16, 1, 4599),
(12, 1, 1, 22599), (12, 47, 1, 50), (12, 48, 1, 30), (12, 50, 1, 79);

SELECT * FROM OrderDetails;

-- Using JOIN CLAUSE to join four tables (Orders, OrderDetails, Customers, Products)
SELECT O.OrderID, C.FirstName, C.LastName, P.ProductName, Od.Quantity,
Od.Subtotal, O.TotalAmount, O.OrderDate, O.Status FROM Orders AS O
INNER JOIN OrderDetails AS Od ON O.OrderID = Od.OrderID
INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID
INNER JOIN Products AS P ON Od.ProductID = P.ProductID;

-- Create a VIEW to get Order Details with Customer Info
CREATE VIEW OrderSummary AS
(SELECT O.OrderID, C.FirstName, C.LastName, O.TotalAmount, O.Status FROM Orders AS O
INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID);

SELECT * FROM OrderSummary;

-- SUBQUERY to Fetch Customers Who Placed Orders Above 10000
SELECT FirstName, LastName FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders as O WHERE TotalAmount > 10000);

-- STORED PROCEDURE to get highest order amount across all customers
DELIMITER $$
CREATE PROCEDURE HighestAmount()
BEGIN
    SELECT C.FirstName, C.LastName, C.Email, C.Phone, O.TotalAmount AS Max_Amt 
    FROM Orders AS O
    INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID
    ORDER BY O.TotalAmount DESC
    LIMIT 1;
END $$
DELIMITER ;

CALL HighestAmount();

-- STORED PROCEDURE to get second highest order amount across all customers
DELIMITER $$
CREATE PROCEDURE SecondHighestAmount()
BEGIN
    SELECT C.FirstName, C.LastName, C.Email, C.Phone, O.TotalAmount AS Max_Amt 
    FROM Orders AS O
    INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID
    ORDER BY O.TotalAmount DESC
    LIMIT 1
    OFFSET 1;
END $$
DELIMITER ;

CALL SecondHighestAmount();

