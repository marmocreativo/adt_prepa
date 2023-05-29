<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2023-05-25 20:51:17 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT COUNT(*) AS `numrows`
FROM (
SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '53'
 )
GROUP BY `ID_USUARIO`
) CI_count_all_results
ERROR - 2023-05-25 20:51:20 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT COUNT(*) AS `numrows`
FROM (
SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '53'
 )
GROUP BY `ID_USUARIO`
) CI_count_all_results
ERROR - 2023-05-25 20:57:50 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT COUNT(*) AS `numrows`
FROM (
SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '53'
 )
GROUP BY `ID_USUARIO`
) CI_count_all_results
ERROR - 2023-05-25 20:59:47 --> Severity: Notice --> Trying to access array offset on value of type null /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/front_detalles_tarea.php 94
ERROR - 2023-05-25 20:59:47 --> Severity: Notice --> Trying to access array offset on value of type null /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/front_detalles_tarea.php 97
ERROR - 2023-05-25 21:14:39 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT COUNT(*) AS `numrows`
FROM (
SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '53'
 )
GROUP BY `ID_USUARIO`
) CI_count_all_results
ERROR - 2023-05-25 21:38:17 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT COUNT(*) AS `numrows`
FROM (
SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '53'
 )
GROUP BY `ID_USUARIO`
) CI_count_all_results
ERROR - 2023-05-25 22:42:34 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT COUNT(*) AS `numrows`
FROM (
SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '53'
 )
GROUP BY `ID_USUARIO`
) CI_count_all_results
ERROR - 2023-05-25 22:43:48 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT COUNT(*) AS `numrows`
FROM (
SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '53'
 )
GROUP BY `ID_USUARIO`
) CI_count_all_results
ERROR - 2023-05-25 22:43:52 --> Query error: Expression #18 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.equipos_usuarios.ID_EQUIPO' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT *
FROM `usuarios`
JOIN `equipos_usuarios` ON `equipos_usuarios`.`ID_USUARIO` = `usuarios`.`ID_USUARIO`
WHERE   (
`usuarios`.`ESTADO` = 'activo'
 )
GROUP BY `usuarios`.`ID_USUARIO`
ORDER BY `usuarios`.`USUARIO_NOMBRE` ASC
ERROR - 2023-05-25 22:43:53 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT COUNT(*) AS `numrows`
FROM (
SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '53'
 )
GROUP BY `ID_USUARIO`
) CI_count_all_results
