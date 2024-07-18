USE CompanyDB;

##################################
#           Question 1           #
##################################

SELECT UPPER(e.FirstName) AS FirstName, 
       LOWER(e.LastName) AS LastName, 
       e.DepartmentID, 
       d.DepartmentName 
FROM employees e 
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

##################################
#           Question 2           #
##################################

SELECT d.DepartmentID, 
       d.DepartmentName, 
       COUNT(e.DepartmentID) AS Number_Of_Employees, 
       ROUND(SUM(e.salary / 1000)) * 1000 AS Rounded_Salary 
FROM Departments d
INNER JOIN Employees e ON e.DepartmentID = d.DepartmentID 
GROUP BY d.DepartmentID 
ORDER BY Rounded_Salary DESC;

##################################
#           Question 3           #
##################################

SELECT p.ProjectID, 
       p.ProjectName, 
       CONCAT(e.FirstName, ' ', e.LastName) AS Name 
FROM projects p
INNER JOIN assignments a ON p.ProjectID = a.ProjectID
INNER JOIN employees e ON e.EmployeeID = a.EmployeeID;

##################################
#           Question 4           #
##################################

SELECT c.CustomerID, 
       LOWER(c.CustomerName), 
       COUNT(o.CustomerID) AS Total_Orders, 
       SUM(o.TotalAmount) AS Amount_Spent_Total 
FROM customers c
INNER JOIN orders o ON o.CustomerID = c.CustomerID 
GROUP BY c.CustomerID 
ORDER BY Amount_Spent_Total DESC;

##################################
#           Question 5           #
##################################

SELECT p.ProductID, 
       SUBSTRING(p.ProductName, 1, 10) AS ProductName,
       SUBSTRING(p.Category, 1, 2) AS Category, 
       COUNT(o.ProductID) AS Amount_Of_Orders,
       SUM(o.Quantity) AS Total_Sold 
FROM products p
INNER JOIN orderdetails o ON o.ProductID = p.ProductID 
GROUP BY p.ProductID 
ORDER BY Total_Sold DESC;

##################################
#           Question 6           #
##################################

DELIMITER $$

CREATE PROCEDURE AvgSal_PerDe()
BEGIN
  DROP TEMPORARY TABLE IF EXISTS temp1;
  CREATE TEMPORARY TABLE temp1(
    DepartmentID INT,
    AvgSal DECIMAL(10, 2)
  );
  
  INSERT INTO temp1 (DepartmentID, AvgSal)
  SELECT DepartmentID, AVG(Salary) AS AvgSal
  FROM employees
  GROUP BY DepartmentID;
END;
$$

DELIMITER ;

CALL AvgSal_PerDe();

SELECT e.EmployeeID, 
       CONCAT(e.FirstName, ' ', e.LastName) AS Name, 
       d.DepartmentName 
FROM employees e
INNER JOIN departments d ON d.DepartmentID = e.DepartmentID
WHERE e.Salary > (SELECT AvgSal FROM temp1 t WHERE t.DepartmentID = d.DepartmentID);

SELECT *, 
       (SELECT AVG(Salary) FROM employees) AS AVGSal 
FROM employees;

DELIMITER //

CREATE FUNCTION CheckSal(eSalary INT)
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
  DECLARE avgSal DECIMAL(10, 2);
  SELECT AVG(Salary) INTO avgSal FROM employees;
  
  RETURN IF(eSalary > avgSal, 'Higher Than', 'Lower Than');
END;
//

DELIMITER ;

SELECT *, 
       CheckSal(Salary) 
FROM employees;

DELETE FROM departments 
WHERE DepartmentName = 'IT';

SELECT * 
FROM employees 
WHERE DepartmentID IS NULL;
