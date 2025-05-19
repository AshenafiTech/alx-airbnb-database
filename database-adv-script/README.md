# Advanced SQL Join Queries

This file (`joins_queries.sql`) contains advanced SQL queries demonstrating different types of JOIN operations on the Airbnb database schema.

## Contents

- **INNER JOIN:**  
  Retrieves all bookings and the respective users who made those bookings.

- **LEFT JOIN:**  
  Retrieves all properties and their reviews, including properties that have no reviews.

- **FULL OUTER JOIN (simulated):**  
  Retrieves all users and all bookings, even if the user has no booking or a booking is not linked to a user.  
  _Note: MySQL does not support FULL OUTER JOIN directly, so this is implemented using a UNION of LEFT JOINs._

## Usage

1. Ensure your database is set up and populated with the schema and seed data.
2. Run the queries in this file using your preferred MySQL client or command line:
   ```
   mysql -u <username> -p <database_name> < joins_queries.sql
   ```

## Query Descriptions

- **INNER JOIN Example:**
  ```sql
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
  ```

- **LEFT JOIN Example:**
  ```sql
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
  ```

- **FULL OUTER JOIN Simulation:**
  ```sql
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
  ```

## Notes

- These queries assume the database schema and data are already loaded.
- Adjust table or column names if your schema differs.
- The FULL OUTER JOIN is simulated for MySQL compatibility.

---