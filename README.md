# 📦 Online Sales Analytics with MySQL

This project demonstrates how to build and analyze an **orders** dataset using **MySQL Workbench**. It includes database creation, sample data population, and analytical queries for monthly revenue and sales volume.

---

## 🗂️ Dataset: `online_sales`

### Table: `orders`
| Column Name | Type         | Description               |
|-------------|--------------|---------------------------|
| order_id    | INT (PK)     | Unique identifier         |
| order_date  | DATE         | Date of the order         |
| amount      | DECIMAL(10,2)| Order amount              |
| product_id  | INT          | ID of the product ordered |

---

## 🛠️ Setup Instructions

### 1. Create Database and Table

```sql
CREATE DATABASE IF NOT EXISTS online_sales;
USE online_sales;

CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    product_id INT NOT NULL
);
```

### 2. Insert Sample Data

```sql
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
```

---

## 📊 Query: Monthly Revenue and Volume

### Full Report (Grouped by Year/Month)

```sql
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
```

---

### Filtered Report: Orders from 2024

```sql
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
```

---

## 📈 Features Used

- `EXTRACT(MONTH FROM order_date)` – Extracts the month from date.
- `GROUP BY` – Aggregates results by year and month.
- `SUM(amount)` – Calculates total revenue.
- `COUNT(DISTINCT order_id)` – Counts unique orders (volume).
- `ORDER BY` – Sorts the result chronologically.
- `LIMIT`, `WHERE` – Filters for specific periods (e.g., 2024 only).

---

## ✅ Output Example

| order_year | order_month | total_revenue | order_volume |
|------------|-------------|----------------|----------------|
| 2024       | 1           | 250.00         | 2              |
| 2024       | 2           | 200.00         | 1              |
| 2024       | 3           | 350.00         | 2              |
| 2024       | 4           | 300.00         | 1              |
| 2025       | 1           | 175.00         | 1              |

---

## 📌 Notes

- You can extend the dataset by adding more fields like `customer_id`, `region`, or `discount`.
- For advanced reporting, consider exporting the results to a BI tool like Tableau or Power BI.

---

## 📧 Contact

For any queries or suggestions, feel free to connect.
