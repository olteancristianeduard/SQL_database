-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lefti_olteancristian
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lefti_olteancristian
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lefti_olteancristian` DEFAULT CHARACTER SET utf8 ;
USE `lefti_olteancristian` ;

-- -----------------------------------------------------
-- Table `lefti_olteancristian`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lefti_olteancristian`.`Customers` (
  `Customer_ID` INT NOT NULL AUTO_INCREMENT,
  `Customer_Name` VARCHAR(255) NOT NULL,
  `Other_Details` VARCHAR(255) NULL,
  PRIMARY KEY (`Customer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lefti_olteancristian`.`Locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lefti_olteancristian`.`Locations` (
  `Location_ID` INT NOT NULL AUTO_INCREMENT,
  `Location_Name` VARCHAR(255) NOT NULL,
  `Other_Details` VARCHAR(255) NULL,
  PRIMARY KEY (`Location_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lefti_olteancristian`.`Products_and_Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lefti_olteancristian`.`Products_and_Services` (
  `Service_CD` CHAR(15) NOT NULL,
  `Service_Name` VARCHAR(255) NOT NULL,
  `Service_Description` INT NOT NULL,
  `Other_Details` VARCHAR(255) NULL,
  PRIMARY KEY (`Service_CD`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lefti_olteancristian`.`Ref_Channels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lefti_olteancristian`.`Ref_Channels` (
  `Channel_Code` CHAR(15) NOT NULL,
  `Channel_Name` VARCHAR(255) NOT NULL,
  `Other_Details` VARCHAR(255) NULL,
  `Channel_Phone` VARCHAR(45) NOT NULL,
  `Channel_Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Channel_Code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lefti_olteancristian`.`Platforms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lefti_olteancristian`.`Platforms` (
  `Platform_CD` CHAR(15) NOT NULL,
  `Platform_Description` VARCHAR(255) NOT NULL,
  `Other_Details` VARCHAR(255) NULL,
  PRIMARY KEY (`Platform_CD`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lefti_olteancristian`.`Events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lefti_olteancristian`.`Events` (
  `Event_ID` INT NOT NULL AUTO_INCREMENT,
  `Channel_Code` CHAR(15) NOT NULL,
  `Customer_ID` INT NOT NULL,
  `Location_Origin_ID` INT NOT NULL,
  `Location_Destination_ID` INT NOT NULL,
  `Platform_CD` CHAR(15) NOT NULL,
  `Service_CD` CHAR(15) NOT NULL,
  `Staff_ID` INT NOT NULL,
  `Stard_Date_Time` DATETIME NOT NULL,
  `End_Date_Time` DATETIME NOT NULL,
  `Other_Details` VARCHAR(255) NULL,
  PRIMARY KEY (`Event_ID`),
  INDEX `Location_Origin_ID_idx` (`Location_Origin_ID` ASC),
  INDEX `Customer_ID_idx` (`Customer_ID` ASC),
  INDEX `Location_Destination_ID_idx` (`Location_Destination_ID` ASC),
  INDEX `Service_CD_idx` (`Service_CD` ASC),
  INDEX `Channel_Code_idx` (`Channel_Code` ASC),
  INDEX `Platform_CD_idx` (`Platform_CD` ASC),
  CONSTRAINT `Customer_ID`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `lefti_olteancristian`.`Customers` (`Customer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Location_Origin_ID`
    FOREIGN KEY (`Location_Origin_ID`)
    REFERENCES `lefti_olteancristian`.`Locations` (`Location_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Location_Destination_ID`
    FOREIGN KEY (`Location_Destination_ID`)
    REFERENCES `lefti_olteancristian`.`Locations` (`Location_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Service_CD`
    FOREIGN KEY (`Service_CD`)
    REFERENCES `lefti_olteancristian`.`Products_and_Services` (`Service_CD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Channel_Code`
    FOREIGN KEY (`Channel_Code`)
    REFERENCES `lefti_olteancristian`.`Ref_Channels` (`Channel_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Platform_CD`
    FOREIGN KEY (`Platform_CD`)
    REFERENCES `lefti_olteancristian`.`Platforms` (`Platform_CD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lefti_olteancristian`.`Ref_Document_Types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lefti_olteancristian`.`Ref_Document_Types` (
  `Document_Type_Code` CHAR(15) NOT NULL,
  `Document_Type_Description` VARCHAR(255) NULL,
  PRIMARY KEY (`Document_Type_Code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lefti_olteancristian`.`Documents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lefti_olteancristian`.`Documents` (
  `Document_ID` INT NOT NULL AUTO_INCREMENT,
  `Document_Type_Code` CHAR(15) NOT NULL,
  `Event_Doc_ID` INT NOT NULL,
  `Document_Name` VARCHAR(255) NOT NULL,
  `Document_Description` VARCHAR(255) NOT NULL,
  `Other_Details` VARCHAR(255) NULL,
  PRIMARY KEY (`Document_ID`),
  INDEX `Document_Type_Code_idx` (`Document_Type_Code` ASC),
  INDEX `Event_Doc_ID_idx` (`Event_Doc_ID` ASC),
  CONSTRAINT `Document_Type_Code`
    FOREIGN KEY (`Document_Type_Code`)
    REFERENCES `lefti_olteancristian`.`Ref_Document_Types` (`Document_Type_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Event_Doc_ID`
    FOREIGN KEY (`Event_Doc_ID`)
    REFERENCES `lefti_olteancristian`.`Events` (`Event_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lefti_olteancristian`.`Ref_Payment_Methods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lefti_olteancristian`.`Ref_Payment_Methods` (
  `Payment_Method_Code` CHAR(15) NOT NULL,
  `Payment_Method_Name` VARCHAR(255) NOT NULL,
  `Other_Details` VARCHAR(255) NULL,
  PRIMARY KEY (`Payment_Method_Code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lefti_olteancristian`.`Payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lefti_olteancristian`.`Payments` (
  `Payment_ID` INT NOT NULL AUTO_INCREMENT,
  `Event_Payment_ID` INT NOT NULL,
  `Payment_Method_Code` CHAR(15) NOT NULL,
  `Payment_Date_Time` DATETIME NOT NULL,
  `Payment_Amount` INT NOT NULL,
  `Other_Details` VARCHAR(255) NULL,
  PRIMARY KEY (`Payment_ID`),
  INDEX `Payment_Method_Code_idx` (`Payment_Method_Code` ASC),
  INDEX `Event_Payment_ID_idx` (`Event_Payment_ID` ASC),
  CONSTRAINT `Payment_Method_Code`
    FOREIGN KEY (`Payment_Method_Code`)
    REFERENCES `lefti_olteancristian`.`Ref_Payment_Methods` (`Payment_Method_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Event_Payment_ID`
    FOREIGN KEY (`Event_Payment_ID`)
    REFERENCES `lefti_olteancristian`.`Events` (`Event_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

########################################################
########################################################
########################################################

-- -----------------------------------------------------
-- Inserting data into tables
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Insert data into table `Customers`
-- -----------------------------------------------------
INSERT INTO `Customers`(`Customer_Name`, `Other_Details`) 
VALUES ('Edi','student'),
('Paul','programator'),
('Andrada','studenta'),
('Dorel','mester'),
('Manu','sofer');


-- -----------------------------------------------------
-- Insert data into table `Locations`
-- -----------------------------------------------------
INSERT INTO `Locations`(`Location_Name`, `Other_Details`) 
VALUES ('Buzias','sala in aer liber'),
('Timisoara','sala de conferinta'),
('Lugoj','sala de conferinta'),
('Silagiu','camin cultural'),
('Bucuresti','sala de conferinta');


-- -----------------------------------------------------
-- Insert data into table `Platforms`
-- -----------------------------------------------------
INSERT INTO `Platforms`(`Platform_CD`, `Platform_Description`, `Other_Details`) 
VALUES ('F2F','Format fizic','intalnirea se realizeaza fata in fata'),
('Z','Zoom','format online'),
('T','Teams','format online'),
('G','Google Meeting','format online'),
('S','Skype','format online');


-- -----------------------------------------------------
-- Insert data into table `Products_and_Services`
-- -----------------------------------------------------
INSERT INTO `Products_and_Services`(`Service_CD`, `Service_Name`, `Service_Description`, `Other_Details`) 
VALUES ('S1','Curs initiere',1,'curs pentru angajatii noi'),
('S2','Consultanta',2,'consultanta cu clientii face to face'),
('S3','Curs programare',3,'curs de programare pentru incepatori'),
('S4','Curs electronica',4,'curs de electronica pentru incepatori'),
('S5','Depanare',5,'depanarea aparatelor din dotare');


-- -----------------------------------------------------
-- Insert data into table `Ref_Channels`
-- -----------------------------------------------------
INSERT INTO `Ref_Channels`(`Channel_Code`, `Channel_Name`, `Other_Details`, `Channel_Phone`, `Channel_Email`) 
VALUES ('CH1','Canalul 1','','0711 111 111','canal1@yahoo.com'),
('CH2','Canalul 2','','0722 222 222','canal2@yahoo.com'),
('CH3','Canalul 3','','0733 333 333','canal3@yahoo.com'),
('CH4','Canalul 4','','0744 444 444','canal4@yahoo.com'),
('CH5','Canalul 5','','0755 555 555','canal5@yahoo.com');


-- -----------------------------------------------------
-- Insert data into table `Ref_Document_Types`
-- -----------------------------------------------------
INSERT INTO `Ref_Document_Types`(`Document_Type_Code`, `Document_Type_Description`) 
VALUES ('DOC1','verificare anuala'),
('DOC2','verificare la 2 ani'),
('DOC3','veerificare lunara'),
('DOC4','verificare saptamanal'),
('DOC5','verificare zilnica');


-- -----------------------------------------------------
-- Insert data into table `Documents`
-- -----------------------------------------------------
INSERT INTO `Documents`(`Document_Type_Code`, `Event_Doc_ID`, `Document_Name`, `Document_Description`, `Other_Details`) 
VALUES ('DOC1','2','Certificat sringatoare','',''),
('DOC2','3','Certificat iesiri de urgenta','',''),
('DOC4','4','Certificat pentru autorizarea cadrelor didactice','',''),
('DOC4','1','Certificarea studilor','',''),
('DOC5','5','Certificarea personalului','','');


-- -----------------------------------------------------
-- Insert data into table `Events`
-- -----------------------------------------------------
INSERT INTO `Events`(`Channel_Code`, `Customer_ID`, `Location_Origin_ID`, `Location_Destination_ID`, `Platform_CD`, `Service_CD`, `Staff_ID`, `Stard_Date_Time`, `End_Date_Time`, `Other_Details`) 
VALUES ('CH2', 2, 1, 2, 'F2F', 'S1', 1,'2022-10-10 10:10:30','2022-10-10 12:10:30',''),
('CH2', 3, 2, 3, 'F2F', 'S3', 1,'2022-09-10 10:10:30','2022-10-10 10:10:30',''),
('CH3', 4, 3, 4, 'F2F', 'S5', 1,'2022-10-10 10:10:30','2022-11-10 10:10:30',''),
('CH4', 1, 4, 5, 'F2F', 'S3', 1,'2022-10-10 10:10:30','2022-10-11 10:10:30',''),
('CH5', 5, 5, 6, 'F2F', 'S2', 1,'2022-10-10 10:10:30','2022-10-12 10:10:30','');


-- -----------------------------------------------------
-- Insert data into table `Ref_Payment_Methods`
-- -----------------------------------------------------
INSERT INTO `Ref_Payment_Methods`(`Payment_Method_Code`, `Payment_Method_Name`, `Other_Details`) 
VALUES ('PM1','Cash',''),
('PM2','Credit card',''),
('PM3','Bonus points',''),
('PM4','Free',''),
('PM5','Promotion','');


-- -----------------------------------------------------
-- Insert data into table `Payments`
-- -----------------------------------------------------
INSERT INTO `Payments`(`Event_Payment_ID`, `Payment_Method_Code`, `Payment_Date_Time`, `Payment_Amount`, `Other_Details`) 
VALUES (2,'PM1','2022-10-10 10:10:30','90',''),
(1,'PM3','2022-10-10 10:10:30','50',''),
(4,'PM4','2022-10-10 10:10:30','0',''),
(5,'PM1','2022-10-10 10:10:30','90',''),
(3,'PM2','2022-10-10 10:10:30','90','');








SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
