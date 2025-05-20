-- Retrieve all bookings along with user details, property details, and payment details

-- Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on perfomance.sql
SELECT
    Bookings.booking_id,
    Bookings.start_date,
    Bookings.end_date,
    Bookings.total_price,
    Bookings.status AS booking_status,
    Bookings.created_at AS booking_created_at,
    Users.user_id,
    Users.first_name,
    Users.last_name,
    Users.email,
    Properties.property_id,
    Properties.name AS property_name,
    Properties.location,
    Properties.pricepernight,
    Payments.payment_id,
    Payments.amount,
    Payments.status AS payment_status,
    Payments.payment_date
FROM
    Bookings
INNER JOIN Users ON Bookings.user_id = Users.user_id
INNER JOIN Properties ON Bookings.property_id = Properties.property_id
LEFT JOIN Payments ON Bookings.booking_id = Payments.booking_id;

-- Analyze the query’s performance using EXPLAIN and identify any inefficiencies.
EXPLAIN
SELECT
    Bookings.booking_id,
    Bookings.start_date,
    Bookings.end_date,
    Bookings.total_price,
    Bookings.status AS booking_status,
    Bookings.created_at AS booking_created_at,
    Users.user_id,
    Users.first_name,
    Users.last_name,
    Users.email,
    Properties.property_id,
    Properties.name AS property_name,
    Properties.location,
    Properties.pricepernight,
    Payments.payment_id,
    Payments.amount,
    Payments.status AS payment_status,
    Payments.payment_date
FROM
    Bookings
INNER JOIN Users ON Bookings.user_id = Users.user_id
INNER JOIN Properties ON Bookings.property_id = Properties.property_id
LEFT JOIN Payments ON Bookings.booking_id = Payments.booking_id;

-- Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.

-- Refactored query: Only select necessary columns and ensure indexes exist on join/filter columns

-- Make sure these indexes exist for best performance:
-- CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
-- CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
-- CREATE INDEX idx_payments_booking_id ON Payments(booking_id);

SELECT
    Bookings.booking_id,
    Bookings.start_date,
    Bookings.end_date,
    Bookings.total_price,
    Users.first_name,
    Users.last_name,
    Properties.name AS property_name,
    Payments.amount,
    Payments.payment_date
FROM
    Bookings
INNER JOIN Users ON Bookings.user_id = Users.user_id
INNER JOIN Properties ON Bookings.property_id = Properties.property_id
LEFT JOIN Payments ON Bookings.booking_id = Payments.booking_id;