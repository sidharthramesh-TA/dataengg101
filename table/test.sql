-- Customers Landing Table
CREATE TABLE landing_customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Landing Table
CREATE TABLE landing_products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(255),
    price DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders Landing Table
CREATE TABLE landing_orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date TIMESTAMP,
    quantity INT,
    total_amount DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Customers Staging Table
CREATE TABLE staging_customers (
    customer_id INT,
    customer_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    is_current BOOLEAN
);

-- Products Staging Table
CREATE TABLE staging_products (
    product_id INT,
    product_name VARCHAR(255),
    category VARCHAR(255),
    price DECIMAL(10, 2),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    is_current BOOLEAN
);

-- Orders Staging Table
CREATE TABLE staging_orders (
    order_id INT,
    customer_id INT,
    product_id INT,
    order_date TIMESTAMP,
    quantity INT,
    total_amount DECIMAL(10, 2),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    is_current BOOLEAN
);


-- Customers Dimension Table
CREATE TABLE dim_customers (
    customer_key SERIAL PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    is_current BOOLEAN
);

-- Products Dimension Table
CREATE TABLE dim_products (
    product_key SERIAL PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(255),
    category VARCHAR(255),
    price DECIMAL(10, 2),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    is_current BOOLEAN
);

-- Orders Fact Table
CREATE TABLE fact_orders (
    order_key SERIAL PRIMARY KEY,
    order_id INT,
    customer_key INT,
    product_key INT,
    order_date TIMESTAMP,
    quantity INT,
    total_amount DECIMAL(10, 2)
);

-- Create Reporting View
CREATE OR REPLACE VIEW vw_customer_product_orders AS
SELECT
    fo.order_key,
    fo.order_id,
    fo.order_date,
    fo.quantity,
    fo.total_amount,
    dc.customer_id,
    dc.customer_name,
    dc.email,
    dc.address,
    dp.product_id,
    dp.product_name,
    dp.category,
    dp.price
FROM
    fact_orders fo
JOIN
    dim_customers dc ON fo.customer_key = dc.customer_key
JOIN
    dim_products dp ON fo.product_key = dp.product_key
WHERE
    dc.is_current = TRUE
    AND dp.is_current = TRUE;






