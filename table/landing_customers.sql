DROP TABLE IF EXISTS landing_customers;

-- Landing table for customers
CREATE TABLE landing_customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);

