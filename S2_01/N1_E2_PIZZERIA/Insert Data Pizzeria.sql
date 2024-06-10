-- Inserting into `province`
INSERT INTO `pizza_shop`.`province` (`id_province`, `name`) VALUES (1, 'Province A');

-- Inserting into `city`
INSERT INTO `pizza_shop`.`city` (`id_city`, `name`, `id_province`) VALUES (1, 'City A', 1);

-- Inserting into `address`
INSERT INTO `pizza_shop`.`address` (`id_address`, `street`, `number`, `flat`, `door`, `post_code`, `id_city`) VALUES 
(1, 'Main St', '123', NULL, NULL, '12345', 1);

-- Inserting into `store`
INSERT INTO `pizza_shop`.`store` (`id_store`, `name`, `phone`, `id_address`) VALUES 
(1, 'Store A', '1234567890', 1);

-- Inserting into `employee`
INSERT INTO `pizza_shop`.`employee` (`id_employee`, `id_store`, `name`, `surname`, `nif`, `phone`, `role`, `id_address`) VALUES 
(1, 1, 'John', 'Doe', 'NIF123456', '1234567890', 'chef', 1);

-- Inserting into `customer`
INSERT INTO `pizza_shop`.`customer` (`id_customer`, `name`, `surname`, `phone`, `id_address`) VALUES 
(1, 'Jane', 'Doe', '0987654321', 1);

-- Inserting into `category`
INSERT INTO `pizza_shop`.`category` (`id_category`, `name`) VALUES 
(1, 'Beverages');

-- Inserting into `product`
INSERT INTO `pizza_shop`.`product` (`id_product`, `name`, `type`, `description`, `image`, `price`, `id_category`) VALUES 
(1, 'Coca-Cola', 'drink', 'Soft drink', NULL, 1.50, 1);

-- Inserting into `order`
INSERT INTO `pizza_shop`.`order` (`id_order`, `id_employee`, `id_customer`, `date`, `delivery`, `amount`, `delivery_date`) VALUES 
(1, 1, 1, '2024-06-10 12:00:00', 'store', 15.00, '2024-06-10 12:30:00');

-- Inserting into `order_detail`
INSERT INTO `pizza_shop`.`order_detail` (`id_detail`, `id_order`, `id_product`, `qty`) VALUES 
(1, 1, 1, 3);
