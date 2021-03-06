-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema E-commerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema E-commerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `E-commerce` DEFAULT CHARACTER SET utf8 ;
USE `E-commerce` ;

-- -----------------------------------------------------
-- Table `E-commerce`.`UserInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-commerce`.`UserInfo` (
  `userID` INT(11) NOT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`userID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `E-commerce`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-commerce`.`Orders` (
  `orderID` INT(11) NOT NULL,
  `userID` INT(11) NULL DEFAULT NULL,
  `product` VARCHAR(45) NULL DEFAULT NULL,
  `quantity` INT(11) NULL DEFAULT NULL,
  `unitPrice` VARCHAR(45) NULL DEFAULT NULL,
  `total` VARCHAR(45) NULL DEFAULT NULL,
  `supplierID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `userID_idx` (`userID` ASC),
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `E-commerce`.`UserInfo` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `E-commerce`.`Suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-commerce`.`Suppliers` (
  `supplierID` INT(11) NOT NULL,
  `product` VARCHAR(45) NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  `numberOfProducts` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`supplierID`),
  CONSTRAINT `supplierID`
    FOREIGN KEY (`supplierID`)
    REFERENCES `E-commerce`.`Orders` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `E-commerce` ;

-- -----------------------------------------------------
-- Placeholder table for view `E-commerce`.`orderview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-commerce`.`orderview` (`orderid` INT, `userid` INT, `total` INT, `location` INT);

-- -----------------------------------------------------
-- Placeholder table for view `E-commerce`.`orderviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-commerce`.`orderviews` (`orderid` INT, `userid` INT, `total` INT, `location` INT);

-- -----------------------------------------------------
-- View `E-commerce`.`orderview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `E-commerce`.`orderview`;
USE `E-commerce`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `e-commerce`.`orderview` AS select `e-commerce`.`orders`.`orderID` AS `orderid`,`e-commerce`.`orders`.`userID` AS `userid`,`e-commerce`.`orders`.`total` AS `total`,`e-commerce`.`suppliers`.`location` AS `location` from (`e-commerce`.`orders` join `e-commerce`.`suppliers` on(((`e-commerce`.`orders`.`product` = `e-commerce`.`suppliers`.`product`) and (`e-commerce`.`orders`.`supplierID` = `e-commerce`.`suppliers`.`supplierID`))));

-- -----------------------------------------------------
-- View `E-commerce`.`orderviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `E-commerce`.`orderviews`;
USE `E-commerce`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `e-commerce`.`orderviews` AS select `e-commerce`.`orders`.`orderID` AS `orderid`,`e-commerce`.`orders`.`userID` AS `userid`,`e-commerce`.`orders`.`total` AS `total`,`e-commerce`.`suppliers`.`location` AS `location` from (`e-commerce`.`orders` join `e-commerce`.`suppliers` on((`e-commerce`.`orders`.`supplierID` = `e-commerce`.`suppliers`.`supplierID`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
