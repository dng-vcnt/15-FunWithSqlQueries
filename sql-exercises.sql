-- 1. Write a query to return all category names with their descriptions from the Categories table.
select [CategoryName], [Description] 
from Categories

-- 2. Write a query to return the contact name, customer id, company name and city name of all Customers in London
select [ContactName], [CustomerID], [CompanyName]
from Customers 
where [City]='London'

-- 3. Write a query to return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number
select * 
from Suppliers 
where [Fax] IS NOT NULL and [ContactTitle] IN ('Market Manager','Sales Representative')

-- 4. Write a query to return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Dec 31, 1997 and with freight under 100 units.
select [CustomerId]
from Orders
where [OrderDate] between '1997-01-01' and '1997-12-31' and [Freight] < 100

-- 5. Write a query to return a list of company names and contact names of all customers from Mexico, Sweden and Germany.
select [CompanyName], [ContactName]
from Customers
where [Country] in ('Mexico', 'Sweden', 'Germany')

-- 6. Write a query to return a count of the number of discontinued products in the Products table.
select COUNT([Discontinued])
from Products

-- 7. Write a query to return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.
select [CategoryName], [Description]
from Categories
where [CategoryName] like 'Co%'

-- 8. Write a query to return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.
select [CompanyName], [City], [Country], [PostalCode]
from Suppliers
where [Address] like '%rue%'
order by [CompanyName]

-- 9. Write a query to return the product id and the quantity ordered for each product labelled as 'Quantity Purchased' in the Order Details table ordered by the Quantity Purchased in descending order.
select [ProductId], [Quantity] 
from [Order Details]
order by [Quantity] desc

-- 10. Write a query to return the company name, address, city, postal code and country of all customers with orders that shipped using Speedy Express, along with the date that the order was made.
select [ShipName], [ShipAddress], [ShipCity], [ShipPostalCode], [ShipCountry], [OrderDate], [ShipVia]
from Orders
left join Shippers 
on Orders.ShipVia = Shippers.ShipperID
where Orders.ShipVia = 1

-- 11. Write a query to return a list of Suppliers containing company name, contact name, contact title and region description.
select [CompanyName],[ContactTitle],[ContactName],[Region]
from Suppliers

-- 12. Write a query to return all product names from the Products table that are condiments.
select [ProductName]
from Products
inner join Categories
on Products.CategoryId = 2

-- 13. Write a query to return a list of customer names who have no orders in the Orders table.
select ContactName
from Customers
left join Orders
on Customers.CustomerID = Orders.CustomerID
where Orders.OrderID is null

-- 14. Write a query to add a shipper named 'Amazon' to the Shippers table using SQL.
SET IDENTITY_INSERT Shippers ON
insert into Shippers(ShipperID, CompanyName, Phone)
values ('4', 'Amazon', '(888)280-4331');

-- 15. Write a query to change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.
Update Shippers
Set CompanyName='Amazon Prime Shipping'
where CompanyName='Amazon'

-- 16. Write a query to return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.
select Round(Sum(Freight), 0)
from Shippers
inner join Orders
on Shippers.ShipperID = Orders.ShipVia
Group by CompanyName

-- 17. Write a query to return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.
select LastName+', '+FirstName As DisplayName
from Employees

-- 18. Write a query to add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.
set IDENTITY_INSERT Orders on
Insert into Customers(CustomerID, CompanyName)
values('99999', 'Vincent')
Insert into Orders(OrderID, CustomerID)
values('00001', '99999')
Insert into [Order Details](OrderID, ProductID)
values('00001', '6')

-- 19. Write a query to remove yourself and your order from the database.
delete from Customers
where CompanyName='Vincent'
delete from Orders
where OrderID = '1'
delete from [Order Details]
where OrderID = '1'

-- 20. Write a query to return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.
select ProductName, UnitsInStock
from Products
where UnitsInStock > 100