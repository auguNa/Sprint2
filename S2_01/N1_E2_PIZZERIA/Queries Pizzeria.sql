-- Query to count the number of drinks sold in a certain city
SELECT 
    l.locality_name AS City,
    COUNT(o.order_id) AS DrinksSold
FROM 
    `pizzeria`.`order` o
JOIN 
    `pizzeria`.`store` s ON o.store_store_id = s.store_id
JOIN 
    `pizzeria`.`locality` l ON s.locality_locality_id = l.locality_id AND s.locality_province_province_id = l.province_province_id
JOIN 
    `pizzeria`.`order_product` op ON o.order_product_order_product_id = op.order_product_id
JOIN 
    `pizzeria`.`product` p ON op.order_product_id = p.order_product_order_product_id
JOIN 
    `pizzeria`.`category` c ON p.category_category_id = c.category_id
WHERE 
    c.category_name = 'Drinks' AND l.locality_name = 'City1'
GROUP BY 
    l.locality_name;

-- Query to count the number of orders processed by a certain employee
SELECT 
    e.employee_name AS Employee,
    e.employee_surname AS Surname,
    COUNT(o.order_id) AS OrdersProcessed
FROM 
    `pizzeria`.`order` o
JOIN 
    `pizzeria`.`delivery` d ON o.delivery_delivery_id = d.delivery_id
JOIN 
    `pizzeria`.`employee` e ON d.delivery_id = e.delivery_delivery_id
WHERE 
    e.employee_name = 'Alice' AND e.employee_surname = 'Brown'
GROUP BY 
    e.employee_name, e.employee_surname;
