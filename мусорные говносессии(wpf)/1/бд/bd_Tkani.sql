use [master]
drop database [trade]

create database [Trade]
go
use [Trade]
go
create table [Role] (
		RoleID int primary key identity,
		RoleName nvarchar(100) not null
	)
go
create table [User] (
		UserID int primary key identity,
		UserSurname nvarchar(100) not null,
		UserName nvarchar(100) not null,
		UserPatronymic nvarchar(100) not null,
		UserLogin nvarchar(max) not null,
		UserPassword nvarchar(max) not null,
		UserRole int foreign key references [Role](RoleID) not null
	)
go
create table [Manufacturer] (
		ManufacturerID int primary key identity,
		ManufacturerName nvarchar(max) not null
	)
go
create table [Category] (
		CategoryID int primary key identity,
		CategoryName nvarchar(max) not null
	)
go
create table [PickupPoint] (
		PickupPointID int primary key identity,
		PickupPointName nvarchar(max) not null,
		PickupPointAddress nvarchar(max) not null
	)
go
create table [Discount] (
		DiscountID int primary key identity,
		DiscountAmount tinyint not null
	)
go
create table [Product] (
		ProductID int primary key identity,
		ProductArticleNumber nvarchar(100) unique not null,
		ProductName nvarchar(max) not null,
		ProductDescription nvarchar(max) not null,
		ProductPhoto image not null,
		ManufacturerID int foreign key references [Manufacturer](ManufacturerID) not null,
		CategoryID int foreign key references [Category](CategoryID) not null,
		ProductCost decimal(19, 4) not null,
		DiscountID int foreign key references [Discount](DiscountID) null,
		ProductQuantityInStock int not null,
		ProductStatus nvarchar(max) not null
	)
go
create table [Order] (
		OrderID int primary key identity,
		OrderStatus nvarchar(max) not null,
		OrderDeliveryDate datetime not null,
		PickupPointID int foreign key references [PickupPoint](PickupPointID) not null,
		UserID int foreign key references [User](UserID) null
	)
go
create table [OrderDetail] (
		OrderDetailID int primary key identity,
		OrderID int foreign key references [Order](OrderID) not null,
		ProductID int foreign key references [Product](ProductID) not null,
		ProductQuantity int not null
	)
go
