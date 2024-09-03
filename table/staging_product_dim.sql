DROP TABLE IF EXISTS staging_product_dim CASCADE;


-- Staging table for products
CREATE TABLE staging_product_dim (
    product_id INT,
    product_name VARCHAR(255),
    category VARCHAR(255),
    price DECIMAL,
    effective_date DATE NOT NULL,
    expiration_date DATE,
    is_current BOOLEAN NOT NULL
);

