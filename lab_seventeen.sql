--Alex Letinski
--Lab 17

--Query 1
SELECT        dbo.Customers.*
FROM            dbo.Customers

--Query 2
SELECT DISTINCT Country
FROM            dbo.Customers

--Query 3
SELECT        CustomerID
FROM            dbo.Customers
WHERE        (CustomerID LIKE N'Bl%')

--Query 4
SELECT        TOP (100) OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, 
                         ShipPostalCode, ShipCountry
FROM            dbo.Orders

--Query 5
SELECT        CustomerID, PostalCode
FROM            dbo.Customers
WHERE        (PostalCode = N'1010') OR
                         (PostalCode = N'3012') OR
                         (PostalCode = N'12209') OR
                         (PostalCode = N'05023')

--Query 6
SELECT        ShipRegion
FROM            dbo.Orders
WHERE        (ShipRegion IS NOT NULL)

--Query 7
SELECT        TOP (100) PERCENT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
FROM            dbo.Customers
ORDER BY Country, City

--Query 8
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES ('.NET', 'Grand Circus', 'Alex', 'Student', '111 Main St', 'Detroit', null, '00000', 'USA', '555-555-5555', null);

--Query 9
UPDATE Orders
SET ShipRegion = 'EuroZone'
WHERE ShipCountry = 'France';

--Query 10
DELETE FROM [Order Details]
WHERE Quantity = 1;

--Query 11
SELECT        AVG(Quantity) AS Average, MAX(Quantity) AS Max, MIN(Quantity) AS Min
FROM            dbo.[Order Details]

--Query 12
SELECT        AVG(Quantity) AS Average, MAX(Quantity) AS Max, MIN(Quantity) AS Min
FROM            dbo.[Order Details]
GROUP BY OrderID

--Query 13
SELECT        CustomerID
FROM            dbo.Orders
WHERE        (OrderID = 10290)

--Query 14
--INNER
SELECT        dbo.Orders.OrderID, dbo.Customers.CustomerID, dbo.Customers.ContactName
FROM            dbo.Orders INNER JOIN
                         dbo.Customers ON dbo.Orders.CustomerID = dbo.Customers.CustomerID

--LEFT
SELECT        dbo.Orders.OrderID, dbo.Customers.CustomerID, dbo.Customers.ContactName
FROM            dbo.Orders LEFT OUTER JOIN
                         dbo.Customers ON dbo.Orders.CustomerID = dbo.Customers.CustomerID

--RIGHT
SELECT        dbo.Orders.OrderID, dbo.Customers.CustomerID, dbo.Customers.ContactName
FROM            dbo.Orders RIGHT OUTER JOIN
                         dbo.Customers ON dbo.Orders.CustomerID = dbo.Customers.CustomerID

--Query 15
SELECT        FirstName
FROM            dbo.Employees
WHERE        (ReportsTo IS NULL)

--Query 16
SELECT DISTINCT dbo.Employees.FirstName, dbo.Employees.ReportsTo
FROM            dbo.Employees INNER JOIN
                         dbo.EmployeeTerritories ON dbo.Employees.EmployeeID = dbo.EmployeeTerritories.EmployeeID
WHERE        (dbo.Employees.ReportsTo = 2)
