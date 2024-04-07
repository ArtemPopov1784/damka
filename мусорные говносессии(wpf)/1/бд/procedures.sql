use [Trade]
go

-- Пример создания процедуры для добавления нового товара
CREATE or alter PROCEDURE AddNewProduct
    @ProductName NVARCHAR(MAX),
    @ProductDescription NVARCHAR(MAX),
    @ProductCategory NVARCHAR(MAX),
    @ProductPhoto IMAGE,
    @ProductManufacturer NVARCHAR(MAX),
    @ProductCost DECIMAL(19, 4),
    @ProductQuantityInStock INT,
    @ProductStatus NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Product (ProductName, ProductDescription, ProductCategory, ProductPhoto, ProductManufacturer, ProductCost, ProductQuantityInStock, ProductStatus)
    VALUES (@ProductName, @ProductDescription, @ProductCategory, @ProductPhoto, @ProductManufacturer, @ProductCost, @ProductQuantityInStock, @ProductStatus)
END
go
-- Пример создания процедуры для обновления статуса заказа
CREATE or alter PROCEDURE UpdateOrderStatus
    @orderId INT,
    @newStatus NVARCHAR(MAX)
AS
BEGIN
    UPDATE [Order]
    SET OrderStatus = @newStatus
    WHERE OrderID = @orderId
END
go
-- Пример создания процедуры для расчета общей стоимости заказа
CREATE or alter PROCEDURE CalculateOrderTotal
    @orderId INT
AS
BEGIN
    SELECT SUM(ProductCost) AS TotalCost
    FROM Product
    INNER JOIN OrderProduct ON Product.ProductArticleNumber = OrderProduct.ProductArticleNumber
    WHERE OrderProduct.OrderID = @orderId
END
go