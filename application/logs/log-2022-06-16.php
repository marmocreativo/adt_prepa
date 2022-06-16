<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2022-06-16 22:16:47 --> Severity: Notice --> Undefined variable: icono D:\xampp\htdocs\adt_prepa\application\views\default\front\front_lista_tareas.php 53
ERROR - 2022-06-16 22:16:47 --> Severity: Notice --> Undefined variable: color D:\xampp\htdocs\adt_prepa\application\views\default\front\front_lista_tareas.php 53
ERROR - 2022-06-16 22:16:47 --> Severity: Notice --> Undefined variable: icono D:\xampp\htdocs\adt_prepa\application\views\default\front\front_lista_tareas.php 53
ERROR - 2022-06-16 22:16:47 --> Severity: Notice --> Undefined variable: color D:\xampp\htdocs\adt_prepa\application\views\default\front\front_lista_tareas.php 53
ERROR - 2022-06-16 22:56:44 --> Query error: Unknown column 'ESTADO' in 'where clause' - Invalid query: SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '1'
AND `ESTADO` = 'activo'
 )
ERROR - 2022-06-16 22:56:49 --> Query error: Unknown column 'ESTADO' in 'where clause' - Invalid query: SELECT *
FROM `usuarios_tareas`
WHERE   (
`ID_TAREA` = '1'
AND `ESTADO` = 'activo'
 )
ERROR - 2022-06-16 23:37:57 --> Query error: Unknown column 'usuarios.ID_USUARIO' in 'on clause' - Invalid query: SELECT *
FROM `tareas`
JOIN `usuarios_tareas` ON `usuarios_tareas`.`ID_USUARIO` = `usuarios`.`ID_USUARIO`
WHERE   (
`usuarios_tareas`.`ID_TAREA` = '1'
 )
ERROR - 2022-06-16 23:38:24 --> Query error: Not unique table/alias: 'usuarios_tareas' - Invalid query: SELECT *
FROM `usuarios_tareas`
JOIN `usuarios_tareas` ON `usuarios_tareas`.`ID_USUARIO` = `usuarios`.`ID_USUARIO`
WHERE   (
`usuarios_tareas`.`ID_TAREA` = '1'
 )
ERROR - 2022-06-16 23:47:58 --> Severity: Notice --> Undefined index: TITULO D:\xampp\htdocs\adt_prepa\application\views\default\front\front_detalles_proyecto.php 112
