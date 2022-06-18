<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2022-06-18 00:48:18 --> Severity: Notice --> Undefined variable: equipo D:\xampp\htdocs\adt_prepa\application\views\default\front\front_lista_proyectos.php 1
ERROR - 2022-06-18 00:58:09 --> Severity: error --> Exception: syntax error, unexpected ')', expecting ',' or ';' D:\xampp\htdocs\adt_prepa\application\views\default\front\front_form_actualizar_proyectos.php 90
ERROR - 2022-06-18 01:25:29 --> Severity: error --> Exception: Call to undefined function fecha_es() D:\xampp\htdocs\adt_prepa\application\views\default\front\front_detalles_proyecto.php 12
ERROR - 2022-06-18 02:31:57 --> Severity: Warning --> A non-numeric value encountered D:\xampp\htdocs\adt_prepa\application\controllers\Front_Tareas.php 71
ERROR - 2022-06-18 02:31:57 --> Severity: Warning --> Division by zero D:\xampp\htdocs\adt_prepa\application\controllers\Front_Tareas.php 71
ERROR - 2022-06-18 02:35:58 --> Query error: Unknown column 'tarreas.FECHA_FINAL' in 'where clause' - Invalid query: SELECT *
FROM `tareas`
JOIN `usuarios_tareas` ON `usuarios_tareas`.`ID_TAREA` = `tareas`.`ID_TAREA`
WHERE   (
`tarreas`.`FECHA_FINAL` >= '19-05-2022'
AND `tarreas`.`ID_USUARIO` <= '18-06-2022'
AND `usuarios_tareas`.`ID_USUARIO` = '5c0653d43d92e7.75019474'
 )
