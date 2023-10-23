<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2023-10-23 19:20:43 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '290'
 )
GROUP BY `ID_USUARIO`
ERROR - 2023-10-23 19:22:38 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '236'
 )
GROUP BY `ID_USUARIO`
