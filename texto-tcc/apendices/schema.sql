SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0; SET
@OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS,  FOREIGN_KEY_CHECKS=0;

DROP SCHEMA IF EXISTS `dwing4` ;
CREATE SCHEMA IF NOT EXISTS `dwing4` DEFAULT CHARACTER 
SET utf8 COLLATE utf8_general_ci ;
USE `dwing4` ;

-- -----------------------------------------------------
-- Table `dwing4`.`Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwing4`.`Project` (
  `idproject` INT NOT NULL,
  `project name` VARCHAR(45) NULL,
  PRIMARY KEY (`idproject`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dwing4`.`Metric`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwing4`.`Metric` (
  `idMetric` INT NOT NULL AUTO_INCREMENT,
  `metric name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`idMetric`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dwing4`.`Time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwing4`.`Time` (
  `idTime` INT NOT NULL AUTO_INCREMENT,
  `Day` INT NULL,
  `Month` INT NULL,
  `Year` INT NULL,
  `CompleteDate` DATE NULL,
  PRIMARY KEY (`idTime`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dwing4`.`Language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwing4`.`Language` (
  `idLanguage` INT NOT NULL AUTO_INCREMENT,
  `language name` VARCHAR(45) NULL,
  PRIMARY KEY (`idLanguage`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dwing4`.`Range`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwing4`.`Range` (
  `idInterval` INT NOT NULL AUTO_INCREMENT,
  `min` FLOAT NULL,
  `max` FLOAT NULL,
  `quality_index` VARCHAR(45) NULL,
  `Metric_idMetric` INT NOT NULL,
  `Language_idLanguage` INT NOT NULL,
  PRIMARY KEY (`idInterval`, `Metric_idMetric`, 
    `Language_idLanguage`),
  INDEX `fk_Range_Metric1_idx` (`Metric_idMetric` ASC),
  INDEX `fk_Range_Language1_idx` (`Language_idLanguage` ASC),
  CONSTRAINT `fk_Range_Metric1`
    FOREIGN KEY (`Metric_idMetric`)
    REFERENCES `dwing4`.`Metric` (`idMetric`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Range_Language1`
    FOREIGN KEY (`Language_idLanguage`)
    REFERENCES `dwing4`.`Language` (`idLanguage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dwing4`.`Metric_Fact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwing4`.`Metric_Fact` (
  `idMetricFact` INT NOT NULL AUTO_INCREMENT,
  `value_day` FLOAT NULL,
  `value_month` FLOAT NULL,
  `value_year` FLOAT NULL,
  `Time_idTime` INT NOT NULL,
  `Project_idproject` INT NOT NULL,
  `Range_idInterval` INT NOT NULL,
  `Range_Metric_idMetric` INT NOT NULL,
  `Range_Language_idLanguage` INT NOT NULL,
  INDEX `fk_Metric_Fact_Project1_idx` (`Project_idproject` ASC),
  INDEX `fk_Metric_Fact_Range1_idx` (`Range_idInterval` ASC, 
    `Range_Metric_idMetric` ASC, `Range_Language_idLanguage` ASC),
  PRIMARY KEY (`idMetricFact`),
  CONSTRAINT `fk_Metric_Fact_Time1`
    FOREIGN KEY (`Time_idTime`)
    REFERENCES `dwing4`.`Time` (`idTime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Metric_Fact_Project1`
    FOREIGN KEY (`Project_idproject`)
    REFERENCES `dwing4`.`Project` (`idproject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Metric_Fact_Range1`
    FOREIGN KEY (`Range_idInterval` , `Range_Metric_idMetric` , 
      `Range_Language_idLanguage`)
    REFERENCES `dwing4`.`Range` (`idInterval` , `Metric_idMetric` , 
      `Language_idLanguage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `dwing4`.`Metric`
-- -----------------------------------------------------
START TRANSACTION;
USE `dwing4`;
INSERT INTO `dwing4`.`Metric` (`idMetric`, `metric name`, 
  `description`) VALUES (1, 'LOC', 'Lines of Code');
INSERT INTO `dwing4`.`Metric` (`idMetric`, `metric name`, 
  `description`) VALUES (2, 'ACCM', 'Average Ciclomatic 
  Complexity Method');
INSERT INTO `dwing4`.`Metric` (`idMetric`, `metric name`, 
  `description`) VALUES (3, 'ACC', 'Afferent Conections per Class');
INSERT INTO `dwing4`.`Metric` (`idMetric`, `metric name`, 
  `description`) VALUES (4, 'RFC', 'Reponse for Class');
INSERT INTO `dwing4`.`Metric` (`idMetric`, `metric name`, 
  `description`) VALUES (5, 'LCOM4', 'Lack of Cohesion of Method');
INSERT INTO `dwing4`.`Metric` (`idMetric`, `metric name`, 
  `description`) VALUES (6, 'NOM', 'Number of Methods');
INSERT INTO `dwing4`.`Metric` (`idMetric`, `metric name`, 
  `description`) VALUES (7, 'DIT', 'Depth on Tree');
INSERT INTO `dwing4`.`Metric` (`idMetric`, `metric name`, 
  `description`) VALUES (8, 'NOC', 'Number of Childs');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dwing4`.`Language`
-- -----------------------------------------------------
START TRANSACTION;
USE `dwing4`;
INSERT INTO `dwing4`.`Language` (`idLanguage`, `language name`)
 VALUES (1, 'java');
INSERT INTO `dwing4`.`Language` (`idLanguage`, `language name`)
 VALUES (2, 'c++');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dwing4`.`Range`
-- -----------------------------------------------------
START TRANSACTION;
USE `dwing4`;
INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`)
   VALUES (1, 0, 33, 'Excelente', 1, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (2, 34, 87, 'Bom', 1, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (3, 88, 200, 'Regular', 1, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (4, 201, 9999, 'Ruim', 1, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (5, 0, 31, 'Excelente', 1, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (6, 32, 84, 'Bom', 1, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (7, 85, 207, 'Regular', 1, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (8, 208, 9999, 'Ruim', 1, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (9, 0, 2.8, 'Excelente', 2, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (10, 2.9, 4.4, 'Bom', 2, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, 
  `max`, `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (11, 4.5, 6, 'Regular', 2, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (12, 6.1, 9999, 'Ruim', 2, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (13, 0, 2.0, 'Excelente', 2, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, 
  `max`, `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (14, 2.1, 4.0, 'Bom', 2, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (15, 4.1, 6.0, 'Regular', 2, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (16, 6.1, 9999, 'Ruim', 2, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (17, 0, 1, 'Excelente', 3, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (18, 1.1, 5, 'Bom', 3, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (19, 5.1, 12, 'Regular', 3, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (20, 12.1, 9999, 'Ruim', 3, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (21, 0, 2.0, 'Excelente', 3, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (22, 2.1, 7, 'Bom', 3, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (23, 7.1, 15, 'Regular', 3, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (24, 15.1, 9999, 'Ruim', 3, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (25, 0, 9, 'Excelente', 4, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (26, 10, 26, 'Bom', 4, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (27, 27, 59, 'Regular', 4, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (28, 60, 9999, 'Ruim', 4, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (29, 0, 29, 'Excelente', 4, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (30, 30, 64, 'Bom', 4, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (31, 65, 102, 'Regular', 4, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (32, 103, 9999, 'Ruim', 4, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (33, 0, 3, 'Excelente', 5, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (34, 4, 7, 'Bom', 5, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (35, 8, 12, 'Regular', 5, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (36, 13, 9999, 'Ruim', 5, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (37, 0, 5, 'Excelente', 5, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (38, 6, 10, 'Bom', 5, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (39, 11, 14, 'Regular', 5, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (40, 15, 99999, 'Ruim', 5, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (41, 0, 8, 'Excelente', 6, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (42, 9, 17, 'Bom', 6, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (43, 18, 27, 'Regular', 6, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (44, 28, 9999, 'Ruim', 6, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (45, 0, 10, 'Excelente', 6, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (46, 11, 17, 'Bom', 6, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (47, 18, 26, 'Regular', 6, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (48, 27, 9999, 'Ruim', 6, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (49, 0, 2, 'Excelente', 7, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (50, 3, 4, 'Bom', 7, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (51, 5, 6, 'Regular', 7, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (52, 7, 9999, 'Ruim', 7, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (53, 0, 1, 'Excelente', 7, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (54, 2, 3, 'Bom', 7, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (55, 3, 4, 'Regular', 7, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (56, 5, 9999, 'Ruim', 7, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (57, 0, 1, 'Excelente', 8, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (58, 1.1, 2, 'Bom', 8, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (59, 3, 3, 'Regular', 8, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (60, 4, 9999, 'Ruim', 8, 1);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (61, 0, 0, 'Excelente', 8, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (62, 1, 1, 'Bom', 8, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 
  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (63, 1, 2, 'Regular', 8, 2);

INSERT INTO `dwing4`.`Range` (`idInterval`, `min`, `max`, 

  `quality_index`, `Metric_idMetric`, `Language_idLanguage`) 
VALUES (64, 3, 9999, 'Ruim', 8, 2);

COMMIT;

