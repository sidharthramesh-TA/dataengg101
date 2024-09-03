CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL,
    status VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES landing_customers(customer_id)
);