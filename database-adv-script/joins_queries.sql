-- a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT
    Bookings.booking_id,
    Bookings.property_id,
    Bookings.start_date,
    Bookings.end_date,
    Bookings.total_price,
    Bookings.status,
    Bookings.created_at,
    Users.user_id,
    Users.first_name,
    Users.last_name,
    Users.email
FROM
    Bookings
INNER JOIN
    Users ON Bookings.user_id = Users.user_id;

-- a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT
    Properties.property_id,
    Properties.name,
    Properties.location,
    Properties.pricepernight,
    Reviews.review_id,
    Reviews.user_id,
    Reviews.rating,
    Reviews.comment,
    Reviews.created_at
FROM
    Properties
LEFT JOIN
    Reviews ON Properties.property_id = Reviews.property_id
ORDER BY
    Properties.property_id;

-- a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

SELECT
    Users.user_id,
    Users.first_name,
    Users.last_name,
    Users.email,
    Bookings.booking_id,
    Bookings.property_id,
    Bookings.start_date,
    Bookings.end_date,
    Bookings.total_price,
    Bookings.status,
    Bookings.created_at
FROM
    Users
LEFT JOIN
    Bookings ON Users.user_id = Bookings.user_id

UNION

SELECT
    Users.user_id,
    Users.first_name,
    Users.last_name,
    Users.email,
    Bookings.booking_id,
    Bookings.property_id,
    Bookings.start_date,
    Bookings.end_date,
    Bookings.total_price,
    Bookings.status,
    Bookings.created_at
FROM
    Bookings
LEFT JOIN
    Users ON Users.user_id = Bookings.user_id
WHERE
    Users.user_id IS NULL;