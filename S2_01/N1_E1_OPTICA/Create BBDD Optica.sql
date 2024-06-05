-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optica_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica_store` DEFAULT CHARACTER SET utf8 ;
USE `optica_store` ;

-- -----------------------------------------------------
-- Table `optica_store`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_store`.`address` (
  `address_id` INT(11) NOT NULL,
  `street` VARCHAR(45) NULL,
  `number` VARCHAR(45) NULL,
  `suite` VARCHAR(45) NULL,
  `entrance` VARCHAR(45) NULL,
  `post_code` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica_store`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_store`.`customer` (
  `id_customer` INT(11) NOT NULL AUTO_INCREMENT,
  `address_address_id` INT(11) NULL,
  `id_customer_recomended` INT(11) NULL,
  `name` VARCHAR(45) NULL,
  `phone` CHAR(20) NULL,
  `email` VARCHAR(255) NULL,
  `created_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_customer`),
  INDEX `address_id` (`address_address_id` ASC),
  INDEX `id_customer_recomended` (`id_customer_recomended` ASC),
  CONSTRAINT `address_id`
    FOREIGN KEY (`address_address_id`)
    REFERENCES `optica_store`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_customer_recomended`
    FOREIGN KEY (`id_customer_recomended`)
    REFERENCES `optica_store`.`customer` (`id_customer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `optica_store`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_store`.`supplier` (
  `supplier_id` INT(11) NOT NULL AUTO_INCREMENT,
  `address_id` INT(11) NULL,
  `name` VARCHAR(45) NULL COMMENT 'Holds supplier name.',
  `phone` CHAR(20) NULL,
  `fax` CHAR(20) NULL,
  `nif` CHAR(12) NULL,
  PRIMARY KEY (`supplier_id`),
  INDEX `nif` (`nif` ASC),
  INDEX `address_id` (`address_id` ASC),
  CONSTRAINT `address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `optica_store`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica_store`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_store`.`brand` (
  `brand_id` INT(11) NOT NULL,
  `supplier_id` INT(11) NULL,
  `brand_name` VARCHAR(45) NULL,
  PRIMARY KEY (`brand_id`),
  INDEX `supplier_id` (`supplier_id` ASC),
  CONSTRAINT `supplier_id`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `optica_store`.`supplier` (`supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica_store`.`glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_store`.`glasses` (
  `glasses_id` INT(11) NOT NULL,
  `brand_brand_id` INT(11) NULL,
  `graduation_R` DECIMAL(5,2) NULL,
  `graduation_L` DECIMAL(5,2) NULL,
  `frame` VARCHAR(45) NULL,
  `frame_color` VARCHAR(20) NULL,
  `price` DECIMAL(8,2) NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `brand_id` (`brand_brand_id` ASC),
  CONSTRAINT `brand_id`
    FOREIGN KEY (`brand_brand_id`)
    REFERENCES `optica_store`.`brand` (`brand_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica_store`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_store`.`employee` (
  `employee_id` INT(11) NOT NULL AUTO_INCREMENT,
  `address_id` INT(11) NULL,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `nif` CHAR(12) NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `address_id` (`address_id` ASC),
  INDEX `nif` (`nif` ASC),
  CONSTRAINT `fk_employee_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `optica_store`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica_store`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_store`.`sales` (
  `sales_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employee_id` INT(11) NULL,
  `customer_id` INT(11) NULL,
  `glasses_id` INT(11) NULL,
  `amount` DECIMAL(8,2) NULL,
  `sale_date` TIMESTAMP NOT NULL,
  PRIMARY KEY (`sales_id`),
  INDEX `glasses_id` (`glasses_id` ASC),
  INDEX `customer_id` (`customer_id` ASC),
  INDEX `employee_id` (`employee_id` ASC),
  CONSTRAINT `glasses_id`
    FOREIGN KEY (`glasses_id`)
    REFERENCES `optica_store`.`glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `optica_store`.`customer` (`id_customer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `optica_store`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
