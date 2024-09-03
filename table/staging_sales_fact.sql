DROP TABLE IF EXISTS staging_sales_fact CASCADE;

-- Staging table for sales
CREATE TABLE staging_sales_fact (
    sale_id INT,
    product_id INT,
    customer_id INT,
    date_id INT,
    quantity INT,
    sale_amount DECIMAL,
    effective_date DATE NOT NULL,
    expiration_date DATE,
    is_current BOOLEAN NOT NULL
);
