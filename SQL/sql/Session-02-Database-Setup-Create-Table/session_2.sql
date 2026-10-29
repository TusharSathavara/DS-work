-- Session 2: Database Setup + CREATE TABLE

-- Task 1: Database installation and connection verification
-- MySQL is already installed on my system.

-- Task 2: Create a database for a Zomato-style application
CREATE DATABASE food ie_app;
USE foodie_app;

-- Task 3: Create a restaurants table
CREATE TABLE restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    location VARCHAR(100)
);

-- Task 4: Create a users table for a Flipkart-style application
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Task 5: Example of an incorrect CREATE TABLE statement
-- Intentional error: missing comma after id INT
/*
CREATE TABLE test_table (
    id INT
    name VARCHAR(100)
);
*/

-- Corrected statement
CREATE TABLE test_table (
    id INT,
    name VARCHAR(100)
);
