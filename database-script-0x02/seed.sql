-- 🧑 USERS
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('a1f7a200-0001-4000-8000-000000000001', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pwd_1', '1234567890', 'host'),
('a1f7a200-0002-4000-8000-000000000002', 'Bob', 'Smith', 'bob@example.com', 'hashed_pwd_2', '0987654321', 'guest'),
('a1f7a200-0003-4000-8000-000000000003', 'Carol', 'Williams', 'carol@example.com', 'hashed_pwd_3', '5551234567', 'host'),
('a1f7a200-0004-4000-8000-000000000004', 'Dan', 'Brown', 'dan@example.com', 'hashed_pwd_4', NULL, 'guest');


-- 🏠 PROPERTIES
INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight)
VALUES 
('b2f7b300-1001-4000-9000-000000000001', 'a1f7a200-0001-4000-8000-000000000001', 'Cozy Cottage', 'A charming cottage in the woods.', 'Portland, OR', 120.00),
('b2f7b300-1002-4000-9000-000000000002', 'a1f7a200-0003-4000-8000-000000000003', 'Urban Loft', 'Modern loft in downtown.', 'New York, NY', 250.00);


-- 📅 BOOKINGS
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
('c3f7c400-2001-4000-a000-000000000001', 'b2f7b300-1001-4000-9000-000000000001', 'a1f7a200-0002-4000-8000-000000000002', '2025-06-01', '2025-06-05', 480.00, 'confirmed'),
('c3f7c400-2002-4000-a000-000000000002', 'b2f7b300-1002-4000-9000-000000000002', 'a1f7a200-0004-4000-8000-000000000004', '2025-07-10', '2025-07-12', 500.00, 'pending');


-- 💳 PAYMENTS
INSERT INTO Payments (payment_id, booking_id, amount, payment_method)
VALUES 
('d4f7d500-3001-4000-b000-000000000001', 'c3f7c400-2001-4000-a000-000000000001', 480.00, 'credit_card');


-- 🌟 REVIEWS
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment)
VALUES 
('e5f7e600-4001-4000-c000-000000000001', 'b2f7b300-1001-4000-9000-000000000001', 'a1f7a200-0002-4000-8000-000000000002', 5, 'Amazing stay! Clean and peaceful.'),
('e5f7e600-4002-4000-c000-000000000002', 'b2f7b300-1002-4000-9000-000000000002', 'a1f7a200-0004-4000-8000-000000000004', 4, 'Great location, just a bit noisy.');


-- 💬 MESSAGES
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body)
VALUES 
('f6f7f700-5001-4000-d000-000000000001', 'a1f7a200-0002-4000-8000-000000000002', 'a1f7a200-0001-4000-8000-000000000001', 'Hi Alice, is the cottage available in June?'),
('f6f7f700-5002-4000-d000-000000000002', 'a1f7a200-0001-4000-8000-000000000001', 'a1f7a200-0002-4000-8000-000000000002', 'Yes, it is available from June 1 to June 5.');


