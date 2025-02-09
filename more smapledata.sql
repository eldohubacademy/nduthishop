INSERT INTO users (name, email, password_hash, phone, address, role) VALUES
('Peter Kariuki', 'peterkariuki@example.com', 'hashedpassword7', '+254789012345', 'Nairobi, Kenya', 'Customer'),
('Aisha Mohammed', 'aishamohammed@example.com', 'hashedpassword8', '+254701234567', 'Mombasa, Kenya', 'Customer'),
('David Njoroge', 'davidnjoroge@example.com', 'hashedpassword9', '+254712345678', 'Nakuru, Kenya', 'Customer'),
('Beatrice Wambui', 'beatricewambui@example.com', 'hashedpassword10', '+254723456789', 'Thika, Kenya', 'Customer'),
('Samuel Ouma', 'samuelouma@example.com', 'hashedpassword11', '+254734567890', 'Kisumu, Kenya', 'Customer'),
('Mercy Kimani', 'mercykimani@example.com', 'hashedpassword12', '+254745678901', 'Eldoret, Kenya', 'Admin');


INSERT INTO products (name, description, price, category, brand, stock_quantity, image_url) VALUES
('Honda CB125F', 'YOM: 2023, CC: 125, Top Speed: 110km/h, Gears: 5', 180000.00, 'Bike', 'Honda', 7, 'honda_cb125f.jpg'),
('Kawasaki Ninja 400', 'YOM: 2023, CC: 400, Top Speed: 190km/h, Gears: 6', 750000.00, 'Bike', 'Kawasaki', 3, 'ninja_400.jpg'),
('Zontes 350R', 'YOM: 2023, CC: 350, Top Speed: 180km/h, Gears: 6', 680000.00, 'Bike', 'Zontes', 5, 'zontes_350r.jpg'),
('SMK Full-Face Helmet', 'Aerodynamic design, tinted visor', 18000.00, 'Helmet', 'SMK', 15, 'smk_helmet.jpg'),
('Biker Jacket', 'Leather protection with CE armor', 25000.00, 'Gear', 'Dainese', 10, 'biker_jacket.jpg'),
('Motul 7100 Engine Oil', 'Fully synthetic engine oil for superbikes', 7500.00, 'Part', 'Motul', 25, 'motul_7100.jpg'),
('LED Headlights', 'Ultra-bright LED headlight kit', 8000.00, 'Electronic', 'Bosch', 12, 'led_headlight.jpg'),
('Riding Boots', 'High ankle riding boots for safety', 20000.00, 'Gear', 'Alpinestars', 8, 'riding_boots.jpg'),
('Motorcycle Cover', 'Waterproof cover for bikes', 5000.00, 'Part', 'Generic', 20, 'bike_cover.jpg');

INSERT INTO orders (user_id, order_date, status, total_price) VALUES
(7, NOW(), 'Pending', 180000.00),
(8, NOW(), 'Shipped', 750000.00),
(9, NOW(), 'Delivered', 25000.00),
(10, NOW(), 'Pending', 20000.00),
(11, NOW(), 'Shipped', 7500.00),
(7, NOW(), 'Delivered', 5000.00);


INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(7, 11, 1, 180000.00),
(8, 12, 1, 750000.00),
(9, 14, 1, 25000.00),
(10, 18, 1, 20000.00),
(11, 16, 1, 7500.00),
(12, 19, 1, 5000.00),
(8, 13, 1, 680000.00),
(10, 15, 2, 18000.00);


INSERT INTO payments (order_id, payment_method, payment_status, transaction_id) VALUES
(7, 'M-Pesa', 'Paid', 'MPESA98765'),
(8, 'Credit Card', 'Pending', 'CC54321'),
(9, 'Bank Transfer', 'Paid', 'BANK66789'),
(10, 'PayPal', 'Paid', 'PAYPAL77890'),
(11, 'M-Pesa', 'Pending', 'MPESA22334'),
(12, 'Credit Card', 'Failed', 'CC88990');


INSERT INTO reviews (user_id, product_id, rating, comment, created_at) VALUES
(7, 11, 5, 'Smooth ride, great fuel efficiency!', NOW()),
(8, 12, 4, 'Powerful but slightly expensive.', NOW()),
(9, 14, 5, 'Amazing jacket, perfect for long rides.', NOW()),
(10, 18, 4, 'Boots are very comfortable, but sizing runs small.', NOW()),
(11, 16, 5, 'Best engine oil for high-performance bikes!', NOW()),
(7, 19, 4, 'Good waterproof bike cover, but a bit thin.', NOW()),
(8, 13, 5, 'Perfect for aggressive riders!', NOW());


INSERT INTO orders (user_id, order_date, status, total_price) VALUES
(3, '2024-01-10 10:15:00', 'Delivered', 1400000.00),
(5, '2024-01-12 14:45:00', 'Shipped', 5000.00),
(8, '2024-01-15 09:30:00', 'Pending', 250000.00),
(10, '2024-01-18 11:00:00', 'Delivered', 680000.00),
(11, '2024-01-20 16:20:00', 'Shipped', 18000.00),
(7, '2024-01-22 18:45:00', 'Pending', 20000.00),
(9, '2024-01-25 12:10:00', 'Delivered', 750000.00),
(6, '2024-01-28 08:50:00', 'Pending', 155000.00),
(4, '2024-02-01 13:30:00', 'Shipped', 15000.00),
(2, '2024-02-03 15:25:00', 'Delivered', 25000.00);

INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(13, 4, 1, 1400000.00), -- Suzuki GSX-R750
(14, 8, 2, 5000.00), -- Riding Gloves
(15, 5, 1, 250000.00), -- Bajaj Pulsar NS200
(16, 13, 1, 680000.00), -- Zontes 350R
(17, 7, 1, 18000.00), -- MT Helmet
(18, 18, 1, 20000.00), -- Riding Boots
(19, 12, 1, 750000.00), -- Kawasaki Ninja 400
(20, 6, 1, 155000.00), -- Haojue KA150
(21, 14, 1, 25000.00), -- Biker Jacket
(22, 10, 1, 15000.00), -- Disc Lock Alarm
(13, 15, 2, 18000.00), -- SMK Helmet
(14, 16, 2, 7500.00), -- Motul 7100 Oil
(15, 19, 3, 5000.00), -- Bike Cover
(16, 9, 1, 2500.00); -- Chain Lube


INSERT INTO payments (order_id, payment_method, payment_status, transaction_id) VALUES
(13, 'Bank Transfer', 'Paid', 'BANK120345'),
(14, 'M-Pesa', 'Paid', 'MPESA567089'),
(15, 'Credit Card', 'Pending', 'CC098765'),
(16, 'PayPal', 'Paid', 'PAYPAL430210'),
(17, 'M-Pesa', 'Paid', 'MPESA990887'),
(18, 'Bank Transfer', 'Failed', 'BANK110223'),
(19, 'Credit Card', 'Paid', 'CC670589'),
(20, 'PayPal', 'Pending', 'PAYPAL330456'),
(21, 'M-Pesa', 'Paid', 'MPESA770665'),
(22, 'Bank Transfer', 'Failed', 'BANK660778');

INSERT INTO reviews (user_id, product_id, rating, comment, created_at) VALUES
(3, 4, 5, 'The Suzuki GSX-R750 is a beast! Highly recommended.', '2024-01-15 08:30:00'),
(5, 8, 4, 'Gloves are nice, but wish they had better ventilation.', '2024-01-17 12:15:00'),
(8, 5, 5, 'Bajaj Pulsar NS200 is the best budget sports bike.', '2024-01-20 15:45:00'),
(10, 13, 4, 'Zontes 350R rides smoothly, but fuel consumption is high.', '2024-01-25 10:05:00'),
(11, 7, 5, 'MT Helmet is super comfortable and stylish.', '2024-01-30 17:30:00'),
(7, 18, 4, 'Good riding boots, just a bit tight around the ankle.', '2024-02-02 11:50:00'),
(9, 12, 5, 'Kawasaki Ninja 400 is worth every penny!', '2024-02-05 14:20:00'),
(6, 6, 3, 'Haojue KA150 is okay, but lacks power on highways.', '2024-02-07 09:00:00'),
(4, 14, 5, 'Dainese Biker Jacket is high quality and fits well.', '2024-02-10 16:10:00'),
(2, 10, 4, 'Disc Lock Alarm is a great security addition.', '2024-02-12 18:40:00');
