-- Create the database
CREATE DATABASE IF NOT EXISTS online_sales;
USE online_sales;

-- Create the orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    product_id INT NOT NULL
);

-- Insert some sample orders
INSERT INTO orders (order_date, amount, product_id) VALUES
('2024-01-05', 100.00, 1),
('2024-01-15', 150.00, 2),
('2024-02-20', 200.00, 1),
('2024-03-10', 250.00, 3),
('2024-03-12', 100.00, 2),
('2024-04-05', 300.00, 3),
('2025-01-10', 175.00, 1),
('2025-02-15', 225.00, 2),
('2025-02-25', 275.00, 3),
('2025-03-01', 125.00, 1);

-- Revenue and Order Volume grouped by Year and Month
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    orders
GROUP BY 
    order_year, order_month
ORDER BY 
    order_year, order_month;
    
    -- Filter results for year 2024 only
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    orders
WHERE
    YEAR(order_date) = 2024
GROUP BY 
    order_year, order_month
ORDER BY 
    order_year, order_month;

