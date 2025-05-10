# 🏠 AirBnB Database Schema - DDL Scripts

This project defines the relational database schema for an AirBnB-style application using SQL `CREATE TABLE` statements. The schema is designed following normalization principles up to **Third Normal Form (3NF)** to ensure data integrity, reduce redundancy, and support scalability.

---

## 📦 Entities & Tables

### 1. Users
Stores information about all users (guests, hosts, admins).

- `user_id`: Primary Key
- `email`: Unique
- `role`: ENUM (`guest`, `host`, `admin`)

### 2. Properties
Houses listed by hosts for booking.

- `property_id`: Primary Key
- `host_id`: Foreign Key → `Users(user_id)`

### 3. Bookings
Reservation records for guests on specific properties.

- `booking_id`: Primary Key
- `property_id`: Foreign Key → `Properties(property_id)`
- `user_id`: Foreign Key → `Users(user_id)`
- `status`: ENUM (`pending`, `confirmed`, `canceled`)

### 4. Payments
Stores payment details associated with bookings.

- `payment_id`: Primary Key
- `booking_id`: Foreign Key → `Bookings(booking_id)`
- `payment_method`: ENUM (`credit_card`, `paypal`, `stripe`)

### 5. Reviews
User reviews for properties.

- `review_id`: Primary Key
- `rating`: Integer (1–5, inclusive)
- Foreign Keys: `property_id`, `user_id`

### 6. Messages
Private messages between users.

- `message_id`: Primary Key
- `sender_id`, `recipient_id`: Foreign Keys → `Users(user_id)`

---

## ⚙️ Features & Constraints

- **Primary Keys**: UUIDs for global uniqueness.
- **Foreign Keys**: Ensure referential integrity.
- **ENUM Types**: Used for roles, booking status, and payment methods.
- **CHECK Constraint**: Ensures ratings are between 1 and 5.
- **Timestamps**: Automatically track creation and updates.

---

## 📈 Indexing

Indexes are created on frequently queried columns for better performance:

- `Users.email`
- `Properties.host_id`
- `Bookings.property_id`, `Bookings.user_id`
- `Payments.booking_id`
- `Reviews.property_id`, `Reviews.user_id`
- `Messages.sender_id`, `Messages.recipient_id`

---

