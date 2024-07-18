--============================================================
--table : employees 
-- description : stores all employees 
--============================================================

create table Employees(
EmployeeID int PRIMARY KEY,
FirstName varchar(20) Not NULL check(length(FirstName)>2),
LastName VARCHAR(20) NOT Null check(length(LastName)>2),
DepartmentID int(3),
HireDate date not null,
position VARCHAR(20),
salary DECIMAL(6,2) not null check(salary>1000)
);
--============================================================ 
-- table :departments
-- description : stores all department
--============================================================

create table Departments(
DepartmentID int primary KEY,
DepartmentName VARCHAR(30) NOT NULL,
location VARCHAR(50) UNIQUE
);
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

