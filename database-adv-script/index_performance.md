
## 3. Query Performance Measurement

### Example Query (before indexing):

```sql
EXPLAIN SELECT * FROM Bookings WHERE user_id = 'some-user-id';
```

**Result:**  
- Without indexes, the query scans the entire `Bookings` table (full table scan).

### After Adding Indexes:

```sql
EXPLAIN SELECT * FROM Bookings WHERE user_id = 'some-user-id';
```

**Result:**  
- With the index, MySQL uses the `idx_bookings_user_id` index, resulting in much faster lookups.

### Example JOIN Query:

```sql
EXPLAIN
SELECT Users.first_name, Properties.name
FROM Users
JOIN Bookings ON Users.user_id = Bookings.user_id
JOIN Properties ON Bookings.property_id = Properties.property_id
WHERE Properties.location = 'New York, NY';
```

**Before indexes:**  
- Full table scans and slower performance.

**After indexes:**  
- Uses indexes on `user_id`, `property_id`, and `location` for efficient lookups and joins.

## 4. Summary

- Adding indexes to high-usage columns significantly improves query performance.
- Use `EXPLAIN` or `ANALYZE` to verify that indexes are being used by the query planner.
- Indexes are especially beneficial for large tables and frequent queries on indexed columns.

---