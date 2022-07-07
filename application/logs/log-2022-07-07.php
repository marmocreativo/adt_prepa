<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2022-07-07 17:43:07 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '!) 'completo'
AND `usuarios_tareas`.`ID_USUARIO` = '5c0653d43d92e7.75019474'
...' at line 5 - Invalid query: SELECT *
FROM `tareas`
JOIN `usuarios_tareas` ON `usuarios_tareas`.`ID_TAREA` = `tareas`.`ID_TAREA`
WHERE   (
tareas.ESTADO !) 'completo'
AND `usuarios_tareas`.`ID_USUARIO` = '5c0653d43d92e7.75019474'
 )
ORDER BY `FECHA_INICIO` ASC
ERROR - 2022-07-07 17:56:18 --> Severity: error --> Exception: syntax error, unexpected '}', expecting ',' or ';' D:\xampp\htdocs\adt_prepa\application\views\default\front\widgets\lista_tareas.php 27
ERROR - 2022-07-07 18:10:18 --> Severity: error --> Exception: syntax error, unexpected 'echo' (T_ECHO) D:\xampp\htdocs\adt_prepa\application\views\default\front\widgets\lista_tareas.php 27
ERROR - 2022-07-07 19:03:57 --> Severity: error --> Exception: Too few arguments to function GeneralModel::lista(), 3 passed in D:\xampp\htdocs\adt_prepa\application\controllers\Front_Tareas.php on line 312 and exactly 6 expected D:\xampp\htdocs\adt_prepa\application\models\GeneralModel.php 52
ERROR - 2022-07-07 20:27:08 --> Severity: error --> Exception: syntax error, unexpected '=', expecting ')' D:\xampp\htdocs\adt_prepa\application\views\default\front\resumen.php 29
ERROR - 2022-07-07 20:27:18 --> Severity: error --> Exception: syntax error, unexpected '=', expecting ')' D:\xampp\htdocs\adt_prepa\application\views\default\front\resumen.php 29
ERROR - 2022-07-07 20:27:25 --> Severity: error --> Exception: Too few arguments to function GeneralModel::lista(), 3 passed in D:\xampp\htdocs\adt_prepa\application\views\default\front\resumen.php on line 40 and exactly 6 expected D:\xampp\htdocs\adt_prepa\application\models\GeneralModel.php 52
ERROR - 2022-07-07 20:27:45 --> Severity: Notice --> Trying to get property 'NOMBRE' of non-object D:\xampp\htdocs\adt_prepa\application\views\default\front\resumen.php 81
ERROR - 2022-07-07 20:27:45 --> Severity: Notice --> Trying to get property 'TAREAS_PENDIENTES' of non-object D:\xampp\htdocs\adt_prepa\application\views\default\front\resumen.php 82
ERROR - 2022-07-07 20:27:45 --> Severity: Notice --> Trying to get property 'NOMBRE' of non-object D:\xampp\htdocs\adt_prepa\application\views\default\front\resumen.php 81
ERROR - 2022-07-07 20:27:45 --> Severity: Notice --> Trying to get property 'TAREAS_PENDIENTES' of non-object D:\xampp\htdocs\adt_prepa\application\views\default\front\resumen.php 82
ERROR - 2022-07-07 20:27:45 --> Severity: Notice --> Trying to get property 'NOMBRE' of non-object D:\xampp\htdocs\adt_prepa\application\views\default\front\resumen.php 81
ERROR - 2022-07-07 20:27:45 --> Severity: Notice --> Trying to get property 'TAREAS_PENDIENTES' of non-object D:\xampp\htdocs\adt_prepa\application\views\default\front\resumen.php 82
