<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2023-05-30 18:08:31 --> Severity: Warning --> mysqli::real_connect(): (HY000/1045): Access denied for user 'polaris'@'localhost' (using password: YES) /Applications/MAMP/htdocs/adt_prepa/system/database/drivers/mysqli/mysqli_driver.php 203
ERROR - 2023-05-30 18:08:31 --> Unable to connect to the database
ERROR - 2023-05-30 18:08:52 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT COUNT(*) AS `numrows`
FROM (
SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '53'
 )
GROUP BY `ID_USUARIO`
) CI_count_all_results
ERROR - 2023-05-30 18:10:41 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT COUNT(*) AS `numrows`
FROM (
SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '53'
 )
GROUP BY `ID_USUARIO`
) CI_count_all_results
ERROR - 2023-05-30 18:10:49 --> Severity: error --> Exception: syntax error, unexpected single-quoted string "", expecting variable /Applications/MAMP/htdocs/adt_prepa/application/models/GeneralModel.php 16
ERROR - 2023-05-30 18:11:05 --> Query error: Expression #18 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.equipos_usuarios.ID_EQUIPO' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT *
FROM `usuarios`
JOIN `equipos_usuarios` ON `equipos_usuarios`.`ID_USUARIO` = `usuarios`.`ID_USUARIO`
WHERE   (
`usuarios`.`ESTADO` = 'activo'
 )
GROUP BY `usuarios`.`ID_USUARIO`
ORDER BY `usuarios`.`USUARIO_NOMBRE` ASC
ERROR - 2023-05-30 18:11:08 --> Query error: Expression #18 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.equipos_usuarios.ID_EQUIPO' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT *
FROM `usuarios`
JOIN `equipos_usuarios` ON `equipos_usuarios`.`ID_USUARIO` = `usuarios`.`ID_USUARIO`
WHERE   (
`usuarios`.`ESTADO` = 'activo'
 )
GROUP BY `usuarios`.`ID_USUARIO`
ORDER BY `usuarios`.`USUARIO_NOMBRE` ASC
ERROR - 2023-05-30 18:11:21 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT COUNT(*) AS `numrows`
FROM (
SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '53'
 )
GROUP BY `ID_USUARIO`
) CI_count_all_results
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Undefined array key "usuario" /Applications/MAMP/htdocs/adt_prepa/application/controllers/Front_Proyectos.php 75
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Trying to access array offset on value of type null /Applications/MAMP/htdocs/adt_prepa/application/controllers/Front_Proyectos.php 75
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Undefined array key "usuario" /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 5
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Trying to access array offset on value of type null /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 5
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Undefined array key "usuario" /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 6
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Trying to access array offset on value of type null /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 6
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Undefined array key "usuario" /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 10
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Trying to access array offset on value of type null /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 10
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Undefined array key "usuario" /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 21
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Trying to access array offset on value of type null /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 21
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Trying to access array offset on value of type null /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 22
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Undefined array key "usuario" /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 31
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Trying to access array offset on value of type null /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 31
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Undefined array key "usuario" /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 63
ERROR - 2023-05-30 21:04:55 --> Severity: Warning --> Trying to access array offset on value of type null /Applications/MAMP/htdocs/adt_prepa/application/views/default/front/widgets/menu_principal.php 63
ERROR - 2023-05-30 21:06:05 --> Query error: Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'polaris.usuarios_tareas.USUARIO_ASIGNACION' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT COUNT(*) AS `numrows`
FROM (
SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '53'
 )
GROUP BY `ID_USUARIO`
) CI_count_all_results
ERROR - 2023-05-30 21:07:34 --> Severity: error --> Exception: syntax error, unexpected single-quoted string "", expecting variable /Applications/MAMP/htdocs/adt_prepa/application/models/GeneralModel.php 16
ERROR - 2023-05-30 21:08:12 --> Severity: error --> Exception: syntax error, unexpected single-quoted string "", expecting variable /Applications/MAMP/htdocs/adt_prepa/application/models/GeneralModel.php 76
ERROR - 2023-05-30 21:08:22 --> Severity: error --> Exception: syntax error, unexpected single-quoted string "", expecting variable /Applications/MAMP/htdocs/adt_prepa/application/models/GeneralModel.php 108
