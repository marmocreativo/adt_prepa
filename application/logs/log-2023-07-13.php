<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2023-07-13 19:35:15 --> Severity: Warning --> Undefined array key "ID_PROCESO" /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/front_detalles_tarea.php 409
ERROR - 2023-07-13 19:35:15 --> Query error: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.validacion_respuesta.ID_RESPUESTA' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT *
FROM `validacion_respuesta`
WHERE   (
`ID_TAREA` = '179'
 )
GROUP BY `ID_REVISION`
