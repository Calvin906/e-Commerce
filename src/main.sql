-- MySQL Script generated by MySQL Workbench
-- Thu Apr 27 11:15:23 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

/* 
 * Sql script to create and populate tables
 * You need to run this script with an authorized user.
 * to run this file @ mysql client :mysql> source path-to\E-Commerce.sql
 * data files for load on desktop
 */
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

SHOW DATABASES;

-- -----------------------------------------------------
-- Schema cs157b
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cs157b` ;
SHOW DATABASES;
-- -----------------------------------------------------
-- Schema cs157b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs157b` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `cs157b` ;

-- -----------------------------------------------------
-- Table `cs157b`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cs157b`.`User` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `cs157b`.`User` (
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NOT NULL,
  `UserID` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cs157b`.`Suppliers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cs157b`.`Suppliers` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `cs157b`.`Suppliers` (
  `Product` VARCHAR(45) NULL,
  `Price` REAL NULL,
  `Location` VARCHAR(45),
  `Quantity` REAL NULL,
  `SupplierID` INT NOT NULL AUTO_INCREMENT,  
   PRIMARY KEY (`SupplierID`))
ENGINE = InnoDB;

SHOW WARNINGS;


-- -----------------------------------------------------
-- Table `cs157b`.`Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cs157b`.`Orders` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `cs157b`.`Orders` (
  `UserID` INT NULL,
  `Product` VARCHAR(45) NULL,
  `Quantity` REAL NULL,
  `UnitPrice` REAL NULL,
  `TotalPrice` REAL NULL,
  `SupplierID` INT NULL,
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID_idx` (`UserID` ASC),
  INDEX `SupplierID_idx` (`SupplierID` ASC),
  CONSTRAINT `UserID`
    FOREIGN KEY (`UserID`)
    REFERENCES `cs157b`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SupplierID`
    FOREIGN KEY (`SupplierID`)
    REFERENCES `cs157b`.`Suppliers` (`SupplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;



show tables;

LOAD DATA LOCAL INFILE 'C:\\Users\\BikramSingh\\Desktop\\users_data.txt' INTO TABLE user FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' ;
SELECT * FROM User;

LOAD DATA LOCAL INFILE 'C:\\Users\\BikramSingh\\Desktop\\suppliers_data.txt' INTO TABLE Suppliers FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' ;
SELECT * FROM Suppliers;

LOAD DATA LOCAL INFILE 'C:\\Users\\BikramSingh\\Desktop\\orders_data.txt' INTO TABLE Orders FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' ;
SELECT * FROM ORDERS;


/* find all the suppliers in San Jose */
select 'Find all the suppliers in San Jose' AS '';
SELECT SupplierID FROM Suppliers WHERE Location Like 'San Jose%';

/* How many registered users the website has? */
select 'Find all registered users the website has' AS '';
SELECT COUNT(userID) FROM user;

 

/* How many orders has quanity more than 2? */
select 'Find all the orders with quanity more than 2' AS '';
SELECT COUNT(orderId) FROM orders where Quantity > 2;

/* Find all the orders shipped from San Jose */
select 'Find all the orders shipped from San Jose ' AS '';
SELECT * FROM orders, suppliers where orders.supplierID = suppliers.supplierID AND Suppliers.Location LIKE 'san jose%';


/* Find all the buyers and their suppliers */
select 'Find all the buyers and their suppliers' AS '';
select u.name, a.supplierID from (select distinct userID, supplierID from orders) a, user u  Where a.userID=u.userid;


/* Which users had orders that cost more than 200 dollars? */
select 'Find all the buyers and their suppliers' AS '';
select u.name from (select distinct userID from orders where totalprice > 200) a, user u  Where a.userID=u.userid;


/* What is the total dollar count for all the orders? */
select 'What is the total dollar count for all the orders' AS '';
select sum(totalprice) from orders;










SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
