# Partitioning Performance Report

## Overview

After partitioning the `Bookings` table by year (`start_date`), we tested query performance for fetching bookings within specific date ranges using the `EXPLAIN` statement.

## Observed Improvements

- **Partition Pruning:**  
  When running queries with a date range filter (e.g., `start_date >= '2024-01-01' AND start_date < '2025-01-01'`), MySQL only scans the relevant partition (e.g., `p2024`) instead of the entire table.
- **Reduced Rows Scanned:**  
  The `EXPLAIN` output shows fewer rows scanned, as only the matching partition is accessed, leading to faster query execution.
- **Improved Query Performance:**  
  Queries that filter by `start_date` are significantly faster, especially as the table grows, because unnecessary partitions are skipped.

## Conclusion

Partitioning the `Bookings` table by `start_date` greatly improves the performance of date range queries by limiting scans to relevant partitions. This optimization is especially beneficial for large tables and time-based queries.