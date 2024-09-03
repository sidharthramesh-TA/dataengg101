DROP TABLE IF EXISTS staging_customer_dim CASCADE;

-- Staging table for customers
CREATE TABLE staging_customer_dim (
    customer_id INT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    effective_date DATE NOT NULL,
    expiration_date DATE,
    is_current BOOLEAN NOT NULL
);





