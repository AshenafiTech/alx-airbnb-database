# AirBnB Database: 3NF Normalization Report

## ✅ Normalization Review

### 1NF: First Normal Form
- **Rule**: All attributes must be atomic (no repeating groups or arrays).
- **Status**: ✅ Satisfied  
  All fields are atomic (e.g., `first_name`, `email`, `role`, etc.).

---

### 2NF: Second Normal Form
- **Rule**: Must be in 1NF, and all non-key attributes must be fully functionally dependent on the primary key.
- **Status**: ✅ Satisfied  
  All tables use single-column primary keys (UUIDs), and non-key attributes depend entirely on those keys.

---

### 3NF: Third Normal Form
- **Rule**: Must be in 2NF, and non-key attributes must not depend on other non-key attributes (no transitive dependencies).

---

### 🔹 User Table
**Attributes**:  
`user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`  
✅ All attributes depend only on `user_id`. No transitive dependencies.

---

### 🔹 Property Table
**Attributes**:  
`property_id`, `host_id`, `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`  
✅ All attributes are directly dependent on `property_id`.  
`host_id` is a foreign key, not a transitive dependency.

---

### 🔹 Booking Table
**Attributes**:  
`booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`  
✅ All attributes directly depend on `booking_id`.  
`total_price` is not derived, assuming dynamic pricing/fees.

---

### 🔹 Payment Table
**Attributes**:  
`payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`  
✅ All attributes are fully dependent on `payment_id`. No transitive dependencies.

---

### 🔹 Review Table
**Attributes**:  
`review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`  
✅ All fields depend directly on `review_id`. Fully normalized.

---

### 🔹 Message Table
**Attributes**:  
`message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`  
✅ Each field directly depends on `message_id`. No transitive dependencies.

---

## ✅ Conclusion

All tables in the AirBnB database design:
- Meet **1NF**: Attributes are atomic.
- Meet **2NF**: No partial dependencies on primary keys.
- Meet **3NF**: No transitive dependencies.

**🔒 The schema is fully normalized to Third Normal Form (3NF).**
