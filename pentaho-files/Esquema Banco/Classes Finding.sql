SET @release_number = (SELECT substring_index('2.js','.',1));

SET @release_id = (SELECT idRelease from D_Release where release_number = @release_number);


SET @Project_Language = (SELECT project_language from D_Project);

SET @idProject = (SELECT max(idProject) from D_Project);


SET @idACCM = (SELECT idMetricRange FROM Meta_Metric_Ranges
where language_name =  @Project_Language 
and metric_name='ACCM' and ? <= max AND ? >= min and configuration_name like '%Open JDK8 Metrics%');

SET @idAMLOC = (SELECT idMetricRange FROM Meta_Metric_Ranges
where language_name =  @Project_Language 
and metric_name='AMLOC' and ? <= max AND ? >= min and configuration_name like '%Open JDK8 Metrics%');

SET @idANPM = (SELECT idMetricRange FROM Meta_Metric_Ranges
where language_name =  @Project_Language 
and metric_name='ANPM' and ? <= max AND ? >= min and configuration_name like '%Open JDK8 Metrics%');

SET @idCBO = (SELECT idMetricRange FROM Meta_Metric_Ranges
where language_name =  @Project_Language 
and metric_name='CBO' and ? <= max AND ? >= min and configuration_name like '%Open JDK8 Metrics%');

SET @idDIT = (SELECT idMetricRange FROM Meta_Metric_Ranges
where language_name =  @Project_Language 
and metric_name='DIT' and ? <= max AND ? >= min and configuration_name like '%Open JDK8 Metrics%');

SET @idLCOM4 = (SELECT idMetricRange FROM Meta_Metric_Ranges
where language_name =  @Project_Language 
and metric_name='LCOM4' and ? <= max AND ? >= min and configuration_name like '%Open JDK8 Metrics%');

SET @idNPA = (SELECT idMetricRange FROM Meta_Metric_Ranges
where language_name =  @Project_Language 
and metric_name='NPA' and ? <= max AND ? >= min and configuration_name like '%Open JDK8 Metrics%');


SET @idRFC = (SELECT idMetricRange FROM Meta_Metric_Ranges
where language_name =  @Project_Language 
and metric_name='NPA' and ? <= max AND ? >= min and configuration_name like '%Open JDK8 Metrics%');


#Classe Pouco Coesa

SET @idClassePoucoCoesa = (SELECT `Meta_Scenario`.`idMeta_Scenario`
FROM `Meta_Metric_Ranges_Meta_Scenario` INNER JOIN Meta_Scenario ON Meta_Scenario.idMeta_Scenario = Meta_Metric_Ranges_Meta_Scenario.Meta_Scenario_idMeta_Scenario where 
Meta_Metric_Ranges_Meta_Scenario.Meta_Metric_Ranges_idMetricRange1 = @idLCOM4 
and  Meta_Metric_Ranges_Meta_Scenario.Meta_Metric_Ranges_idMetricRange2 = @idRFC);


#Interface dos Métodos

SET @idInterfaceMetodos = (SELECT `Meta_Scenario`.`idMeta_Scenario`
FROM `Meta_Metric_Ranges_Meta_Scenario` INNER JOIN Meta_Scenario ON Meta_Scenario.idMeta_Scenario = Meta_Metric_Ranges_Meta_Scenario.Meta_Scenario_idMeta_Scenario where 
Meta_Metric_Ranges_Meta_Scenario.Meta_Metric_Ranges_idMetricRange1 = @idANPM);


#Classe com muitos Filhos

SET @idClasseFilhos = (SELECT `Meta_Scenario`.`idMeta_Scenario`
FROM `Meta_Metric_Ranges_Meta_Scenario` INNER JOIN Meta_Scenario ON Meta_Scenario.idMeta_Scenario = Meta_Metric_Ranges_Meta_Scenario.Meta_Scenario_idMeta_Scenario where 
Meta_Metric_Ranges_Meta_Scenario.Meta_Metric_Ranges_idMetricRange1 = @idDIT);

#Classe Grande

SET @idClasseGrande = (SELECT `Meta_Scenario`.`idMeta_Scenario`
FROM `Meta_Metric_Ranges_Meta_Scenario` INNER JOIN Meta_Scenario ON Meta_Scenario.idMeta_Scenario = Meta_Metric_Ranges_Meta_Scenario.Meta_Scenario_idMeta_Scenario where 
Meta_Metric_Ranges_Meta_Scenario.Meta_Metric_Ranges_idMetricRange1 = @idACCM 
and  Meta_Metric_Ranges_Meta_Scenario.Meta_Metric_Ranges_idMetricRange2 = @idAMLOC);


#Classe Exposta

SET @idClasseExposta = (SELECT `Meta_Scenario`.`idMeta_Scenario`
FROM `Meta_Metric_Ranges_Meta_Scenario` INNER JOIN Meta_Scenario ON Meta_Scenario.idMeta_Scenario = Meta_Metric_Ranges_Meta_Scenario.Meta_Scenario_idMeta_Scenario where 
Meta_Metric_Ranges_Meta_Scenario.Meta_Metric_Ranges_idMetricRange1 = @idNPA);

#Complexidade Estrutural

SET @idComplexidadeEstrutural = (SELECT `Meta_Scenario`.`idMeta_Scenario`
FROM `Meta_Metric_Ranges_Meta_Scenario` INNER JOIN Meta_Scenario ON Meta_Scenario.idMeta_Scenario = Meta_Metric_Ranges_Meta_Scenario.Meta_Scenario_idMeta_Scenario where 
Meta_Metric_Ranges_Meta_Scenario.Meta_Metric_Ranges_idMetricRange1 = @idCBO 
and  Meta_Metric_Ranges_Meta_Scenario.Meta_Metric_Ranges_idMetricRange2 = @idLCOM4);

SELECT @release_id, @idLCOM4, @idCBO, @idScenario;
