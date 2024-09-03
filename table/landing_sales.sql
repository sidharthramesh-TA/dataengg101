DROP TABLE IF EXISTS landing_sales;

-- Landing table for sales
CREATE TABLE landing_sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INT,
    customer_id INT,
    sale_date DATE,
    quantity INT,
    sale_amount DECIMAL
);