# Query Optimization Report

## Objective

Analyze and optimize a query that retrieves all bookings along with user details, property details, and payment details.

---

## 1. Initial Query

The original query selected several columns from multiple tables using several JOINs:

```sql
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
LEFT JOIN Payments ON Bookings.booking_id = Payments.booking_id
WHERE
    Users.user_id = 'some-user-id'
    AND Bookings.start_date >= '2024-01-01';
```

---

## 2. Performance Analysis Using EXPLAIN

```sql
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
```

**Findings:**
- If any table shows `type: ALL` and `key: NULL`, it means a full table scan is being performed.
- If `rows` is high, a large number of rows are being scanned, which can slow down the query.
- The query joins on `user_id`, `property_id`, and `booking_id`. If these columns are not indexed, performance will degrade as data grows.

---

## 3. Optimization Steps

### a. Indexing

To improve join and filter performance, ensure the following indexes exist:

```sql
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_payments_booking_id ON Payments(booking_id);
```

### b. Reducing Unnecessary Columns

Select only the columns needed for your use case to reduce data transfer and processing time.

### c. Filtering with WHERE and AND

Adding a `WHERE` clause with specific filters (such as `Users.user_id` and `Bookings.start_date`) reduces the number of rows processed and returned, improving performance.

### d. Refactored Query

```sql
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
LEFT JOIN Payments ON Bookings.booking_id = Payments.booking_id
WHERE
    Users.user_id = 'some-user-id'
    AND Bookings.start_date >= '2024-01-01';
```

---

## 4. Results

- **Before indexing and filtering:**  
  - Joins may result in full table scans, especially as data grows.
  - Higher query execution time.
  - More data transferred and processed.

- **After indexing and filtering:**  
  - Joins use indexes, reducing the number of rows scanned.
  - Lower query execution time.
  - Less data is transferred due to fewer selected columns and filtered results.

---

## 5. Recommendations

- Always index columns used in JOIN and WHERE clauses for large tables.
- Use `EXPLAIN` to verify that indexes are being used.
- Only select the columns you need.
- Use `WHERE` and `AND` to filter data as early as possible.
- Regularly review and optimize queries as your data grows.

---