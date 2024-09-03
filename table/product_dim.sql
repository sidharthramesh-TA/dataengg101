DROP TABLE IF EXISTS product_dim CASCADE;

CREATE TABLE product_dim (
    product_dim_id SERIAL PRIMARY KEY, -- Surrogate Key
    product_id INT,
    product_name VARCHAR(255),
    category VARCHAR(255),
    price DECIMAL,
    effective_date DATE NOT NULL,
    expiration_date DATE,
    is_current BOOLEAN NOT NULL,
    UNIQUE(product_id, effective_date) -- Ensures uniqueness for each version of a product
);