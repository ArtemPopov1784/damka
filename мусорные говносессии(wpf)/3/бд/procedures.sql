use DATABASE SkiResortRental;
GO
CREATE PROCEDURE add_client
(
    @first_name NVARCHAR(50),
    @last_name NVARCHAR(50),
    @patronymic NVARCHAR(50) = NULL,
    @phone_number NVARCHAR(20) = NULL,
    @email NVARCHAR(100) = NULL
)
AS
BEGIN
    INSERT INTO clients (first_name, last_name, patronymic, phone_number, email)
    VALUES (@first_name, @last_name, @patronymic, @phone_number, @email);
END;

CREATE PROCEDURE add_equipment
(
    @name NVARCHAR(50),
    @description NVARCHAR(255) = NULL,
    @quantity INT,
    @rental_price DECIMAL(10, 2)
)
AS
BEGIN
    INSERT INTO equipment (name, description, quantity, rental_price)
    VALUES (@name, @description, @quantity, @rental_price);
END;

CREATE PROCEDURE add_order
(
    @client_id INT,
    @order_date DATETIME,
    @return_date DATETIME = NULL
)
AS
BEGIN
    INSERT INTO orders (client_id, order_date, return_date)
    VALUES (@client_id, @order_date, @return_date);
END;

CREATE PROCEDURE add_order_item
(
    @order_id INT,
    @equipment_id INT,
    @quantity INT,
    @rental_price DECIMAL(10, 2)
)
AS
BEGIN
    INSERT INTO order_items (order_id, equipment_id, quantity, rental_price)
    VALUES (@order_id, @equipment_id, @quantity, @rental_price);
END;

CREATE PROCEDURE add_barcode
(
    @order_item_id INT,
    @barcode_number NVARCHAR(50)
)
AS
BEGIN
    INSERT INTO barcodes (order_item_id, barcode_number)
    VALUES (@order_item_id, @barcode_number);
END;

CREATE PROCEDURE add_user
(
    @first_name NVARCHAR(50),
    @last_name NVARCHAR(50),
    @patronymic NVARCHAR(50) = NULL,
    @login NVARCHAR(50),
    @password NVARCHAR(100),
    @role NVARCHAR(50)
)
AS
BEGIN
    INSERT INTO users (first_name, last_name, patronymic, login, password, role)
    VALUES (@first_name, @last_name, @patronymic, @login, @password, @role);
END;

CREATE PROCEDURE add_log
(
    @user_id INT,
    @login_time DATETIME
)
AS
BEGIN
    INSERT INTO logs (user_id, login_time)
    VALUES (@user_id, @login_time);
END;

CREATE PROCEDURE add_consumable
(
    @name NVARCHAR(50),
    @description NVARCHAR(255) = NULL,
    @quantity INT,
    @price DECIMAL(10, 2)
)
AS
BEGIN
    INSERT INTO consumables (name, description, quantity, price)
    VALUES (@name, @description, @quantity, @price);
END;
