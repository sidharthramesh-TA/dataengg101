DROP TABLE IF EXISTS sales_fact CASCADE;

CREATE TABLE sales_fact (
    sale_id INT PRIMARY KEY,
    product_dim_id INT REFERENCES product_dim(product_dim_id), -- Reference to Product Dimension Surrogate Key
    customer_dim_id INT REFERENCES customer_dim(customer_dim_id), -- Reference to Customer Dimension Surrogate Key
    date_id INT REFERENCES date_dim(date_id),
    quantity INT,
    sale_amount DECIMAL
);