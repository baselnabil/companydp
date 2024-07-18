-- DROP TABLE assignments
ALTER TABLE assignments
DROP CONSTRAINT IF EXISTS FK_ProjectID,
DROP CONSTRAINT IF EXISTS FK_EMPLOYEEID;

-- DROP TABLE orders
ALTER TABLE orders
DROP CONSTRAINT IF EXISTS FK_CustomerID;

-- DROP TABLE orderdetails
ALTER TABLE orderdetails
DROP CONSTRAINT IF EXISTS FK_OrderID,
DROP CONSTRAINT IF EXISTS chk_quantity,
DROP CONSTRAINT IF EXISTS chck_unit_price;

-- DROP TABLE projects
ALTER TABLE projects
DROP CONSTRAINT IF EXISTS chck_budget;

-- DROP TABLE products
ALTER TABLE products
DROP CONSTRAINT IF EXISTS chk_price;

-- Drop tables (Order matters if there are dependencies between tables)
DROP TABLE IF EXISTS orderdetails;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
