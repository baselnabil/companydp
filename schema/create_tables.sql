--============================================================
-- table projects  
-- description: stores project information
--============================================================
 
CREATE TABLE projects (
    projectID INT PRIMARY KEY ,
    projectName VARCHAR(20),
    startDate DATE,
    endDate DATE,
    budget INT
)

--============================================================
-- table assignments 
-- description: stores task information
--============================================================
 

CREATE TABLE assignments (
    assignmentID INT PRIMARY KEY ,
    EmployeeID INt,
    ProjectID INT,
    role  VARCHAR(20),
    AssignmentDate DATE)


--============================================================
-- table customers
-- description: stores customer information
--============================================================

CREATE TABLE customers (
    customerID INT PRIMARY KEY ,
    customerName VARCHAR(20),
    contanctNumber INT,
    Email VARCHAR(20),
    Address VARCHAR(50))


--============================================================
-- table orders
-- description: stores order information
--============================================================
CREATE TABLE orders (
    orderID INT PRIMARY KEY ,
    customerID INT,
    orderDate DATE,
    TotalAmount INT
)


--============================================================
-- table orderdetails
-- description: stores order details information
--============================================================
CREATE TABLE orderdetails (
    OrderDetailID INT,
    orderID INT,
    productID INT,
    quantity INT,
    UnitPrice INT
)


--============================================================
-- table products
-- description: stores product information
--============================================================
CREATE TABLE products (
    productID INT PRIMARY KEY ,
    productName VARCHAR(20),
    Category VARCHAR(20),
    Price INT,
    StockQuantity INT
)   

