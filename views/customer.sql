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