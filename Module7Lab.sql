USE Northwind;

SELECT * FROM Shippers;
Select * FROM Orders;

SELECT TOP 5 ContactName, Country, Phone FROM Customers 
ORDER BY Country, ContactName;

SELECT TOP 5 ContactName, Country, Phone FROM Customers 
Where Country='Argentina';

SELECT CustomerID, OrderDate, ShipCity FROM Orders
Where CustomerID='ALFKI';

--Test Run--
SELECT CustomerID, OrderDate, ShipCity FROM Orders
Where ShipCountry='France';

--JOIN, Alias, Primary Key = Foreign Key, with Filter
SELECT TOP 5 c.CompanyName, o.OrderDate FROM Customers AS c 
JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE c.CompanyName='QUICK-Stop';

--TEST
SELECT TOP 5 c.CompanyName, o.ShipCountry FROM Customers AS c 
JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE o.ShipCountry='France';

--ADD New Record
INSERT INTO Customers (CustomerID, ContactName, CompanyName, Country) 
    VALUES ('ALICE', 'Alice Johnson', 'Wonderful Widgets','USA');

SELECT ContactName From Customers WHere CustomerID='ALICE';

--Modify Statement *MUST HAVE WHERE CLAUSE*
UPDATE Customers SET ContactName = 'Maria Anders'
WHERE CustomerID = 'ALFKI';

SELECT ContactName From Customers WHere CustomerID='ALFKI';

--DELETE *THis is the scary one. MUST ALSO USE WHERE CLAUSE
DELETE From Orders WHERE OrderID = 10248;
--ERROR because Order ID is also listed in another table
--Cannot delete record if it is another records
--Must delete record from the FK record first, then from primary table
--THis is a constraint relationship.



