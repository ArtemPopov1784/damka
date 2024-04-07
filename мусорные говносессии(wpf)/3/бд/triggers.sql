use DATABASE SkiResortRental;
GO
CREATE TRIGGER update_total_price ON order_items
AFTER INSERT, UPDATE, DELETE AS
BEGIN
    UPDATE orders
    SET total_price = (SELECT SUM(oi.quantity * oi.rental_price)
                       FROM order_items oi
                       WHERE oi.order_id = orders.id)
    FROM orders o
    JOIN inserted i ON o.id = i.order_id
    JOIN deleted d ON o.id = d.order_id;
END;

CREATE TRIGGER log_user_activity ON logs
AFTER INSERT AS
BEGIN
    UPDATE users
    SET last_login = GETDATE()
    FROM users u
    JOIN inserted i ON u.id = i.user_id;
END;
