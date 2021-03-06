-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`quality_assurance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`quality_assurance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `qltyasrnce_number` VARCHAR(45) NOT NULL,
  `qltyasrnce_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`evaluation_form`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`evaluation_form` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `evltnform_number` VARCHAR(45) NOT NULL,
  `evltnform_name` VARCHAR(45) NOT NULL,
  `QUALITY_ASSURANCE_QLTYASRNCE_ID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_EVALUATION_FORM_QUALITY_ASSURANCE_idx` (`QUALITY_ASSURANCE_QLTYASRNCE_ID` ASC),
  CONSTRAINT `fk_EVALUATION_FORM_QUALITY_ASSURANCE`
    FOREIGN KEY (`QUALITY_ASSURANCE_QLTYASRNCE_ID`)
    REFERENCES `mydb`.`quality_assurance` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cust_number` VARCHAR(45) NOT NULL,
  `cust_name` VARCHAR(45) NOT NULL,
  `cust_email` VARCHAR(45) NOT NULL,
  `EVALUATION_FORM_EVLTNFORM_ID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CUSTOMER_EVALUATION_FORM1_idx` (`EVALUATION_FORM_EVLTNFORM_ID` ASC),
  CONSTRAINT `fk_CUSTOMER_EVALUATION_FORM1`
    FOREIGN KEY (`EVALUATION_FORM_EVLTNFORM_ID`)
    REFERENCES `mydb`.`evaluation_form` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`department_head`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`department_head` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `depthead_name` VARCHAR(45) NOT NULL,
  `depthead_position` VARCHAR(45) NOT NULL,
  `CUSTOMER_CUST_ID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DEPARTMENT_HEAD_CUSTOMER1_idx` (`CUSTOMER_CUST_ID` ASC),
  CONSTRAINT `fk_DEPARTMENT_HEAD_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_CUST_ID`)
    REFERENCES `mydb`.`CUSTOMER` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gnrlmnger_name`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gnrlmnger_name` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gnrlmnger_number` VARCHAR(45) NOT NULL,
  `GNRLMNGER_NAME` VARCHAR(45) NOT NULL,
  `DEPARTMENT_HEAD_DEPTHEAD_ID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_GENERAL_MANAGER_DEPARTMENT_HEAD1_idx` (`DEPARTMENT_HEAD_DEPTHEAD_ID` ASC),
  CONSTRAINT `fk_GENERAL_MANAGER_DEPARTMENT_HEAD1`
    FOREIGN KEY (`DEPARTMENT_HEAD_DEPTHEAD_ID`)
    REFERENCES `mydb`.`department_head` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
