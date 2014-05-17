SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `project_info` ;
CREATE SCHEMA IF NOT EXISTS `project_info` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `project_info` ;

-- -----------------------------------------------------
-- Table `project_info`.`Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_info`.`Project` (
  `idProject` INT NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(45) NULL,
  `project_language` VARCHAR(45) NULL,
  PRIMARY KEY (`idProject`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_info`.`Metric_Ranges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_info`.`Metric_Ranges` (
  `idMetricRange` INT NOT NULL AUTO_INCREMENT,
  `metric_name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `min` DOUBLE NULL,
  `max` DOUBLE NULL,
  `language_name` VARCHAR(45) NULL,
  `quality_index` VARCHAR(45) NULL,
  PRIMARY KEY (`idMetricRange`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_info`.`Version`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_info`.`Version` (
  `idVersion` INT NOT NULL AUTO_INCREMENT,
  `numberVersion` INT NOT NULL,
  PRIMARY KEY (`idVersion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_info`.`Quality_Project_Metric_Fact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_info`.`Quality_Project_Metric_Fact` (
  `idQuality` INT NOT NULL AUTO_INCREMENT,
  `metric_value` VARCHAR(45) NULL,
  `Project_idproject` INT NOT NULL,
  `Metric_Ranges_idMetricRange` INT NOT NULL,
  `Version_idVersion` INT NOT NULL,
  PRIMARY KEY (`idQuality`),
  INDEX `fk_Quality_Fact_Project1_idx` (`Project_idproject` ASC),
  INDEX `fk_Quality_Project_Metric_Fact_Metric_Ranges1_idx` (`Metric_Ranges_idMetricRange` ASC),
  INDEX `fk_Quality_Project_Metric_Fact_Version1_idx` (`Version_idVersion` ASC),
  CONSTRAINT `fk_Quality_Fact_Project1`
    FOREIGN KEY (`Project_idproject`)
    REFERENCES `project_info`.`Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quality_Project_Metric_Fact_Metric_Ranges1`
    FOREIGN KEY (`Metric_Ranges_idMetricRange`)
    REFERENCES `project_info`.`Metric_Ranges` (`idMetricRange`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quality_Project_Metric_Fact_Version1`
    FOREIGN KEY (`Version_idVersion`)
    REFERENCES `project_info`.`Version` (`idVersion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_info`.`Class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_info`.`Class` (
  `idClass` INT NOT NULL AUTO_INCREMENT,
  `class_name` VARCHAR(200) NULL,
  `hashcode` VARCHAR(45) NULL,
  PRIMARY KEY (`idClass`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_info`.`Quality_Class_Metric_Fact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_info`.`Quality_Class_Metric_Fact` (
  `idQuality_Class` INT NOT NULL AUTO_INCREMENT,
  `metric_value` VARCHAR(45) NULL,
  `Class_idClass` INT NOT NULL,
  `Project_idProject` INT NOT NULL,
  `Metric_Ranges_idMetricRange` INT NOT NULL,
  `Version_idVersion` INT NOT NULL,
  PRIMARY KEY (`idQuality_Class`),
  INDEX `fk_Quality_Class_Metric_Fact_Class1_idx` (`Class_idClass` ASC),
  INDEX `fk_Quality_Class_Metric_Fact_Metric_Ranges1_idx` (`Metric_Ranges_idMetricRange` ASC),
  INDEX `fk_Quality_Class_Metric_Fact_Project1_idx` (`Project_idProject` ASC),
  INDEX `fk_Quality_Class_Metric_Fact_Version1_idx` (`Version_idVersion` ASC),
  CONSTRAINT `fk_Quality_Class_Metric_Fact_Class1`
    FOREIGN KEY (`Class_idClass`)
    REFERENCES `project_info`.`Class` (`idClass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quality_Class_Metric_Fact_Metric_Ranges1`
    FOREIGN KEY (`Metric_Ranges_idMetricRange`)
    REFERENCES `project_info`.`Metric_Ranges` (`idMetricRange`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quality_Class_Metric_Fact_Project1`
    FOREIGN KEY (`Project_idProject`)
    REFERENCES `project_info`.`Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quality_Class_Metric_Fact_Version1`
    FOREIGN KEY (`Version_idVersion`)
    REFERENCES `project_info`.`Version` (`idVersion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `project_info` ;

-- -----------------------------------------------------
-- Placeholder table for view `project_info`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_info`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `project_info`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_info`.`view1`;
USE `project_info`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `project_info`.`Metric_Ranges`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_info`;
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (1, 'LOC', 'Lines of Code', 0, 33, 'java', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (2, 'LOC', 'Lines of Code', 34, 87, 'java', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (3, 'LOC', 'Lines of Code', 88, 200, 'java', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (4, 'LOC', 'Lines of Code', 201, 4294967295, 'java', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (5, 'LOC', 'Lines of Code', 0, 31, 'c++', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (6, 'LOC', 'Lines of Code', 32, 84, 'c++', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (7, 'LOC', 'Lines of Code', 85, 207, 'c++', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (8, 'LOC', 'Lines of Code', 208, 4294967295, 'c++', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (9, 'ACCM', 'Average Cyclomatic Complexity per Method', 0, 2.8, 'java', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (10, 'ACCM', 'Average Cyclomatic Complexity per Method', 2.9, 4.4, 'java', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (11, 'ACCM', 'Average Cyclomatic Complexity per Method', 4.5, 6, 'java', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (12, 'ACCM', 'Average Cyclomatic Complexity per Method', 6.1, 4294967295, 'java', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (13, 'ACCM', 'Average Cyclomatic Complexity per Method', 0, 2, 'c++', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (14, 'ACCM', 'Average Cyclomatic Complexity per Method', 2.1, 4.0, 'c++', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (15, 'ACCM', 'Average Cyclomatic Complexity per Method', 4.1, 6, 'c++', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (16, 'ACCM', 'Average Cyclomatic Complexity per Method', 6.1, 4294967295, 'c++', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (17, 'ACC', 'Afferent Connections per Class', 0, 1, 'java', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (18, 'ACC', 'Afferent Connections per Class', 1.1, 5, 'java', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (19, 'ACC', 'Afferent Connections per Class', 5.1, 12, 'java', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (20, 'ACC', 'Afferent Connections per Class', 12.1, 4294967295, 'java', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (21, 'ACC', 'Afferent Connections per Class', 0, 2, 'c++', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (22, 'ACC', 'Afferent Connections per Class', 2.1, 4, 'c++', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (23, 'ACC', 'Afferent Connections per Class', 4.1, 6, 'c++', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (24, 'ACC', 'Afferent Connections per Class', 6.1, 4294967295, 'c++', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (25, 'RFC', 'Response for Class', 0, 9, 'java', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (26, 'RFC', 'Response for Class', 10, 26, 'java', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (27, 'RFC', 'Response for Class', 27, 59, 'java', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (28, 'RFC', 'Response for Class', 60, 4294967295, 'java', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (29, 'RFC', 'Response for Class', 0, 29, 'c++', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (30, 'RFC', 'Response for Class', 30, 64, 'c++', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (31, 'RFC', 'Response for Class', 65, 102, 'c++', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (32, 'RFC', 'Response for Class', 103, 4294967295, 'c++', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (33, 'LCOM4', 'Lack of Cohesion in Methods', 0, 3, 'java', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (34, 'LCOM4', 'Lack of Cohesion in Methods', 4, 7, 'java', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (35, 'LCOM4', 'Lack of Cohesion in Methods', 8, 12, 'java', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (36, 'LCOM4', 'Lack of Cohesion in Methods', 13, 4294967295, 'java', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (37, 'LCOM4', 'Lack of Cohesion in Methods', 0, 5, 'c++', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (38, 'LCOM4', 'Lack of Cohesion in Methods', 6, 10, 'c++', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (39, 'LCOM4', 'Lack of Cohesion in Methods', 11, 14, 'c++', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (40, 'LCOM4', 'Lack of Cohesion in Methods', 15, 4294967295, 'c++', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (41, 'NOM', 'Number of Methods', 0, 8, 'java', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (42, 'NOM', 'Number of Methods', 9, 17, 'java', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (43, 'NOM', 'Number of Methods', 18, 27, 'java', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (44, 'NOM', 'Number of Methods', 28, 4294967295, 'java', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (45, 'NOM', 'Number of Methods', 0, 10, 'c++', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (46, 'NOM', 'Number of Methods', 11, 17, 'c++', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (47, 'NOM', 'Number of Methods', 18, 26, 'c++', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (48, 'NOM', 'Number of Methods', 27, 4294967295, 'c++', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (49, 'DIT', 'Depth of Inheritance Tree', 0, 2, 'java', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (50, 'DIT', 'Depth of Inheritance Tree', 3, 4, 'java', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (51, 'DIT', 'Depth of Inheritance Tree', 5, 6, 'java', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (52, 'DIT', 'Depth of Inheritance Tree', 7, 4294967295, 'java', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (53, 'DIT', 'Depth of Inheritance Tree', 0, 1, 'c++', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (54, 'DIT', 'Depth of Inheritance Tree', 2, 3, 'c++', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (55, 'DIT', 'Depth of Inheritance Tree', 3, 4, 'c++', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (56, 'DIT', 'Depth of Inheritance Tree', 5, 4294967295, 'c++', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (57, 'NOC', 'Number of Children', 0, 1, 'java', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (58, 'NOC', 'Number of Children', 1.1, 2, 'java', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (59, 'NOC', 'Number of Children', 2.1, 3, 'java', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (60, 'NOC', 'Number of Children', 3.1, 4294967295, 'java', 'Ruim');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (61, 'NOC', 'Number of Children', 0, 0, 'c++', 'Excelente');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (62, 'NOC', 'Number of Children', 1, 1, 'c++', 'Bom');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (63, 'NOC', 'Number of Children', 1.1, 2, 'c++', 'Regular');
INSERT INTO `project_info`.`Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`) VALUES (64, 'NOC', 'Number of Children', 3, 4294967295, 'c++', 'Ruim');

COMMIT;

