-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `main_category_id` INT NOT NULL AUTO_INCREMENT,
  `main_category_name` VARCHAR(100) NOT NULL,
  `sub_category_id` INT NOT NULL,
  `sub_category_name` VARCHAR(100) NOT NULL,
  `sub_sub_category_id` INT NOT NULL,
  `sub_sub_category_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`main_category_id`, `sub_category_id`, `sub_sub_category_id`),
  UNIQUE INDEX `main_categorg_id_UNIQUE` (`main_category_id` ASC) VISIBLE,
  UNIQUE INDEX `sub_category_id_UNIQUE` (`sub_category_id` ASC) VISIBLE,
  UNIQUE INDEX `sub_sub_category_id_UNIQUE` (`sub_sub_category_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(100) NOT NULL,
  `category_main_category_id` INT NOT NULL,
  `category_sub_category_id` INT NOT NULL,
  `category_sub_sub_category_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `category_main_category_id`, `category_sub_category_id`, `category_sub_sub_category_id`),
  INDEX `fk_product_category1_idx` (`category_main_category_id` ASC, `category_sub_category_id` ASC, `category_sub_sub_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_main_category_id` , `category_sub_category_id` , `category_sub_sub_category_id`)
    REFERENCES `mydb`.`category` (`main_category_id` , `sub_category_id` , `sub_sub_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`store_schema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`store_schema` (
  `store_id` INT NOT NULL AUTO_INCREMENT,
  `store_name` VARCHAR(100) NOT NULL,
  `product_description` VARCHAR(1000) NULL DEFAULT 'null',
  `product_price` VARCHAR(10) NOT NULL,
  `product_availability` INT NOT NULL,
  PRIMARY KEY (`store_id`),
  UNIQUE INDEX `store_name_UNIQUE` (`store_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categorg_id_has_store1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categorg_id_has_store1` (
  `main_category_id` INT NOT NULL,
  `sub_category_id` INT NOT NULL,
  `sub_sub_category_id` INT NOT NULL,
  `store_id` INT NOT NULL,
  PRIMARY KEY (`main_category_id`, `sub_category_id`, `sub_sub_category_id`, `store_id`),
  INDEX `fk_categorg_id_has_store1_store11_idx` (`store_id` ASC) VISIBLE,
  INDEX `fk_categorg_id_has_store1_categorg_id_idx` (`main_category_id` ASC, `sub_category_id` ASC, `sub_sub_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_categorg_id_has_store1_categorg_id`
    FOREIGN KEY (`main_category_id` , `sub_category_id` , `sub_sub_category_id`)
    REFERENCES `mydb`.`category` (`main_category_id` , `sub_category_id` , `sub_sub_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorg_id_has_store1_store11`
    FOREIGN KEY (`store_id`)
    REFERENCES `mydb`.`store_schema` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product_has_store1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product_has_store1` (
  `product_id` INT NOT NULL,
  `main_category_id` INT NOT NULL,
  `sub_category_id` INT NOT NULL,
  `sub_sub_category_id` INT NOT NULL,
  `store_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `main_category_id`, `sub_category_id`, `sub_sub_category_id`, `store_id`),
  INDEX `fk_product_has_store1_store11_idx` (`store_id` ASC) VISIBLE,
  INDEX `fk_product_has_store1_product1_idx` (`product_id` ASC, `main_category_id` ASC, `sub_category_id` ASC, `sub_sub_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_store1_product1`
    FOREIGN KEY (`product_id` , `main_category_id` , `sub_category_id` , `sub_sub_category_id`)
    REFERENCES `mydb`.`product` (`product_id` , `category_main_category_id` , `category_sub_category_id` , `category_sub_sub_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_store1_store11`
    FOREIGN KEY (`store_id`)
    REFERENCES `mydb`.`store_schema` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
