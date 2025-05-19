-- Find the total number of bookings made by each user
SELECT
    Users.user_id,
    Users.first_name,
    Users.last_name,
    COUNT(Bookings.booking_id) AS total_bookings
FROM
    Users
LEFT JOIN
    Bookings ON Users.user_id = Bookings.user_id
GROUP BY
    Users.user_id,
    Users.first_name,
    Users.last_name;

-- Rank properties based on the total number of bookings they have received
SELECT
    property_id,
    name,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS property_rank
FROM (
    SELECT
        Properties.property_id,
        Properties.name,
        COUNT(Bookings.booking_id) AS total_bookings
    FROM
        Properties
    LEFT JOIN
        Bookings ON Properties.property_id = Bookings.property_id
    GROUP BY
        Properties.property_id,
        Properties.name
) AS property_booking_counts;