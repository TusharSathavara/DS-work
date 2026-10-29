# Session 2: Database Setup + CREATE TABLE

## Task 1: Database Installation

MySQL Community Server is installed on my system. MySQL version 8.0.46 was verified previously.

## Task 2: Database Creation

Created a database named `foodie_app` for a Zomato-style restaurant application.

## Task 3: Restaurants Table

The `restaurants` table contains:

- `id`: Integer primary key that uniquely identifies each restaurant.
- `name`: Restaurant name, up to 100 characters.
- `cuisine`: Cuisine type, up to 50 characters.
- `rating`: Decimal value such as 4.5.
- `location`: Restaurant location, up to 100 characters.

## Task 4: Users Table

The `users` table contains:

- `user_id`: Integer primary key.
- `username`: Username, which cannot be NULL.
- `email`: Email address, which must be unique and cannot be NULL.
- `phone_number`: Phone number stored as text because it may contain leading zeros or a country code. It must be unique when provided.
- `created_at`: Date and time when the record is created. Defaults to the current timestamp.

## Task 5: SQL Syntax Error

An SQL statement can fail if a comma is missing between column definitions.

**Incorrect statement:**

```sql
CREATE TABLE test_table (
    id INT
    name VARCHAR(100)
);
```

The comma after `id INT` is missing.

**Corrected statement:**

```sql
CREATE TABLE test_table (
    id INT,
    name VARCHAR(100)
);
```

Adding the missing comma separates the two column definitions and fixes the syntax error.
