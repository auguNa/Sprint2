-- Inserting data into the `address` table
INSERT INTO optica_store.address (address_id, street, number, suite, entrance, post_code, city, country) 
VALUES 

	(1,'Calle Anna 1', '1', '72', NULL, '35800', 'Tarragona',  'España'),
    (2,'Calle Roja', '2', NULL, NULL, '38111', 'Vilafranca',  'España'),
    (3,'Calle Principal', '3', '2', 'B', '50001', 'Burgos',  'España'),
    (4,'Calle St Maria', '4', NULL, NULL, '15001', 'Barcelona',  'España');
    
    -- Inserting data into the `customer` table
INSERT INTO optica_store.customer (id_customer, address_address_id, id_customer_recomended, name, phone, email, created_date) 
VALUES 
(1, 1, NULL, 'John Doe', '123-456-7890', 'john.doe@example.com', NOW()),
(2, 2, 1, 'Jane Smith', '987-654-3210', 'jane.smith@example.com', NOW());

-- Inserting data into the `supplier` table
INSERT INTO optica_store.supplier (supplier_id, address_id, name, phone, fax, nif) 
VALUES 
(1, 1, 'Lens Co.', '555-123-4567', '555-987-6543', '123456789A'),
(2, 2, 'Frames Inc.', '555-987-6543', '555-123-4567', '987654321B');

-- Inserting data into the `brand` table
INSERT INTO optica_store.brand (brand_id, supplier_id, brand_name) 
VALUES 
(1, 1, 'LensMaster'),
(2, 2, 'FrameWorks');

-- Inserting data into the `glasses` table
INSERT INTO optica_store.glasses (glasses_id, brand_brand_id, graduation_R, graduation_L, frame, frame_color, price) 
VALUES 
(1, 1, 2.25, 2.50, 'Rectangular', 'Black', 99.99),
(2, 2, 1.75, 1.75, 'Round', 'Brown', 79.99);

-- Inserting data into the `employee` table
INSERT INTO optica_store.employee (employee_id, address_id, name, surname, nif) 
VALUES 
(1, 1, 'Michael', 'Smith', 'A123456789'),
(2, 2, 'Emily', 'Johnson', 'B987654321');

-- Inserting data into the `sales` table
INSERT INTO optica_store.sales (sales_id, employee_id, customer_id, glasses_id, amount, sale_date) 
VALUES 
(1, 1, 1, 1, 99.99, NOW()),
(2, 2, 2, 2, 79.99, NOW());
   