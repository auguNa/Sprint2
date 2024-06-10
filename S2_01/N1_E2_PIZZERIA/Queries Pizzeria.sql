-- Query to Show How Many Drinks Have Been Sold in a Given Location
SELECT c.name AS City_Name, SUM(od.qty) AS Drinks_Sold
FROM `pizza_shop`.`order_detail` od
JOIN `pizza_shop`.`product` p ON od.id_product = p.id_product
JOIN `pizza_shop`.`order` o ON od.id_order = o.id_order
JOIN `pizza_shop`.`employee` e ON o.id_employee = e.id_employee
JOIN `pizza_shop`.`store` s ON e.id_store = s.id_store
JOIN `pizza_shop`.`address` a ON s.id_address = a.id_address
JOIN `pizza_shop`.`city` c ON a.id_city = c.id_city
WHERE p.type = 'drink' AND c.name = 'City A' -- Change 'City A' to the desired city name
GROUP BY c.name;

-- Query to Show the Number of Orders a Specific Employee Has Placed
SELECT e.name AS Employee_Name, e.surname AS Employee_Surname, c.name AS City_Name, SUM(od.qty) AS Drinks_Sold
FROM `pizza_shop`.`order_detail` od
JOIN `pizza_shop`.`product` p ON od.id_product = p.id_product
JOIN `pizza_shop`.`order` o ON od.id_order = o.id_order
JOIN `pizza_shop`.`employee` e ON o.id_employee = e.id_employee
JOIN `pizza_shop`.`store` s ON e.id_store = s.id_store
JOIN `pizza_shop`.`address` a ON s.id_address = a.id_address
JOIN `pizza_shop`.`city` c ON a.id_city = c.id_city
WHERE p.type = 'drink' AND c.name = 'City A' AND e.name = 'John' AND e.surname = 'Doe' -- Change 'City A', 'John', 'Doe' to the desired city name and employee's name
GROUP BY e.name, e.surname, c.name;
