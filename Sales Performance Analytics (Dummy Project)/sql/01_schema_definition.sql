CREATE DATABASE db_sales_analytics;

USE db_sales_analytics;

-- 1. Tabel Customers
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    segment VARCHAR(50),
    city VARCHAR(100),
    region VARCHAR(50)
);

-- 2. Tabel Products
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    unit_price DECIMAL(12, 2),
    cost_price DECIMAL(12, 2)
);

-- 3. Tabel Orders
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id VARCHAR(50) NOT NULL,
    ship_mode VARCHAR(50),
    status VARCHAR(50) NOT NULL,
    payment_method VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Tabel Order Items
CREATE TABLE order_items (
    item_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(12, 2),
    cost_price DECIMAL(12, 2),
    discount DECIMAL(4, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);