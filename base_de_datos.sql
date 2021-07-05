-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-07-2021 a las 07:04:48
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

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
(1, 'Equipo RREA', 'equipo-rrea', 'Pequeña descripción del equipo', 'default.jpg', 'fondo_default.jpg', 'pink', 'general', 'activo', 0),
(2, 'Equipo 97D3', 'borrador-97D3', '', 'default.jpg', 'fondo_default.jpg', 'green', 'general', 'activo', 1),
(3, 'Equipo 44VS', 'borrador-44VS', '', 'default.jpg', 'fondo_default.jpg', 'primary', 'general', 'inactivo', 0),
(4, 'Equipo de prueba', 'equipo-de-prueba', '', 'default.jpg', 'fondo_default.jpg', 'primary', 'general', 'activo', 0);

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
(1, 1),
(2, 1),
(4, 2);

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
(4, '5c0653d43d92e7.75019474', 'miembro');

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
('2', 'autor', 'Manuel Marmolejo Martínez', 'equipo'),
('3', 'meta_autor', 'Manuel Marmolejo Martínez', 'equipo'),
('5c0653d43d92e7.75019474', 'secreto', 'J66CL7', 'usuario'),
('1', 'autor', 'Manuel Marmolejo Martínez', 'equipo'),
('4', 'autor', 'Manuel Marmolejo Martínez', 'equipo'),
('2', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos');

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
  `COLOR` varchar(255) NOT NULL DEFAULT 'primary',
  `TIPO` varchar(255) NOT NULL DEFAULT 'general',
  `ESTADO` varchar(255) NOT NULL DEFAULT 'activo',
  `ORDEN` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`ID_PROYECTO`, `PROYECTO_NOMBRE`, `URL`, `PROYECTO_DESCRIPCION`, `IMAGEN`, `IMAGEN_FONDO`, `DURACION`, `FECHA_INICIO`, `FECHA_FINAL`, `FECHA_ENTREGA`, `COLOR`, `TIPO`, `ESTADO`, `ORDEN`) VALUES
(1, 'Proyecto permanente', 'proyecto-permanente', 'Esta es la descripción del proyecto', 'default.jpg', 'fondo_default.jpg', 'temporal', NULL, NULL, '2020-08-29', 'yellow', 'general', 'activo', 0),
(2, 'Proyecto IWCF', 'Proyecto-IWCF', '', 'default.jpg', 'fondo_default.jpg', 'permanente', NULL, NULL, NULL, 'primary', 'general', 'activo', 0);

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
  `FECHA_INICIO` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_FINAL` timestamp NULL DEFAULT NULL,
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
(4, 1, NULL, NULL, 'si', '2020-08-24 12:13:40', NULL, '2020-08-25', 'Tarea de ejemplo', '', '', '', 'media', 'primary', 'general', 'pendiente'),
(5, 1, NULL, NULL, 'si', '2020-08-24 12:13:54', NULL, '2020-08-25', 'Otra tarea', 'asdasd', '', '', 'media', 'primary', 'general', 'pendiente'),
(6, 1, NULL, NULL, 'si', '2020-08-24 12:14:06', NULL, '2020-08-26', 'Otra tarea 2', 'asadasdsad', '', '', 'media', 'primary', 'general', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas_mensajes`
--

CREATE TABLE `tareas_mensajes` (
  `ID` int(11) NOT NULL,
  `ID_TAREA` int(11) NOT NULL,
  `MENSAJE` text NOT NULL,
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT current_timestamp(),
  `ENLACE` varchar(255) NOT NULL,
  `ADJUNTO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('5f400557ec9b74.36456554', '', '', 'Fulanito', 'Pérez', 'stmarmo@hotmail.com', '55555555', '1970-01-01', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$vPreFxNk1ZQayykVTFFBBOcIK8rp.R6xGOSDsx92AHR.nyYRL2CvK', 'si', '2020-08-22 00:33:12', '2020-08-22 00:33:12', 'usuario', 'activo'),
('5f400801858cd8.64544354', '', '', 'Sutanito', 'Jonaz', 'prueba1@correo.com', '222222', '1970-01-01', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$gpL/rYnNfgnKy.LTalzAMOyVO7XXQqqYBkAwINStN3C1SCBIw.j1O', 'si', '2020-08-22 00:44:33', '2020-08-22 00:44:33', 'usuario', 'activo');

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
  `FECHA_ASIGNACION` timestamp NOT NULL DEFAULT current_timestamp(),
  `ESTADO` varchar(255) NOT NULL DEFAULT 'proceso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `ID_PROYECTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `ID_TAREA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tareas_mensajes`
--
ALTER TABLE `tareas_mensajes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `usuarios_seguridad`
--
ALTER TABLE `usuarios_seguridad`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
