/*
Module 8 Challenge: SQL Statements
*/

/*
Instructions:
For this challenge, we'll be retrieving, sorting, and 
filtering data from the Northwind Database. 
We'll also insert records, update, and delete records.


Use the Northwind database for this assignment. Use the
instructions in the comments to write the SQL statements
for this assignment.
 
Run and test your SQL code using the sqlcmd command in the Terminal.
Here's an example: 
sqlcmd -S localhost -U sa -P P@ssw0rd -d Northwind -Q "SELECT * FROM Customers;"
*/


USE Northwind;

/*
1.	
Retrieve a list of products. 
The list should include the product name, unit price, 
and how many units Northwind has in stock.
*/
---Review list first
SELECT * FROM Products

/*
*2.	
List the product name and units in stock for products where UnitsInStock equals zero.
*/
---Run list
Select ProductName, UnitsInStock FROM Products WHERE UnitsInStock = 0;

/*
3.	List the product name and the unit price for each product. 
Sort the list with the smallest unit price on top.
*/
Select ProductName, UnitPrice FROM Products ORDER BY UnitPrice DESC;

/*
4.	List all products with the brand "Sir Rodney's" in the product name. 
*/
--Issues with have the products listed with Rodney's
--It did not show up with Rodney''s, which is the correct way
--I added % to include Rodney
Select * FROM Products WHERE ProductName LIKE 'Sir Rodney%';

/*
5.	Create a list of product names and product IDs for products 
with supplier ID 20. Order by product name. */
--RUN 
Select ProductName, ProductID FROM Products WHERE SupplierID = 20 ORDER BY ProductName;
--TEST RUN to include Supplier ID 20
Select ProductName, ProductID, SupplierID FROM Products WHERE SupplierID = 20 ORDER BY ProductName;


/*
6.	List the product ID and product name for products with 
zero units on order. Order by product ID. 
*/
--RUN 
Select ProductID, ProductName FROM Products WHERE UnitsOnOrder = 0 ORDER BY ProductID;
--TEST RUN 
Select ProductID, ProductName, UnitsOnOrder FROM Products WHERE UnitsOnOrder = 0 ORDER BY ProductID;

/*
7. Your boss has asked you for a list of orders for
       the employee Janet Leverling. 
       The list should contain the order ID, the company name
	   of the customer, and the name of the employee who
	   helped place the order.
       (Hint: Use a JOIN to retrieve data from more than one table.)
*/
--Look at the table
SELECT o.OrderID, c.CompanyName, e.FirstName + ' ' + e.LastName AS EmployeeName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE e.FirstName = 'Janet' AND e.LastName = 'Leverling';
/*


8. Insert a new record into the products table with a product name
    that is your favorite food, a unit price that is $4.55, supplier ID 26, and category ID 5.
*/
INSERT INTO Products (ProductName, UnitPrice, SupplierID, CategoryID)
VALUES ('Biscoff Delta Plane Cookies', 4.55, 26, 5);


/*
9. Display the new record you added to the products table 
where the product name is your favorite food.
*/
SELECT * FROM Products WHERE ProductName = 'Biscoff Delta Plane Cookies';

/*
10. Insert a record into the suppliers table.
    The record should contain the following values:
    - Supplier ID 30
	- Your school's name as the CompanyName
	- Your name as the ContactName
	- Manager as the ContactTitle
	- 123 Sesame Street as the address
    - Saint Paul as the city
*/
INSERT INTO Suppliers (SupplierID, CompanyName, ContactName, ContactTitle, Address, City)
VALUES (30, 'MCTC', 'Marie Geislinger', 'Super Manager', '123 Sesame Street', 'Saint Paul');

---ERROR MESSAGE: Msg 544, Level 16, State 1, Line 1
---Cannot insert explicit value for identity column in table 'Suppliers' when IDENTITY_INSERT is set to OFF.
---TEST RUN
SELECT * FROM Suppliers WHERE SupplierID = 30;
--REMOVED SUPPLIER ID
INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, Address, City)
VALUES ('MCTC', 'Marie Geislinger', 'Super Manager', '123 Sesame Street', 'Saint Paul');
---RERUN TEST RUN
SELECT * FROM Suppliers WHERE SupplierID = 30;

/*
11. Display the new record that you created in the suppliers
    table to ensure it was inserted correctly.
*/
---RERUN TEST RUN
SELECT * FROM Suppliers WHERE SupplierID = 30;


/*
12. Update the record in the products table for your favorite food.
Change the unit price from $4.55 to $9.99.
*/
UPDATE Products SET UnitPrice = 9.99 WHERE ProductName = 'Biscoff Delta Plane Cookies';
---TEST RUN
SELECT * FROM Products WHERE ProductName = 'Biscoff Delta Plane Cookies';

/*
13. Insert a new record into the Categories table. 
Insert the values 'Ice Cream'and 'Frosty desserts' into the 
CategoryName and Description columns. You don't need to insert
a value into the CategoryID column because that it auto-populated.
You don't need to insert a value into the Picture column 
because it is optional.
*/
---REVIEW TABLE
SELECT * FROM Categories;

INSERT INTO Categories (CategoryName, Description)
VALUES ('Ice Cream', 'Frozen ice cream treat'),
        ('Frosty Desserts', 'Icee or frozen drinks');
/*
14. Delete the record you just inserted into the Categories table.
*/
 DELETE FROM Categories WHERE CategoryName = 'Ice Cream';
DELETE FROM Categories WHERE CategoryName = 'Frosty Desserts';

--TEST RUN 
SELECT * FROM Categories WHERE  CategoryName = 'Frosty Desserts';




	
 
