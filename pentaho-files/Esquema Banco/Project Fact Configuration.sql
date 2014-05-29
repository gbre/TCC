USE source_info;

SET @idProject = (SELECT max(idProject) from D_Project);

SET @idRelease = (SELECT max(idRelease) from D_Release);

SET @Project_Language = (SELECT project_language from D_Project);

SET @Best_Configuration  = (SELECT idConfiguration FROM D_Configuration where configuration_name like '%Melhor%' and
language_name LIKE CONCAT('%', @Project_Language, '%')); 


# Consulta da Métrica LOC
SET @idLOC = (SELECT idMetric FROM D_Metric where metric_abbreviation='LOC'); 


# Consulta da Métrica ACCM
SET @idACCM = (SELECT idMetric FROM D_Metric where metric_abbreviation='ACCM'); 

# Consulta da Métrica AMLOC

SET @idAMLOC = (SELECT idMetric FROM D_Metric where metric_abbreviation='AMLOC');


# Consulta da Métrica ACC

SET @idACC = (SELECT idMetric FROM D_Metric where metric_abbreviation='ACC'); 

# Consulta da Métrica ANPM

SET @idANPM = (SELECT idMetric FROM D_Metric where metric_abbreviation='ANPM'); 


# Consulta da Métrica CBO

SET @idCBO = (SELECT idMetric FROM D_Metric where metric_abbreviation='CBO'); 

# Consulta da Métrica DIT

SET @idDIT = (SELECT idMetric FROM D_Metric where metric_abbreviation='DIT'); 

# Consulta da Métrica LCOM4

SET @idLCOM4 = (SELECT idMetric FROM D_Metric where metric_abbreviation='LCOM4');

# Consulta da Métrica NOC

SET @idNOC = (SELECT idMetric FROM D_Metric where metric_abbreviation='NOC');  

# Consulta da Métrica NOM

SET @idNOM = (SELECT idMetric FROM D_Metric where metric_abbreviation='NOM'); 

# Consulta da Métrica NPA

SET @idNPA = (SELECT idMetric FROM D_Metric where metric_abbreviation='NPA'); 

# Consulta da Métrica RFC

SET @idRFC = (SELECT idMetric FROM D_Metric where metric_abbreviation='RFC'); 

# Consulta de Indicador de Qualidade de LOC na Melhor Configuração

SET @qualityBestLOC = (SELECT idQuality FROM Meta_Metric_Ranges
INNER JOIN D_Quality
ON Meta_Metric_Ranges.quality_index=D_Quality.quality_index where language_name =  @Project_Language 
and metric_name='LOC' and ? <= max AND ? >= min and configuration_name like '%Melhor%');


# Consulta de Indicador de Qualidade de ACCM na Melhor Configuração

SET @qualityBestACCM = (SELECT idQuality FROM Meta_Metric_Ranges
INNER JOIN D_Quality
ON Meta_Metric_Ranges.quality_index=D_Quality.quality_index where language_name =  @Project_Language 
and metric_name='ACCM' and ? <= max AND ? >= min and configuration_name like '%Melhor%');

# Consulta de Indicador de Qualidade de AMLOC na Melhor Configuração

SET @qualityBestAMLOC = (SELECT idQuality FROM Meta_Metric_Ranges
INNER JOIN D_Quality
ON Meta_Metric_Ranges.quality_index=D_Quality.quality_index where language_name =  @Project_Language 
and metric_name='AMLOC' and ? <= max AND ? >= min and configuration_name like '%Melhor%');

# Consulta de Indicador de Qualidade de ACC na Melhor Configuração

SET @qualityBestACC = (SELECT idQuality FROM Meta_Metric_Ranges
INNER JOIN D_Quality
ON Meta_Metric_Ranges.quality_index=D_Quality.quality_index where language_name =  @Project_Language 
and metric_name='ACC' and ? <= max AND ? >= min and configuration_name like '%Melhor%');

# Consulta de Indicador de Qualidade de ANPM na Melhor Configuração

SET @qualityBestANPM = (SELECT idQuality FROM Meta_Metric_Ranges
INNER JOIN D_Quality
ON Meta_Metric_Ranges.quality_index=D_Quality.quality_index where language_name =  @Project_Language 
and metric_name='ANPM' and ? <= max AND ? >= min and configuration_name like '%Melhor%');


# Consulta de Indicador de Qualidade de CBO na Melhor Configuração

SET @qualityBestCBO = (SELECT idQuality FROM Meta_Metric_Ranges
INNER JOIN D_Quality
ON Meta_Metric_Ranges.quality_index=D_Quality.quality_index where language_name =  @Project_Language 
and metric_name='CBO' and ? <= max AND ? >= min and configuration_name like '%Melhor%');

# Consulta de Indicador de Qualidade de DIT na Melhor Configuração

SET @qualityBestDIT = (SELECT idQuality FROM Meta_Metric_Ranges
INNER JOIN D_Quality
ON Meta_Metric_Ranges.quality_index=D_Quality.quality_index where language_name =  @Project_Language 
and metric_name='DIT' and ? <= max AND ? >= min and configuration_name like '%Melhor%');


# Consulta de Indicador de Qualidade de LCOM4 na Melhor Configuração

SET @qualityBestLCOM4 = (SELECT idQuality FROM Meta_Metric_Ranges
INNER JOIN D_Quality
ON Meta_Metric_Ranges.quality_index=D_Quality.quality_index where language_name =  @Project_Language 
and metric_name='LCOM4' and ? <= max AND ? >= min and configuration_name like '%Melhor%');

# Consulta de Indicador de Qualidade de NOC na Melhor Configuração

SET @qualityBestNOC = (SELECT idQuality FROM Meta_Metric_Ranges
INNER JOIN D_Quality
ON Meta_Metric_Ranges.quality_index=D_Quality.quality_index where language_name =  @Project_Language 
and metric_name='NOC' and ? <= max AND ? >= min and configuration_name like '%Melhor%');


# Consulta de Indicador de Qualidade de NOM na Melhor Configuração

SET @qualityBestNOM = (SELECT idQuality FROM Meta_Metric_Ranges
INNER JOIN D_Quality
ON Meta_Metric_Ranges.quality_index=D_Quality.quality_index where language_name =  @Project_Language 
and metric_name='NOM' and ? <= max AND ? >= min and configuration_name like '%Melhor%');

# Consulta de Indicador de Qualidade de NPA na Melhor Configuração

SET @qualityBestNPA = (SELECT idQuality FROM Meta_Metric_Ranges
INNER JOIN D_Quality
ON Meta_Metric_Ranges.quality_index=D_Quality.quality_index where language_name =  @Project_Language 
and metric_name='NPA' and ? <= max AND ? >= min and configuration_name like '%Melhor%');

# Consulta de Indicador de Qualidade de RFC na Melhor Configuração

SET @qualityBestRFC = (SELECT idQuality FROM Meta_Metric_Ranges
INNER JOIN D_Quality
ON Meta_Metric_Ranges.quality_index=D_Quality.quality_index where language_name =  @Project_Language 
and metric_name='RFC' and ? <= max AND ? >= min and configuration_name like '%Melhor%');


# Inserindo o Fato do LOC na melhor Configuração;

INSERT INTO `source_info`.`F_Project_Metric`
(`percentil_value`, `Project_idproject`, `Quality_idQuality`,
`Metric_idMetric`, `Configuration_idConfiguration`, `D_Release_idRelease`)
VALUES
(?,@idProject, @qualityBestLOC, @idLOC, @Best_Configuration, @idRelease);


# Inserindo o Fato do ACCM na melhor Configuração;

INSERT INTO `source_info`.`F_Project_Metric`
(`percentil_value`, `Project_idproject`, `Quality_idQuality`,
`Metric_idMetric`, `Configuration_idConfiguration`, `D_Release_idRelease`)
VALUES
(?,@idProject, @qualityBestACCM, @idACCM, @Best_Configuration, @idRelease);

# Inserindo o Fato do AMLOC na melhor Configuração;

INSERT INTO `source_info`.`F_Project_Metric`
(`percentil_value`, `Project_idproject`, `Quality_idQuality`,
`Metric_idMetric`, `Configuration_idConfiguration`, `D_Release_idRelease`)
VALUES
(?,@idProject, @qualityBestAMLOC, @idAMLOC, @Best_Configuration, @idRelease);

# Inserindo o Fato do ACC na melhor Configuração;

INSERT INTO `source_info`.`F_Project_Metric`
(`percentil_value`, `Project_idproject`, `Quality_idQuality`,
`Metric_idMetric`, `Configuration_idConfiguration`, `D_Release_idRelease`)
VALUES
(?,@idProject, @qualityBestACC, @idACC, @Best_Configuration, @idRelease);


# Inserindo o Fato do ANPM na melhor Configuração;

INSERT INTO `source_info`.`F_Project_Metric`
(`percentil_value`, `Project_idproject`, `Quality_idQuality`,
`Metric_idMetric`, `Configuration_idConfiguration`, `D_Release_idRelease`)
VALUES
(?,@idProject, @qualityBestANPM, @idANPM, @Best_Configuration, @idRelease);


# Inserindo o Fato do CBO na melhor Configuração;

INSERT INTO `source_info`.`F_Project_Metric`
(`percentil_value`, `Project_idproject`, `Quality_idQuality`,
`Metric_idMetric`, `Configuration_idConfiguration`, `D_Release_idRelease`)
VALUES
(?,@idProject, @qualityBestCBO, @idCBO, @Best_Configuration, @idRelease);


# Inserindo o Fato do DIT na melhor Configuração;

INSERT INTO `source_info`.`F_Project_Metric`
(`percentil_value`, `Project_idproject`, `Quality_idQuality`,
`Metric_idMetric`, `Configuration_idConfiguration`, `D_Release_idRelease`)
VALUES
(?,@idProject, @qualityBestDIT, @idDIT, @Best_Configuration, @idRelease);


# Inserindo o Fato do LCOM4 na melhor Configuração;

INSERT INTO `source_info`.`F_Project_Metric`
(`percentil_value`, `Project_idproject`, `Quality_idQuality`,
`Metric_idMetric`, `Configuration_idConfiguration`, `D_Release_idRelease`)
VALUES
(?,@idProject, @qualityBestLCOM4, @idLCOM4, @Best_Configuration, @idRelease);


# Inserindo o Fato do NOC na melhor Configuração;

INSERT INTO `source_info`.`F_Project_Metric`
(`percentil_value`, `Project_idproject`, `Quality_idQuality`,
`Metric_idMetric`, `Configuration_idConfiguration`, `D_Release_idRelease`)
VALUES
(?,@idProject, @qualityBestNOC, @idNOC, @Best_Configuration, @idRelease);

# Inserindo o Fato do NOM na melhor Configuração;

INSERT INTO `source_info`.`F_Project_Metric`
(`percentil_value`, `Project_idproject`, `Quality_idQuality`,
`Metric_idMetric`, `Configuration_idConfiguration`, `D_Release_idRelease`)
VALUES
(?,@idProject, @qualityBestNOM, @idNOM, @Best_Configuration, @idRelease);


# Inserindo o Fato do NPA na melhor Configuração;

INSERT INTO `source_info`.`F_Project_Metric`
(`percentil_value`, `Project_idproject`, `Quality_idQuality`,
`Metric_idMetric`, `Configuration_idConfiguration`, `D_Release_idRelease`)
VALUES
(?,@idProject, @qualityBestNPA, @idNPA, @Best_Configuration, @idRelease);


# Inserindo o Fato do RFC na melhor Configuração;

INSERT INTO `source_info`.`F_Project_Metric`
(`percentil_value`, `Project_idproject`, `Quality_idQuality`,
`Metric_idMetric`, `Configuration_idConfiguration`, `D_Release_idRelease`)
VALUES
(?,@idProject, @qualityBestRFC, @idRFC, @Best_Configuration, @idRelease);