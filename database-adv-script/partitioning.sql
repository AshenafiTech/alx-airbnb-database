-- Partition the Bookings table by RANGE on the start_date column
-- Create the Bookings table partitioned by year of start_date

CREATE TABLE Bookings (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL
    -- Add other columns as needed, but do NOT add foreign keys if you want partitioning
)
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