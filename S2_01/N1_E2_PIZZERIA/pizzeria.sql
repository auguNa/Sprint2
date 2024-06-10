-- MySQL Workbench Synchronization
-- Generated: 2024-06-10 20:06
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: augustin

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `pizza_shop` DEFAULT CHARACTER SET utf8mb4 ;

CREATE TABLE IF NOT EXISTS `pizza_shop`.`category` (
  `id_category` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_category`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizza_shop`.`customer` (
  `id_customer` INT(11) NOT NULL,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  `surname` VARCHAR(30) NULL DEFAULT NULL,
  `phone` VARCHAR(16) NULL DEFAULT NULL,
  `id_address` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  INDEX `id_address` (`id_address` ASC),
  CONSTRAINT `customer_ibfk_1`
    FOREIGN KEY (`id_address`)
    REFERENCES `pizza_shop`.`address` (`id_address`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizza_shop`.`order_detail` (
  `id_detail` INT(11) NOT NULL,
  `id_order` INT(11) NULL DEFAULT NULL,
  `id_product` INT(11) NULL DEFAULT NULL,
  `qty` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail`),
  INDEX `id_order` (`id_order` ASC),
  INDEX `id_product` (`id_product` ASC),
  CONSTRAINT `detail_order_ibfk_1`
    FOREIGN KEY (`id_order`)
    REFERENCES `pizza_shop`.`order` (`id_order`),
  CONSTRAINT `detail_order_ibfk_2`
    FOREIGN KEY (`id_product`)
    REFERENCES `pizza_shop`.`product` (`id_product`))
ENGINE = InnoDB
AUTO_INCREMENT = 24
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizza_shop`.`address` (
  `id_address` INT(11) NOT NULL,
  `street` VARCHAR(50) NOT NULL,
  `number` VARCHAR(20) NOT NULL,
  `flat` VARCHAR(10) NULL DEFAULT NULL,
  `door` VARCHAR(10) NULL DEFAULT NULL,
  `post_code` VARCHAR(12) NULL DEFAULT NULL,
  `id_city` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_address`),
  INDEX `id_city` (`id_city` ASC),
  CONSTRAINT `address_ibfk_1`
    FOREIGN KEY (`id_city`)
    REFERENCES `pizza_shop`.`city` (`id_city`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizza_shop`.`employee` (
  `id_employee` INT(11) NOT NULL,
  `id_store` INT(11) NULL DEFAULT NULL,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  `surname` VARCHAR(50) NULL DEFAULT NULL,
  `nif` VARCHAR(12) NULL DEFAULT NULL,
  `phone` VARCHAR(12) NULL DEFAULT NULL,
  `role` ENUM('chef', 'delivery') NULL DEFAULT NULL,
  `id_address` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_employee`),
  UNIQUE INDEX `nif` (`nif` ASC),
  INDEX `id_store` (`id_store` ASC),
  INDEX `id_address` (`id_address` ASC),
  CONSTRAINT `employee_ibfk_1`
    FOREIGN KEY (`id_store`)
    REFERENCES `pizza_shop`.`store` (`id_store`),
  CONSTRAINT `employee_ibfk_2`
    FOREIGN KEY (`id_address`)
    REFERENCES `pizza_shop`.`address` (`id_address`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizza_shop`.`city` (
  `id_city` INT(11) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `id_province` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_city`),
  INDEX `id_province` (`id_province` ASC),
  CONSTRAINT `city_ibfk_1`
    FOREIGN KEY (`id_province`)
    REFERENCES `pizza_shop`.`province` (`id_province`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb4
ROW_FORMAT = DEFAULT
KEY_BLOCK_SIZE = 16;

CREATE TABLE IF NOT EXISTS `pizza_shop`.`order` (
  `id_order` INT(11) NOT NULL,
  `id_employee` INT(11) NULL DEFAULT NULL,
  `id_customer` INT(11) NULL DEFAULT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `delivery` ENUM('store', 'take_away') NULL DEFAULT 'store',
  `amount` DECIMAL(8,2) NULL DEFAULT NULL,
  `delivery_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  INDEX `id_employee` (`id_employee` ASC),
  INDEX `id_customer` (`id_customer` ASC),
  CONSTRAINT `order_ibfk_1`
    FOREIGN KEY (`id_employee`)
    REFERENCES `pizza_shop`.`employee` (`id_employee`),
  CONSTRAINT `order_ibfk_2`
    FOREIGN KEY (`id_customer`)
    REFERENCES `pizza_shop`.`customer` (`id_customer`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizza_shop`.`product` (
  `id_product` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `type` ENUM('pizza', 'hamburger', 'drink') NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `image` VARCHAR(30) NULL DEFAULT NULL,
  `price` DECIMAL(8,2) NULL DEFAULT NULL,
  `id_category` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  INDEX `id_category` (`id_category` ASC),
  CONSTRAINT `product_ibfk_1`
    FOREIGN KEY (`id_category`)
    REFERENCES `pizza_shop`.`category` (`id_category`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizza_shop`.`province` (
  `id_province` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_province`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `pizza_shop`.`store` (
  `id_store` INT(11) NOT NULL,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  `phone` VARCHAR(12) NULL DEFAULT NULL,
  `id_address` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_store`),
  INDEX `id_address` (`id_address` ASC),
  CONSTRAINT `store_ibfk_1`
    FOREIGN KEY (`id_address`)
    REFERENCES `pizza_shop`.`address` (`id_address`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
