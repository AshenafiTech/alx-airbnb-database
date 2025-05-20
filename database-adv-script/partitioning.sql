-- Partition the Bookings table by RANGE on the start_date column

ALTER TABLE Bookings
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Test performance of queries on the partitioned Bookings table

-- Example: Fetch bookings in 2024 (should only scan the p2024 partition)
EXPLAIN
SELECT *
FROM Bookings
WHERE start_date >= '2024-01-01' AND start_date < '2025-01-01';

-- Example: Fetch bookings in 2023 (should only scan the p2023 partition)
EXPLAIN
SELECT *
FROM Bookings
WHERE start_date >= '2023-01-01' AND start_date < '2024-01-01';

-- Example: Fetch bookings in 2022 (should only scan the p2022 partition)
EXPLAIN
SELECT *
FROM Bookings
WHERE start_date >= '2022-01-01' AND start_date < '2023-01-01';