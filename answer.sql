-- =========================================================================
-- PLP ACADEMY: WEEK 1 DATABASE ASSIGNMENT
-- Topic Chosen : Online Shop Management System
-- Author       : Noor Hassan (NOORH431)
-- Database     : MySQL
-- Description  : Relational database setup tracking customers, products,
--                and customer transactions with relational logic.
-- =========================================================================

-- 1. DATABASE SETUP & CREATION
-- Ensure the environment is isolated, then cleanly instantiate the workspace
CREATE DATABASE IF NOT EXISTS online_shop_db;
USE online_shop_db;


-- 2. CREATE CUSTOMERS MATRIX TABLE
-- Standardizes profile storage for users logging into and ordering from the shop
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique internal identification key
    first_name VARCHAR(50) NOT NULL,            -- Prevents null entry processing errors
    last_name VARCHAR(50) NOT NULL,             -- Prevents null entry processing errors
    email VARCHAR(100) UNIQUE NOT NULL,         -- Strict unique constraint ensures no profile duplication
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- System timestamp monitoring user enrollment
);


-- 3. CREATE PRODUCTS INVENTORY TABLE
-- Registers inventory stock metrics, pricing strategies, and naming frameworks
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,  -- Core evaluation identification key
    product_name VARCHAR(100) NOT NULL,         -- Identifies stock inventory standard name
    category VARCHAR(50) NOT NULL,              -- Filters structural groups (e.g., Apparel)
    price DECIMAL(10, 2) NOT NULL,              -- Precision currency calculation tracking
    stock_quantity INT DEFAULT 0                -- Tracks baseline warehouse items count
);


-- 4. CREATE ORDERS TRACKER MAPPING TABLE
-- Explicitly binds transaction tracking back to specific registered customer profiles
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,    -- Transaction tracking key
    customer_id INT NOT NULL,                   -- Refers back directly to the parent account profile
    order_date DATE NOT NULL,                   -- Day standard transaction was committed
    total_amount DECIMAL(10, 2) NOT NULL,       -- Sum financial aggregate calculated for checking
    -- Relational integrity constraint binds parent customers mapping safely
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);


-- 5. INSERT SYSTEM EVALUATION SAMPLES
-- Hardcoded entries to evaluate structural operational checks across tables
INSERT INTO customers (first_name, last_name, email) VALUES 
('Noor', 'Hassan', 'noor4413@gmail.com'), 
('Osman', 'Abdullahi', 'osman.manager@example.com'), 
('Idris', 'Ibrahim', 'idris.ibrahim@example.com');

INSERT INTO products (product_name, category, price, stock_quantity) VALUES 
('Wireless Earphones', 'Electronics', 3500.00, 50), 
('Cotton Men Thobe', 'Apparel', 4500.00, 20), 
('Portable Solar Power Bank', 'Electronics', 6500.00, 15);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES 
(1, '2026-09-15', 8000.00), 
(2, '2026-09-16', 6500.00);


-- 6. VERIFICATION LOGGING QUERIES
-- Confirm schema tables pull operational dataset matrices perfectly
SELECT '=== READING ACTIVE CUSTOMERS ===' AS 'Console Status Log';
SELECT * FROM customers;

SELECT '=== READING INSTANTIATED PRODUCTS ===' AS 'Console Status Log';
SELECT * FROM products;

SELECT '=== READING TRACKED ORDERS ===' AS 'Console Status Log';
SELECT * FROM orders;
