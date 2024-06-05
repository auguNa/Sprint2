SELECT DISTINCT
    customer.name AS customer_name,
    count(sales_id) AS total_amount,
    SUM(sales.amount) AS total_amount
FROM 
    customer
JOIN 
    sales ON customer_id = sales.customer_id
WHERE
customer.name ='Jane Smith';

