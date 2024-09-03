DROP TABLE IF EXISTS date_dim CASCADE;

-- Date Dimension (simplified for example)
CREATE TABLE date_dim (
    date_id INT PRIMARY KEY,
    date DATE,
    year INT,
    month INT,
    day INT
);