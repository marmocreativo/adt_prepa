<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| RUTAS RESERVADAS
| -------------------------------------------------------------------------
|
*/
$route['default_controller'] = 'Front_Publicaciones';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

/*
| -------------------------------------------------------------------------
| RUTAS AUTENTICACION
| -------------------------------------------------------------------------
|
*/
$route['login'] = 'Autenticacion';
$route['login/(:any)'] = 'Autenticacion/$1';

/*
| -------------------------------------------------------------------------
| RUTAS AJAX
| -------------------------------------------------------------------------
|
*/
$route['ajax'] = 'Ajax';
$route['ajax/(:any)'] = 'Ajax/$1';

/*
| -------------------------------------------------------------------------
| RUTAS ADMINISTRADOR
| -------------------------------------------------------------------------
|
*/
/* - Bases de datos - */
$route['admin/base_de_datos'] = 'Admin_Base_De_Datos';
$route['admin/base_de_datos/(:any)'] = 'Admin_Base_De_Datos/$1';

/* - Página de inicio - */
$route['admin'] = 'Admin_Inicio';
$route['admin/(:any)'] = 'Admin_Inicio/$1';
/*
| -------------------------------------------------------------------------
| RUTAS Equipos y proyectos
| -------------------------------------------------------------------------
|
*/
$route['equipos'] = 'Front_Equipos';
$route['equipos/(:any)'] = 'Front_Equipos/$1';
$route['proyectos'] = 'Front_Proyectos';
$route['proyectos/(:any)'] = 'Front_Proyectos/$1';
$route['tareas'] = 'Front_Tareas';
$route['tareas/(:any)'] = 'Front_Tareas/$1';
$route['lista_usuarios'] = 'Front_Usuarios';
$route['lista_usuarios/(:any)'] = 'Front_Usuarios/$1';
/*
| -------------------------------------------------------------------------
| RUTAS USUARIOS
| -------------------------------------------------------------------------
|
*/
$route['usuarios'] = 'Usuarios_Inicio';
$route['usuarios/(:any)'] = 'Usuarios_Inicio/$1';

/*
| -------------------------------------------------------------------------
| RUTAS FRONTEND
| -------------------------------------------------------------------------
|
*/
$route['sitemap.xml'] = 'Front_Publicaciones/sitemap/';
$route['reparar_EN_CMS'] = 'Admin_Instalar';
$route['mantenimiento'] = 'Front_Publicaciones/mantenimiento';
$route['busqueda'] = 'Front_Publicaciones/busqueda';
$route['categoria/(:any)'] = 'Front_Publicaciones/categoria/$1';
$route['categoria/(:any)/(:num)'] = 'Front_Publicaciones/categoria/$1/$2';

$route['reaccionar'] = 'Front_Publicaciones/reaccionar/';
$route['(:any)'] = 'Front_Publicaciones/publicacion/';
