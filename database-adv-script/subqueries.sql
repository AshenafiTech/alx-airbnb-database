-- Find all properties where the average rating is greater than 4.0 (non-correlated subquery)
SELECT
    property_id,
    name,
    location,
    pricepernight
FROM
    Properties
WHERE
    property_id IN (
        SELECT
            property_id
        FROM
            Reviews
        GROUP BY
            property_id
        HAVING
            AVG(rating) > 4.0
    );

-- Find users who have made more than 3 bookings (correlated subquery)
SELECT
    user_id,
    first_name,
    last_name,
    email
FROM
    Users u
WHERE
    (
        SELECT COUNT(*)
        FROM Bookings b
        WHERE b.user_id = u.user_id
    ) > 3;