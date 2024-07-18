--============================================================
-- Section: Insert Data
--============================================================

-- Insert data into Projects
INSERT INTO Projects VALUES 
(1, 'Project A', '2023-01-01', '2023-12-31', 500000),
(2, 'Project B', '2023-02-01', '2023-11-30', 300000);

-- Insert data into Assignments
INSERT INTO Assignments VALUES 
(1, 1, 1, 'Lead', '2023-01-01'),
(2, 2, 2, 'Developer', '2023-03-01');

-- Insert data into Customers
INSERT INTO Customers VALUES 
(1, 'Alice', '1234567890', 'alice@example.com', '123 Main St'),
(2, 'Bob', '0987654321', 'bob@example.com', '456 Elm St');

-- Insert data into Orders
INSERT INTO Orders VALUES 
(1, 1, '2023-05-15', 250.75),
(2, 2, '2023-06-20', 150.50);

-- Insert data into Products
INSERT INTO Products VALUES 
(1, 'Product X', 'Category 1', 19.99, 100),
(2, 'Product Y', 'Category 2', 29.99, 200);

-- Insert data into OrderDetails
INSERT INTO OrderDetails VALUES 
(1, 1, 1, 2, 19.99),
(2, 2, 2, 1, 29.99);
