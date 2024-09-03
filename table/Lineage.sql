

-- Landing table for customers
CREATE TABLE landing_customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);



-- Landing table for products
CREATE TABLE landing_products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(255),
    price DECIMAL
);


-- Landing table for sales
CREATE TABLE landing_sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INT,
    customer_id INT,
    sale_date DATE,
    quantity INT,
    sale_amount DECIMAL
);


-- Staging table for customers
CREATE TABLE staging_customer_dim (
    customer_id INT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    effective_date DATE NOT NULL,
    expiration_date DATE,
    is_current BOOLEAN NOT NULL
);


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


-- Dimension table for customers
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


CREATE TABLE sales_fact (
    sale_id INT PRIMARY KEY,
    product_dim_id INT REFERENCES product_dim(product_dim_id), -- Reference to Product Dimension Surrogate Key
    customer_dim_id INT REFERENCES customer_dim(customer_dim_id), -- Reference to Customer Dimension Surrogate Key
    date_id INT REFERENCES date_dim(date_id),
    quantity INT,
    sale_amount DECIMAL
);

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL,
    status VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES landing_customers(customer_id)
);


CREATE VIEW customer_product_sales AS
SELECT
    c.customer_id,
    c.full_name,
    c.email,
    p.product_name,
    p.category,
    p.price,
    s.quantity,
    s.sale_amount,
    s.effective_date AS sale_effective_date,
    s.expiration_date AS sale_expiration_date
FROM
    staging_sales_fact s
JOIN customer_dim c ON s.customer_id = c.customer_id AND c.is_current = TRUE
JOIN product_dim p ON s.product_id = p.product_id AND p.is_current = TRUE
WHERE
    s.is_current = TRUE;


    
