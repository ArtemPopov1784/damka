use Trade
go
-- Пример создания представления для получения информации о клиентах и их заказах
CREATE or alter VIEW CustomerOrdersView AS
SELECT Customers.CustomerId, Customers.CustomerName, Orders.OrderId, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerId = Orders.CustomerId
go
-- Пример создания представления для получения информации о товарах и их категориях
CREATE or alter VIEW ProductCategoryView AS
SELECT Products.ProductId, Products.ProductName, Categories.CategoryId, Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryId = Categories.CategoryId
go