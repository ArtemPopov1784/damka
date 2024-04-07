use DATABASE SkiResortRental;
GO
CREATE VIEW client_orders AS
SELECT c.id AS client_id, c.first_name, c.last_name, c.patronymic, o.id AS order_id, o.order_date, o.return_date, o.total_price
FROM clients c
JOIN orders o ON c.id = o.client_id;

CREATE VIEW order_details AS
SELECT o.id AS order_id, e.name AS equipment_name, oi.quantity, oi.rental_price
FROM order_items oi
JOIN equipment e ON oi.equipment_id = e.id
JOIN orders o ON oi.order_id = o.id;

CREATE VIEW user_logs AS
SELECT u.id AS user_id, u.first_name, u.last_name, u.patronymic, u.role, l.login_time, l.logout_time
FROM users u
JOIN logs l ON u.id = l.user_id;
