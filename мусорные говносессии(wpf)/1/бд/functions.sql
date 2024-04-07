use [Trade]
go
-- Функция для добавления новой роли
CREATE or alter FUNCTION AddRole
(
    @roleName NVARCHAR(100)
)
RETURNS INT
AS
BEGIN
    DECLARE @roleId INT;
    
    INSERT INTO [dbo].[Role] (RoleName)
    VALUES (@roleName)
    
    SET @roleId = SCOPE_IDENTITY()
    
    RETURN @roleId
END
go
-- Функция для добавления нового пользователя
CREATE or alter FUNCTION AddUser
(
    @userSurname NVARCHAR(100),
    @userName NVARCHAR(100),
    @userPatronymic NVARCHAR(100),
    @userLogin NVARCHAR(MAX),
    @userPassword NVARCHAR(MAX),
    @userRole INT
)
RETURNS INT
AS
BEGIN
    DECLARE @userId INT
    
    INSERT INTO [User] (UserSurname, UserName, UserPatronymic, UserLogin, UserPassword, UserRole)
    VALUES (@userSurname, @userName, @userPatronymic, @userLogin, @userPassword, @userRole)
    
    SET @userId = SCOPE_IDENTITY()
    
    RETURN @userId
END
go
-- Функция для добавления нового заказа
CREATE or alter FUNCTION AddOrder
(
    @orderStatus NVARCHAR(MAX),
    @orderDeliveryDate DATETIME,
    @orderPickupPoint NVARCHAR(MAX)
)
RETURNS INT
AS
BEGIN
    DECLARE @orderId INT
    
    INSERT INTO [Order] (OrderStatus, OrderDeliveryDate, OrderPickupPoint)
    VALUES (@orderStatus, @orderDeliveryDate, @orderPickupPoint)
    
    SET @orderId = SCOPE_IDENTITY()
    
    RETURN @orderId
END
go
-- Функция для добавления нового товара
CREATE or alter FUNCTION AddProduct
(
    @productArticleNumber NVARCHAR(100),
    @productName NVARCHAR(MAX),
    @productDescription NVARCHAR(MAX),
    @productCategory NVARCHAR(MAX),
    @productPhoto IMAGE,
    @productManufacturer NVARCHAR(MAX),
    @productCost DECIMAL(19, 4),
    @productDiscountAmount TINYINT,
    @productQuantityInStock INT,
    @productStatus NVARCHAR(MAX)
)
RETURNS NVARCHAR(100)
AS
BEGIN
    INSERT INTO Product (ProductArticleNumber, ProductName, ProductDescription, ProductCategory, ProductPhoto, ProductManufacturer, ProductCost, ProductDiscountAmount, ProductQuantityInStock, ProductStatus)
    VALUES (@productArticleNumber, @productName, @productDescription, @productCategory, @productPhoto, @productManufacturer, @productCost, @productDiscountAmount, @productQuantityInStock, @productStatus)
    
    RETURN @productArticleNumber
END
go-- Функция для добавления связи между заказом и товаром
CREATE or alter FUNCTION AddOrderProduct
(
    @orderId INT,
    @productArticleNumber NVARCHAR(100)
)
RETURNS INT
AS
BEGIN
    INSERT INTO OrderProduct (OrderID, ProductArticleNumber)
    VALUES (@orderId, @productArticleNumber)
    
    RETURN @@ROWCOUNT
END
go