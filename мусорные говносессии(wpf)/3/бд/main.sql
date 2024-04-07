CREATE DATABASE SkiResortRental;
GO

USE SkiResortRental;
GO

CREATE TABLE clients (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    patronymic NVARCHAR(50),
    phone_number NVARCHAR(20),
    email NVARCHAR(100)
);

CREATE TABLE equipment (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    description NVARCHAR(255),
    quantity INT NOT NULL,
    rental_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE orders (
    id INT IDENTITY(1,1) PRIMARY KEY,
    client_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    return_date DATETIME,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE order_items (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    equipment_id INT NOT NULL,
    quantity INT NOT NULL,
    rental_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(id)
);

CREATE TABLE barcodes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_item_id INT NOT NULL,
    barcode_number NVARCHAR(50) NOT NULL,
    FOREIGN KEY (order_item_id) REFERENCES order_items(id)
);

CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    patronymic NVARCHAR(50),
    login NVARCHAR(50) NOT NULL,
    password NVARCHAR(100) NOT NULL,
    role NVARCHAR(50) NOT NULL
);

CREATE TABLE logs (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    login_time DATETIME NOT NULL,
    logout_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE consumables (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    description NVARCHAR(255),
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
