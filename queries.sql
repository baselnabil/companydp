USE project;
 
--##################################
--#           Question 1           #
--##################################
 
SELECT UPPER(e.FirstName) AS "First Name", LOWER(e.LastName) AS "Last Name",LENGTH(e.position) AS "position title", d.DepartmentName from employees e 
LEFT JOIN Departments d on e.DepartmentID = d.DepartmentID;
 
--##################################
--#           Question 2           #
--##################################
 
SELECT d.DepartmentID, d.DepartmentName, (COUNT(e.DepartmentID)) AS "Number of employees", (ROUND(SUM(e.salary / 1000)) * 1000) AS Rounded_Salary  from Departments d
INNER JOIN Employees e on e.DepartmentID=d.DepartmentID GROUP BY d.DepartmentID ORDER BY Rounded_Salary   DESC;
 
 
--##################################
--#           Question 3           #
--##################################
SELECT p.ProjectID, UPPER(p.ProjectName) AS "Project name", CONCAT(e.FirstName, ' ', e.LastName) AS "Employee name",a.role from projects p
INNER JOIN assignments a on p.ProjectID = a.ProjectID
INNER JOIN employees e on e.EmployeeID = a.EmployeeID;
 
--##################################
--#           Question 4           #
--##################################
 
SELECT c.CustomerID, LOWER(c.CustomerName) AS "Customer name", COUNT(o.CustomerID) As Total_Orders, SUM(o.TotalAmount) AS Amount_Spent_Total from customers c
INNER JOIN orders o on o.CustomerID = c.CustomerID GROUP BY c.CustomerID ORDER BY Amount_Spent_Total DESC

 
---##################################
--#           Question 5           #
--##################################
 
SELECT p.ProductID, SUBSTRING(p.ProductName, 1, 10) AS ProductName,
SUBSTRING(ProductName, 1, 2) AS Category, COUNT(o.ProductID) AS Amount_Of_Orders
from products p
INNER JOIN orderdetails o on o.ProductID = p.ProductID GROUP BY p.ProductID ;
 
 
--##################################
--#           Question 6           #
--##################################
 

DELIMITER $$
CREATE PROCEDURE AvgSal_PerDe()
BEGIN
  SELECT CONCAT(`FirstName`," ",`LastName`) AS "Employee name",
  if (salary>(SELECT avg(salary) from employees as e2 where e2.`DepartmentID` = e.`DepartmentID` GROUP BY e2.`DepartmentID`),salary,null)
  ,departments.`DepartmentName`
  from employees as e
  INNER JOIN departments on e.DepartmentID =  departments.`DepartmentID`;  

  Select Max(salary) from employees;
END;
$$
 
DELIMITER ;
 

CALL AvgSal_PerDe();
-------------------------------------------
SELECT e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS Name, d.DepartmentName FROM employees e
INNER JOIN departments d ON d.DepartmentID = e.DepartmentID
WHERE e.Salary > (SELECT AvgSal from temp1 t WHERE t.DepartmentID = d.DepartmentID); 
 
SELECT *, (SELECT AVG(Salary) from employees) AS AVGSal from employees;

-------------------------------------------- 
DELIMITER //
 
CREATE FUNCTION CheckSal(eSalary INT)
RETURNS VARCHAR(13) DETERMINISTIC
BEGIN
  DECLARE avgSal DECIMAL(10, 2);
  SELECT AVG(Salary) INTO avgSal FROM employees;
  
  RETURN IF(eSalary > avgSal, 'Higher Than', 'Lower than');
END;
//
DELIMITER ;
 
SELECT *, CheckSal(Salary) from employees;
 
DELETE FROM departments WHERE DepartmentName = "IT";
SELECT * from employees WHERE DepartmentID IS NULL;





