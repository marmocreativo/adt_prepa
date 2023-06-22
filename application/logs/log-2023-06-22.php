<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2023-06-22 02:22:33 --> Query error: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.validacion_respuesta.ID_RESPUESTA' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT *
FROM `validacion_respuesta`
WHERE   (
`ID_TAREA` = '242'
 )
GROUP BY `ID_REVISION`
