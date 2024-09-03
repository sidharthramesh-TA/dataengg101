-- Landing Table for Customers
CREATE TABLE Demo_landing_customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    customer_email VARCHAR(255),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Landing Table for Products
CREATE TABLE Demo_landing_products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    product_price DECIMAL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Landing Table for Orders
CREATE TABLE Demo_landing_orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date TIMESTAMP,
    quantity INT,
    total_price DECIMAL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Staging Tables
CREATE TABLE Demo_staging_customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    customer_email VARCHAR(255),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    is_current BOOLEAN
);

CREATE TABLE Demo_staging_products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    product_price DECIMAL,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    is_current BOOLEAN
);

CREATE TABLE Demo_staging_orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date TIMESTAMP,
    quantity INT,
    total_price DECIMAL
);

-- Create Dimension and Fact Tables
CREATE TABLE Demo_dim_customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    customer_email VARCHAR(255),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    is_current BOOLEAN
);

CREATE TABLE Demo_dim_products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    product_price DECIMAL,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    is_current BOOLEAN
);

CREATE TABLE Demo_fact_orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date TIMESTAMP,
    quantity INT,
    total_price DECIMAL
);