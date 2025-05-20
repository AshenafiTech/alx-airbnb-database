-- Query before indexing

EXPLAIN ANALYZE SELECT * FROM Bookings WHERE user_id = 'some-user-id';

-- Users table
CREATE INDEX idx_users_email ON Users(email);

-- Bookings table
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_status ON Bookings(status);

-- Properties table
CREATE INDEX idx_properties_host_id ON Properties(host_id);
CREATE INDEX idx_properties_location ON Properties(location);

-- After adding Indexes

EXPLAIN ANALYZE SELECT * FROM Bookings WHERE user_id = 'some-user-id';