# 🌱 AirBnB Database — Sample Seed Data

This script (`seed.sql`) contains **realistic, sample data** to seed your AirBnB-style relational database. It populates all main entities — Users, Properties, Bookings, Payments, Reviews, and Messages — for development, testing, and demonstration purposes.

---

## 🧪 Purpose

The seed data provides a working dataset to:

- Test schema integrity and relationships
- Run SELECT queries on realistic content
- Develop frontend/backend features without requiring live data
- Demonstrate database usage scenarios

---

## ⚙️ What's Included?

### 1. Users
- 4 users (2 hosts, 2 guests)
- Unique emails and roles (`guest`, `host`)
  
### 2. Properties
- 2 listings (urban and rural)
- Linked to hosts via `host_id`

### 3. Bookings
- 2 bookings with accurate dates and statuses
- One booking has payment recorded

### 4. Payments
- 1 payment entry tied to a confirmed booking

### 5. Reviews
- 2 reviews submitted by guests for each property

### 6. Messages
- 2 messages simulating a conversation between a guest and host

---