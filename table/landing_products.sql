DROP TABLE IF EXISTS landing_products;

-- Landing table for products
CREATE TABLE landing_products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(255),
    price DECIMAL
);

