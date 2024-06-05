-- Insert data into the province table
INSERT INTO `pizzeria`.`province` (`province_name`) VALUES ('ProvinceA'), ('ProvinceB');

-- Insert data into the locality table
INSERT INTO `pizzeria`.`locality` (`locality_name`, `province_province_id`) VALUES ('City1', 1), ('City2', 2);

-- Insert data into the store table
INSERT INTO `pizzeria`.`store` (`store_address`, `store_postal_code`, `locality_locality_id`, `locality_province_province_id`) 
VALUES ('123 Main St', '12345', 1, 1), ('456 Second St', '67890', 2, 2);

-- Insert data into the customer table ensuring unique composite keys
INSERT INTO `pizzeria`.`customer` (`customer_id`, `customer_name`, `customer_surname`, `customer_address`, `customer_postal_code`, `customer_phone`, `locality_locality_id`, `locality_province_province_id`) 
VALUES (1, 'John', 'Doe', '789 Third St', 12345, '555-1234', 1, 1), 
       (2, 'Jane', 'Smith', '101 First St', 67890, '555-5678', 2, 2);

-- Insert data into the delivery table
INSERT INTO `pizzeria`.`delivery` (`delivery_date_time`) VALUES (NOW()), (NOW());

-- Insert data into the employee table ensuring unique composite keys
INSERT INTO `pizzeria`.`employee` (`employee_name`, `employee_surname`, `employee_nif`, `employee_phone`, `employee_role`, `employee_col`, `store_store_id`, `store_locality_locality_id`, `store_locality_province_province_id`, `delivery_delivery_id`) 
VALUES ('Alice', 'Brown', 'NIF123', '555-1111', 'Manager', 'cook', 1, 1, 1, 1), 
       ('Bob', 'White', 'NIF456', '555-2222', 'Delivery', 'delivery_person', 2, 2, 2, 2);

-- Insert data into the category table
INSERT INTO `pizzeria`.`category` (`category_name`) VALUES ('Drinks'), ('Pizzas');

-- Insert data into the order_product table with unique primary keys
INSERT INTO `pizzeria`.`order_product` (`order_product_id`, `order_product_quantity`) VALUES (1, '2'), (2, '3');

-- Insert data into the product table
INSERT INTO `pizzeria`.`product` (`product_name`, `product_description`, `product_image`, `product_price`, `category_category_id`, `order_product_order_product_id`) 
VALUES ('Coke', 'Soft drink', NULL, 1.50, 1, 1), 
       ('Pepsi', 'Soft drink', NULL, 1.50, 1, 2);

-- Insert data into the order table ensuring unique composite keys
INSERT INTO `pizzeria`.`order` (`order_date`, `delivery_type`, `order_total_price`, `customer_customer_id`, `customer_locality_locality_id`, `customer_locality_province_province_id`, `store_store_id`, `store_locality_locality_id`, `store_locality_province_province_id`, `order_product_order_product_id`, `delivery_delivery_id`)
VALUES (NOW(), 'home_delivery', 3.00, 1, 1, 1, 1, 1, 1, 1, 1), 
       (NOW(), 'store_pickup', 4.50, 2, 2, 2, 2, 2, 2, 2, 2);
