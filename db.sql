CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    role ENUM('Customer', 'Admin') NOT NULL DEFAULT 'Customer'
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    category ENUM('Bike', 'Helmet', 'Electronic', 'Gear','Part') NOT NULL,
    brand VARCHAR(200),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    image_url VARCHAR(500)
)

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipped', 'Delivered') NOT NULL DEFAULT 'Pending',
    total_price DECIMAL(10,2) NOT NULL CHECK (total_price >= 0),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price_at_purchase DECIMAL(10,2) NOT NULL CHECK (price_at_purchase >= 0),
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
)

CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_method ENUM('Credit Card', 'PayPal', 'M-Pesa', 'Bank Transfer') NOT NULL,
    payment_status ENUM('Paid', 'Pending', 'Failed') NOT NULL DEFAULT 'Pending',
    transaction_id VARCHAR(255) UNIQUE,
     FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
) 
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
     FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
)

-- Insert Users
INSERT INTO users (name, email, password_hash, phone, address, role) VALUES
('John Mwangi', 'johnmwangi@example.com', 'hashedpassword1', '+254712345678', 'Nairobi, Kenya', 'Customer'),
('Mary Achieng', 'maryachieng@example.com', 'hashedpassword2', '+254723456789', 'Kisumu, Kenya', 'Customer'),
('Kevin Mutua', 'kevinmutua@example.com', 'hashedpassword3', '+254734567890', 'Mombasa, Kenya', 'Customer'),
('Linda Wanjiru', 'lindawanjiru@example.com', 'hashedpassword4', '+254745678901', 'Nakuru, Kenya', 'Customer'),
('James Otieno', 'jamesotieno@example.com', 'hashedpassword5', '+254756789012', 'Eldoret, Kenya', 'Customer'),
('Grace Njeri', 'gracenjeri@example.com', 'hashedpassword6', '+254767890123', 'Thika, Kenya', 'Admin');

-- Insert Products (Bikes & Accessories)
INSERT INTO products (name, description, price, category, brand, stock_quantity, image_url) VALUES
('Boxer 150', 'YOM: 2023, CC: 150, Top Speed: 120km/h, Gears: 5', 150000.00, 'Bike', 'Bajaj', 10, 'boxer150.jpg'),
('TVS HLX 125', 'YOM: 2022, CC: 125, Top Speed: 110km/h, Gears: 4', 130000.00, 'Bike', 'TVS', 12, 'tvs_hlx_125.jpg'),
('Yamaha R6', 'YOM: 2021, CC: 600, Top Speed: 220km/h, Gears: 6', 1300000.00, 'Bike', 'Yamaha', 5, 'yamaha_r6.jpg'),
('Suzuki GSX-R750', 'YOM: 2022, CC: 750, Top Speed: 250km/h, Gears: 6', 1400000.00, 'Bike', 'Suzuki', 4, 'suzuki_gsx_r750.jpg'),
('Bajaj Pulsar NS200', 'YOM: 2023, CC: 200, Top Speed: 136km/h, Gears: 6', 250000.00, 'Bike', 'Bajaj', 8, 'pulsar_ns200.jpg'),
('Haojue KA150', 'YOM: 2023, CC: 150, Top Speed: 120km/h, Gears: 5', 155000.00, 'Bike', 'Haojue', 9, 'haojue_ka150.jpg'),
('MT Helmet', 'Full-face helmet, black color', 15000.00, 'Helmet', 'MT Helmets', 20, 'mt_helmet.jpg'),
('Riding Gloves', 'Leather protective gloves', 5000.00, 'Gear', 'Alpinestars', 30, 'riding_gloves.jpg'),
('Motorcycle Chain Lube', 'High-performance chain lubricant', 2500.00, 'Part', 'Motul', 40, 'chain_lube.jpg'),
('Disc Lock Alarm', 'Anti-theft security lock with alarm', 3500.00, 'Electronic', 'Xena', 15, 'disc_lock.jpg');

-- Insert Orders
INSERT INTO orders (user_id, order_date, status, total_price) VALUES
(1, NOW(), 'Pending', 150000.00),
(2, NOW(), 'Shipped', 130000.00),
(3, NOW(), 'Delivered', 1400000.00),
(4, NOW(), 'Pending', 250000.00),
(5, NOW(), 'Shipped', 5000.00),
(1, NOW(), 'Delivered', 155000.00);

-- Insert Order Items
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 1, 150000.00),
(2, 2, 1, 130000.00),
(3, 4, 1, 1400000.00),
(4, 5, 1, 250000.00),
(5, 8, 1, 5000.00),
(6, 6, 1, 155000.00),
(2, 7, 1, 15000.00),
(4, 9, 2, 2500.00);

-- Insert Payments
INSERT INTO payments (order_id, payment_method, payment_status, transaction_id) VALUES
(1, 'M-Pesa', 'Paid', 'MPESA12345'),
(2, 'Credit Card', 'Paid', 'CC67890'),
(3, 'Bank Transfer', 'Pending', 'BANK11223'),
(4, 'PayPal', 'Paid', 'PAYPAL33456'),
(5, 'M-Pesa', 'Paid', 'MPESA55667'),
(6, 'Credit Card', 'Failed', 'CC78901');

-- Insert Reviews
INSERT INTO reviews (user_id, product_id, rating, comment, created_at) VALUES
(1, 1, 5, 'Excellent bike, very fuel-efficient!', NOW()),
(2, 2, 4, 'Great for daily commuting, but a bit slow.', NOW()),
(3, 4, 5, 'Superb performance, worth every penny!', NOW()),
(4, 5, 4, 'Good bike, but the seat is a little hard.', NOW()),
(5, 8, 5, 'Gloves are very comfortable and durable.', NOW()),
(1, 6, 4, 'Reliable bike for long distances.', NOW()),
(2, 7, 5, 'Helmet fits well and is lightweight.', NOW());
