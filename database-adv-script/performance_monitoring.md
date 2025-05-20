# Database Performance Monitoring Report

## 1. Monitoring Query Performance

We used `EXPLAIN ANALYZE` to monitor the performance of frequently used queries:

### Example Query 1: Fetch bookings by user and date
```sql
EXPLAIN ANALYZE
SELECT *
FROM Bookings
WHERE user_id = 'some-user-id'
  AND start_date >= '2024-01-01';
```
**Observation:**  
- If `type` is `ALL` and `key` is `NULL`, a full table scan is performed.

### Example Query 2: Join Bookings and Payments
```sql
EXPLAIN ANALYZE
SELECT b.booking_id, p.amount
FROM Bookings b
LEFT JOIN Payments p ON b.booking_id = p.booking_id
WHERE b.start_date >= '2024-01-01';
```
**Observation:**  
- If `Payments` shows `ALL` and `key` is `NULL`, join is not using an index.

---

## 2. Identified Bottlenecks

- Full table scans on `Bookings` for queries filtering by `user_id` and `start_date`.
- Joins between `Bookings` and `Payments` not using indexes.

---

## 3. Suggested and Implemented Changes

### a. Add Indexes
```sql
CREATE INDEX idx_bookings_user_id_start_date ON Bookings(user_id, start_date);
CREATE INDEX idx_payments_booking_id ON Payments(booking_id);
```

### b. Partitioning (if not already applied)
Partition `Bookings` by `YEAR(start_date)` to improve date range queries.

---

## 4. Results After Changes

- **EXPLAIN ANALYZE** now shows `ref` or `range` types and the correct indexes in use.
- Number of rows scanned is significantly reduced.
- Query execution time is lower, especially for large tables and date range queries.

---

## 5. Recommendations

- Regularly monitor slow queries using `EXPLAIN ANALYZE` or `SHOW PROFILE`.
- Add or adjust indexes for columns frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses.
- Consider partitioning large tables by date or other logical ranges.
- Periodically review and refine schema and indexes as data volume and query patterns evolve.

---