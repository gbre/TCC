-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 01/06/2014 às 07:11
-- Versão do servidor: 5.6.16
-- Versão do PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `source_info`
--
DROP SCHEMA IF EXISTS `source_info` ;
CREATE SCHEMA IF NOT EXISTS `source_info` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `source_info` ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Class`
--

CREATE TABLE IF NOT EXISTS `D_Class` (
  `idClass` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `hashcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `D_Configuration`
--

CREATE TABLE IF NOT EXISTS `D_Configuration` (
  `idConfiguration` int(11) NOT NULL,
  `configuration_name` varchar(45) DEFAULT NULL,
  `software_reference_name` varchar(45) DEFAULT NULL,
  `language_name` varchar(45) DEFAULT NULL,
  `software_repository_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idConfiguration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `D_Configuration`
--

INSERT INTO `D_Configuration` (`idConfiguration`, `configuration_name`, `software_reference_name`, `language_name`, `software_repository_address`) VALUES
(1, 'Open JDK8 Metrics', 'Open JDK8', 'java', 'http://hg.openjdk.java.net/jdk8'),
(2, 'Tomcat Metrics', 'Tomcat', 'java', 'git://git.apache.org/tomcat70.git');

-- --------------------------------------------------------

--
-- Estrutura para tabela `D_Metric`
--

CREATE TABLE IF NOT EXISTS `D_Metric` (
  `idMetric` int(11) NOT NULL,
  `metric_abbreviation` varchar(45) DEFAULT NULL,
  `metric_name` varchar(45) DEFAULT NULL,
  `metric_category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMetric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `D_Metric`
--

INSERT INTO `D_Metric` (`idMetric`, `metric_abbreviation`, `metric_name`, `metric_category`) VALUES
(1, 'LOC', 'Lines of Code', 'Source Code Metric'),
(2, 'ACCM', 'Average Cyclomatic Complexity per Method', 'Source Code Metric'),
(3, 'AMLOC', 'Average Method Lines of Code', 'Source Code Metric'),
(4, 'ACC', 'Afferent Connections per Class', 'Source Code Metric'),
(5, 'ANPM', 'Average Number of Parameters per Method', 'Source Code Metric'),
(6, 'CBO', 'Coupling Between Objects', 'Source Code Metric'),
(7, 'DIT', 'Depth of Inheritance Tree', 'Source Code Metric'),
(8, 'LCOM4', 'Lack of Cohesion in Methods', 'Source Code Metric'),
(9, 'NOC', 'Number of Children', 'Source Code Metric'),
(10, 'NOM', 'Number of Methods', 'Source Code Metric'),
(11, 'NPA', 'Number of Public Attributes', 'Source Code Metric'),
(12, 'RFC', 'Response for Class', 'Source Code Metric');

-- --------------------------------------------------------

--
-- Estrutura para tabela `D_Project`
--

CREATE TABLE IF NOT EXISTS `D_Project` (
  `idProject` int(11) NOT NULL AUTO_INCREMENT,
  `project_abbreviation` varchar(45) DEFAULT NULL,
  `project_name` varchar(45) DEFAULT NULL,
  `project_language` varchar(45) DEFAULT NULL,
  `organization_owner` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProject`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Fazendo dump de dados para tabela `D_Project`
--

INSERT INTO `D_Project` (`idProject`, `project_abbreviation`, `project_name`, `project_language`, `organization_owner`) VALUES
(1, 'sicg', 'Sistema Integrado de Controle e Gestão', 'java', 'IPHAN');

-- --------------------------------------------------------

--
-- Estrutura para tabela `D_Quality`
--

CREATE TABLE IF NOT EXISTS `D_Quality` (
  `idQuality` int(11) NOT NULL,
  `quality_index` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idQuality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `D_Quality`
--

INSERT INTO `D_Quality` (`idQuality`, `quality_index`) VALUES
(1, 'Excelente'),
(2, 'Bom'),
(3, 'Regular'),
(4, 'Ruim');

-- --------------------------------------------------------

--
-- Estrutura para tabela `D_Release`
--

CREATE TABLE IF NOT EXISTS `D_Release` (
  `idRelease` int(11) NOT NULL,
  `release_name` varchar(45) DEFAULT NULL,
  `release_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRelease`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `D_Release`
--

INSERT INTO `D_Release` (`idRelease`, `release_name`, `release_number`) VALUES
(1, 'OS02', 2),
(2, 'OS04', 4),
(3, 'OS05', 5),
(4, 'OS07', 7),
(5, 'OS08', 8),
(6, 'OS09', 9),
(7, 'OS10', 10),
(8, 'OS11', 11),
(9, 'OS12', 12),
(10, 'OS13', 13),
(11, 'OS14', 14),
(12, 'OS16', 16),
(13, 'OS17', 17),
(14, 'OS19', 19),
(15, 'OS20', 20),
(16, 'OS21', 21),
(17, 'OS22', 22),
(18, 'OS23', 23),
(19, 'OS24', 24);

-- --------------------------------------------------------

--
-- Estrutura para tabela `D_Time`
--

CREATE TABLE IF NOT EXISTS `D_Time` (
  `idTime` int(11) NOT NULL,
  `Month` decimal(10,0) DEFAULT NULL,
  `Year` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `D_Time`
--

INSERT INTO `D_Time` (`idTime`, `Month`, `Year`) VALUES
(1, '4', '2012'),
(2, '6', '2012'),
(3, '7', '2012'),
(4, '9', '2012'),
(5, '10', '2012'),
(6, '11', '2012'),
(7, '12', '2012'),
(8, '1', '2013'),
(9, '2', '2013'),
(10, '3', '2013'),
(11, '4', '2013'),
(12, '6', '2013'),
(13, '7', '2013'),
(14, '9', '2013'),
(15, '10', '2013'),
(16, '11', '2013'),
(17, '12', '2013'),
(18, '1', '2014'),
(19, '2', '2014');

-- --------------------------------------------------------

--
-- Estrutura para tabela `F_Project_Metric`
--

CREATE TABLE IF NOT EXISTS `F_Project_Metric` (
  `idQuality` int(11) NOT NULL AUTO_INCREMENT,
  `percentil_value` double DEFAULT NULL,
  `D_Project_idProject` int(11) NOT NULL,
  `D_Metric_idMetric` int(11) NOT NULL,
  `D_Quality_idQuality` int(11) NOT NULL,
  `D_Configuration_idConfiguration` int(11) NOT NULL,
  `D_Release_idRelease` int(11) NOT NULL,
  `D_Time_idTime` int(11) NOT NULL,
  PRIMARY KEY (`idQuality`),
  KEY `fk_F_Project_Metric_D_Quality1_idx` (`D_Quality_idQuality`),
  KEY `fk_F_Project_Metric_D_Project1_idx` (`D_Project_idProject`),
  KEY `fk_F_Project_Metric_D_Configuration1_idx` (`D_Configuration_idConfiguration`),
  KEY `fk_F_Project_Metric_D_Release1_idx` (`D_Release_idRelease`),
  KEY `fk_F_Project_Metric_D_Time1_idx` (`D_Time_idTime`),
  KEY `fk_F_Project_Metric_D_Metric1_idx` (`D_Metric_idMetric`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=457 ;

--
-- Fazendo dump de dados para tabela `F_Project_Metric`
--

INSERT INTO `F_Project_Metric` (`idQuality`, `percentil_value`, `D_Project_idProject`, `D_Metric_idMetric`, `D_Quality_idQuality`, `D_Configuration_idConfiguration`, `D_Release_idRelease`, `D_Time_idTime`) VALUES
(1, 22, 1, 1, 1, 1, 1, 1),
(2, 22, 1, 1, 1, 2, 1, 1),
(3, 1.4, 1, 2, 1, 1, 1, 1),
(4, 1.4, 1, 2, 1, 2, 1, 1),
(5, 4.3, 1, 3, 1, 1, 1, 1),
(6, 4.3, 1, 3, 1, 2, 1, 1),
(7, 3, 1, 4, 2, 1, 1, 1),
(8, 3, 1, 4, 2, 2, 1, 1),
(9, 1, 1, 5, 1, 1, 1, 1),
(10, 1, 1, 5, 1, 2, 1, 1),
(11, 28, 1, 6, 4, 1, 1, 1),
(12, 28, 1, 6, 4, 2, 1, 1),
(13, 1, 1, 7, 1, 1, 1, 1),
(14, 1, 1, 7, 1, 2, 1, 1),
(15, 7, 1, 8, 2, 1, 1, 1),
(16, 7, 1, 8, 2, 2, 1, 1),
(17, 1, 1, 9, 2, 1, 1, 1),
(18, 1, 1, 9, 2, 2, 1, 1),
(19, 9, 1, 10, 2, 1, 1, 1),
(20, 9, 1, 10, 1, 2, 1, 1),
(21, 0, 1, 11, 1, 1, 1, 1),
(22, 0, 1, 11, 1, 2, 1, 1),
(23, 20, 1, 12, 2, 1, 1, 1),
(24, 20, 1, 12, 2, 2, 1, 1),
(25, 24, 1, 1, 1, 1, 2, 2),
(26, 24, 1, 1, 1, 2, 2, 2),
(27, 1.3, 1, 2, 1, 1, 2, 2),
(28, 1.3, 1, 2, 1, 2, 2, 2),
(29, 3.2, 1, 3, 1, 1, 2, 2),
(30, 3.2, 1, 3, 1, 2, 2, 2),
(31, 3.5, 1, 4, 2, 1, 2, 2),
(32, 3.5, 1, 4, 2, 2, 2, 2),
(33, 1, 1, 5, 1, 1, 2, 2),
(34, 1, 1, 5, 1, 2, 2, 2),
(35, 49, 1, 6, 4, 1, 2, 2),
(36, 49, 1, 6, 4, 2, 2, 2),
(37, 1, 1, 7, 1, 1, 2, 2),
(38, 1, 1, 7, 1, 2, 2, 2),
(39, 8, 1, 8, 3, 1, 2, 2),
(40, 8, 1, 8, 3, 2, 2, 2),
(41, 1, 1, 9, 2, 1, 2, 2),
(42, 1, 1, 9, 2, 2, 2, 2),
(43, 9, 1, 10, 2, 1, 2, 2),
(44, 9, 1, 10, 1, 2, 2, 2),
(45, 0, 1, 11, 1, 1, 2, 2),
(46, 0, 1, 11, 1, 2, 2, 2),
(47, 20, 1, 12, 2, 1, 2, 2),
(48, 20, 1, 12, 2, 2, 2, 2),
(49, 21, 1, 1, 1, 1, 3, 3),
(50, 21, 1, 1, 1, 2, 3, 3),
(51, 1.3, 1, 2, 1, 1, 3, 3),
(52, 1.3, 1, 2, 1, 2, 3, 3),
(53, 3.2, 1, 3, 1, 1, 3, 3),
(54, 3.2, 1, 3, 1, 2, 3, 3),
(55, 4, 1, 4, 2, 1, 3, 3),
(56, 4, 1, 4, 2, 2, 3, 3),
(57, 1, 1, 5, 1, 1, 3, 3),
(58, 1, 1, 5, 1, 2, 3, 3),
(59, 61, 1, 6, 4, 1, 3, 3),
(60, 61, 1, 6, 4, 2, 3, 3),
(61, 1, 1, 7, 1, 1, 3, 3),
(62, 1, 1, 7, 1, 2, 3, 3),
(63, 8, 1, 8, 3, 1, 3, 3),
(64, 8, 1, 8, 3, 2, 3, 3),
(65, 1, 1, 9, 2, 1, 3, 3),
(66, 1, 1, 9, 2, 2, 3, 3),
(67, 9, 1, 10, 2, 1, 3, 3),
(68, 9, 1, 10, 1, 2, 3, 3),
(69, 0, 1, 11, 1, 1, 3, 3),
(70, 0, 1, 11, 1, 2, 3, 3),
(71, 19, 1, 12, 2, 1, 3, 3),
(72, 19, 1, 12, 2, 2, 3, 3),
(73, 19, 1, 1, 1, 1, 4, 4),
(74, 19, 1, 1, 1, 2, 4, 4),
(75, 1.2, 1, 2, 1, 1, 4, 4),
(76, 1.2, 1, 2, 1, 2, 4, 4),
(77, 3, 1, 3, 1, 1, 4, 4),
(78, 3, 1, 3, 1, 2, 4, 4),
(79, 3, 1, 4, 2, 1, 4, 4),
(80, 3, 1, 4, 2, 2, 4, 4),
(81, 0.9, 1, 5, 1, 1, 4, 4),
(82, 0.9, 1, 5, 1, 2, 4, 4),
(83, 118, 1, 6, 4, 1, 4, 4),
(84, 118, 1, 6, 4, 2, 4, 4),
(85, 1, 1, 7, 1, 1, 4, 4),
(86, 1, 1, 7, 1, 2, 4, 4),
(87, 8, 1, 8, 3, 1, 4, 4),
(88, 8, 1, 8, 3, 2, 4, 4),
(89, 1, 1, 9, 2, 1, 4, 4),
(90, 1, 1, 9, 2, 2, 4, 4),
(91, 9, 1, 10, 2, 1, 4, 4),
(92, 9, 1, 10, 1, 2, 4, 4),
(93, 0, 1, 11, 1, 1, 4, 4),
(94, 0, 1, 11, 1, 2, 4, 4),
(95, 18, 1, 12, 2, 1, 4, 4),
(96, 18, 1, 12, 2, 2, 4, 4),
(97, 19, 1, 1, 1, 1, 5, 5),
(98, 19, 1, 1, 1, 2, 5, 5),
(99, 1.3, 1, 2, 1, 1, 5, 5),
(100, 1.3, 1, 2, 1, 2, 5, 5),
(101, 3, 1, 3, 1, 1, 5, 5),
(102, 3, 1, 3, 1, 2, 5, 5),
(103, 3, 1, 4, 2, 1, 5, 5),
(104, 3, 1, 4, 2, 2, 5, 5),
(105, 0.9, 1, 5, 1, 1, 5, 5),
(106, 0.9, 1, 5, 1, 2, 5, 5),
(107, 155, 1, 6, 4, 1, 5, 5),
(108, 155, 1, 6, 4, 2, 5, 5),
(109, 1, 1, 7, 1, 1, 5, 5),
(110, 1, 1, 7, 1, 2, 5, 5),
(111, 8, 1, 8, 3, 1, 5, 5),
(112, 8, 1, 8, 3, 2, 5, 5),
(113, 1, 1, 9, 2, 1, 5, 5),
(114, 1, 1, 9, 2, 2, 5, 5),
(115, 9, 1, 10, 2, 1, 5, 5),
(116, 9, 1, 10, 1, 2, 5, 5),
(117, 0, 1, 11, 1, 1, 5, 5),
(118, 0, 1, 11, 1, 2, 5, 5),
(119, 15, 1, 12, 2, 1, 5, 5),
(120, 15, 1, 12, 2, 2, 5, 5),
(121, 19, 1, 1, 1, 1, 6, 6),
(122, 19, 1, 1, 1, 2, 6, 6),
(123, 1.3, 1, 2, 1, 1, 6, 6),
(124, 1.3, 1, 2, 1, 2, 6, 6),
(125, 3, 1, 3, 1, 1, 6, 6),
(126, 3, 1, 3, 1, 2, 6, 6),
(127, 3, 1, 4, 2, 1, 6, 6),
(128, 3, 1, 4, 2, 2, 6, 6),
(129, 0.9, 1, 5, 1, 1, 6, 6),
(130, 0.9, 1, 5, 1, 2, 6, 6),
(131, 158, 1, 6, 4, 1, 6, 6),
(132, 158, 1, 6, 4, 2, 6, 6),
(133, 1, 1, 7, 1, 1, 6, 6),
(134, 1, 1, 7, 1, 2, 6, 6),
(135, 8, 1, 8, 3, 1, 6, 6),
(136, 8, 1, 8, 3, 2, 6, 6),
(137, 1, 1, 9, 2, 1, 6, 6),
(138, 1, 1, 9, 2, 2, 6, 6),
(139, 9, 1, 10, 2, 1, 6, 6),
(140, 9, 1, 10, 1, 2, 6, 6),
(141, 0, 1, 11, 1, 1, 6, 6),
(142, 0, 1, 11, 1, 2, 6, 6),
(143, 15, 1, 12, 2, 1, 6, 6),
(144, 15, 1, 12, 2, 2, 6, 6),
(145, 19, 1, 1, 1, 1, 7, 7),
(146, 19, 1, 1, 1, 2, 7, 7),
(147, 1.3, 1, 2, 1, 1, 7, 7),
(148, 1.3, 1, 2, 1, 2, 7, 7),
(149, 3, 1, 3, 1, 1, 7, 7),
(150, 3, 1, 3, 1, 2, 7, 7),
(151, 3, 1, 4, 2, 1, 7, 7),
(152, 3, 1, 4, 2, 2, 7, 7),
(153, 1, 1, 5, 1, 1, 7, 7),
(154, 1, 1, 5, 1, 2, 7, 7),
(155, 188, 1, 6, 4, 1, 7, 7),
(156, 188, 1, 6, 4, 2, 7, 7),
(157, 1, 1, 7, 1, 1, 7, 7),
(158, 1, 1, 7, 1, 2, 7, 7),
(159, 8, 1, 8, 3, 1, 7, 7),
(160, 8, 1, 8, 3, 2, 7, 7),
(161, 1, 1, 9, 2, 1, 7, 7),
(162, 1, 1, 9, 2, 2, 7, 7),
(163, 9, 1, 10, 2, 1, 7, 7),
(164, 9, 1, 10, 1, 2, 7, 7),
(165, 0, 1, 11, 1, 1, 7, 7),
(166, 0, 1, 11, 1, 2, 7, 7),
(167, 16, 1, 12, 2, 1, 7, 7),
(168, 16, 1, 12, 2, 2, 7, 7),
(169, 21, 1, 1, 1, 1, 8, 8),
(170, 21, 1, 1, 1, 2, 8, 8),
(171, 1.3, 1, 2, 1, 1, 8, 8),
(172, 1.3, 1, 2, 1, 2, 8, 8),
(173, 3, 1, 3, 1, 1, 8, 8),
(174, 3, 1, 3, 1, 2, 8, 8),
(175, 2, 1, 4, 2, 1, 8, 8),
(176, 2, 1, 4, 2, 2, 8, 8),
(177, 0.9, 1, 5, 1, 1, 8, 8),
(178, 0.9, 1, 5, 1, 2, 8, 8),
(179, 218, 1, 6, 4, 1, 8, 8),
(180, 218, 1, 6, 4, 2, 8, 8),
(181, 1, 1, 7, 1, 1, 8, 8),
(182, 1, 1, 7, 1, 2, 8, 8),
(183, 8, 1, 8, 3, 1, 8, 8),
(184, 8, 1, 8, 3, 2, 8, 8),
(185, 1, 1, 9, 2, 1, 8, 8),
(186, 1, 1, 9, 2, 2, 8, 8),
(187, 9, 1, 10, 2, 1, 8, 8),
(188, 9, 1, 10, 1, 2, 8, 8),
(189, 0, 1, 11, 1, 1, 8, 8),
(190, 0, 1, 11, 1, 2, 8, 8),
(191, 16, 1, 12, 2, 1, 8, 8),
(192, 16, 1, 12, 2, 2, 8, 8),
(193, 19, 1, 1, 1, 1, 9, 9),
(194, 19, 1, 1, 1, 2, 9, 9),
(195, 1.3, 1, 2, 1, 1, 9, 9),
(196, 1.3, 1, 2, 1, 2, 9, 9),
(197, 3, 1, 3, 1, 1, 9, 9),
(198, 3, 1, 3, 1, 2, 9, 9),
(199, 3, 1, 4, 2, 1, 9, 9),
(200, 3, 1, 4, 2, 2, 9, 9),
(201, 0.9, 1, 5, 1, 1, 9, 9),
(202, 0.9, 1, 5, 1, 2, 9, 9),
(203, 256, 1, 6, 4, 1, 9, 9),
(204, 256, 1, 6, 4, 2, 9, 9),
(205, 1, 1, 7, 1, 1, 9, 9),
(206, 1, 1, 7, 1, 2, 9, 9),
(207, 8, 1, 8, 3, 1, 9, 9),
(208, 8, 1, 8, 3, 2, 9, 9),
(209, 1, 1, 9, 2, 1, 9, 9),
(210, 1, 1, 9, 2, 2, 9, 9),
(211, 8, 1, 10, 1, 1, 9, 9),
(212, 8, 1, 10, 1, 2, 9, 9),
(213, 0, 1, 11, 1, 1, 9, 9),
(214, 0, 1, 11, 1, 2, 9, 9),
(215, 15, 1, 12, 2, 1, 9, 9),
(216, 15, 1, 12, 2, 2, 9, 9),
(217, 20, 1, 1, 1, 1, 10, 10),
(218, 20, 1, 1, 1, 2, 10, 10),
(219, 1.4, 1, 2, 1, 1, 10, 10),
(220, 1.4, 1, 2, 1, 2, 10, 10),
(221, 3, 1, 3, 1, 1, 10, 10),
(222, 3, 1, 3, 1, 2, 10, 10),
(223, 2.5, 1, 4, 2, 1, 10, 10),
(224, 2.5, 1, 4, 2, 2, 10, 10),
(225, 1, 1, 5, 1, 1, 10, 10),
(226, 1, 1, 5, 1, 2, 10, 10),
(227, 267, 1, 6, 4, 1, 10, 10),
(228, 267, 1, 6, 4, 2, 10, 10),
(229, 1, 1, 7, 1, 1, 10, 10),
(230, 1, 1, 7, 1, 2, 10, 10),
(231, 8, 1, 8, 3, 1, 10, 10),
(232, 8, 1, 8, 3, 2, 10, 10),
(233, 1, 1, 9, 2, 1, 10, 10),
(234, 1, 1, 9, 2, 2, 10, 10),
(235, 8, 1, 10, 1, 1, 10, 10),
(236, 8, 1, 10, 1, 2, 10, 10),
(237, 0, 1, 11, 1, 1, 10, 10),
(238, 0, 1, 11, 1, 2, 10, 10),
(239, 15, 1, 12, 2, 1, 10, 10),
(240, 15, 1, 12, 2, 2, 10, 10),
(241, 19, 1, 1, 1, 1, 11, 11),
(242, 19, 1, 1, 1, 2, 11, 11),
(243, 1.4, 1, 2, 1, 1, 11, 11),
(244, 1.4, 1, 2, 1, 2, 11, 11),
(245, 3, 1, 3, 1, 1, 11, 11),
(246, 3, 1, 3, 1, 2, 11, 11),
(247, 2, 1, 4, 2, 1, 11, 11),
(248, 2, 1, 4, 2, 2, 11, 11),
(249, 1, 1, 5, 1, 1, 11, 11),
(250, 1, 1, 5, 1, 2, 11, 11),
(251, 279, 1, 6, 4, 1, 11, 11),
(252, 279, 1, 6, 4, 2, 11, 11),
(253, 1, 1, 7, 1, 1, 11, 11),
(254, 1, 1, 7, 1, 2, 11, 11),
(255, 8, 1, 8, 3, 1, 11, 11),
(256, 8, 1, 8, 3, 2, 11, 11),
(257, 1, 1, 9, 2, 1, 11, 11),
(258, 1, 1, 9, 2, 2, 11, 11),
(259, 8, 1, 10, 1, 1, 11, 11),
(260, 8, 1, 10, 1, 2, 11, 11),
(261, 0, 1, 11, 1, 1, 11, 11),
(262, 0, 1, 11, 1, 2, 11, 11),
(263, 15, 1, 12, 2, 1, 11, 11),
(264, 15, 1, 12, 2, 2, 11, 11),
(265, 18, 1, 1, 1, 1, 12, 12),
(266, 18, 1, 1, 1, 2, 12, 12),
(267, 1.2, 1, 2, 1, 1, 12, 12),
(268, 1.2, 1, 2, 1, 2, 12, 12),
(269, 3, 1, 3, 1, 1, 12, 12),
(270, 3, 1, 3, 1, 2, 12, 12),
(271, 2, 1, 4, 2, 1, 12, 12),
(272, 2, 1, 4, 2, 2, 12, 12),
(273, 0.9, 1, 5, 1, 1, 12, 12),
(274, 0.9, 1, 5, 1, 2, 12, 12),
(275, 327, 1, 6, 4, 1, 12, 12),
(276, 327, 1, 6, 4, 2, 12, 12),
(277, 1, 1, 7, 1, 1, 12, 12),
(278, 1, 1, 7, 1, 2, 12, 12),
(279, 8, 1, 8, 3, 1, 12, 12),
(280, 8, 1, 8, 3, 2, 12, 12),
(281, 1, 1, 9, 2, 1, 12, 12),
(282, 1, 1, 9, 2, 2, 12, 12),
(283, 8, 1, 10, 1, 1, 12, 12),
(284, 8, 1, 10, 1, 2, 12, 12),
(285, 0, 1, 11, 1, 1, 12, 12),
(286, 0, 1, 11, 1, 2, 12, 12),
(287, 13, 1, 12, 2, 1, 12, 12),
(288, 13, 1, 12, 2, 2, 12, 12),
(289, 18, 1, 1, 1, 1, 13, 13),
(290, 18, 1, 1, 1, 2, 13, 13),
(291, 1.2, 1, 2, 1, 1, 13, 13),
(292, 1.2, 1, 2, 1, 2, 13, 13),
(293, 3, 1, 3, 1, 1, 13, 13),
(294, 3, 1, 3, 1, 2, 13, 13),
(295, 2, 1, 4, 2, 1, 13, 13),
(296, 2, 1, 4, 2, 2, 13, 13),
(297, 0.9, 1, 5, 1, 1, 13, 13),
(298, 0.9, 1, 5, 1, 2, 13, 13),
(299, 333, 1, 6, 4, 1, 13, 13),
(300, 333, 1, 6, 4, 2, 13, 13),
(301, 1, 1, 7, 1, 1, 13, 13),
(302, 1, 1, 7, 1, 2, 13, 13),
(303, 8, 1, 8, 3, 1, 13, 13),
(304, 8, 1, 8, 3, 2, 13, 13),
(305, 1, 1, 9, 2, 1, 13, 13),
(306, 1, 1, 9, 2, 2, 13, 13),
(307, 8, 1, 10, 1, 1, 13, 13),
(308, 8, 1, 10, 1, 2, 13, 13),
(309, 0, 1, 11, 1, 1, 13, 13),
(310, 0, 1, 11, 1, 2, 13, 13),
(311, 13, 1, 12, 2, 1, 13, 13),
(312, 13, 1, 12, 2, 2, 13, 13),
(313, 18, 1, 1, 1, 1, 14, 14),
(314, 18, 1, 1, 1, 2, 14, 14),
(315, 1.2, 1, 2, 1, 1, 14, 14),
(316, 1.2, 1, 2, 1, 2, 14, 14),
(317, 3, 1, 3, 1, 1, 14, 14),
(318, 3, 1, 3, 1, 2, 14, 14),
(319, 2, 1, 4, 2, 1, 14, 14),
(320, 2, 1, 4, 2, 2, 14, 14),
(321, 0.9, 1, 5, 1, 1, 14, 14),
(322, 0.9, 1, 5, 1, 2, 14, 14),
(323, 347, 1, 6, 4, 1, 14, 14),
(324, 347, 1, 6, 4, 2, 14, 14),
(325, 1, 1, 7, 1, 1, 14, 14),
(326, 1, 1, 7, 1, 2, 14, 14),
(327, 8, 1, 8, 3, 1, 14, 14),
(328, 8, 1, 8, 3, 2, 14, 14),
(329, 1, 1, 9, 2, 1, 14, 14),
(330, 1, 1, 9, 2, 2, 14, 14),
(331, 8, 1, 10, 1, 1, 14, 14),
(332, 8, 1, 10, 1, 2, 14, 14),
(333, 0, 1, 11, 1, 1, 14, 14),
(334, 0, 1, 11, 1, 2, 14, 14),
(335, 13, 1, 12, 2, 1, 14, 14),
(336, 13, 1, 12, 2, 2, 14, 14),
(337, 13, 1, 1, 1, 1, 15, 15),
(338, 13, 1, 1, 1, 2, 15, 15),
(339, 1.2, 1, 2, 1, 1, 15, 15),
(340, 1.2, 1, 2, 1, 2, 15, 15),
(341, 3, 1, 3, 1, 1, 15, 15),
(342, 3, 1, 3, 1, 2, 15, 15),
(343, 2, 1, 4, 2, 1, 15, 15),
(344, 2, 1, 4, 2, 2, 15, 15),
(345, 0.8, 1, 5, 1, 1, 15, 15),
(346, 0.8, 1, 5, 1, 2, 15, 15),
(347, 357, 1, 6, 4, 1, 15, 15),
(348, 357, 1, 6, 4, 2, 15, 15),
(349, 1, 1, 7, 1, 1, 15, 15),
(350, 1, 1, 7, 1, 2, 15, 15),
(351, 8, 1, 8, 3, 1, 15, 15),
(352, 8, 1, 8, 3, 2, 15, 15),
(353, 1, 1, 9, 2, 1, 15, 15),
(354, 1, 1, 9, 2, 2, 15, 15),
(355, 8, 1, 10, 1, 1, 15, 15),
(356, 8, 1, 10, 1, 2, 15, 15),
(357, 0, 1, 11, 1, 1, 15, 15),
(358, 0, 1, 11, 1, 2, 15, 15),
(359, 12, 1, 12, 2, 1, 15, 15),
(360, 12, 1, 12, 2, 2, 15, 15),
(361, 13, 1, 1, 1, 1, 16, 16),
(362, 13, 1, 1, 1, 2, 16, 16),
(363, 1.2, 1, 2, 1, 1, 16, 16),
(364, 1.2, 1, 2, 1, 2, 16, 16),
(365, 3, 1, 3, 1, 1, 16, 16),
(366, 3, 1, 3, 1, 2, 16, 16),
(367, 2, 1, 4, 2, 1, 16, 16),
(368, 2, 1, 4, 2, 2, 16, 16),
(369, 0.9, 1, 5, 1, 1, 16, 16),
(370, 0.9, 1, 5, 1, 2, 16, 16),
(371, 364, 1, 6, 4, 1, 16, 16),
(372, 364, 1, 6, 4, 2, 16, 16),
(373, 1, 1, 7, 1, 1, 16, 16),
(374, 1, 1, 7, 1, 2, 16, 16),
(375, 8, 1, 8, 3, 1, 16, 16),
(376, 8, 1, 8, 3, 2, 16, 16),
(377, 1, 1, 9, 2, 1, 16, 16),
(378, 1, 1, 9, 2, 2, 16, 16),
(379, 8, 1, 10, 1, 1, 16, 16),
(380, 8, 1, 10, 1, 2, 16, 16),
(381, 0, 1, 11, 1, 1, 16, 16),
(382, 0, 1, 11, 1, 2, 16, 16),
(383, 12, 1, 12, 2, 1, 16, 16),
(384, 12, 1, 12, 2, 2, 16, 16),
(385, 13, 1, 1, 1, 1, 17, 17),
(386, 13, 1, 1, 1, 2, 17, 17),
(387, 1.2, 1, 2, 1, 1, 17, 17),
(388, 1.2, 1, 2, 1, 2, 17, 17),
(389, 3, 1, 3, 1, 1, 17, 17),
(390, 3, 1, 3, 1, 2, 17, 17),
(391, 2, 1, 4, 2, 1, 17, 17),
(392, 2, 1, 4, 2, 2, 17, 17),
(393, 0.9, 1, 5, 1, 1, 17, 17),
(394, 0.9, 1, 5, 1, 2, 17, 17),
(395, 366, 1, 6, 4, 1, 17, 17),
(396, 366, 1, 6, 4, 2, 17, 17),
(397, 1, 1, 7, 1, 1, 17, 17),
(398, 1, 1, 7, 1, 2, 17, 17),
(399, 8, 1, 8, 3, 1, 17, 17),
(400, 8, 1, 8, 3, 2, 17, 17),
(401, 1, 1, 9, 2, 1, 17, 17),
(402, 1, 1, 9, 2, 2, 17, 17),
(403, 8, 1, 10, 1, 1, 17, 17),
(404, 8, 1, 10, 1, 2, 17, 17),
(405, 0, 1, 11, 1, 1, 17, 17),
(406, 0, 1, 11, 1, 2, 17, 17),
(407, 13, 1, 12, 2, 1, 17, 17),
(408, 13, 1, 12, 2, 2, 17, 17),
(409, 13, 1, 1, 1, 1, 18, 18),
(410, 13, 1, 1, 1, 2, 18, 18),
(411, 1.2, 1, 2, 1, 1, 18, 18),
(412, 1.2, 1, 2, 1, 2, 18, 18),
(413, 3, 1, 3, 1, 1, 18, 18),
(414, 3, 1, 3, 1, 2, 18, 18),
(415, 2, 1, 4, 2, 1, 18, 18),
(416, 2, 1, 4, 2, 2, 18, 18),
(417, 0.9, 1, 5, 1, 1, 18, 18),
(418, 0.9, 1, 5, 1, 2, 18, 18),
(419, 366, 1, 6, 4, 1, 18, 18),
(420, 366, 1, 6, 4, 2, 18, 18),
(421, 1, 1, 7, 1, 1, 18, 18),
(422, 1, 1, 7, 1, 2, 18, 18),
(423, 8, 1, 8, 3, 1, 18, 18),
(424, 8, 1, 8, 3, 2, 18, 18),
(425, 1, 1, 9, 2, 1, 18, 18),
(426, 1, 1, 9, 2, 2, 18, 18),
(427, 8, 1, 10, 1, 1, 18, 18),
(428, 8, 1, 10, 1, 2, 18, 18),
(429, 0, 1, 11, 1, 1, 18, 18),
(430, 0, 1, 11, 1, 2, 18, 18),
(431, 13, 1, 12, 2, 1, 18, 18),
(432, 13, 1, 12, 2, 2, 18, 18),
(433, 14, 1, 1, 1, 1, 19, 19),
(434, 14, 1, 1, 1, 2, 19, 19),
(435, 1.2, 1, 2, 1, 1, 19, 19),
(436, 1.2, 1, 2, 1, 2, 19, 19),
(437, 3, 1, 3, 1, 1, 19, 19),
(438, 3, 1, 3, 1, 2, 19, 19),
(439, 2, 1, 4, 2, 1, 19, 19),
(440, 2, 1, 4, 2, 2, 19, 19),
(441, 0.9, 1, 5, 1, 1, 19, 19),
(442, 0.9, 1, 5, 1, 2, 19, 19),
(443, 372, 1, 6, 4, 1, 19, 19),
(444, 372, 1, 6, 4, 2, 19, 19),
(445, 1, 1, 7, 1, 1, 19, 19),
(446, 1, 1, 7, 1, 2, 19, 19),
(447, 8, 1, 8, 3, 1, 19, 19),
(448, 8, 1, 8, 3, 2, 19, 19),
(449, 1, 1, 9, 2, 1, 19, 19),
(450, 1, 1, 9, 2, 2, 19, 19),
(451, 8, 1, 10, 1, 1, 19, 19),
(452, 8, 1, 10, 1, 2, 19, 19),
(453, 0, 1, 11, 1, 1, 19, 19),
(454, 0, 1, 11, 1, 2, 19, 19),
(455, 13, 1, 12, 2, 1, 19, 19),
(456, 13, 1, 12, 2, 2, 19, 19);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Meta_Metric_Ranges`
--

CREATE TABLE IF NOT EXISTS `Meta_Metric_Ranges` (
  `idMetricRange` int(11) NOT NULL AUTO_INCREMENT,
  `metric_name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `min` double DEFAULT NULL,
  `max` double DEFAULT NULL,
  `language_name` varchar(45) DEFAULT NULL,
  `quality_index` varchar(45) DEFAULT NULL,
  `configuration_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMetricRange`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Fazendo dump de dados para tabela `Meta_Metric_Ranges`
--

INSERT INTO `Meta_Metric_Ranges` (`idMetricRange`, `metric_name`, `description`, `min`, `max`, `language_name`, `quality_index`, `configuration_name`) VALUES
(1, 'LOC', 'Lines of Code', 0, 33, 'java', 'Excelente', 'Open JDK8 Metrics'),
(2, 'LOC', 'Lines of Code', 34, 87, 'java', 'Bom', 'Open JDK8 Metrics'),
(3, 'LOC', 'Lines of Code', 88, 200, 'java', 'Regular', 'Open JDK8 Metrics'),
(4, 'LOC', 'Lines of Code', 200, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics'),
(5, 'LOC', 'Lines of Code', 0, 33, 'java', 'Excelente', 'Tomcat Metrics'),
(6, 'LOC', 'Lines of Code', 34, 105, 'java', 'Bom', 'Tomcat Metrics'),
(7, 'LOC', 'Lines of Code', 106, 276, 'java', 'Regular', 'Tomcat Metrics'),
(8, 'LOC', 'Lines of Code', 276, 4294967295, 'java', 'Ruim', 'Tomcat Metrics'),
(9, 'ACCM', 'Average Cyclomatic Complexity per Method', 0, 2.8, 'java', 'Excelente', 'Open JDK8 Metrics'),
(10, 'ACCM', 'Average Cyclomatic Complexity per Method', 2.9, 4.4, 'java', 'Bom', 'Open JDK8 Metrics'),
(11, 'ACCM', 'Average Cyclomatic Complexity per Method', 4.5, 6, 'java', 'Regular', 'Open JDK8 Metrics'),
(12, 'ACCM', 'Average Cyclomatic Complexity per Method', 6.1, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics'),
(13, 'ACCM', 'Average Cyclomatic Complexity per Method', 0, 3.1, 'java', 'Excelente', 'Tomcat Metrics'),
(14, 'ACCM', 'Average Cyclomatic Complexity per Method', 3.1, 4, 'java', 'Bom', 'Tomcat Metrics'),
(15, 'ACCM', 'Average Cyclomatic Complexity per Method', 4.1, 6, 'java', 'Regular', 'Tomcat Metrics'),
(16, 'ACCM', 'Average Cyclomatic Complexity per Method', 6.1, 4294967295, 'java', 'Ruim', 'Tomcat Metrics'),
(17, 'AMLOC', 'Average Method Lines of Code', 0, 8.3, 'java', 'Excelente', 'Open JDK8 Metrics'),
(18, 'AMLOC', 'Average Method Lines of Code', 8.4, 18, 'java', 'Bom', 'Open JDK8 Metrics'),
(19, 'AMLOC', 'Average Method Lines of Code', 19, 34, 'java', 'Regular', 'Open JDK8 Metrics'),
(20, 'AMLOC', 'Average Method Lines of Code', 35, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics'),
(21, 'AMLOC', 'Average Method Lines of Code', 0, 8, 'java', 'Excelente', 'Tomcat Metrics'),
(22, 'AMLOC', 'Average Method Lines of Code', 8.1, 16, 'java', 'Bom', 'Tomcat Metrics'),
(23, 'AMLOC', 'Average Method Lines of Code', 16.1, 27, 'java', 'Regular', 'Tomcat Metrics'),
(24, 'AMLOC', 'Average Method Lines of Code', 27, 4294967295, 'java', 'Ruim', 'Tomcat Metrics'),
(25, 'ACC', 'Afferent Connections per Class', 0, 1, 'java', 'Excelente', 'Open JDK8 Metrics'),
(26, 'ACC', 'Afferent Connections per Class', 1.1, 5, 'java', 'Bom', 'Open JDK8 Metrics'),
(27, 'ACC', 'Afferent Connections per Class', 5.1, 12, 'java', 'Regular', 'Open JDK8 Metrics'),
(28, 'ACC', 'Afferent Connections per Class', 12.1, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics'),
(29, 'ACC', 'Afferent Connections per Class', 0, 1, 'java', 'Excelente', 'Tomcat Metrics'),
(30, 'ACC', 'Afferent Connections per Class', 1.1, 5, 'java', 'Bom', 'Tomcat Metrics'),
(31, 'ACC', 'Afferent Connections per Class', 5.1, 13, 'java', 'Regular', 'Tomcat Metrics'),
(32, 'ACC', 'Afferent Connections per Class', 13.1, 4294967295, 'java', 'Ruim', 'Tomcat Metrics'),
(33, 'ANPM', 'Average Number of Parameters per Method', 0, 1.5, 'java', 'Excelente', 'Open JDK8 Metrics'),
(34, 'ANPM', 'Average Number of Parameters per Method', 1.6, 2.3, 'java', 'Bom', 'Open JDK8 Metrics'),
(35, 'ANPM', 'Average Number of Parameters per Method', 2.4, 3, 'java', 'Regular', 'Open JDK8 Metrics'),
(36, 'ANPM', 'Average Number of Parameters per Method', 3.1, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics'),
(37, 'ANPM', 'Average Number of Parameters per Method', 0, 2, 'java', 'Excelente', 'Tomcat Metrics'),
(38, 'ANPM', 'Average Number of Parameters per Method', 2.1, 3, 'java', 'Bom', 'Tomcat Metrics'),
(39, 'ANPM', 'Average Number of Parameters per Method', 3.1, 5, 'java', 'Regular', 'Tomcat Metrics'),
(40, 'ANPM', 'Average Number of Parameters per Method', 5.1, 4294967295, 'java', 'Ruim', 'Tomcat Metrics'),
(41, 'CBO', 'Coupling Between Objects', 0, 3, 'java', 'Excelente', 'Open JDK8 Metrics'),
(42, 'CBO', 'Coupling Between Objects', 4, 6, 'java', 'Bom', 'Open JDK8 Metrics'),
(43, 'CBO', 'Coupling Between Objects', 7, 9, 'java', 'Regular', 'Open JDK8 Metrics'),
(44, 'CBO', 'Coupling Between Objects', 10, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics'),
(45, 'CBO', 'Coupling Between Objects', 0, 2, 'java', 'Excelente', 'Tomcat Metrics'),
(46, 'CBO', 'Coupling Between Objects', 3, 5, 'java', 'Bom', 'Tomcat Metrics'),
(47, 'CBO', 'Coupling Between Objects', 5, 7, 'java', 'Regular', 'Tomcat Metrics'),
(48, 'CBO', 'Coupling Between Objects', 8, 4294967295, 'java', 'Ruim', 'Tomcat Metrics'),
(49, 'DIT', 'Depth of Inheritance Tree', 0, 2, 'java', 'Excelente', 'Open JDK8 Metrics'),
(50, 'DIT', 'Depth of Inheritance Tree', 3, 4, 'java', 'Bom', 'Open JDK8 Metrics'),
(51, 'DIT', 'Depth of Inheritance Tree', 5, 6, 'java', 'Regular', 'Open JDK8 Metrics'),
(52, 'DIT', 'Depth of Inheritance Tree', 7, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics'),
(53, 'DIT', 'Depth of Inheritance Tree', 0, 1, 'java', 'Excelente', 'Tomcat Metrics'),
(54, 'DIT', 'Depth of Inheritance Tree', 2, 3, 'java', 'Bom', 'Tomcat Metrics'),
(55, 'DIT', 'Depth of Inheritance Tree', 4, 4, 'java', 'Regular', 'Tomcat Metrics'),
(56, 'DIT', 'Depth of Inheritance Tree', 5, 4294967295, 'java', 'Ruim', 'Tomcat Metrics'),
(57, 'LCOM4', 'Lack of Cohesion in Methods', 0, 3, 'java', 'Excelente', 'Open JDK8 Metrics'),
(58, 'LCOM4', 'Lack of Cohesion in Methods', 4, 7, 'java', 'Bom', 'Open JDK8 Metrics'),
(59, 'LCOM4', 'Lack of Cohesion in Methods', 8, 12, 'java', 'Regular', 'Open JDK8 Metrics'),
(60, 'LCOM4', 'Lack of Cohesion in Methods', 13, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics'),
(61, 'LCOM4', 'Lack of Cohesion in Methods', 0, 3, 'java', 'Excelente', 'Tomcat Metrics'),
(62, 'LCOM4', 'Lack of Cohesion in Methods', 4, 7, 'java', 'Bom', 'Tomcat Metrics'),
(63, 'LCOM4', 'Lack of Cohesion in Methods', 8, 11, 'java', 'Regular', 'Tomcat Metrics'),
(64, 'LCOM4', 'Lack of Cohesion in Methods', 12, 4294967295, 'java', 'Ruim', 'Tomcat Metrics'),
(65, 'NOC', 'Number of Children', 0, 0, 'java', 'Excelente', 'Open JDK8 Metrics'),
(66, 'NOC', 'Number of Children', 1, 2, 'java', 'Bom', 'Open JDK8 Metrics'),
(67, 'NOC', 'Number of Children', 3, 3, 'java', 'Regular', 'Open JDK8 Metrics'),
(68, 'NOC', 'Number of Children', 4, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics'),
(69, 'NOC', 'Number of Children', 0, 0, 'java', 'Excelente', 'Tomcat Metrics'),
(70, 'NOC', 'Number of Children', 1, 2, 'java', 'Bom', 'Tomcat Metrics'),
(71, 'NOC', 'Number of Children', 3, 3, 'java', 'Regular', 'Tomcat Metrics'),
(72, 'NOC', 'Number of Children', 4, 4294967295, 'java', 'Ruim', 'Tomcat Metrics'),
(73, 'NOM', 'Number of Methods', 0, 8, 'java', 'Excelente', 'Open JDK8 Metrics'),
(74, 'NOM', 'Number of Methods', 9, 17, 'java', 'Bom', 'Open JDK8 Metrics'),
(75, 'NOM', 'Number of Methods', 18, 27, 'java', 'Regular', 'Open JDK8 Metrics'),
(76, 'NOM', 'Number of Methods', 28, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics'),
(77, 'NOM', 'Number of Methods', 0, 10, 'java', 'Excelente', 'Tomcat Metrics'),
(78, 'NOM', 'Number of Methods', 11, 21, 'java', 'Bom', 'Tomcat Metrics'),
(79, 'NOM', 'Number of Methods', 22, 35, 'java', 'Regular', 'Tomcat Metrics'),
(80, 'NOM', 'Number of Methods', 36, 4294967295, 'java', 'Ruim', 'Tomcat Metrics'),
(81, 'NPA', 'Number of Public Attributes', 0, 0, 'java', 'Excelente', 'Open JDK8 Metrics'),
(82, 'NPA', 'Number of Public Attributes', 1, 1, 'java', 'Bom', 'Open JDK8 Metrics'),
(83, 'NPA', 'Number of Public Attributes', 2, 3, 'java', 'Regular', 'Open JDK8 Metrics'),
(84, 'NPA', 'Number of Public Attributes', 4, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics'),
(85, 'NPA', 'Number of Public Attributes', 0, 0, 'java', 'Excelente', 'Tomcat Metrics'),
(86, 'NPA', 'Number of Public Attributes', 1, 1, 'java', 'Bom', 'Tomcat Metrics'),
(87, 'NPA', 'Number of Public Attributes', 2, 3, 'java', 'Regular', 'Tomcat Metrics'),
(88, 'NPA', 'Number of Public Attributes', 4, 4294967295, 'java', 'Ruim', 'Tomcat Metrics'),
(89, 'RFC', 'Response for Class', 0, 9, 'java', 'Excelente', 'Open JDK8 Metrics'),
(90, 'RFC', 'Response for Class', 10, 26, 'java', 'Bom', 'Open JDK8 Metrics'),
(91, 'RFC', 'Response for Class', 27, 59, 'java', 'Regular', 'Open JDK8 Metrics'),
(92, 'RFC', 'Response for Class', 59, 4294967295, 'java', 'Ruim', 'Open JDK8 Metrics'),
(93, 'RFC', 'Response for Class', 0, 11, 'java', 'Excelente', 'Tomcat Metrics'),
(94, 'RFC', 'Response for Class', 12, 30, 'java', 'Bom', 'Tomcat Metrics'),
(95, 'RFC', 'Response for Class', 31, 74, 'java', 'Regular', 'Tomcat Metrics'),
(96, 'RFC', 'Response for Class', 75, 4294967295, 'java', 'Ruim', 'Tomcat Metrics');

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `F_Project_Metric`
--
ALTER TABLE `F_Project_Metric`
  ADD CONSTRAINT `fk_F_Project_Metric_D_Configuration1` FOREIGN KEY (`D_Configuration_idConfiguration`) REFERENCES `D_Configuration` (`idConfiguration`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_F_Project_Metric_D_Metric1` FOREIGN KEY (`D_Metric_idMetric`) REFERENCES `D_Metric` (`idMetric`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_F_Project_Metric_D_Project1` FOREIGN KEY (`D_Project_idProject`) REFERENCES `D_Project` (`idProject`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_F_Project_Metric_D_Quality1` FOREIGN KEY (`D_Quality_idQuality`) REFERENCES `D_Quality` (`idQuality`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_F_Project_Metric_D_Release1` FOREIGN KEY (`D_Release_idRelease`) REFERENCES `D_Release` (`idRelease`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_F_Project_Metric_D_Time1` FOREIGN KEY (`D_Time_idTime`) REFERENCES `D_Time` (`idTime`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


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
  `quantity_Scenario` INT NULL,
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
