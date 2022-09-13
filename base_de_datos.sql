-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-08-2022 a las 00:24:07
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `adt_prepa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_CATEGORIA` bigint(6) NOT NULL,
  `CATEGORIA_NOMBRE` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `CATEGORIA_DESCRIPCION` text NOT NULL,
  `IMAGEN` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `IMAGEN_FONDO` varchar(255) NOT NULL DEFAULT 'fondo_default.jpg',
  `CATEGORIA_PADRE` int(6) NOT NULL DEFAULT 0,
  `CATEGORIA_NIVEL` int(1) NOT NULL DEFAULT 1,
  `VISIBLE` varchar(255) NOT NULL DEFAULT 'visible',
  `TIPO_OBJETO` varchar(255) NOT NULL DEFAULT 'publicacion',
  `TIPO` varchar(255) NOT NULL,
  `ESTADO` varchar(255) NOT NULL DEFAULT 'activo',
  `ORDEN` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_objetos`
--

CREATE TABLE `categorias_objetos` (
  `ID_CATEGORIA` int(11) NOT NULL,
  `ID_OBJETO` varchar(255) NOT NULL,
  `TIPO` varchar(255) NOT NULL,
  `TIPO_OBJETO` varchar(255) NOT NULL DEFAULT 'publicacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `ID_EQUIPO` int(11) NOT NULL,
  `EQUIPO_NOMBRE` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `EQUIPO_DESCRIPCION` text NOT NULL,
  `IMAGEN` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `IMAGEN_FONDO` varchar(255) NOT NULL DEFAULT 'fondo_default.jpg	',
  `COLOR` varchar(255) NOT NULL DEFAULT 'primary',
  `TIPO` varchar(255) NOT NULL DEFAULT 'general',
  `ESTADO` varchar(255) NOT NULL DEFAULT 'activo',
  `ORDEN` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`ID_EQUIPO`, `EQUIPO_NOMBRE`, `URL`, `EQUIPO_DESCRIPCION`, `IMAGEN`, `IMAGEN_FONDO`, `COLOR`, `TIPO`, `ESTADO`, `ORDEN`) VALUES
(1, 'DTE-Web', 'dte-web', '<p>Esta es la descripci&oacute;n de un equipo<br />Se puede agregar cualquier informaci&oacute;n que se desee.</p>', 'default.jpg', 'fondo_default.jpg', 'primary', 'general', 'activo', 0),
(2, 'DTE-Comunicación', 'dte-comunicacion', '', 'default.jpg', 'fondo_default.jpg', 'primary', 'general', 'activo', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos_proyectos`
--

CREATE TABLE `equipos_proyectos` (
  `ID_EQUIPO` int(11) NOT NULL,
  `ID_PROYECTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipos_proyectos`
--

INSERT INTO `equipos_proyectos` (`ID_EQUIPO`, `ID_PROYECTO`) VALUES
(1, 3),
(1, 4),
(2, 4),
(0, 5),
(2, 2),
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos_usuarios`
--

CREATE TABLE `equipos_usuarios` (
  `ID_EQUIPO` int(11) NOT NULL,
  `ID_USUARIO` varchar(255) NOT NULL,
  `ROL_USUARIO` varchar(255) NOT NULL DEFAULT 'miembro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipos_usuarios`
--

INSERT INTO `equipos_usuarios` (`ID_EQUIPO`, `ID_USUARIO`, `ROL_USUARIO`) VALUES
(2, '62a8a43bb67fa6.38495185', 'miembro'),
(2, '62a8da0d97a8f6.25904684', 'miembro'),
(1, '5c0653d43d92e7.75019474', 'miembro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galerias`
--

CREATE TABLE `galerias` (
  `ID_GALERIA` int(11) NOT NULL,
  `ID_OBJETO` int(11) NOT NULL,
  `ID_MULTIMEDIA` int(11) NOT NULL,
  `TIPO_OBJETO` varchar(255) NOT NULL DEFAULT 'publicaciones',
  `TIPO_ARCHIVO` varchar(255) NOT NULL DEFAULT 'imagen',
  `ORDEN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meta_datos`
--

CREATE TABLE `meta_datos` (
  `ID_OBJETO` varchar(255) NOT NULL,
  `DATO_NOMBRE` varchar(255) NOT NULL,
  `DATO_VALOR` text NOT NULL,
  `TIPO_OBJETO` varchar(255) NOT NULL DEFAULT 'publicacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `meta_datos`
--

INSERT INTO `meta_datos` (`ID_OBJETO`, `DATO_NOMBRE`, `DATO_VALOR`, `TIPO_OBJETO`) VALUES
('0', 'meta_autor', 'Manuel Marmolejo Martínez', 'equipo'),
('0', 'meta_autor', 'Manuel Marmolejo Martínez', 'equipo'),
('0', 'meta_autor', 'Manuel Marmolejo Martínez', 'equipo'),
('0', 'meta_autor', 'Manuel Marmolejo Martínez', 'equipo'),
('5f400557ec9b74.36456554', 'secreto', 'RGJX6F', 'usuario'),
('5f400801858cd8.64544354', 'secreto', 'GX3TW3', 'usuario'),
('0', 'meta_autor', 'Manuel Marmolejo Martínez', 'equipo'),
('5c0653d43d92e7.75019474', 'secreto', 'J66CL7', 'usuario'),
('2', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos'),
('3', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos'),
('3', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('1', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos'),
('1', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('2', 'meta_autor', 'Saray Navarro', 'proyectos'),
('2', 'autor', 'Saray Navarro', 'proyecto'),
('3', 'meta_autor', 'Saray Navarro', 'proyectos'),
('3', 'autor', 'Saray Navarro', 'proyecto'),
('4', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos'),
('4', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('4', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('4', 'meta_autor', 'Manuel Marmolejo Martínez', 'equipo'),
('5', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos'),
('2', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('2', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('1', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('1', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('1', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('1', 'autor', 'Manuel Marmolejo Martínez', 'proyecto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multimedia`
--

CREATE TABLE `multimedia` (
  `ID_MULTIMEDIA` int(11) NOT NULL,
  `ARCHIVO` varchar(255) NOT NULL,
  `TIPO_ARCHIVO` varchar(255) NOT NULL DEFAULT 'imagen',
  `TITULO` varchar(255) NOT NULL,
  `RESUMEN` text NOT NULL,
  `DESTINO` varchar(255) DEFAULT NULL,
  `ESTADO` varchar(255) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `ID` int(11) NOT NULL,
  `ID_USUARIO` varchar(255) NOT NULL,
  `ENLACE` varchar(255) NOT NULL,
  `GRUPO` varchar(255) NOT NULL DEFAULT 'mensaje',
  `NOTIFICACION_CONTENIDO` text NOT NULL,
  `FECHA_CREACION` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ESTADO` varchar(255) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`ID`, `ID_USUARIO`, `ENLACE`, `GRUPO`, `NOTIFICACION_CONTENIDO`, `FECHA_CREACION`, `ESTADO`) VALUES
(1, '5c0653d43d92e7.75019474', 'http://localhost/adt_prepa/tareas/detalles?id=3', 'tareas', 'Se te ha asignado una tarea actualizada: <b>01S.04_M19_S3_Naturaleza de la luz_SCORM</b>', '2022-07-13 23:04:39', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `ID` int(6) NOT NULL,
  `OPCION_NOMBRE` varchar(255) NOT NULL,
  `OPCION_VALOR` longtext NOT NULL,
  `OPCION_INPUT` varchar(255) NOT NULL DEFAULT 'varchar',
  `OPCION_TIPO` varchar(255) NOT NULL,
  `ORDEN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`ID`, `OPCION_NOMBRE`, `OPCION_VALOR`, `OPCION_INPUT`, `OPCION_TIPO`, `ORDEN`) VALUES
(1, 'titulo_sitio', 'Administrador de Tareas Prepa en línea', 'varchar', 'sistema', 0),
(2, 'modo_mantenimiento', 'no', 'boolean', 'sistema', 1),
(3, 'modo_debug', 'no', 'boolean', 'sistema', 2),
(6, 'correo_sitio', 'produccionmultimedia@prepaenlinea.sep.gob.mx', 'varchar', 'contacto', 0),
(7, 'mailer_host', 'mail.quarkservers.com', 'varchar', 'sistema', 4),
(8, 'mailer_port', '2525', 'varchar', 'sistema', 5),
(9, 'mailer_user', 'servidor@quarkservers.com', 'varchar', 'sistema', 6),
(10, 'mailer_pass', '123Servidor', 'varchar', 'sistema', 7),
(11, 'ruta_imagenes', 'contenido/img/', 'varchar', 'apariencia', 3),
(12, 'ancho_imagenes_publicaciones', '800', 'varchar', 'apariencia', 1),
(13, 'alto_imagenes_publicaciones', '800', 'varchar', 'apariencia', 2),
(14, 'tiempo_inactividad_sesion', '45', 'varchar', 'sistema', 8),
(15, 'acerca_sitio', 'Sistema de administración de tareas y calendario', 'text', 'contacto', 1),
(19, 'plantilla', 'default', 'varchar', 'apariencia', 0),
(20, 'recaptcha', 'no', 'boolean', 'seguridad', 0),
(21, 'recaptcha_public', '-', 'varchar', 'seguridad ', 1),
(22, 'recaptcha_secret', '-', 'varchar', 'seguridad', 2),
(27, 'cantidad_publicaciones_por_pagina', '12', 'varchar', 'apariencia', 7),
(28, 'niveles_categorias', '2', 'varchar', 'apariencia', 6),
(29, 'ancho_imagenes_fondo_publicaciones', '1920', 'varchar', 'apariencia', 4),
(30, 'alto_imagenes_fondo_publicaciones', '600', 'varchar', 'apariencia', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `ID_PROYECTO` int(11) NOT NULL,
  `PROYECTO_NOMBRE` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `PROYECTO_DESCRIPCION` text NOT NULL,
  `IMAGEN` varchar(255) DEFAULT 'default.jpg',
  `IMAGEN_FONDO` varchar(255) NOT NULL DEFAULT 'fondo_default.jpg',
  `DURACION` varchar(255) NOT NULL DEFAULT 'permanente',
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_FINAL` date DEFAULT NULL,
  `FECHA_ENTREGA` date DEFAULT NULL,
  `ENLACE_ENTREGABLE` varchar(255) DEFAULT NULL,
  `ENLACE_EDITABLE` varchar(255) DEFAULT NULL,
  `COLOR` varchar(255) NOT NULL DEFAULT 'primary',
  `TIPO` varchar(255) NOT NULL DEFAULT 'general',
  `PRIORIDAD` varchar(255) NOT NULL DEFAULT 'media',
  `ESTADO` varchar(255) NOT NULL DEFAULT 'activo',
  `ORDEN` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`ID_PROYECTO`, `PROYECTO_NOMBRE`, `URL`, `PROYECTO_DESCRIPCION`, `IMAGEN`, `IMAGEN_FONDO`, `DURACION`, `FECHA_INICIO`, `FECHA_FINAL`, `FECHA_ENTREGA`, `ENLACE_ENTREGABLE`, `ENLACE_EDITABLE`, `COLOR`, `TIPO`, `PRIORIDAD`, `ESTADO`, `ORDEN`) VALUES
(1, 'Actualización M19', 'actualizacion-m19', '<p>Esta es la descripci&oacute;n del proyecto, lo mejor ser&iacute;a que asignaramos los usuarios aqu&iacute;</p>\r\n<p>Adem&aacute;s se establecen las tareas y asignaciones</p>', 'default.jpg', 'fondo_default.jpg', 'temporal', '2022-06-01', '2022-06-10', '2022-06-10', '#', '#', 'primary', 'general', 'normal', 'activo', 0),
(2, 'Muestra de un proyecto', 'muestra-de-un-proyecto', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2022-06-14', '2022-09-16', NULL, NULL, NULL, 'primary', 'general', 'normal', 'activo', 0),
(3, 'Ajustes Polaris', 'ajustes-polaris', 'Ajustes a las herramientas de Polaris', 'default.jpg', 'fondo_default.jpg', 'temporal', '2022-06-14', '2022-06-15', '2022-06-15', NULL, NULL, 'primary', 'general', 'normal', 'terminado', 0),
(4, 'Nuevo sistema de Proyectos', 'nuevo-sistema-de-proyectos', '<p>Este es la manera en que se podr&aacute;n administrar los proyectos.</p>\r\n<p>Las notas y descripciones deber&iacute;an incluir todos los datos y enlaces necesarios para el trabajo</p>\r\n<p>se pueden tener dos enlaces a carpetas principales de proyecto.</p>', 'default.jpg', 'fondo_default.jpg', 'temporal', '2022-06-18', '2022-07-18', NULL, NULL, NULL, 'primary', 'general', 'normal', 'terminado', 0),
(5, 'Proyecto 5L7Q', 'Proyecto-5L7Q', '', 'default.jpg', 'fondo_default.jpg', 'permanente', NULL, NULL, NULL, NULL, NULL, 'primary', 'general', 'media', 'activo', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `ID_PUBLICACION` int(11) NOT NULL,
  `PUBLICACION_TITULO` varchar(255) DEFAULT NULL,
  `URL` varchar(255) NOT NULL,
  `PUBLICACION_RESUMEN` text DEFAULT NULL,
  `PUBLICACION_CONTENIDO` text DEFAULT NULL,
  `PUBLICACION_KEYWORDS` text NOT NULL,
  `IMAGEN` varchar(255) DEFAULT 'default.jpg',
  `IMAGEN_FONDO` varchar(255) NOT NULL DEFAULT 'fondo_default.jpg',
  `FECHA_REGISTRO` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_ACTUALIZACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FECHA_PUBLICACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_VIGENCIA` timestamp NULL DEFAULT NULL,
  `TIPO` varchar(255) DEFAULT 'pagina',
  `ESTADO` varchar(255) DEFAULT 'activo',
  `ORDEN` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reacciones`
--

CREATE TABLE `reacciones` (
  `ID` int(11) NOT NULL,
  `ID_USUARIO` varchar(255) NOT NULL,
  `ID_OBJETO` int(11) NOT NULL,
  `REACCION` varchar(255) NOT NULL,
  `TIPO_OBJETO` varchar(255) NOT NULL DEFAULT 'publicacion',
  `TIPO` varchar(255) NOT NULL DEFAULT 'like',
  `FECHA_CREACION` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `ID_TAREA` int(11) NOT NULL,
  `ID_PROYECTO` int(11) NOT NULL,
  `ID_TAREA_PADRE` int(11) DEFAULT NULL,
  `ID_USUARIO` varchar(255) DEFAULT NULL,
  `TAREA_DIA_COMPLETO` varchar(255) NOT NULL DEFAULT 'si',
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_FINAL` date DEFAULT NULL,
  `FECHA_ENTREGA` date DEFAULT NULL,
  `TAREA_TITULO` varchar(255) NOT NULL,
  `TAREA_DESCRIPCION` text NOT NULL,
  `TAREA_ENLACE_ENTREGABLE` varchar(255) NOT NULL,
  `TAREA_ENLACE_EDITABLES` varchar(255) NOT NULL,
  `PRIORIDAD` varchar(255) NOT NULL DEFAULT 'media',
  `COLOR` varchar(255) NOT NULL DEFAULT 'primary',
  `TIPO` varchar(255) NOT NULL DEFAULT 'general',
  `ESTADO` varchar(255) NOT NULL DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`ID_TAREA`, `ID_PROYECTO`, `ID_TAREA_PADRE`, `ID_USUARIO`, `TAREA_DIA_COMPLETO`, `FECHA_INICIO`, `FECHA_FINAL`, `FECHA_ENTREGA`, `TAREA_TITULO`, `TAREA_DESCRIPCION`, `TAREA_ENLACE_ENTREGABLE`, `TAREA_ENLACE_EDITABLES`, `PRIORIDAD`, `COLOR`, `TIPO`, `ESTADO`) VALUES
(1, 1, 0, NULL, 'si', '2022-06-01', '2022-06-10', NULL, '01S.04_M19_S3_Aplicaciones de las ondas_SCORM', '<p>Esta es la descripci&oacute;n de la tarea se puede agregar informaci&oacute;n.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit justo, varius et pulvinar sagittis, vulputate nec ante. Duis lorem massa, vulputate vitae congue quis, bibendum a leo. Curabitur convallis neque non venenatis malesuada. In eu enim mauris. Mauris lorem mi, accumsan hendrerit tempor eu, congue quis sem. Vivamus a ante eget ex pulvinar egestas. Integer eu ante sagittis, mollis leo non, viverra tellus. Ut dictum, enim in rutrum aliquet, sapien libero ultrices neque, non laoreet leo mi non ligula. Maecenas egestas sodales neque, nec placerat ante facilisis eu. In hac habitasse platea dictumst. Nam venenatis est eu dolor congue consequat. Donec sodales lectus ac odio porttitor, eget euismod ante auctor.</p>\r\n<p>&nbsp;</p>', '#', '#', 'normal', 'primary', 'general', 'en desarrollo'),
(2, 1, 0, NULL, 'si', '2022-06-01', '2022-06-10', '2022-06-16', '01S.04_M19_S3_La óptica_SCORM', '', '', '', 'normal', 'primary', 'general', 'completo'),
(3, 1, 0, NULL, 'si', '2022-06-01', '2022-06-10', '2022-07-13', '01S.04_M19_S3_Naturaleza de la luz_SCORM', '', '', '', 'normal', 'primary', 'general', 'completo'),
(4, 1, 0, NULL, 'si', '2022-06-01', '2022-06-10', '2022-06-21', '01S.04_M19_S3_El sonido y sus propiedades_SCORM', '', '', '', 'normal', 'primary', 'general', 'completo'),
(5, 1, NULL, NULL, 'si', '2022-06-01', '2022-06-10', NULL, '01S.04_M19_S3_Las ondas: características, tipos y fenómenos_SCORM', '', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(6, 1, 0, NULL, 'si', '2022-06-01', '2022-06-11', NULL, '01S.04_M19_S3_El movimiento en repetición_SCORM', '', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(7, 1, 0, NULL, 'si', '2022-06-01', '2022-06-10', NULL, '01S.04_M19_S2_Fuerza de fricción_SCORM', '', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(8, 1, NULL, NULL, 'si', '2022-06-01', '2022-06-10', NULL, '01S.04_M19_S2_Potencia y las unidades en que se mide_HTML', '', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(9, 1, NULL, NULL, 'si', '2022-06-01', '2022-06-10', NULL, '01S.04_M19_S2_Características de las magnitudes vectoriales en la dinámica del movimiento_HTML', '', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(10, 1, NULL, NULL, 'si', '2022-06-01', '2022-06-10', NULL, '01S.04_M19_S2_Simuladores y leyes de Newton_SCORM', '', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(11, 1, NULL, NULL, 'si', '2022-06-01', '2022-06-10', NULL, '01S.04_M19_S2_La segunda ley de Newton_SCORM', '', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(12, 1, NULL, NULL, 'si', '2022-06-01', '2022-06-10', NULL, '01S.04_M19_S1_Aplicación de la línea recta_HTML', '', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(13, 1, NULL, NULL, 'si', '2022-06-01', '2022-06-10', NULL, '01S.04_M19_S1_Razones trigonométricas de ángulos representativos_HTML', '', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(14, 1, NULL, NULL, 'si', '2022-06-01', '2022-06-10', NULL, '01S.04_M19_S1_Círculo trigonométrico_HTML', '', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(15, 1, NULL, NULL, 'si', '2022-06-01', '2022-06-10', NULL, '01S.04_M19_S1_Razones trigonométricas_HTML', '', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(16, 1, 0, NULL, 'si', '2022-06-01', '2022-06-13', NULL, '01S.04_M20_S1_Ecología_HTML', 'Carpeta\r\nVersiones finales\r\n\r\nRecurso de referencia\r\n\r\nPlantilla HTML y SCORM\r\n\r\nProducción: ﻿ Frida De Paz Frida ﻿ \r\nCorrección de estilo: ﻿ Abraham Gonzalez Abraham ﻿ \r\nQA: ﻿ Lucia Gabriela Bonilla Jiménez Lucia ﻿   ', 'https://drive.google.com/drive/folders/1641Z4zbOcbDdSN9wwTDX1sfUModRn0f4', 'https://drive.google.com/drive/u/0/folders/1KX5FNmGfEWYdIkoZhe3klhtiiOI4IxDT', 'normal', 'primary', 'general', 'en desarrollo'),
(17, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', '2022-06-18', '08C.08_Texto en botones de navegación', '<p>Agregar el texto para identificar el nombre de los botones de navegaci&oacute;n</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(18, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', NULL, '08C.08_Agregar usuarios de Comunicación', '<p>Agregar a Liz como administradora y a los dem&aacute;s chicos de Comunicaci&oacute;n: Joe Abraham Mariana C&eacute;sar Laura Ernesto Marco</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(19, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', NULL, '08C.08_Agregar el histórico de las acciones', '<p>Agregar en cada tarea el hist&oacute;rico de cada acci&oacute;n</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(20, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', '2022-06-18', '08C.08_Cambiar Descripción por Notas', '<p>Cambiar el t&iacute;tulo de Descripci&oacute;n por Notas</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(21, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', NULL, '08C.08_Incluir los enlaces a las carpetas en las Notas', '<p>Incluir los enlaces a las carpetas en las Notas</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(22, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', '2022-06-18', '08C.08_Creación de proyectos sin equipos', '<p>Creaci&oacute;n de proyectos sin equipos espec&iacute;ficos</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(23, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', '2022-06-18', '08C.08_Quitar las alertas', '<p>Quitar las alertas al crear tareas</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(24, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', '2022-06-18', '08C.08_Revisar el error del resumen', '<p>Revisar el error del bot&oacute;n de resumen</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(25, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', '2022-06-18', '08C.08_Cambiar Retraso por Atraso ', '<p>Cambiar Retraso por Atraso en estatus</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(26, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', '2022-06-18', '08C.08_Cambiar normal por Normal', '<p>Cambiar normal por Normal en estatus</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(27, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', '2022-06-18', '08C.08_Incluir el nombre en las tareas', '<p>En el listado de tareas que aparezca el nombre del responsable de la tarea</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(28, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', '2022-06-18', '08C.08_Ajustar el tamaño de la fecha en las tareas', '<p>Ajustar el tama&ntilde;o de la fecha en el listado de tareas</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(29, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', '2022-06-18', '08C.08_Colocar la fecha en la misma fila de la tarea', '<p>Colocar la fecha en la misma fila de la tarea</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(30, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', '2022-06-18', '08C.08_Incluir el listado de actividades en el perfil', '', '', '', 'normal', 'primary', 'general', 'completo'),
(31, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', NULL, '08C.08_Verificar el envío de las notificaciones por correo', '<p>Verificar el env&iacute;o de las notificaciones por correo ya que no llegaron</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(32, 1, 0, NULL, 'si', '2022-06-16', '2022-06-17', NULL, 'PRUEBA', '<p>Carpeta</p>\r\n<p>Versiones finales</p>', 'https://docs.google.com/spreadsheets/d/1GHlDFrHPBmwq9M58Czg_V_w8ewW-tdk--uWVnohNLZs/edit#gid=517572698', 'https://docs.google.com/spreadsheets/d/1GHlDFrHPBmwq9M58Czg_V_w8ewW-tdk--uWVnohNLZs/edit#gid=517572698', 'normal', 'primary', 'general', 'pendiente'),
(33, 2, 0, NULL, 'si', '2022-06-16', '2022-06-17', '2022-06-16', 'Prueba 2', '<p>Prueba</p>\r\n<p>Prueba</p>', '', '', 'urgente', 'primary', 'general', 'completo'),
(34, 4, 0, NULL, 'si', '2022-06-18', '2022-06-17', '2022-07-07', 'Revisar ortografía', '', 'https://prepaenlinea.sep.gob.mx/calaveritas-2021/', 'https://prepaenlinea.sep.gob.mx/registro/registro-de-aspirante/', 'normal', 'primary', 'general', 'completo'),
(35, 3, 0, NULL, 'si', '2022-06-14', '2022-06-15', NULL, 'Revisar acomodo de fechas', '<p>Las fechas se duplican en alg&uacute;nas tareas</p>', '', '', 'normal', 'primary', 'general', 'completo'),
(36, 0, 0, NULL, 'si', '2022-07-05', '2022-07-08', NULL, 'terminar los ajustes en el sistema de Admin', '<p>Este es el contenido de la tarea.</p>\r\n<p>Deber&iacute;a de tener alg&uacute;n tipo de redacci&oacute;n, puedo agregar <a href=\"#\">enlaces</a></p>', '#', '#', 'normal', 'primary', 'general', 'en desarrollo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas_mensajes`
--

CREATE TABLE `tareas_mensajes` (
  `ID` int(11) NOT NULL,
  `ID_TAREA` int(11) NOT NULL,
  `MENSAJE` text NOT NULL,
  `ID_USUARIO` text NOT NULL,
  `ASIGNACIONES` text NOT NULL,
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT current_timestamp(),
  `ENLACE` varchar(255) NOT NULL,
  `ADJUNTO` varchar(255) NOT NULL,
  `TIPO` varchar(255) NOT NULL DEFAULT 'mensaje'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tareas_mensajes`
--

INSERT INTO `tareas_mensajes` (`ID`, `ID_TAREA`, `MENSAJE`, `ID_USUARIO`, `ASIGNACIONES`, `FECHA_REGISTRO`, `ENLACE`, `ADJUNTO`, `TIPO`) VALUES
(8, 36, '<p>Hola, esta es la asignaci&oacute;n</p><br>Reasignado a:', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474, 62a8da0d97a8f6.25904684, 62a8a43bb67fa6.38495185', '2022-07-05 11:26:25', '', '', 'mensaje'),
(9, 36, '<br>Se cambio el estado a: <b>completo</b>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474, 62a8da0d97a8f6.25904684, 62a8a43bb67fa6.38495185', '2022-07-05 11:29:46', '\r\n<div style=', '', 'mensaje'),
(10, 36, 'Se actualizó la información de la tarea', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474, 62a8da0d97a8f6.25904684, 62a8a43bb67fa6.38495185', '2022-07-05 11:55:03', '', '', 'mensaje'),
(11, 36, '<p>Voy a reasignar la tarea por que YOLO</p><br>Reasignado a:', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474, 62a8a43bb67fa6.38495185', '2022-07-05 12:41:34', '', '', 'mensaje'),
(12, 36, '<p>Voy a reasignar de nuevo</p><br>Reasignado a:', '5c0653d43d92e7.75019474', '62a8a43bb67fa6.38495185', '2022-07-05 12:42:32', '', '', 'reasignacion'),
(13, 36, '<br>Reasignado a:', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-05 12:47:10', '', '', 'reasignacion'),
(14, 36, '<p>Esta es la &uacute;ltima reasignaci&oacute;n</p><br>Reasignado a:', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474, 62a8da0d97a8f6.25904684, 62a8a43bb67fa6.38495185', '2022-07-05 12:47:25', '', '', 'reasignacion'),
(15, 18, '<p>Ya lo termin&eacute;!!!</p><br>Se cambio el estado a: <b>completo</b>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 11:46:03', '', '', 'mensaje'),
(16, 19, '<p>Listo esl hist&oacute;rico lo puedes ver aqu&iacute;</p><br>Se cambio el estado a: <b>completo</b>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 11:46:20', '', '', 'mensaje'),
(17, 21, '<p>Listos los enlaces, <a href=\"#\">checa&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 11:46:43', '', '', 'mensaje'),
(18, 31, '<p>No est&aacute; completo pero lo pongo completo para ver lo del proceso</p><br>Se cambio el estado a: <b>completo</b>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 11:48:35', '', '', 'mensaje'),
(19, 35, '<p>Listo y corregido</p><br>Se cambio el estado a: <b>completo</b>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 11:48:55', '', '', 'mensaje'),
(20, 35, '<p>Vuelvo a probar la actualizaci&oacute;n</p>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 12:03:57', '', '', 'mensaje'),
(21, 35, '<p>Vuelvo a probar la actualizaci&oacute;n</p>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 12:04:22', '', '', 'mensaje'),
(22, 35, '<p>Otro</p>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 12:06:46', '', '', 'mensaje'),
(23, 35, '<p>Otro</p>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 12:06:59', '', '', 'mensaje'),
(24, 17, '<p>Va de nuez</p>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 12:07:34', '', '', 'mensaje'),
(25, 34, 'Se actualizó la información de la tarea', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 12:29:00', '', '', 'mensaje'),
(26, 34, 'Se actualizó la información de la tarea', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 12:52:43', '', '', 'mensaje'),
(27, 34, '<p>Completado</p><br>Se cambio el estado a: <b>completo</b>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-07 12:53:20', '', '', 'mensaje'),
(28, 33, '<p>Terminado</p>', '5c0653d43d92e7.75019474', '62a8a43bb67fa6.38495185', '2022-07-07 12:53:43', '', '', 'mensaje'),
(29, 3, 'Se actualizó la información de la tarea', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-13 16:03:02', '', '', 'mensaje'),
(30, 3, 'Se actualizó la información de la tarea', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-13 16:03:50', '', '', 'mensaje'),
(31, 3, 'Se actualizó la información de la tarea', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-07-13 16:04:38', '', '', 'mensaje'),
(32, 1, '<p>Este es un comentario com&uacute;n</p>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-08-23 17:49:00', '', '', 'mensaje'),
(33, 1, '<p>Este es otro comentario y voy a reasignar</p>\r\n<p>&nbsp;</p><br>Reasignado a:', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474, 62a8da0d97a8f6.25904684', '2022-08-23 17:56:55', '', '', 'reasignacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `ID` int(11) NOT NULL,
  `TIPO_NOMBRE` varchar(255) NOT NULL,
  `TIPO_NOMBRE_SINGULAR` varchar(255) NOT NULL,
  `TIPO_NOMBRE_PLURAL` varchar(255) NOT NULL,
  `TIPO_OBJETO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`ID`, `TIPO_NOMBRE`, `TIPO_NOMBRE_SINGULAR`, `TIPO_NOMBRE_PLURAL`, `TIPO_OBJETO`) VALUES
(1, 'usuario', 'Usuario', 'Usuarios', 'usuarios'),
(2, 'administrador', 'Administrador', 'Administradores', 'usuarios'),
(18, 'imagen', 'Imágen', 'Imágenes', 'multimedia'),
(19, 'documento', 'Documento', 'Documentos', 'multimedia'),
(21, 'enlace', 'Enlace', 'Enlaces', 'multimedia'),
(22, 'youtube', 'Youtube', 'Youtube', 'multimedia'),
(23, 'general', 'General', 'Generales', 'proyectos'),
(25, 'general', 'General', 'Generales', 'equipos'),
(26, 'general', 'General', 'Generales', 'tareas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_USUARIO` varchar(255) NOT NULL,
  `ID_SOCIAL` varchar(255) NOT NULL,
  `SOCIAL_LOGIN` varchar(255) NOT NULL,
  `USUARIO_NOMBRE` varchar(255) NOT NULL,
  `USUARIO_APELLIDOS` varchar(255) NOT NULL,
  `USUARIO_CORREO` varchar(255) NOT NULL,
  `USUARIO_TELEFONO` varchar(255) DEFAULT NULL,
  `USUARIO_FECHA_NACIMIENTO` date DEFAULT NULL,
  `IMAGEN` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `IMAGEN_FONDO` varchar(255) NOT NULL DEFAULT 'fondo_default.jpg',
  `COLOR` varchar(255) NOT NULL DEFAULT 'primary',
  `USUARIO_PASSWORD` varchar(255) NOT NULL,
  `USUARIO_LISTA_DE_CORREO` varchar(255) NOT NULL DEFAULT 'si',
  `FECHA_REGISTRO` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_ACTUALIZACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TIPO` varchar(255) NOT NULL,
  `ESTADO` varchar(255) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `ID_SOCIAL`, `SOCIAL_LOGIN`, `USUARIO_NOMBRE`, `USUARIO_APELLIDOS`, `USUARIO_CORREO`, `USUARIO_TELEFONO`, `USUARIO_FECHA_NACIMIENTO`, `IMAGEN`, `IMAGEN_FONDO`, `COLOR`, `USUARIO_PASSWORD`, `USUARIO_LISTA_DE_CORREO`, `FECHA_REGISTRO`, `FECHA_ACTUALIZACION`, `TIPO`, `ESTADO`) VALUES
('5c0653d43d92e7.75019474', '', '', 'Manuel', 'Marmolejo Martínez', 'marmocreativo@gmail.com', '5523995604 ', '1970-01-01', 'equipo-5f4359ee04313.jpg', 'usuario-5f435a9e5ba50.jpg', 'orange', '$2y$10$DbFvC2gsgQG3aODXsp0a4OUN1ERS.XFFE1pe/RTDkncia0ynhuBHy', 'no', '2019-01-01 06:00:00', '2020-09-09 10:57:47', 'administrador', 'activo'),
('62a8a43bb67fa6.38495185', '', '', 'Saray', 'Navarro', 'lourdes.navarro@sems.gob.mx', NULL, NULL, 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$926QY0WTw2wQZrNNYo3pd.mZKVv3cKhEj2.WZUbdoZOaEV.jDUpQu', 'si', '2022-06-14 16:07:39', '2022-06-14 16:07:39', 'usuario', 'activo'),
('62a8da0d97a8f6.25904684', '', '', 'Miguel Ángel ', 'García Viveros', 'miguel.garcia@sems.gob.mx', NULL, NULL, 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$8bVc/fGIR1YDSrMLywHQiu8y0lpO/jZNQB9PU/XBlPDbY8gI0OtSW', 'si', '2022-06-14 19:57:17', '2022-06-14 19:57:17', 'usuario', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_preferencias`
--

CREATE TABLE `usuarios_preferencias` (
  `ID` int(11) NOT NULL,
  `ID_USUARIO` varchar(255) NOT NULL,
  `CONFIGURACION` varchar(255) NOT NULL,
  `VALOR` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_proyectos`
--

CREATE TABLE `usuarios_proyectos` (
  `ID_USUARIO` varchar(255) NOT NULL,
  `ID_PROYECTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_seguridad`
--

CREATE TABLE `usuarios_seguridad` (
  `ID` bigint(10) NOT NULL,
  `ID_USUARIO` varchar(255) NOT NULL,
  `CLAVE` varchar(128) NOT NULL,
  `FECHA_REGISTRO` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ESTADO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_tareas`
--

CREATE TABLE `usuarios_tareas` (
  `ID_USUARIO` varchar(255) NOT NULL,
  `ID_TAREA` varchar(255) NOT NULL,
  `USUARIO_ASIGNACION` varchar(255) NOT NULL DEFAULT 'produccion',
  `FECHA_ASIGNACION` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_tareas`
--

INSERT INTO `usuarios_tareas` (`ID_USUARIO`, `ID_TAREA`, `USUARIO_ASIGNACION`, `FECHA_ASIGNACION`) VALUES
('5c0653d43d92e7.75019474', '5', 'produccion', '2022-06-14 19:10:37'),
('5c0653d43d92e7.75019474', '8', 'produccion', '2022-06-14 19:12:36'),
('5c0653d43d92e7.75019474', '9', 'produccion', '2022-06-14 19:13:34'),
('5c0653d43d92e7.75019474', '10', 'produccion', '2022-06-14 19:13:55'),
('5c0653d43d92e7.75019474', '11', 'produccion', '2022-06-14 19:14:12'),
('5c0653d43d92e7.75019474', '12', 'produccion', '2022-06-14 19:15:11'),
('5c0653d43d92e7.75019474', '13', 'produccion', '2022-06-14 19:15:58'),
('5c0653d43d92e7.75019474', '14', 'produccion', '2022-06-14 19:16:12'),
('5c0653d43d92e7.75019474', '15', 'produccion', '2022-06-14 19:16:28'),
('5c0653d43d92e7.75019474', '16', 'produccion', '2022-06-14 19:52:02'),
('5c0653d43d92e7.75019474', '6', 'produccion', '2022-06-16 22:58:28'),
('5c0653d43d92e7.75019474', '2', 'produccion', '2022-06-16 23:08:06'),
('62a8da0d97a8f6.25904684', '2', 'produccion', '2022-06-16 23:08:06'),
('62a8a43bb67fa6.38495185', '2', 'produccion', '2022-06-16 23:08:06'),
('5c0653d43d92e7.75019474', '20', 'produccion', '2022-06-18 07:05:36'),
('5c0653d43d92e7.75019474', '22', 'produccion', '2022-06-18 07:19:49'),
('5c0653d43d92e7.75019474', '23', 'produccion', '2022-06-18 07:26:27'),
('5c0653d43d92e7.75019474', '24', 'produccion', '2022-06-18 07:26:40'),
('5c0653d43d92e7.75019474', '25', 'produccion', '2022-06-18 07:26:57'),
('5c0653d43d92e7.75019474', '26', 'produccion', '2022-06-18 07:27:13'),
('5c0653d43d92e7.75019474', '27', 'produccion', '2022-06-18 07:27:30'),
('5c0653d43d92e7.75019474', '28', 'produccion', '2022-06-18 07:27:43'),
('5c0653d43d92e7.75019474', '29', 'produccion', '2022-06-18 07:27:56'),
('5c0653d43d92e7.75019474', '30', 'produccion', '2022-06-18 07:28:15'),
('5c0653d43d92e7.75019474', '32', 'produccion', '2022-06-18 07:43:24'),
('62a8da0d97a8f6.25904684', '32', 'produccion', '2022-06-18 07:43:24'),
('62a8a43bb67fa6.38495185', '32', 'produccion', '2022-06-18 07:43:24'),
('5c0653d43d92e7.75019474', '4', 'produccion', '2022-06-21 22:21:05'),
('5c0653d43d92e7.75019474', '7', 'produccion', '2022-06-21 22:21:55'),
('5c0653d43d92e7.75019474', '36', 'produccion', '2022-07-06 00:47:25'),
('62a8da0d97a8f6.25904684', '36', 'produccion', '2022-07-06 00:47:25'),
('62a8a43bb67fa6.38495185', '36', 'produccion', '2022-07-06 00:47:25'),
('5c0653d43d92e7.75019474', '18', 'produccion', '2022-07-07 23:46:03'),
('5c0653d43d92e7.75019474', '19', 'produccion', '2022-07-07 23:46:20'),
('5c0653d43d92e7.75019474', '21', 'produccion', '2022-07-07 23:46:43'),
('5c0653d43d92e7.75019474', '31', 'produccion', '2022-07-07 23:48:35'),
('5c0653d43d92e7.75019474', '35', 'produccion', '2022-07-08 00:06:59'),
('5c0653d43d92e7.75019474', '17', 'produccion', '2022-07-08 00:07:35'),
('5c0653d43d92e7.75019474', '34', 'produccion', '2022-07-08 00:53:21'),
('62a8a43bb67fa6.38495185', '33', 'produccion', '2022-07-08 00:53:43'),
('5c0653d43d92e7.75019474', '3', 'produccion', '2022-07-14 04:04:39'),
('5c0653d43d92e7.75019474', '1', 'produccion', '2022-08-24 05:56:55'),
('62a8da0d97a8f6.25904684', '1', 'produccion', '2022-08-24 05:56:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_CATEGORIA`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`ID_EQUIPO`);

--
-- Indices de la tabla `galerias`
--
ALTER TABLE `galerias`
  ADD PRIMARY KEY (`ID_GALERIA`);

--
-- Indices de la tabla `multimedia`
--
ALTER TABLE `multimedia`
  ADD PRIMARY KEY (`ID_MULTIMEDIA`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`ID_PROYECTO`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`ID_PUBLICACION`);

--
-- Indices de la tabla `reacciones`
--
ALTER TABLE `reacciones`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`ID_TAREA`);

--
-- Indices de la tabla `tareas_mensajes`
--
ALTER TABLE `tareas_mensajes`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD UNIQUE KEY `USUARIO_CORREO` (`USUARIO_CORREO`);

--
-- Indices de la tabla `usuarios_preferencias`
--
ALTER TABLE `usuarios_preferencias`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuarios_seguridad`
--
ALTER TABLE `usuarios_seguridad`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID_CATEGORIA` bigint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `ID_EQUIPO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `galerias`
--
ALTER TABLE `galerias`
  MODIFY `ID_GALERIA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `multimedia`
--
ALTER TABLE `multimedia`
  MODIFY `ID_MULTIMEDIA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `ID_PROYECTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `ID_PUBLICACION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reacciones`
--
ALTER TABLE `reacciones`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `ID_TAREA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `tareas_mensajes`
--
ALTER TABLE `tareas_mensajes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `usuarios_preferencias`
--
ALTER TABLE `usuarios_preferencias`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios_seguridad`
--
ALTER TABLE `usuarios_seguridad`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
