SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema source_info
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `source_info` ;
CREATE SCHEMA IF NOT EXISTS `source_info` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `source_info` ;

-- -----------------------------------------------------
-- Table `source_info`.`D_Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`D_Project` (
  `idProject` INT NOT NULL AUTO_INCREMENT,
  `project_abbreviation` VARCHAR(45) NULL,
  `project_name` VARCHAR(45) NULL,
  `project_language` VARCHAR(45) NULL,
  `organization_owner` VARCHAR(45) NULL,
  PRIMARY KEY (`idProject`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `source_info`.`D_Quality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`D_Quality` (
  `idQuality` INT NOT NULL,
  `quality_index` VARCHAR(45) NULL,
  PRIMARY KEY (`idQuality`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `source_info`.`D_Configuration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`D_Configuration` (
  `idConfiguration` INT NOT NULL,
  `configuration_name` VARCHAR(45) NULL,
  `software_reference_name` VARCHAR(45) NULL,
  `language_name` VARCHAR(45) NULL,
  `software_repository_address` VARCHAR(45) NULL,
  PRIMARY KEY (`idConfiguration`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `source_info`.`D_Release`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`D_Release` (
  `idRelease` INT NOT NULL,
  `release_name` VARCHAR(45) NULL,
  `release_number` INT NULL,
  PRIMARY KEY (`idRelease`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `source_info`.`D_Time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`D_Time` (
  `idTime` INT NOT NULL,
  `Month` DECIMAL(10,0) NULL,
  `Year` DECIMAL(10,0) NULL,
  PRIMARY KEY (`idTime`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `source_info`.`D_Metric`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`D_Metric` (
  `idMetric` INT NOT NULL,
  `metric_abbreviation` VARCHAR(45) NULL,
  `metric_name` VARCHAR(45) NULL,
  `metric_category` VARCHAR(45) NULL,
  PRIMARY KEY (`idMetric`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `source_info`.`F_Project_Metric`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`F_Project_Metric` (
  `idQuality` INT NOT NULL AUTO_INCREMENT,
  `percentil_value` DOUBLE NULL,
  `D_Project_idProject` INT NOT NULL,
  `D_Metric_idMetric` INT NOT NULL,
  `D_Quality_idQuality` INT NOT NULL,
  `D_Configuration_idConfiguration` INT NOT NULL,
  `D_Release_idRelease` INT NOT NULL,
  `D_Time_idTime` INT NOT NULL,
  PRIMARY KEY (`idQuality`),
  INDEX `fk_F_Project_Metric_D_Quality1_idx` (`D_Quality_idQuality` ASC),
  INDEX `fk_F_Project_Metric_D_Project1_idx` (`D_Project_idProject` ASC),
  INDEX `fk_F_Project_Metric_D_Configuration1_idx` (`D_Configuration_idConfiguration` ASC),
  INDEX `fk_F_Project_Metric_D_Release1_idx` (`D_Release_idRelease` ASC),
  INDEX `fk_F_Project_Metric_D_Time1_idx` (`D_Time_idTime` ASC),
  INDEX `fk_F_Project_Metric_D_Metric1_idx` (`D_Metric_idMetric` ASC),
  CONSTRAINT `fk_F_Project_Metric_D_Quality1`
    FOREIGN KEY (`D_Quality_idQuality`)
    REFERENCES `source_info`.`D_Quality` (`idQuality`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_Project_Metric_D_Project1`
    FOREIGN KEY (`D_Project_idProject`)
    REFERENCES `source_info`.`D_Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_Project_Metric_D_Configuration1`
    FOREIGN KEY (`D_Configuration_idConfiguration`)
    REFERENCES `source_info`.`D_Configuration` (`idConfiguration`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_Project_Metric_D_Release1`
    FOREIGN KEY (`D_Release_idRelease`)
    REFERENCES `source_info`.`D_Release` (`idRelease`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_Project_Metric_D_Time1`
    FOREIGN KEY (`D_Time_idTime`)
    REFERENCES `source_info`.`D_Time` (`idTime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_Project_Metric_D_Metric1`
    FOREIGN KEY (`D_Metric_idMetric`)
    REFERENCES `source_info`.`D_Metric` (`idMetric`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `source_info`.`D_Class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`D_Class` (
  `idClass` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `hashcode` VARCHAR(45) NULL,
  PRIMARY KEY (`idClass`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `source_info`.`Meta_Metric_Ranges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`Meta_Metric_Ranges` (
  `idMetricRange` INT NOT NULL AUTO_INCREMENT,
  `metric_name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `min` DOUBLE NULL,
  `max` DOUBLE NULL,
  `language_name` VARCHAR(45) NULL,
  `quality_index` VARCHAR(45) NULL,
  `configuration_name` VARCHAR(45) NULL,
  PRIMARY KEY (`idMetricRange`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `source_info`.`D_Scenario_Clean_Code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`D_Scenario_Clean_Code` (
  `idScenario` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idScenario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `source_info`.`F_Scenario_Class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`F_Scenario_Class` (
  `idScenarioFact` INT NOT NULL,
  `D_Scenario_Clean_Code_idScenario` INT NOT NULL,
  `D_Project_idProject` INT NOT NULL,
  `D_Release_idRelease` INT NOT NULL,
  `D_Class_idClass` INT NOT NULL,
  PRIMARY KEY (`idScenarioFact`),
  INDEX `fk_F_Scenario_Class_D_Scenario_Clean_Code1_idx` (`D_Scenario_Clean_Code_idScenario` ASC),
  INDEX `fk_F_Scenario_Class_D_Project1_idx` (`D_Project_idProject` ASC),
  INDEX `fk_F_Scenario_Class_D_Release1_idx` (`D_Release_idRelease` ASC),
  INDEX `fk_F_Scenario_Class_D_Class1_idx` (`D_Class_idClass` ASC),
  CONSTRAINT `fk_F_Scenario_Class_D_Scenario_Clean_Code1`
    FOREIGN KEY (`D_Scenario_Clean_Code_idScenario`)
    REFERENCES `source_info`.`D_Scenario_Clean_Code` (`idScenario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_Scenario_Class_D_Project1`
    FOREIGN KEY (`D_Project_idProject`)
    REFERENCES `source_info`.`D_Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_Scenario_Class_D_Release1`
    FOREIGN KEY (`D_Release_idRelease`)
    REFERENCES `source_info`.`D_Release` (`idRelease`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_Scenario_Class_D_Class1`
    FOREIGN KEY (`D_Class_idClass`)
    REFERENCES `source_info`.`D_Class` (`idClass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `source_info`.`Meta_Scenario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`Meta_Scenario` (
  `idMeta_Scenario` INT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idMeta_Scenario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `source_info`.`Meta_Metric_Ranges_Meta_Scenario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (
  `idMeta_Scenario_Ranges` INT NOT NULL,
  `Meta_Scenario_idMeta_Scenario` INT NULL,
  `Meta_Metric_Ranges_idMetricRange1` INT NULL,
  `Meta_Metric_Ranges_idMetricRange2` INT NULL,
  INDEX `fk_Meta_Metric_Ranges_has_Meta_Scenario_Meta_Scenario1_idx` (`Meta_Scenario_idMeta_Scenario` ASC),
  INDEX `fk_Meta_Metric_Ranges_has_Meta_Scenario_Meta_Metric_Ranges1_idx` (`Meta_Metric_Ranges_idMetricRange1` ASC),
  INDEX `fk_Meta_Metric_Ranges_has_Meta_Scenario_Meta_Metric_Ranges2_idx` (`Meta_Metric_Ranges_idMetricRange2` ASC),
  PRIMARY KEY (`idMeta_Scenario_Ranges`),
  CONSTRAINT `fk_Meta_Metric_Ranges_has_Meta_Scenario_Meta_Metric_Ranges1`
    FOREIGN KEY (`Meta_Metric_Ranges_idMetricRange1`)
    REFERENCES `source_info`.`Meta_Metric_Ranges` (`idMetricRange`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Meta_Metric_Ranges_has_Meta_Scenario_Meta_Scenario1`
    FOREIGN KEY (`Meta_Scenario_idMeta_Scenario`)
    REFERENCES `source_info`.`Meta_Scenario` (`idMeta_Scenario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Meta_Metric_Ranges_has_Meta_Scenario_Meta_Metric_Ranges2`
    FOREIGN KEY (`Meta_Metric_Ranges_idMetricRange2`)
    REFERENCES `source_info`.`Meta_Metric_Ranges` (`idMetricRange`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `source_info`.`D_Quality`
-- -----------------------------------------------------
START TRANSACTION;
USE `source_info`;
INSERT INTO `source_info`.`D_Quality` (`idQuality`, `quality_index`) VALUES (1, 'Excelente');
INSERT INTO `source_info`.`D_Quality` (`idQuality`, `quality_index`) VALUES (2, 'Bom');
INSERT INTO `source_info`.`D_Quality` (`idQuality`, `quality_index`) VALUES (3, 'Regular');
INSERT INTO `source_info`.`D_Quality` (`idQuality`, `quality_index`) VALUES (4, 'Ruim');

COMMIT;


-- -----------------------------------------------------
-- Data for table `source_info`.`D_Configuration`
-- -----------------------------------------------------
START TRANSACTION;
USE `source_info`;
INSERT INTO `source_info`.`D_Configuration` (`idConfiguration`, `configuration_name`, `software_reference_name`, `language_name`, `software_repository_address`) VALUES (1, 'Open JDK8 Metrics', 'Open JDK8', 'java', 'http://hg.openjdk.java.net/jdk8');
INSERT INTO `source_info`.`D_Configuration` (`idConfiguration`, `configuration_name`, `software_reference_name`, `language_name`, `software_repository_address`) VALUES (2, 'Tomcat Metrics', 'Tomcat', 'java', 'git://git.apache.org/tomcat70.git');

COMMIT;


-- -----------------------------------------------------
-- Data for table `source_info`.`D_Metric`
-- -----------------------------------------------------
START TRANSACTION;
USE `source_info`;
INSERT INTO `source_info`.`D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES (1, 'LOC', 'Lines of Code', 'Source Code Metric');
INSERT INTO `source_info`.`D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES (2, 'ACCM', 'Average Cyclomatic Complexity per Method', 'Source Code Metric');
INSERT INTO `source_info`.`D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES (3, 'AMLOC', 'Average Method Lines of Code', 'Source Code Metric');
INSERT INTO `source_info`.`D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES (4, 'ACC', 'Afferent Connections per Class', 'Source Code Metric');
INSERT INTO `source_info`.`D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES (5, 'ANPM', 'Average Number of Parameters per Method', 'Source Code Metric');
INSERT INTO `source_info`.`D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES (6, 'CBO', 'Coupling Between Objects', 'Source Code Metric');
INSERT INTO `source_info`.`D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES (7, 'DIT', 'Depth of Inheritance Tree', 'Source Code Metric');
INSERT INTO `source_info`.`D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES (8, 'LCOM4', 'Lack of Cohesion in Methods', 'Source Code Metric');
INSERT INTO `source_info`.`D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES (9, 'NOC', 'Number of Children', 'Source Code Metric');
INSERT INTO `source_info`.`D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES (10, 'NOM', 'Number of Methods', 'Source Code Metric');
INSERT INTO `source_info`.`D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES (11, 'NPA', 'Number of Public Attributes', 'Source Code Metric');
INSERT INTO `source_info`.`D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES (12, 'RFC', 'Response for Class', 'Source Code Metric');

COMMIT;


-- -----------------------------------------------------
-- Data for table `source_info`.`Meta_Metric_Ranges`
-- -----------------------------------------------------
START TRANSACTION;
USE `source_info`;
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (1, 'LOC', 'Lines of Code', 0, 33, 'java', 'Excelente', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (2, 'LOC', 'Lines of Code', 34, 87, 'java', 'Bom', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (3, 'LOC', 'Lines of Code', 88, 200, 'java', 'Regular', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (4, 'LOC', 'Lines of Code', 200, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (5, 'LOC', 'Lines of Code', 0, 33, 'java', 'Excelente', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (6, 'LOC', 'Lines of Code', 34, 105, 'java', 'Bom', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (7, 'LOC', 'Lines of Code', 106, 276, 'java', 'Regular', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (8, 'LOC', 'Lines of Code', 276, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (9, 'ACCM', 'Average Cyclomatic Complexity per Method', 0, 2.8, 'java', 'Excelente', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (10, 'ACCM', 'Average Cyclomatic Complexity per Method', 2.9, 4.4, 'java', 'Bom', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (11, 'ACCM', 'Average Cyclomatic Complexity per Method', 4.5, 6, 'java', 'Regular', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (12, 'ACCM', 'Average Cyclomatic Complexity per Method', 6.1, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (13, 'ACCM', 'Average Cyclomatic Complexity per Method', 0, 3.1, 'java', 'Excelente', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (14, 'ACCM', 'Average Cyclomatic Complexity per Method', 3.1, 4.0, 'java', 'Bom', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (15, 'ACCM', 'Average Cyclomatic Complexity per Method', 4.1, 6, 'java', 'Regular', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (16, 'ACCM', 'Average Cyclomatic Complexity per Method', 6.1, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (17, 'AMLOC', 'Average Method Lines of Code', 0, 8.3, 'java', 'Excelente', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (18, 'AMLOC', 'Average Method Lines of Code', 8.4, 18, 'java', 'Bom', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (19, 'AMLOC', 'Average Method Lines of Code', 19, 34, 'java', 'Regular', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (20, 'AMLOC', 'Average Method Lines of Code', 35, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (21, 'AMLOC', 'Average Method Lines of Code', 0, 8.0, 'java', 'Excelente', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (22, 'AMLOC', 'Average Method Lines of Code', 8.1, 16, 'java', 'Bom', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (23, 'AMLOC', 'Average Method Lines of Code', 16.1, 27, 'java', 'Regular', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (24, 'AMLOC', 'Average Method Lines of Code', 27, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (25, 'ACC', 'Afferent Connections per Class', 0, 1, 'java', 'Excelente', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (26, 'ACC', 'Afferent Connections per Class', 1.1, 5, 'java', 'Bom', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (27, 'ACC', 'Afferent Connections per Class', 5.1, 12, 'java', 'Regular', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (28, 'ACC', 'Afferent Connections per Class', 12.1, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (29, 'ACC', 'Afferent Connections per Class', 0, 1, 'java', 'Excelente', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (30, 'ACC', 'Afferent Connections per Class', 1.1, 5.0, 'java', 'Bom', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (31, 'ACC', 'Afferent Connections per Class', 5.1, 13, 'java', 'Regular', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (32, 'ACC', 'Afferent Connections per Class', 13.1, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (33, 'ANPM', 'Average Number of Parameters per Method', 0, 1.5, 'java', 'Excelente', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (34, 'ANPM', 'Average Number of Parameters per Method', 1.6, 2.3, 'java', 'Bom', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (35, 'ANPM', 'Average Number of Parameters per Method', 2.4, 3.0, 'java', 'Regular', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (36, 'ANPM', 'Average Number of Parameters per Method', 3.1, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (37, 'ANPM', 'Average Number of Parameters per Method', 0, 2.0, 'java', 'Excelente', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (38, 'ANPM', 'Average Number of Parameters per Method', 2.1, 3.0, 'java', 'Bom', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (39, 'ANPM', 'Average Number of Parameters per Method', 3.1, 5.0, 'java', 'Regular', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (40, 'ANPM', 'Average Number of Parameters per Method', 5.1, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (41, 'CBO', 'Coupling Between Objects', 0, 3, 'java', 'Excelente', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (42, 'CBO', 'Coupling Between Objects', 4, 6, 'java', 'Bom', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (43, 'CBO', 'Coupling Between Objects', 7, 9, 'java', 'Regular', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (44, 'CBO', 'Coupling Between Objects', 10, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (45, 'CBO', 'Coupling Between Objects', 0, 2.0, 'java', 'Excelente', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (46, 'CBO', 'Coupling Between Objects', 3, 5, 'java', 'Bom', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (47, 'CBO', 'Coupling Between Objects', 5, 7, 'java', 'Regular', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (48, 'CBO', 'Coupling Between Objects', 8, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (49, 'DIT', 'Depth of Inheritance Tree', 0, 2, 'java', 'Excelente', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (50, 'DIT', 'Depth of Inheritance Tree', 3, 4, 'java', 'Bom', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (51, 'DIT', 'Depth of Inheritance Tree', 5, 6, 'java', 'Regular', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (52, 'DIT', 'Depth of Inheritance Tree', 7, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (53, 'DIT', 'Depth of Inheritance Tree', 0, 1, 'java', 'Excelente', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (54, 'DIT', 'Depth of Inheritance Tree', 2, 3, 'java', 'Bom', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (55, 'DIT', 'Depth of Inheritance Tree', 4, 4, 'java', 'Regular', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (56, 'DIT', 'Depth of Inheritance Tree', 5, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (57, 'LCOM4', 'Lack of Cohesion in Methods', 0, 3, 'java', 'Excelente', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (58, 'LCOM4', 'Lack of Cohesion in Methods', 4, 7, 'java', 'Bom', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (59, 'LCOM4', 'Lack of Cohesion in Methods', 8, 12, 'java', 'Regular', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (60, 'LCOM4', 'Lack of Cohesion in Methods', 13, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (61, 'LCOM4', 'Lack of Cohesion in Methods', 0, 3.0, 'java', 'Excelente', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (62, 'LCOM4', 'Lack of Cohesion in Methods', 4, 7, 'java', 'Bom', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (63, 'LCOM4', 'Lack of Cohesion in Methods', 8, 11, 'java', 'Regular', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (64, 'LCOM4', 'Lack of Cohesion in Methods', 12, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (65, 'NOC', 'Number of Children', 0, 0, 'java', 'Excelente', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (66, 'NOC', 'Number of Children', 1, 2, 'java', 'Bom', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (67, 'NOC', 'Number of Children', 3, 3, 'java', 'Regular', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (68, 'NOC', 'Number of Children', 4, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (69, 'NOC', 'Number of Children', 0, 0, 'java', 'Excelente', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (70, 'NOC', 'Number of Children', 1, 2, 'java', 'Bom', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (71, 'NOC', 'Number of Children', 3, 3, 'java', 'Regular', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (72, 'NOC', 'Number of Children', 4, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (73, 'NOM', 'Number of Methods', 0, 8, 'java', 'Excelente', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (74, 'NOM', 'Number of Methods', 9, 17, 'java', 'Bom', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (75, 'NOM', 'Number of Methods', 18, 27, 'java', 'Regular', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (76, 'NOM', 'Number of Methods', 28, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (77, 'NOM', 'Number of Methods', 0, 10, 'java', 'Excelente', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (78, 'NOM', 'Number of Methods', 11, 21, 'java', 'Bom', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (79, 'NOM', 'Number of Methods', 22, 35, 'java', 'Regular', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (80, 'NOM', 'Number of Methods', 36, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (81, 'NPA', 'Number of Public Attributes', 0, 0, 'java', 'Excelente', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (82, 'NPA', 'Number of Public Attributes', 1, 1, 'java', 'Bom', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (83, 'NPA', 'Number of Public Attributes', 2, 3, 'java', 'Regular', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (84, 'NPA', 'Number of Public Attributes', 4, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (85, 'NPA', 'Number of Public Attributes', 0, 0, 'java', 'Excelente', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (86, 'NPA', 'Number of Public Attributes', 1, 1, 'java', 'Bom', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (87, 'NPA', 'Number of Public Attributes', 2, 3, 'java', 'Regular', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (88, 'NPA', 'Number of Public Attributes', 4, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (89, 'RFC', 'Response for Class', 0, 9, 'java', 'Excelente', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (90, 'RFC', 'Response for Class', 10, 26, 'java', 'Bom', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (91, 'RFC', 'Response for Class', 27, 59, 'java', 'Regular', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (92, 'RFC', 'Response for Class', 59, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (93, 'RFC', 'Response for Class', 0, 11, 'java', 'Excelente', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (94, 'RFC', 'Response for Class', 12, 30, 'java', 'Bom', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (95, 'RFC', 'Response for Class', 31, 74, 'java', 'Regular', 'Tomcat Metrics');
INSERT INTO `source_info`.`Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES (96, 'RFC', 'Response for Class', 75, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');

COMMIT;


-- -----------------------------------------------------
-- Data for table `source_info`.`D_Scenario_Clean_Code`
-- -----------------------------------------------------
START TRANSACTION;
USE `source_info`;
INSERT INTO `source_info`.`D_Scenario_Clean_Code` (`idScenario`, `name`) VALUES (1, 'Classe Pouco Coesa');
INSERT INTO `source_info`.`D_Scenario_Clean_Code` (`idScenario`, `name`) VALUES (2, 'Interface dos Métodos');
INSERT INTO `source_info`.`D_Scenario_Clean_Code` (`idScenario`, `name`) VALUES (3, 'Classes com muitos filhos');
INSERT INTO `source_info`.`D_Scenario_Clean_Code` (`idScenario`, `name`) VALUES (4, 'Classe com métodos grandes e/ou muitos condicionais');
INSERT INTO `source_info`.`D_Scenario_Clean_Code` (`idScenario`, `name`) VALUES (5, 'Classe com muita Exposição ');
INSERT INTO `source_info`.`D_Scenario_Clean_Code` (`idScenario`, `name`) VALUES (6, 'Complexidade Estrutural');

COMMIT;


-- -----------------------------------------------------
-- Data for table `source_info`.`Meta_Scenario`
-- -----------------------------------------------------
START TRANSACTION;
USE `source_info`;
INSERT INTO `source_info`.`Meta_Scenario` (`idMeta_Scenario`, `name`) VALUES (1, 'Classe Pouco Coesa');
INSERT INTO `source_info`.`Meta_Scenario` (`idMeta_Scenario`, `name`) VALUES (2, 'Interface dos Métodos');
INSERT INTO `source_info`.`Meta_Scenario` (`idMeta_Scenario`, `name`) VALUES (3, 'Classes com muitos filhos');
INSERT INTO `source_info`.`Meta_Scenario` (`idMeta_Scenario`, `name`) VALUES (4, 'Classe com métodos grandes e/ou muitos condicionais');
INSERT INTO `source_info`.`Meta_Scenario` (`idMeta_Scenario`, `name`) VALUES (5, 'Classe com muita Exposição ');
INSERT INTO `source_info`.`Meta_Scenario` (`idMeta_Scenario`, `name`) VALUES (6, 'Complexidade Estrutural');

COMMIT;


-- -----------------------------------------------------
-- Data for table `source_info`.`Meta_Metric_Ranges_Meta_Scenario`
-- -----------------------------------------------------
START TRANSACTION;
USE `source_info`;
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (1, 1, 59, 91);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (2, 1, 59, 92);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (3, 1, 60, 91);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (4, 1, 60, 92);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (5, 2, 35, NULL);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (6, 2, 36, NULL);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (7, 3, 51, NULL);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (8, 3, 52, NULL);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (9, 4, 11, 19);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (10, 4, 11, 20);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (11, 4, 12, 19);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (12, 4, 12, 20);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (13, 5, 83, NULL);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (14, 5, 84, NULL);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (15, 6, 43, 59);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (16, 6, 43, 60);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (17, 6, 44, 59);
INSERT INTO `source_info`.`Meta_Metric_Ranges_Meta_Scenario` (`idMeta_Scenario_Ranges`, `Meta_Scenario_idMeta_Scenario`, `Meta_Metric_Ranges_idMetricRange1`, `Meta_Metric_Ranges_idMetricRange2`) VALUES (18, 6, 44, 60);

COMMIT;




