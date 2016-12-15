-- Write a query to get Product name and quantity/unit. 
select [ProductName], [QuantityPerUnit] 
from Products

-- Write a query to get current Product list (Product ID and name).
select [ProductName], [ProductID]
from Products
where Discontinued = 'FALSE'
order by [ProductName]

-- Write a query to get discontinued Product list (Product ID and name).
select [ProductName], [ProductID]
from Products
where Discontinued = 'True'
order by [ProductName]

-- Write a query to get most expensive and least expensive Product list (name and unit price).
select [productname], [unitprice]
from products
order by -[unitprice]

-- Write a query to get Product list (id, name, unitprice) where current products cost less than $20
select [productid], [productname], [unitprice]
from products
where [discontinued] = 'False'
and [unitprice] < 20
order by -[unitprice]

-- Write a query to get Product list (id, name, unitprice) where products cose between $15 and $25
select [productid], [productname], [unitprice]
from products
where [unitprice] between 15 and 25
order by -[unitprice]

-- Write a query to get Product list (name, unit price) of above average price
select [productname], [unitprice]
from products
where [unitprice] > (select avg(unitprice) from products)
order by [unitprice]

-- Write a query to get Product list (name, unit price) of 10 most expensive items
select top 10 [productname], [unitprice]
from products
order by -[unitprice]

-- Write a query to count current and discontinued products
select count(productname)
from products
group by [discontinued]

-- Write a query to get Product list (name, units on order, units in stock) of stock less than the quantity on order
select [ProductName], [UnitsOnOrder], [UnitsInStock]
from products
where [UnitsInStock] < [UnitsOnOrder]
and [Discontinued] = 'False';
