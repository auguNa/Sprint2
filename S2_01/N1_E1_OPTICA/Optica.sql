-- MySQL Workbench Synchronization
-- Generated: 2024-05-31 21:54
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: augus

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `optica_store` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `optica_store`.`customer` (
  `id_customer` INT(11) NOT NULL AUTO_INCREMENT,
  `id_customer_recommended` INT(11) NULL DEFAULT NULL,
  `customer_name` VARCHAR(45) NULL DEFAULT NULL,
  `cliente_address` VARCHAR(45) NULL DEFAULT NULL,
  `customer_phone` CHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `customer_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `address_address_country` VARCHAR(45) NOT NULL,
  `customer_created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id_customer` INT(11) NOT NULL,
  PRIMARY KEY (`id_customer`),
  INDEX `fk_customer_address1_idx` (`address_address_country` ASC) VISIBLE,
  INDEX `customer_name` (`customer_name` ASC) VISIBLE,
  INDEX `fk_customer_customer1_idx` (`customer_id_customer` ASC) VISIBLE,
  CONSTRAINT `fk_customer_address1`
    FOREIGN KEY (`address_address_country`)
    REFERENCES `optica_store`.`address` (`address_country`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_customer1`
    FOREIGN KEY (`customer_id_customer`)
    REFERENCES `optica_store`.`customer` (`id_customer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica_store`.`supplier` (
  `supplier_id` INT(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` VARCHAR(45) NOT NULL COMMENT 'Holds supplier name.',
  `supplier_address` VARCHAR(45) NOT NULL,
  `supplier_phone` CHAR(20) NULL DEFAULT NULL,
  `supplier_fax` CHAR(20) NULL DEFAULT NULL,
  `supplier_nif` CHAR(12) NULL DEFAULT NULL,
  `supplier_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id_customer_recommended1` INT(11) NOT NULL,
  `customer_id_customer1` INT(11) NOT NULL,
  `address_address_id` INT(11) NOT NULL,
  `address_address_country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`supplier_id`, `customer_id_customer_recommended1`, `customer_id_customer1`),
  INDEX `fk_supplier_address1_idx` (`address_address_id` ASC, `address_address_country` ASC) VISIBLE,
  INDEX `supplier_name` (`supplier_name` ASC) VISIBLE,
  CONSTRAINT `fk_supplier_address1`
    FOREIGN KEY (`address_address_id` , `address_address_country`)
    REFERENCES `optica_store`.`address` (`address_id` , `address_country`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica_store`.`glasses` (
  `glasses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `glasses_brand` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_graduation_R` DECIMAL NOT NULL,
  `glasses_graduation_L` DECIMAL NOT NULL,
  `glasses_frame` VARCHAR(45) NULL DEFAULT NULL,
  `frame_color` VARCHAR(20) NULL DEFAULT NULL,
  `glasses_price` VARCHAR(45) NULL DEFAULT NULL,
  `supplier_supplier_id` INT(11) NOT NULL,
  `supplier_customer_id_customer_recommended1` INT(11) NOT NULL,
  `supplier_customer_id_customer1` INT(11) NOT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_glasses_supplier1_idx` (`supplier_supplier_id` ASC, `supplier_customer_id_customer_recommended1` ASC, `supplier_customer_id_customer1` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_supplier1`
    FOREIGN KEY (`supplier_supplier_id` , `supplier_customer_id_customer_recommended1` , `supplier_customer_id_customer1`)
    REFERENCES `optica_store`.`supplier` (`supplier_id` , `customer_id_customer_recommended1` , `customer_id_customer1`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica_store`.`employee` (
  `employee_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employee_name` VARCHAR(45) NULL DEFAULT NULL,
  `employee_surname` VARCHAR(45) NULL DEFAULT NULL,
  `employee_dni` INT(9) NULL DEFAULT NULL,
  `address_address_id` INT(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_employee_address1_idx` (`address_address_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_address1`
    FOREIGN KEY (`address_address_id`)
    REFERENCES `optica_store`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica_store`.`sales` (
  `sales_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employee_id` INT(11) NULL DEFAULT NULL,
  `customer_id` INT(11) NULL DEFAULT NULL,
  `glasses_id` INT(11) NULL DEFAULT NULL,
  `amount` DECIMAL(7,2) NULL DEFAULT NULL,
  `sale_timestamp` DATETIME NULL DEFAULT NULL,
  `customer_id_customer` INT(11) NOT NULL,
  `glasses_glasses_id` INT(11) NOT NULL,
  `employee_employee_id` INT(11) NOT NULL,
  PRIMARY KEY (`sales_id`),
  INDEX `fk_sales_customer1_idx` (`customer_id_customer` ASC) VISIBLE,
  INDEX `fk_sales_glasses1_idx` (`glasses_glasses_id` ASC) VISIBLE,
  INDEX `fk_sales_employee1_idx` (`employee_employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_sales_customer1`
    FOREIGN KEY (`customer_id_customer`)
    REFERENCES `optica_store`.`customer` (`id_customer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_glasses1`
    FOREIGN KEY (`glasses_glasses_id`)
    REFERENCES `optica_store`.`glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_employee1`
    FOREIGN KEY (`employee_employee_id`)
    REFERENCES `optica_store`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica_store`.`address` (
  `address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `address_street` VARCHAR(45) NOT NULL,
  `address_street_no` VARCHAR(45) NOT NULL,
  `address_suite` VARCHAR(45) NULL DEFAULT NULL,
  `address_entrance` VARCHAR(45) NULL DEFAULT NULL,
  `address_post_code` VARCHAR(45) NOT NULL,
  `address_city` VARCHAR(45) NOT NULL,
  `address_country` VARCHAR(45) NOT NULL,
  `address_created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `address_updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  INDEX `idx_city` (`address_city` ASC) INVISIBLE,
  INDEX `idx_post_code` (`address_post_code` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
