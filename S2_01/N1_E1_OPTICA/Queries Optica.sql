-- Lists the total invoices of a client in a given period.
SELECT 
    customer.name AS customer_name,
    count(sales_id) AS total_amount,
    SUM(sales.amount) AS total_amount
FROM  customer
JOIN  sales ON customer_id = sales.customer_id
WHERE
customer.name ='Jane Smith' AND sales.sale_date BETWEEN'2023-01-01' AND '2024-06-31';

-- List the different models of glasses that an employee has sold during a year.
SELECT DISTINCT brand.brand_name, employee.name, sales.sale_date, sales.amount
FROM sales
JOIN glasses ON sales.glasses_id = glasses.glasses_id
JOIN employee ON sales.employee_id = employee.employee_id
JOIN brand ON glasses.brand_brand_id = brand.brand_id
WHERE  employee.employee_id = 2;

-- Lists different suppliers that have supplied glasses successfully sold by the optician.
SELECT DISTINCT supplier.name, sales.amount
FROM sales
JOIN glasses ON glasses.glasses_id = sales.glasses_id
JOIN brand ON glasses.brand_brand_id = brand.brand_id
JOIN supplier ON brand.brand_id;

