-- -------------------------------------------------------------
-- 1. ANALISIS PERFORMA FINANSIAL BULANAN
-- -------------------------------------------------------------
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS net_revenue,
    ROUND(SUM(oi.quantity * oi.cost_price), 2) AS total_cogs,
    ROUND(SUM((oi.quantity * oi.unit_price * (1 - oi.discount)) - (oi.quantity * oi.cost_price)), 2) AS gross_profit,
    ROUND(
        (SUM((oi.quantity * oi.unit_price * (1 - oi.discount)) - (oi.quantity * oi.cost_price)) / 
        SUM(oi.quantity * oi.unit_price * (1 - oi.discount))) * 100, 2
    ) AS profit_margin_pct
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY order_month
ORDER BY order_month ASC;

-- -------------------------------------------------------------
-- 2. ANALISIS KONTRIBUSI SEGMEN PELANGGAN & AOV
-- -------------------------------------------------------------
SELECT 
    c.segment,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS total_revenue,
    ROUND(
        SUM(oi.quantity * oi.unit_price * (1 - oi.discount)) / COUNT(DISTINCT o.order_id), 2
    ) AS average_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY c.segment
ORDER BY total_revenue DESC;

-- -------------------------------------------------------------
-- 3. PERINGKAT PRODUK TERATAS BERDASARKAN REVENUE (WINDOW FUNCTION)
-- -------------------------------------------------------------
WITH product_performance AS (
    SELECT 
        p.category,
        p.product_name,
        SUM(oi.quantity) AS total_units_sold,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS total_revenue,
        DENSE_RANK() OVER (PARTITION BY p.category ORDER BY SUM(oi.quantity * oi.unit_price * (1 - oi.discount)) DESC) as rank_in_category
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.status = 'Completed'
    GROUP BY p.category, p.product_name
)
SELECT * 
FROM product_performance 
WHERE rank_in_category <= 3; -- Mengambil Top 3 Produk per Kategori

-- -------------------------------------------------------------
-- 4. ANALISIS TINGKAT PEMBATALAN & PENGEMBALIAN BARANG
-- -------------------------------------------------------------
SELECT 
    COUNT(order_id) AS total_all_orders,
    SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed_orders,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    SUM(CASE WHEN status = 'Returned' THEN 1 ELSE 0 END) AS returned_orders,
    ROUND((SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(order_id)) * 100, 2) AS cancellation_rate_pct,
    ROUND((SUM(CASE WHEN status = 'Returned' THEN 1 ELSE 0 END) / COUNT(order_id)) * 100, 2) AS return_rate_pct
FROM orders;

-- -------------------------------------------------------------
-- 5. MASTER DATASET UNTUK INTEGRASI DASHBOARD / PYTHON
-- -------------------------------------------------------------
SELECT 
    -- Dimensi Transaksi & Waktu
    o.order_id,
    o.order_date,
    o.status,
    o.payment_method,
    
    -- Dimensi Pelanggan
    c.customer_id,
    c.customer_name,
    c.segment,
    c.city,
    c.region,
    
    -- Dimensi Produk
    p.product_id,
    p.product_name,
    p.category,
    p.sub_category,
    
    -- Metrik Transaksi & Kalkulasi Finansial
    oi.quantity,
    oi.unit_price,
    oi.cost_price,
    oi.discount,
    ROUND(oi.quantity * oi.unit_price * (1 - oi.discount), 2) AS net_revenue,
    ROUND((oi.quantity * oi.unit_price * (1 - oi.discount)) - (oi.quantity * oi.cost_price), 2) AS gross_profit
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id;