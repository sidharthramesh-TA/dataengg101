DROP TABLE IF EXISTS customer_dim CASCADE;

CREATE TABLE customer_dim (
    customer_dim_id SERIAL PRIMARY KEY, -- Surrogate Key
    customer_id INT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    effective_date DATE NOT NULL,
    expiration_date DATE,
    is_current BOOLEAN NOT NULL,
    UNIQUE(customer_id, effective_date) -- Ensures uniqueness for each version of a customer
);