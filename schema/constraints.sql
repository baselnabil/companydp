-- ALTER TABLE assignments
ALTER TABLE assignments
ADD CONSTRAINT FK_ProjectID
FOREIGN KEY (ProjectID) REFERENCES Projects (ProjectID) ON UPDATE CASCADE,
ADD CONSTRAINT FK_EMPLOYEEID
FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID) ON UPDATE CASCADE ,
MODIFY role VARCHAR(20) NOT NULL,
MODIFY AssignmentDate DATE NOT NULL;

-- ALTER TABLE orders
ALTER TABLE orders
ADD CONSTRAINT FK_CustomerID
FOREIGN KEY (customerID) REFERENCES customers (customerID) ON UPDATE CASCADE;

ALTER TABLE orders
MODIFY orderDate DATE NOT NULL,
MODIFY TotalAmount INT NOT NULL;

-- ALTER TABLE orderdetails
ALTER TABLE orderdetails
ADD CONSTRAINT FK_OrderID
FOREIGN KEY (productID) REFERENCES products (productID) ON UPDATE CASCADE,
MODIFY quantity INT NOT NULL,
ADD CONSTRAINT chk_quantity
CHECK (quantity > 0),
ADD CONSTRAINT chck_unit_price
CHECK (UnitPrice > 10),
MODIFY UnitPrice INT NOT NULL;

-- ALTER TABLE projects
ALTER TABLE projects
MODIFY startDate DATE NOT NULL,
MODIFY endDate DATE NOT NULL,
ADD CONSTRAINT chck_budget
CHECK (budget < 1000000);

-- ALTER TABLE customers
ALTER TABLE customers
MODIFY ContactNumber VARCHAR(11) NOT NULL,
MODIFY Email VARCHAR(20) NOT NULL,
MODIFY Address VARCHAR(50) NOT NULL;

-- ALTER TABLE products
ALTER TABLE products
MODIFY Category VARCHAR(20) NOT NULL,
MODIFY Price INT NOT NULL,
ADD CONSTRAINT chk_price
CHECK (Price > 0),
MODIFY StockQuantity INT NOT NULL;
--ALTER TABLE employees
Alter table employees
ADD Constraint fk_department
FOREIGN KEY employees(departmentID) REFERENCES departments(DepartmentID)
on update cascade
Update departments SET `DepartmentID` = 3 where `DepartmentID` =1

--- MAKING A TRIGGER FOR THE DATE 

DELIMITER $$
CREATE TRIGGER CHECK_DATE
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
IF NEW.HireDate > CURDATE() THEN 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Hire Date cannot be in the future';
END IF;
END $$
DELIMITER ;

