-- MySQL Workbench Synchronization
-- Generated: 2024-06-02 21:35
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: augus

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `pizzeria`.`customer` (
  `customer_id` INT(11) NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_surname` VARCHAR(45) NOT NULL,
  `customer_address` VARCHAR(90) NOT NULL,
  `customer_postal_code` INT(5) NOT NULL,
  `customer_phone` VARCHAR(20) NOT NULL,
  `locality_locality_id` INT(11) NOT NULL,
  `locality_province_province_id` INT(11) NOT NULL,
  PRIMARY KEY (`customer_id`, `locality_locality_id`, `locality_province_province_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC),
  INDEX `fk_customer_locality1_idx` (`locality_locality_id` ASC, `locality_province_province_id` ASC),
  CONSTRAINT `fk_customer_locality1`
    FOREIGN KEY (`locality_locality_id` , `locality_province_province_id`)
    REFERENCES `pizzeria`.`locality` (`locality_id` , `province_province_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`province` (
  `province_id` INT(11) NOT NULL AUTO_INCREMENT,
  `province_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`province_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`locality` (
  `locality_id` INT(11) NOT NULL AUTO_INCREMENT,
  `locality_name` VARCHAR(255) NOT NULL,
  `province_province_id` INT(11) NOT NULL,
  PRIMARY KEY (`locality_id`, `province_province_id`),
  INDEX `fk_locality_province_idx` (`province_province_id` ASC),
  CONSTRAINT `fk_locality_province`
    FOREIGN KEY (`province_province_id`)
    REFERENCES `pizzeria`.`province` (`province_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`store` (
  `store_id` INT(11) NOT NULL AUTO_INCREMENT,
  `store_address` VARCHAR(255) NOT NULL,
  `store_postal_code` VARCHAR(10) NOT NULL,
  `locality_locality_id` INT(11) NOT NULL,
  `locality_province_province_id` INT(11) NOT NULL,
  PRIMARY KEY (`store_id`, `locality_locality_id`, `locality_province_province_id`),
  INDEX `fk_store_locality1_idx` (`locality_locality_id` ASC, `locality_province_province_id` ASC),
  CONSTRAINT `fk_store_locality1`
    FOREIGN KEY (`locality_locality_id` , `locality_province_province_id`)
    REFERENCES `pizzeria`.`locality` (`locality_id` , `province_province_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`employee` (
  `employee_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employee_name` VARCHAR(45) NOT NULL,
  `employee_surname` VARCHAR(45) NOT NULL,
  `employee_nif` VARCHAR(20) NOT NULL,
  `employee_phone` VARCHAR(20) NULL DEFAULT NULL,
  `employee_role` VARCHAR(45) NOT NULL,
  `employee_col` ENUM('cook', 'delivery_person') NOT NULL,
  `store_store_id` INT(11) NOT NULL,
  `store_locality_locality_id` INT(11) NOT NULL,
  `store_locality_province_province_id` INT(11) NOT NULL,
  `delivery_delivery_id` INT(11) NOT NULL,
  PRIMARY KEY (`employee_id`, `store_store_id`, `store_locality_locality_id`, `store_locality_province_province_id`, `delivery_delivery_id`),
  UNIQUE INDEX `employee_nif_UNIQUE` (`employee_nif` ASC),
  INDEX `fk_employee_store1_idx` (`store_store_id` ASC, `store_locality_locality_id` ASC, `store_locality_province_province_id` ASC),
  INDEX `fk_employee_delivery1_idx` (`delivery_delivery_id` ASC),
  CONSTRAINT `fk_employee_store1`
    FOREIGN KEY (`store_store_id` , `store_locality_locality_id` , `store_locality_province_province_id`)
    REFERENCES `pizzeria`.`store` (`store_id` , `locality_locality_id` , `locality_province_province_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_employee_delivery1`
    FOREIGN KEY (`delivery_delivery_id`)
    REFERENCES `pizzeria`.`delivery` (`delivery_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`category` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`product` (
  `product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_description` TEXT NULL DEFAULT NULL,
  `product_image` MEDIUMBLOB NULL DEFAULT NULL,
  `product_price` DECIMAL(5,2) NULL DEFAULT NULL,
  `category_category_id` INT(11) NOT NULL,
  `order_product_order_product_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`, `category_category_id`, `order_product_order_product_id`),
  INDEX `fk_product_category1_idx` (`category_category_id` ASC),
  INDEX `fk_product_order_product1_idx` (`order_product_order_product_id` ASC),
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `pizzeria`.`category` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_order_product1`
    FOREIGN KEY (`order_product_order_product_id`)
    REFERENCES `pizzeria`.`order_product` (`order_product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`order_product` (
  `order_product_id` INT(11) NOT NULL,
  `order_product_quantity` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`order_product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`delivery` (
  `delivery_id` INT(11) NOT NULL AUTO_INCREMENT,
  `delivery_date_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`delivery_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`order` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery_type` ENUM('home_delivery', 'store_pickup') NULL DEFAULT NULL,
  `order_total_price` DECIMAL(8,2) NOT NULL,
  `customer_customer_id` INT(11) NOT NULL,
  `customer_locality_locality_id` INT(11) NOT NULL,
  `customer_locality_province_province_id` INT(11) NOT NULL,
  `store_store_id` INT(11) NOT NULL,
  `store_locality_locality_id` INT(11) NOT NULL,
  `store_locality_province_province_id` INT(11) NOT NULL,
  `order_product_order_product_id` INT(11) NOT NULL,
  `delivery_delivery_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_id`, `customer_customer_id`, `customer_locality_locality_id`, `customer_locality_province_province_id`, `store_store_id`, `store_locality_locality_id`, `store_locality_province_province_id`, `order_product_order_product_id`, `delivery_delivery_id`),
  INDEX `fk_order_customer1_idx` (`customer_customer_id` ASC, `customer_locality_locality_id` ASC, `customer_locality_province_province_id` ASC),
  INDEX `fk_order_store1_idx` (`store_store_id` ASC, `store_locality_locality_id` ASC, `store_locality_province_province_id` ASC),
  INDEX `fk_order_order_product1_idx` (`order_product_order_product_id` ASC),
  INDEX `fk_order_delivery1_idx` (`delivery_delivery_id` ASC),
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_customer_id` , `customer_locality_locality_id` , `customer_locality_province_province_id`)
    REFERENCES `pizzeria`.`customer` (`customer_id` , `locality_locality_id` , `locality_province_province_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_store1`
    FOREIGN KEY (`store_store_id` , `store_locality_locality_id` , `store_locality_province_province_id`)
    REFERENCES `pizzeria`.`store` (`store_id` , `locality_locality_id` , `locality_province_province_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_order_product1`
    FOREIGN KEY (`order_product_order_product_id`)
    REFERENCES `pizzeria`.`order_product` (`order_product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_delivery1`
    FOREIGN KEY (`delivery_delivery_id`)
    REFERENCES `pizzeria`.`delivery` (`delivery_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
