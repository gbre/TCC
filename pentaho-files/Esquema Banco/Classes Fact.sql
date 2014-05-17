USE project_info;

SET @idProject = (SELECT max(idProject) from Project);

SET @idVersion = (SELECT max(idVersion) from Version);

SET @Project_Language = (SELECT project_language from Project);

# Consulta da Range LOC

SET @idLOC = (SELECT idMetricRange FROM project_info.Metric_Ranges where language_name = @Project_Language and 
metric_name='LOC' and ? <= max AND ? >= min) ;

# Consulta de Indicador de Qualidade de LOC

SET @qualityLOC = (SELECT idQuality FROM project_info.Quality where quality_index=
(SELECT quality_index FROM project_info.Metric_Ranges where idMetricRange=@idLOC));


# Consulta Na Range ACC

SET @idACC = (SELECT idMetricRange FROM project_info.Metric_Ranges where language_name = @Project_Language and 
metric_name='ACC' and ? <= max AND ? >= min) ;

# Consulta de Indicador de Qualidade de ACC

SET @qualityACC = (SELECT idQuality FROM project_info.Quality where quality_index=
(SELECT quality_index FROM project_info.Metric_Ranges where idMetricRange=@idACC));


# Consulta Na Range ACCM

SET @idACCM = (SELECT idMetricRange FROM project_info.Metric_Ranges where language_name = @Project_Language and 
metric_name='ACCM' and ? <= max AND ? >= min) ;

# Consulta de Indicador de Qualidade de ACCM

SET @qualityACCM = (SELECT idQuality FROM project_info.Quality where quality_index=
(SELECT quality_index FROM project_info.Metric_Ranges where idMetricRange=@idACCM));

# Consulta Na Range RFC

SET @idRFC = (SELECT idMetricRange FROM project_info.Metric_Ranges where language_name = @Project_Language and 
metric_name='RFC' and ? <= max AND ? >= min) ;

# Consulta de Indicador de Qualidade de RFC

SET @qualityRFC = (SELECT idQuality FROM project_info.Quality where quality_index=
(SELECT quality_index FROM project_info.Metric_Ranges where idMetricRange=@idRFC));

# Consulta Na Range LCOM4

SET @idLCOM4 = (SELECT idMetricRange FROM project_info.Metric_Ranges where language_name = @Project_Language and 
metric_name='LCOM4' and ? <= max AND ? >= min) ;

# Consulta de Indicador de Qualidade de LCOM4

SET @qualityLCOM4 = (SELECT idQuality FROM project_info.Quality where quality_index=
(SELECT quality_index FROM project_info.Metric_Ranges where idMetricRange=@idLCOM4));


# Consulta Na Range NOM

SET @idNOM = (SELECT idMetricRange FROM project_info.Metric_Ranges where language_name = @Project_Language and 
metric_name='NOM' and ? <= max AND ? >= min) ;


# Consulta de Indicador de Qualidade de NOM

SET @qualityNOM = (SELECT idQuality FROM project_info.Quality where quality_index=
(SELECT quality_index FROM project_info.Metric_Ranges where idMetricRange=@idNOM));


# Consulta Na Range DIT

SET @idDIT = (SELECT idMetricRange FROM project_info.Metric_Ranges where language_name = @Project_Language and 
metric_name='DIT' and ? <= max AND ? >= min) ;


# Consulta de Indicador de Qualidade de DIT

SET @qualityDIT = (SELECT idQuality FROM project_info.Quality where quality_index=
(SELECT quality_index FROM project_info.Metric_Ranges where idMetricRange=@idDIT));

# Consulta Na Range NOC

SET @idNOC = (SELECT idMetricRange FROM project_info.Metric_Ranges where language_name = @Project_Language and 
metric_name='NOC' and ? <= max AND ? >= min) ;

# Consulta de Indicador de Qualidade de NOC

SET @qualityNOC = (SELECT idQuality FROM project_info.Quality where quality_index=
(SELECT quality_index FROM project_info.Metric_Ranges where idMetricRange=@idNOC));

#Inserindo o Fato do LOC

INSERT INTO `project_info`.`Quality_Class_Metric_Fact`
(`metric_value`,`Class_idClass`,`Project_idProject`,`Metric_Ranges_idMetricRange`,`Version_idVersion`,`Quality_idQuality`)
VALUES
(?,?,@idProject, @idLOC, @idVersion, @qualityLOC);

#Inserindo o Fato do ACCM

INSERT INTO `project_info`.`Quality_Class_Metric_Fact`
(`metric_value`,`Class_idClass`,`Project_idProject`,`Metric_Ranges_idMetricRange`,`Version_idVersion`,`Quality_idQuality`)
VALUES
(?,?,@idProject, @idACCM, @idVersion, @qualityACCM);

#Inserindo o Fato do ACC

INSERT INTO `project_info`.`Quality_Class_Metric_Fact`
(`metric_value`,`Class_idClass`,`Project_idProject`,`Metric_Ranges_idMetricRange`,`Version_idVersion`,`Quality_idQuality`)
VALUES
(?,?,@idProject, @idACC, @idVersion, @qualityACC);

#Inserindo o Fato do RFC

INSERT INTO `project_info`.`Quality_Class_Metric_Fact`
(`metric_value`,`Class_idClass`,`Project_idProject`,`Metric_Ranges_idMetricRange`,`Version_idVersion`,`Quality_idQuality`)
VALUES
(?,?,@idProject, @idRFC, @idVersion, @qualityRFC);

#Inserindo o Fato do LCOM4

INSERT INTO `project_info`.`Quality_Class_Metric_Fact`
(`metric_value`,`Class_idClass`,`Project_idProject`,`Metric_Ranges_idMetricRange`,`Version_idVersion`,`Quality_idQuality`)
VALUES
(?,?,@idProject, @idLCOM4, @idVersion, @qualityLCOM4);

#Inserindo o Fato do NOM

INSERT INTO `project_info`.`Quality_Class_Metric_Fact`
(`metric_value`,`Class_idClass`,`Project_idProject`,`Metric_Ranges_idMetricRange`,`Version_idVersion`,`Quality_idQuality`)
VALUES
(?,?,@idProject, @idNOM, @idVersion, @qualityNOM);

#Inserindo o Fato do DIT

INSERT INTO `project_info`.`Quality_Class_Metric_Fact`
(`metric_value`,`Class_idClass`,`Project_idProject`,`Metric_Ranges_idMetricRange`,`Version_idVersion`,`Quality_idQuality`)
VALUES
(?,?,@idProject, @idDIT, @idVersion,@qualityDIT);

#Inserindo o Fato do NOC

INSERT INTO `project_info`.`Quality_Class_Metric_Fact`
(`metric_value`,`Class_idClass`,`Project_idProject`,`Metric_Ranges_idMetricRange`,`Version_idVersion`,`Quality_idQuality`)
VALUES
(?,?,@idProject, @idNOC, @idVersion,@qualityNOC);