-- 1. Sample data table customers
INSERT INTO customers (customer_id, customer_name, segment, city, region) VALUES
('CUST-001', 'Ahmad Pratama', 'Consumer', 'Jakarta Selatan', 'DKI Jakarta'),
('CUST-002', 'Budi Santoso', 'Corporate', 'Surabaya', 'Jawa Timur'),
('CUST-003', 'Citra Dewi', 'Home Office', 'Bandung', 'Jawa Barat'),
('CUST-004', 'Deni Wijaya', 'Consumer', 'Semarang', 'Jawa Tengah'),
('CUST-005', 'Eka Rahmawati', 'Corporate', 'Yogyakarta', 'DI Yogyakarta'),
('CUST-006', 'Fajar Utama', 'Consumer', 'Medan', 'Sumatera Utara'),
('CUST-007', 'Gita Lestari', 'Home Office', 'Makassar', 'Sulawesi Selatan'),
('CUST-008', 'Hadi Sucipto', 'Corporate', 'Denpasar', 'Bali'),
('CUST-009', 'Indah Permata', 'Consumer', 'Palembang', 'Sumatera Selatan'),
('CUST-010', 'Joko Susilo', 'Home Office', 'Malang', 'Jawa Timur');

-- 2. Sample data table products
INSERT INTO products (product_id, product_name, category, sub_category) VALUES
('PROD-001', 'Laptop Pro 14 Inch', 'Electronics', 'Computers'),
('PROD-002', 'Wireless Mechanical Keyboard', 'Electronics', 'Accessories'),
('PROD-003', 'Ergonomic Office Chair', 'Furniture', 'Chairs'),
('PROD-004', 'Standing Desk Adjustable', 'Furniture', 'Tables'),
('PROD-005', 'Kemeja Katun Formal', 'Apparel', 'Clothing'),
('PROD-006', 'Sepatu Sneakers Casual', 'Apparel', 'Footwear'),
('PROD-007', 'Monitor 27 Inch 4K', 'Electronics', 'Monitors'),
('PROD-008', 'Mouse Wireless Silent', 'Electronics', 'Accessories'),
('PROD-009', 'Rak Buku Minimalis', 'Furniture', 'Storage'),
('PROD-010', 'Jaket Parka Waterproof', 'Apparel', 'Clothing');

-- 3. Sample data table orders
INSERT INTO orders (order_id, customer_id, order_date, status, payment_method) VALUES
('ORD-2025-001', 'CUST-001', '2025-01-10', 'Completed', 'Credit Card'),
('ORD-2025-002', 'CUST-002', '2025-01-12', 'Completed', 'Bank Transfer'),
('ORD-2025-003', 'CUST-003', '2025-01-15', 'Cancelled', 'E-Wallet'),
('ORD-2025-004', 'CUST-004', '2025-02-01', 'Completed', 'Credit Card'),
('ORD-2025-005', 'CUST-005', '2025-02-05', 'Completed', 'Bank Transfer'),
('ORD-2025-006', 'CUST-006', '2025-02-14', 'Returned', 'E-Wallet'),
('ORD-2025-007', 'CUST-007', '2025-03-02', 'Completed', 'Credit Card'),
('ORD-2025-008', 'CUST-008', '2025-03-10', 'Completed', 'Bank Transfer'),
('ORD-2025-009', 'CUST-009', '2025-03-20', 'Completed', 'E-Wallet'),
('ORD-2025-010', 'CUST-010', '2025-04-01', 'Completed', 'Bank Transfer'),
('ORD-2025-011', 'CUST-001', '2025-04-11', 'Completed', 'Credit Card'),
('ORD-2025-012', 'CUST-003', '2025-04-18', 'Completed', 'E-Wallet');

-- 4. Sample data table order_items
INSERT INTO order_items (item_id, order_id, product_id, quantity, unit_price, cost_price, discount) VALUES
('ITEM-001', 'ORD-2025-001', 'PROD-001', 1, 15000000.00, 12000000.00, 0.05),
('ITEM-002', 'ORD-2025-001', 'PROD-008', 2, 350000.00, 200000.00, 0.00),
('ITEM-003', 'ORD-2025-002', 'PROD-003', 4, 2500000.00, 1800000.00, 0.10),
('ITEM-004', 'ORD-2025-003', 'PROD-005', 2, 300000.00, 150000.00, 0.00),
('ITEM-005', 'ORD-2025-004', 'PROD-007', 1, 4500000.00, 3500000.00, 0.00),
('ITEM-006', 'ORD-2025-005', 'PROD-004', 2, 3800000.00, 2800000.00, 0.15),
('ITEM-007', 'ORD-2025-006', 'PROD-006', 1, 750000.00, 450000.00, 0.00),
('ITEM-008', 'ORD-2025-007', 'PROD-002', 3, 850000.00, 550000.00, 0.05),
('ITEM-009', 'ORD-2025-008', 'PROD-001', 2, 15000000.00, 12000000.00, 0.10),
('ITEM-010', 'ORD-2025-008', 'PROD-007', 2, 4500000.00, 3500000.00, 0.05),
('ITEM-011', 'ORD-2025-009', 'PROD-010', 1, 500000.00, 300000.00, 0.00),
('ITEM-012', 'ORD-2025-010', 'PROD-009', 1, 1200000.00, 800000.00, 0.00),
('ITEM-013', 'ORD-2025-011', 'PROD-002', 1, 850000.00, 550000.00, 0.00),
('ITEM-014', 'ORD-2025-012', 'PROD-003', 1, 2500000.00, 1800000.00, 0.05),
('ITEM-015', 'ORD-2025-012', 'PROD-005', 3, 300000.00, 150000.00, 0.10);
