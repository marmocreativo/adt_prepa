-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2023 a las 01:04:49
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
-- Base de datos: `polaris`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `ID_AREA` int(11) NOT NULL,
  `AREA_NOMBRE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AREA_DESCRIPCION` text COLLATE utf8_unicode_ci NOT NULL,
  `IMAGEN` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `IMAGEN_FONDO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `COLOR` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'primary',
  `TIPO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `ESTADO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activo',
  `ORDEN` int(11) NOT NULL DEFAULT 0,
  `ID_PADRE` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`ID_AREA`, `AREA_NOMBRE`, `URL`, `AREA_DESCRIPCION`, `IMAGEN`, `IMAGEN_FONDO`, `COLOR`, `TIPO`, `ESTADO`, `ORDEN`, `ID_PADRE`) VALUES
(1, 'Dirección de Tecnología Educativa', 'direccion-de-tecnologia-educativa', '', 'default.jpg', 'default.jpg', NULL, 'general', 'activo', 0, 4),
(3, 'Telecomunicaciones', 'telecomunicaciones', '', 'default.jpg', 'fondo_default.jpg', NULL, 'general', 'activo', 0, 4),
(4, 'Dirección general', 'direccion-general', '', 'default.jpg', 'fondo_default.jpg', NULL, 'general', 'activo', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas_usuarios`
--

CREATE TABLE `areas_usuarios` (
  `ID` int(11) UNSIGNED NOT NULL,
  `ID_USUARIO` varchar(255) NOT NULL,
  `ID_AREA` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `areas_usuarios`
--

INSERT INTO `areas_usuarios` (`ID`, `ID_USUARIO`, `ID_AREA`) VALUES
(2, '62a8a43bb67fa6.38495185', 1),
(3, '62a8da0d97a8f6.25904684', 1),
(4, '632b45df945454.17181395', 1),
(6, '632b472f497b95.12743913', 1),
(8, '633eeece335cd2.35066473', 1),
(9, '633eef17cc43c6.86654620', 1),
(10, '633eefe21f96f3.52854199', 1),
(11, '6345f3d21f53b8.76043717', 1),
(12, '6345f518c5c2d6.73393476', 1),
(13, '636ae6f2b13177.70285172', 1),
(14, '636ae7e47631d0.53211866', 1),
(15, '636ae819c96372.19213704', 1),
(16, '636ae845774a90.50892287', 1),
(17, '63cb26f44ff981.59154321', 1),
(18, '63cb274b243f88.12842329', 1),
(19, '63cb27964cb2a3.14800375', 1),
(20, '63cb27f4c588d8.85302337', 1),
(21, '63cb28a0adb2f2.67596660', 1),
(22, '63cb2915916798.85801765', 1),
(23, '63cb2a6d7f0fb3.85967578', 1),
(24, '63e55c9b6b2d98.20695336', 1),
(25, '642734073b27e7.66765165', 1),
(28, '62a8a43bb67fa6.38495185', 1),
(29, '62a8da0d97a8f6.25904684', 1),
(30, '632b45df945454.17181395', 1),
(32, '632b472f497b95.12743913', 1),
(34, '633eeece335cd2.35066473', 1),
(35, '633eef17cc43c6.86654620', 1),
(36, '633eefe21f96f3.52854199', 1),
(37, '6345f3d21f53b8.76043717', 1),
(38, '6345f518c5c2d6.73393476', 1),
(39, '636ae6f2b13177.70285172', 1),
(40, '636ae7e47631d0.53211866', 1),
(41, '636ae819c96372.19213704', 1),
(42, '636ae845774a90.50892287', 1),
(43, '63cb26f44ff981.59154321', 1),
(44, '63cb274b243f88.12842329', 1),
(45, '63cb27964cb2a3.14800375', 1),
(46, '63cb27f4c588d8.85302337', 1),
(47, '63cb28a0adb2f2.67596660', 1),
(48, '63cb2915916798.85801765', 1),
(49, '63cb2a6d7f0fb3.85967578', 1),
(50, '63e55c9b6b2d98.20695336', 1),
(51, '642734073b27e7.66765165', 1),
(53, '5c0653d43d92e7.75019474', 1),
(54, '5c0653d43d92e7.75019474', 3),
(55, '5c0653d43d92e7.75019474', 4);

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
-- Estructura de tabla para la tabla `enlaces`
--

CREATE TABLE `enlaces` (
  `ID_ENLACE` int(11) UNSIGNED NOT NULL,
  `ID_PROYECTO` int(11) UNSIGNED NOT NULL,
  `ID_TAREA` int(11) UNSIGNED NOT NULL,
  `ETIQUETA` varchar(255) NOT NULL,
  `ENLACE` varchar(255) NOT NULL,
  `TIPO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `ID_EQUIPO` int(11) NOT NULL,
  `ID_AREA` int(11) NOT NULL DEFAULT 1,
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

INSERT INTO `equipos` (`ID_EQUIPO`, `ID_AREA`, `EQUIPO_NOMBRE`, `URL`, `EQUIPO_DESCRIPCION`, `IMAGEN`, `IMAGEN_FONDO`, `COLOR`, `TIPO`, `ESTADO`, `ORDEN`) VALUES
(1, 1, 'DTE-Web', 'dte-web', '<p>Esta es la descripci&oacute;n de un equipo<br />Se puede agregar cualquier informaci&oacute;n que se desee.</p>', 'default.jpg', 'fondo_default.jpg', 'primary', 'general', 'activo', 0),
(2, 1, 'DTE-Comunicación', 'dte-comunicacion', '', 'default.jpg', 'fondo_default.jpg', 'primary', 'general', 'activo', 0),
(3, 1, 'DTE Producción', 'dte-produccion', '', 'default.jpg', 'fondo_default.jpg', 'primary', 'general', 'activo', 0),
(4, 1, 'Equipo KCSQ', 'borrador-KCSQ', '', 'default.jpg', 'fondo_default.jpg', 'primary', 'general', 'activo', 0);

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
(1, 2),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 3),
(2, 3),
(2, 11),
(0, 13),
(0, 15),
(0, 16),
(0, 17),
(0, 19),
(3, 20),
(0, 21),
(0, 22),
(1, 23),
(2, 23),
(3, 23),
(3, 18),
(0, 24),
(0, 25),
(0, 26),
(0, 27),
(0, 28),
(0, 29),
(2, 30),
(0, 31),
(1, 32),
(2, 32),
(2, 14),
(0, 33),
(0, 34),
(0, 35),
(0, 37),
(0, 38),
(0, 40),
(2, 39),
(3, 39),
(3, 41),
(1, 42),
(2, 42),
(0, 43),
(0, 44),
(1, 46),
(2, 46),
(3, 46),
(1, 47),
(2, 47),
(3, 47),
(0, 48);

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
(1, '632b45df945454.17181395', 'miembro'),
(1, '632b472f497b95.12743913', 'miembro'),
(2, '636ae6f2b13177.70285172', 'miembro'),
(2, '62a8da0d97a8f6.25904684', 'miembro'),
(3, '63cb26f44ff981.59154321', 'miembro'),
(3, '63cb274b243f88.12842329', 'miembro'),
(3, '63cb27964cb2a3.14800375', 'miembro'),
(3, '63cb27f4c588d8.85302337', 'miembro'),
(3, '63e55c9b6b2d98.20695336', 'miembro'),
(3, '63cb2915916798.85801765', 'miembro'),
(2, '633eefe21f96f3.52854199', 'miembro'),
(1, '5c0653d43d92e7.75019474', 'miembro'),
(2, '636ae7e47631d0.53211866', 'miembro'),
(3, '63cb2a6d7f0fb3.85967578', 'miembro'),
(3, '63cb28a0adb2f2.67596660', 'miembro');

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
('5f400557ec9b74.36456554', 'secreto', 'RGJX6F', 'usuario'),
('5f400801858cd8.64544354', 'secreto', 'GX3TW3', 'usuario'),
('632b45df945454.17181395', 'secreto', 'WJHA3O', 'usuario'),
('632b45df945454.17181395', '0', '', 'usuario'),
('632b472f497b95.12743913', 'secreto', 'ABIXGR', 'usuario'),
('632b472f497b95.12743913', '0', '', 'usuario'),
('1', 'meta_autor', 'Samuel Vasquez Aquino', 'proyectos'),
('1', 'autor', 'Samuel Vasquez Aquino', 'proyecto'),
('632b46a0cdf025.04927926', 'secreto', 'BWBZ55', 'usuario'),
('632b46a0cdf025.04927926', '0', '', 'usuario'),
('2', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos'),
('2', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('3', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos'),
('3', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('4', 'meta_autor', 'Samuel Vasquez Aquino', 'proyectos'),
('4', 'autor', 'Samuel Vasquez Aquino', 'proyecto'),
('5', 'meta_autor', 'Samuel Vasquez Aquino', 'proyectos'),
('5', 'autor', 'Samuel Vasquez Aquino', 'proyecto'),
('6', 'meta_autor', 'Samuel Vasquez Aquino', 'proyectos'),
('6', 'autor', 'Samuel Vasquez Aquino', 'proyecto'),
('7', 'meta_autor', 'Samuel Vasquez Aquino', 'proyectos'),
('7', 'autor', 'Samuel Vasquez Aquino', 'proyecto'),
('633eeece335cd2.35066473', 'secreto', 'J2CEG0', 'usuario'),
('633eeece335cd2.35066473', '0', '', 'usuario'),
('6345f518c5c2d6.73393476', 'secreto', 'K22NKI', 'usuario'),
('636ae845774a90.50892287', 'secreto', 'W1D77J', 'usuario'),
('636ae845774a90.50892287', '0', '', 'usuario'),
('636ae6f2b13177.70285172', 'secreto', 'MHAZTU', 'usuario'),
('636ae6f2b13177.70285172', '0', '', 'usuario'),
('8', 'meta_autor', 'Samuel Vasquez Aquino', 'proyectos'),
('8', 'autor', 'Samuel Vasquez Aquino', 'proyecto'),
('9', 'meta_autor', 'Samuel Vasquez Aquino', 'proyectos'),
('9', 'autor', 'Samuel Vasquez Aquino', 'proyecto'),
('10', 'meta_autor', 'Samuel Vasquez Aquino', 'proyectos'),
('10', 'autor', 'Samuel Vasquez Aquino', 'proyecto'),
('632b47e9ba5356.01109483', 'secreto', 'Y3AOOY', 'usuario'),
('632b47e9ba5356.01109483', '0', '', 'usuario'),
('636ae819c96372.19213704', 'secreto', 'RPSOCZ', 'usuario'),
('636ae819c96372.19213704', '0', '', 'usuario'),
('3', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('3', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('3', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('3', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('11', 'meta_autor', 'Abraham González Flores ', 'proyectos'),
('62a8da0d97a8f6.25904684', 'secreto', 'CYNXV1', 'usuario'),
('62a8da0d97a8f6.25904684', '0', '', 'usuario'),
('63cb274b243f88.12842329', 'secreto', 'DSBIYM', 'usuario'),
('63cb27f4c588d8.85302337', 'secreto', '7DLILR', 'usuario'),
('63cb27f4c588d8.85302337', '0', '', 'usuario'),
('63cb26f44ff981.59154321', 'secreto', 'M8QYT4', 'usuario'),
('63cb26f44ff981.59154321', '0', '', 'usuario'),
('63cb27964cb2a3.14800375', 'secreto', 'N55B3H', 'usuario'),
('63cb27964cb2a3.14800375', '0', '', 'usuario'),
('12', 'meta_autor', 'Saray Navarro', 'proyectos'),
('12', 'autor', 'Saray Navarro', 'proyecto'),
('13', 'meta_autor', 'Lizbeth Evoli', 'proyectos'),
('14', 'meta_autor', 'Lizbeth Evoli', 'proyectos'),
('14', 'autor', 'Lizbeth Evoli', 'proyecto'),
('15', 'meta_autor', 'ivonne mayoral', 'proyectos'),
('16', 'meta_autor', 'ivonne mayoral', 'proyectos'),
('17', 'meta_autor', 'ivonne mayoral', 'proyectos'),
('18', 'meta_autor', 'ivonne mayoral', 'proyectos'),
('18', 'autor', 'ivonne mayoral', 'proyecto'),
('19', 'meta_autor', 'ivonne mayoral', 'proyectos'),
('63e55c9b6b2d98.20695336', 'secreto', 'U028PJ', 'usuario'),
('3', 'autor', 'ivonne mayoral', 'equipo'),
('20', 'meta_autor', 'ivonne mayoral', 'proyectos'),
('20', 'autor', 'ivonne mayoral', 'proyecto'),
('21', 'meta_autor', 'Francisco Ramirez', 'proyectos'),
('22', 'meta_autor', 'Francisco Ramirez', 'proyectos'),
('23', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos'),
('23', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('18', 'autor', 'ivonne mayoral', 'proyecto'),
('24', 'meta_autor', 'Ivonne Mayoral', 'proyectos'),
('25', 'meta_autor', 'Mariana García García', 'proyectos'),
('26', 'meta_autor', 'Mariana García García', 'proyectos'),
('27', 'meta_autor', 'Mariana García García', 'proyectos'),
('28', 'meta_autor', 'Mariana García García', 'proyectos'),
('29', 'meta_autor', 'Mariana García García', 'proyectos'),
('30', 'meta_autor', 'Mariana García García', 'proyectos'),
('30', 'autor', 'Mariana García García', 'proyecto'),
('30', 'autor', 'Mariana García García', 'proyecto'),
('31', 'meta_autor', 'Mariana García García', 'proyectos'),
('63cb2915916798.85801765', 'secreto', 'V1K7HG', 'usuario'),
('63cb2915916798.85801765', '0', 'Diseñadora Gráfica', 'usuario'),
('32', 'meta_autor', 'Gonzalo Torres', 'proyectos'),
('32', 'autor', 'Gonzalo Torres', 'proyecto'),
('633eefe21f96f3.52854199', 'secreto', 'OMD1UZ', 'usuario'),
('633eefe21f96f3.52854199', '0', '', 'usuario'),
('32', 'autor', 'Gonzalo Torres', 'proyecto'),
('6345f3d21f53b8.76043717', 'secreto', 'BPWKH6', 'usuario'),
('6345f3d21f53b8.76043717', '0', '', 'usuario'),
('14', 'autor', 'Mariana García García', 'proyecto'),
('2', 'meta_autor', 'Manuel Marmolejo Martínez', 'area'),
('33', 'meta_autor', 'Ivonne Mayoral', 'proyectos'),
('34', 'meta_autor', 'Ivonne Mayoral', 'proyectos'),
('35', 'meta_autor', 'Ivonne Mayoral', 'proyectos'),
('36', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos'),
('36', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('37', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos'),
('38', 'meta_autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyectos'),
('636ae7e47631d0.53211866', 'secreto', '07OYCL', 'usuario'),
('636ae7e47631d0.53211866', '0', '', 'usuario'),
('63cb2a6d7f0fb3.85967578', 'secreto', 'TNNZBU', 'usuario'),
('63cb2a6d7f0fb3.85967578', '0', '', 'usuario'),
('63cb28a0adb2f2.67596660', 'secreto', '34X0IC', 'usuario'),
('63cb28a0adb2f2.67596660', '0', '', 'usuario'),
('39', 'meta_autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyectos'),
('39', 'autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyecto'),
('40', 'meta_autor', 'Ivonne Mayoral', 'proyectos'),
('41', 'meta_autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyectos'),
('41', 'autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyecto'),
('42', 'meta_autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyectos'),
('42', 'autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyecto'),
('41', 'autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyecto'),
('41', 'autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyecto'),
('42', 'autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyecto'),
('42', 'autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyecto'),
('42', 'autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyecto'),
('39', 'autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyecto'),
('41', 'autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyecto'),
('42', 'autor', 'Francisco Javier Ramírez Medina Ramírez Medina', 'proyecto'),
('633eef17cc43c6.86654620', 'secreto', 'WFTITM', 'usuario'),
('633eef17cc43c6.86654620', '0', '', 'usuario'),
('43', 'meta_autor', 'Nekhbet Urcid', 'proyectos'),
('44', 'meta_autor', 'Nekhbet Urcid', 'proyectos'),
('62a8a43bb67fa6.38495185', 'secreto', '4JQTOK', 'usuario'),
('62a8a43bb67fa6.38495185', '0', '', 'usuario'),
('642734073b27e7.66765165', 'secreto', 'QBWP14', 'usuario'),
('45', 'meta_autor', 'Andres Ruelas', 'proyectos'),
('45', 'autor', 'Andres Ruelas', 'proyecto'),
('4', 'meta_autor', 'Silvia Vargas', 'equipo'),
('64585d73c125e7.84936271', 'secreto', 'FWHGQK', 'usuario'),
('64585d73c125e7.84936271', '0', '', 'usuario'),
('4', 'autor', 'Manuel Marmolejo Martínez', 'area'),
('1', 'autor', 'Manuel Marmolejo Martínez', 'area'),
('3', 'autor', 'Manuel Marmolejo Martínez', 'area'),
('5c0653d43d92e7.75019474', 'secreto', 'J66CL7', 'usuario'),
('5c0653d43d92e7.75019474', '0', '', 'usuario'),
('7', 'nivel_accesibilidad', 'Accesibilidad A', 'parametro'),
('7', 'criterio_produccion', 'si_criterio_produccion', 'parametro'),
('7', 'nivel', 'nivel 1', 'parametro'),
('8', 'nivel_accesibilidad', 'Accesibilidad A', 'parametro'),
('8', 'criterio_produccion', 'si_criterio_produccion', 'parametro'),
('8', 'nivel', 'nivel 1', 'parametro'),
('9', 'nivel_accesibilidad', 'Accesibilidad A', 'parametro'),
('9', 'criterio_produccion', 'si_criterio_produccion', 'parametro'),
('9', 'nivel', 'nivel 1', 'parametro'),
('10', 'nivel_accesibilidad', 'Accesibilidad A', 'parametro'),
('10', 'criterio_produccion', 'si_criterio_produccion', 'parametro'),
('10', 'nivel', 'nivel 1', 'parametro'),
('11', 'nivel_accesibilidad', 'Accesibilidad A', 'parametro'),
('11', 'criterio_produccion', 'si_criterio_produccion', 'parametro'),
('11', 'nivel', 'nivel 1', 'parametro'),
('12', 'nivel_accesibilidad', 'Accesibilidad A', 'parametro'),
('12', 'criterio_produccion', 'si_criterio_produccion', 'parametro'),
('12', 'nivel', 'nivel 1', 'parametro'),
('13', 'nivel_accesibilidad', 'Accesibilidad A', 'parametro'),
('13', 'criterio_produccion', 'si_criterio_produccion', 'parametro'),
('13', 'nivel', 'nivel 1', 'parametro'),
('14', 'nivel_accesibilidad', 'Accesibilidad A', 'parametro'),
('14', 'criterio_produccion', 'si_criterio_produccion', 'parametro'),
('14', 'nivel', 'nivel 1', 'parametro'),
('46', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos'),
('46', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('46', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('46', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('15', 'nivel_accesibilidad', 'Accesibilidad AAA', 'parametro'),
('15', 'criterio_produccion', 'si_criterio_produccion', 'parametro'),
('15', 'nivel', 'nivel 1', 'parametro'),
('16', 'nivel_accesibilidad', 'Accesibilidad A', 'parametro'),
('16', 'criterio_produccion', 'si_criterio_produccion', 'parametro'),
('16', 'nivel', 'nivel 1', 'parametro'),
('17', 'nivel_accesibilidad', 'Accesibilidad A', 'parametro'),
('17', 'criterio_produccion', 'si_criterio_produccion', 'parametro'),
('17', 'nivel', 'nivel 1', 'parametro'),
('18', 'nivel_accesibilidad', 'Accesibilidad A', 'parametro'),
('18', 'criterio_produccion', 'si_criterio_produccion', 'parametro'),
('18', 'nivel', 'nivel 1', 'parametro'),
('47', 'meta_autor', 'Manuel Marmolejo Martínez', 'proyectos'),
('47', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('47', 'autor', 'Manuel Marmolejo Martínez', 'proyecto'),
('1', 'nivel_accesibilidad', 'Accesibilidad AA', 'parametro'),
('1', 'criterio_produccion', 'no_criterio_produccion', 'parametro'),
('1', 'nivel', 'nivel 2', 'parametro'),
('6', 'nivel_accesibilidad', 'Accesibilidad A', 'parametro'),
('6', 'criterio_produccion', 'no_criterio_produccion', 'parametro'),
('6', 'nivel', 'nivel 1', 'parametro'),
('48', 'meta_autor', 'Lucia Gabriela Bonilla Jiménez', 'proyectos');

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
  `ESTADO` varchar(255) NOT NULL DEFAULT 'activo',
  `LEIDO` varchar(256) DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`ID`, `ID_USUARIO`, `ENLACE`, `GRUPO`, `NOTIFICACION_CONTENIDO`, `FECHA_CREACION`, `ESTADO`, `LEIDO`) VALUES
(1, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=1', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S1_The gerund_HTML</b>', '2022-09-21 13:34:26', 'leido', 'no'),
(2, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=1', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S1_The gerund_HTML</b> y fuiste asignado a ella', '2022-09-21 13:35:31', 'leido', 'no'),
(4, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=3', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M08_S1_Las dos caras de la socialización_HTML</b>', '2022-09-21 14:40:36', 'leido', 'si'),
(5, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=4', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M08_S1_El agente como ser ético_HTML</b>', '2022-09-21 14:42:33', 'leido', 'si'),
(6, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=5', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M08_S1_Convivir con derechos humanos_SCORM</b>', '2022-09-21 14:44:02', 'leido', 'si'),
(7, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=6', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M08_S1_Ciudadanía responsable_SCORM</b>', '2022-09-21 14:44:36', 'pendiente', 'no'),
(8, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=7', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M08_S1_El ser social en la diversidad cultural_SCORM</b>', '2022-09-21 14:45:50', 'pendiente', 'no'),
(13, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=12', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M08_S3_Fuentes de información en el proceso de investigación_HTML</b>', '2022-09-21 14:48:39', 'leido', 'no'),
(14, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=13', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M08_S3_Alcances y limitaciones de los resultados de investigación_SCORM</b>', '2022-09-21 14:50:10', 'leido', 'no'),
(15, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=13', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M08_S3_Alcances y limitaciones de los resultados de investigación_SCORM</b> y fuiste asignado a ella', '2022-09-21 14:50:32', 'leido', 'no'),
(22, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=18', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S1_Enfrentamientos y alianzas_HTML</b> y fuiste asignado a ella', '2022-09-21 16:01:02', 'leido', 'no'),
(23, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=19', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M09_S1_Evangelización_HTML</b>', '2022-09-21 16:02:53', 'leido', 'no'),
(24, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=20', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M09_S1_Nueva España_HTML</b>', '2022-09-21 16:03:32', 'leido', 'no'),
(25, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=20', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S1_Nueva España_HTML</b> y fuiste asignado a ella', '2022-09-21 16:03:48', 'leido', 'no'),
(29, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=24', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M09_S2_Antecedentes de la guerra de Independencia de la Nueva España_SCORM</b>', '2022-09-21 16:07:09', 'leido', 'si'),
(30, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=25', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M09_S2_Independencia_SCORM</b>', '2022-09-21 16:07:52', 'leido', 'si'),
(31, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=26', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M09_S2_La República restaurada_HTML</b>', '2022-09-21 16:08:45', 'leido', 'si'),
(32, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=27', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M09_S2_El Porfiriato_HTML</b>', '2022-09-21 16:09:31', 'pendiente', 'no'),
(33, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=28', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M09_S2_Presidencia de Francisco I. Madero_HTML</b>', '2022-09-21 16:10:16', 'pendiente', 'no'),
(37, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=32', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M09_S3_Elecciones de 1988_HTML</b>', '2022-09-21 16:13:21', 'leido', 'no'),
(38, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=33', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M09_S3_Organismos internacionales en la economía nacional_HTML</b>', '2022-09-21 16:14:03', 'leido', 'no'),
(39, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=34', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M09_S3_Creación de la identificación oficial_HTML</b>', '2022-09-21 16:14:45', 'leido', 'no'),
(43, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=38', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S1_Life stages_HTML</b>', '2022-09-21 16:18:43', 'leido', 'si'),
(44, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=39', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S1_Time expressions_SCORM</b>', '2022-09-21 16:23:03', 'leido', 'si'),
(45, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=40', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S1_To practice further_HTML</b>', '2022-09-21 16:26:40', 'leido', 'si'),
(46, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=41', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S1_To learn further_HTML</b>', '2022-09-21 16:28:40', 'pendiente', 'no'),
(47, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=42', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S1_Prepositions of time_HTML</b>', '2022-09-21 16:30:22', 'pendiente', 'no'),
(48, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=43', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S2_Memories_HTML</b>', '2022-09-21 16:32:20', 'pendiente', 'no'),
(52, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=10', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-09-21 17:18:20', 'pendiente', 'no'),
(54, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=46', 'tareas', 'Se te ha asignado la tarea <b>Nueva tarea de ejemplo</b>', '2022-09-21 17:23:00', 'pendiente', 'no'),
(56, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=46', 'tareas', 'Se te ha asignado la tarea <b>Nueva tarea de ejemplo</b>', '2022-09-21 17:23:02', 'leido', 'no'),
(58, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=46', 'tareas', 'Se te ha asignado la tarea <b>Nueva tarea de ejemplo</b>', '2022-09-21 17:23:03', 'leido', 'si'),
(59, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=1', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S1_The gerund_HTML</b> y fuiste asignado a ella', '2022-09-21 17:31:43', 'leido', 'si'),
(64, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=49', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S3_What are you going to do?_HTML</b>', '2022-09-22 11:10:02', 'leido', 'no'),
(65, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=50', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S3_Would you like to…?_HTML</b>', '2022-09-22 11:12:22', 'leido', 'no'),
(66, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=51', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S3_To learn further_HTML</b>', '2022-09-22 11:15:15', 'leido', 'no'),
(67, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=52', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S3_To practice further_HTML</b>', '2022-09-22 11:17:01', 'leido', 'no'),
(75, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=57', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M06_S1_To practice further_HTML</b>', '2022-09-22 11:35:52', 'leido', 'si'),
(76, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=58', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M06_S1_To learn further_HTML</b>', '2022-09-22 11:37:51', 'leido', 'si'),
(77, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=59', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M06_S1_Question Words_HTML</b>', '2022-09-22 11:40:49', 'leido', 'si'),
(78, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=59', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M06_S1_Question Words_HTML</b> y fuiste asignado a ella', '2022-09-22 11:41:15', 'leido', 'si'),
(79, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=60', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M06_S2_Definite Article \'The\'_HTML</b>', '2022-09-22 11:43:28', 'leido', 'si'),
(80, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=61', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M06_S2_There is / There are_SCORM</b>', '2022-09-22 11:53:30', 'pendiente', 'no'),
(81, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=62', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M06_S2_To learn further_SCORM</b>', '2022-09-22 11:55:18', 'pendiente', 'no'),
(85, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=66', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M06_S3_Can, Can\'t_SCORM</b>', '2022-09-22 12:49:56', 'leido', 'no'),
(86, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=67', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M06_S3_Expressing hobbies and abilities_SCORM</b>', '2022-09-22 12:51:30', 'leido', 'no'),
(87, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=68', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M06_S3_Likes, Dislikes, Hate_SCORM</b>', '2022-09-22 12:53:00', 'leido', 'no'),
(91, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=72', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M05_S1_Tipos de argumento_SCORM</b>', '2022-09-22 13:03:12', 'leido', 'si'),
(92, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=73', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M05_S1_Reactivar aprendizajes_HTML</b>', '2022-09-22 13:06:08', 'leido', 'si'),
(93, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=74', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M05_S1_Investigación documental_HTML</b>', '2022-09-22 13:07:34', 'leido', 'si'),
(94, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=74', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M05_S2_Investigación documental_HTML</b> y fuiste asignado a ella', '2022-09-22 13:09:32', 'leido', 'si'),
(95, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=75', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M05_S2_Informática en la investigación_HTML</b>', '2022-09-22 13:27:26', 'pendiente', 'no'),
(96, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=76', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M05_S2_Búsqueda de información en internet_SCORM</b>', '2022-09-22 13:29:37', 'pendiente', 'no'),
(100, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=80', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M05_S2_Recupera aprendizajes: opinar, leer, escribir y hablar_HTML</b>', '2022-09-22 13:39:13', 'leido', 'no'),
(101, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=81', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M05_S3_Recupera aprendizajes: conocimiento científico_HTML</b>', '2022-09-22 13:40:23', 'leido', 'no'),
(102, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=82', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M05_S3_Recupera aprendizajes: fuentes de información_HTML</b>', '2022-09-22 13:42:34', 'leido', 'no'),
(106, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=86', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M04_S2_Para saber más. El sentido de la vida_HTML</b>', '2022-09-22 13:52:26', 'leido', 'si'),
(107, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=87', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M04_S2_Literatura en los siglos XIX y XX_HTML</b>', '2022-09-22 13:53:41', 'leido', 'si'),
(108, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=88', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M04_S2_Literatura en México_HTML</b>', '2022-09-22 13:55:43', 'leido', 'si'),
(109, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=89', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M04_S2_Para saber más. Glosario_HTML</b>', '2022-09-22 13:59:21', 'pendiente', 'no'),
(110, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=90', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M04_S2_Recupera aprendizajes: Características de la sociedad contemporánea_HTML</b>', '2022-09-22 14:01:15', 'pendiente', 'no'),
(114, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=94', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M04_S3_Formas de literatura actuales_HTML</b>', '2022-09-22 14:08:58', 'leido', 'no'),
(115, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=95', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M04_S3_Recupera aprendizajes. Oralidad y escritura_HTML</b>', '2022-09-22 14:10:07', 'leido', 'no'),
(116, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=96', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M04_S3_Para saber más. Sócrates y los sofistas_HTML</b>', '2022-09-22 14:11:38', 'leido', 'no'),
(120, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=100', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S1_Estrategias de estudio_HTML</b>', '2022-09-22 14:30:22', 'leido', 'si'),
(121, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=101', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S1_Reconstrucción y análisis de hechos históricos_HTML</b>', '2022-09-22 14:32:00', 'leido', 'si'),
(122, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=102', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S1_Condiciones sociohistóricas y culturales_SCORM</b>', '2022-09-22 14:33:44', 'leido', 'si'),
(123, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=103', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S1_Análisis de datos e información_HTML</b>', '2022-09-22 14:36:02', 'pendiente', 'no'),
(124, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=104', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S1_Lenguaje_HTML</b>', '2022-09-22 14:37:34', 'pendiente', 'no'),
(135, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=108', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S2_Biología_HTML</b>', '2022-09-22 17:47:43', 'leido', 'no'),
(136, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=109', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S2_Biología en la vida cotidiana_HTML</b>', '2022-09-22 17:48:52', 'leido', 'no'),
(137, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=110', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S2_Fenómeno natural: representaciones_SCORM</b>', '2022-09-22 17:50:31', 'leido', 'no'),
(141, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=114', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S3_El lenguaje de la ciencia_HTML</b>', '2022-09-22 17:56:31', 'leido', 'si'),
(142, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=115', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S3_Antropología_HTML</b>', '2022-09-23 10:59:30', 'leido', 'si'),
(143, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=116', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S3_El mundo contemporáneo_HTML</b>', '2022-09-23 11:00:52', 'leido', 'si'),
(144, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=117', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S3_Relaciones sociales_SCORM</b>', '2022-09-23 11:02:38', 'pendiente', 'no'),
(145, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=118', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M03_S3_Fundamentalismo_HTML</b>', '2022-09-23 11:05:10', 'pendiente', 'no'),
(155, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=18', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S1_Enfrentamientos y alianzas_HTML</b> y fuiste asignado a ella', '2022-09-28 15:04:11', 'leido', 'no'),
(156, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=19', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S1_Evangelización_HTML</b> y fuiste asignado a ella', '2022-09-28 15:06:42', 'leido', 'no'),
(157, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=20', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S1_Nueva España_HTML</b> y fuiste asignado a ella', '2022-09-28 15:06:49', 'leido', 'no'),
(158, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=20', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S1_Nueva España_HTML</b> y fuiste asignado a ella', '2022-09-28 15:07:31', 'leido', 'no'),
(159, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=20', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S1_Nueva España_HTML</b> y fuiste asignado a ella', '2022-09-28 15:07:33', 'leido', 'no'),
(160, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=20', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S1_Nueva España_HTML</b> y fuiste asignado a ella', '2022-09-28 15:07:34', 'leido', 'no'),
(161, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=34', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S3_Creación de la identificación oficial_HTML</b> y fuiste asignado a ella', '2022-09-28 15:07:50', 'leido', 'no'),
(162, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=33', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S3_Organismos internacionales en la economía nacional_HTML</b> y fuiste asignado a ella', '2022-09-28 15:07:56', 'leido', 'no'),
(163, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=32', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S3_Elecciones de 1988_HTML</b> y fuiste asignado a ella', '2022-09-28 15:08:02', 'leido', 'no'),
(164, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=12', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M08_S3_Fuentes de información en el proceso de investigación_HTML</b> y fuiste asignado a ella', '2022-09-28 15:09:42', 'leido', 'no'),
(165, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=13', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M08_S3_Alcances y limitaciones de los resultados de investigación_SCORM</b> y fuiste asignado a ella', '2022-09-28 15:09:53', 'leido', 'no'),
(166, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=46', 'tareas', 'Se ha actualizado la tarea <b>Nueva tarea de ejemplo</b> y fuiste asignado a ella', '2022-09-28 15:10:26', 'pendiente', 'no'),
(169, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=46', 'tareas', 'Se ha actualizado la tarea <b>Nueva tarea de ejemplo</b> y fuiste asignado a ella', '2022-09-28 15:10:27', 'leido', 'si'),
(172, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=49', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S3_What are you going to do?_HTML</b> y fuiste asignado a ella', '2022-09-29 14:27:53', 'leido', 'no'),
(173, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=49', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S3_What are you going to do?_HTML</b> y fuiste asignado a ella', '2022-09-29 14:29:01', 'leido', 'no'),
(175, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=49', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-09-29 14:31:46', 'pendiente', 'no'),
(176, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=50', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S3_Would you like to…?_HTML</b> y fuiste asignado a ella', '2022-09-29 18:51:43', 'leido', 'no'),
(178, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=10', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S1_Trying something new_HTML</b> y fuiste asignado a ella', '2022-09-30 17:51:09', 'pendiente', 'no'),
(184, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=51', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S3_To learn further_HTML</b> y fuiste asignado a ella', '2022-10-04 13:01:53', 'leido', 'no'),
(185, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=52', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S3_To practice further_HTML</b> y fuiste asignado a ella', '2022-10-04 13:03:05', 'leido', 'no'),
(186, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=50', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S3_Would you like to…?_HTML</b> y fuiste asignado a ella', '2022-10-04 13:03:29', 'leido', 'no'),
(187, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=82', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M05_S3_Recupera aprendizajes: fuentes de información_HTML</b> y fuiste asignado a ella', '2022-10-04 13:03:56', 'leido', 'no'),
(188, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=67', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M06_S3_Expressing hobbies and abilities_SCORM</b> y fuiste asignado a ella', '2022-10-04 13:04:32', 'leido', 'no'),
(189, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=68', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M06_S3_Likes, Dislikes, Hate_SCORM</b> y fuiste asignado a ella', '2022-10-04 13:35:54', 'leido', 'no'),
(190, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=80', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M05_S2_Recupera aprendizajes: opinar, leer, escribir y hablar_HTML</b> y fuiste asignado a ella', '2022-10-04 13:36:01', 'leido', 'no'),
(191, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=81', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M05_S3_Recupera aprendizajes: conocimiento científico_HTML</b> y fuiste asignado a ella', '2022-10-04 13:36:08', 'leido', 'no'),
(192, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=49', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S3_What are you going to do?_HTML</b> y fuiste asignado a ella', '2022-10-04 13:40:52', 'leido', 'no'),
(193, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=51', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S3_To learn further_HTML</b> y fuiste asignado a ella', '2022-10-04 13:41:54', 'leido', 'no'),
(194, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=95', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M04_S3_Recupera aprendizajes. Oralidad y escritura_HTML</b> y fuiste asignado a ella', '2022-10-04 14:42:37', 'leido', 'no'),
(195, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=94', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M04_S3_Formas de literatura actuales_HTML</b> y fuiste asignado a ella', '2022-10-04 14:42:46', 'leido', 'no'),
(196, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=96', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M04_S3_Para saber más. Sócrates y los sofistas_HTML</b> y fuiste asignado a ella', '2022-10-04 14:42:58', 'leido', 'no'),
(197, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=109', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M03_S2_Biología en la vida cotidiana_HTML</b> y fuiste asignado a ella', '2022-10-04 14:44:40', 'leido', 'no'),
(198, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=108', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M03_S2_Biología_HTML</b> y fuiste asignado a ella', '2022-10-04 14:44:46', 'leido', 'no'),
(199, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=6', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-05 16:02:40', 'pendiente', 'no'),
(200, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=7', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-05 16:03:17', 'pendiente', 'no'),
(202, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=41', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S1_To learn further_HTML</b> y fuiste asignado a ella', '2022-10-05 16:35:27', 'pendiente', 'no'),
(204, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=41', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-05 16:36:09', 'pendiente', 'no'),
(206, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=41', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-05 16:36:17', 'pendiente', 'no'),
(207, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=110', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M03_S2_Fenómeno natural: representaciones_SCORM</b> y fuiste asignado a ella', '2022-10-05 18:51:41', 'leido', 'no'),
(208, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=38', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-07 13:48:10', 'pendiente', 'si'),
(209, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=39', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-07 13:53:33', 'pendiente', 'si'),
(210, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=40', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-07 13:55:45', 'pendiente', 'si'),
(211, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=52', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S3_To practice further_HTML</b> y fuiste asignado a ella', '2022-10-07 13:58:38', 'leido', 'si'),
(212, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=50', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S3_Would you like to…?_HTML</b> y fuiste asignado a ella', '2022-10-07 13:58:57', 'pendiente', 'si'),
(213, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=49', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S3_What are you going to do?_HTML</b> y fuiste asignado a ella', '2022-10-07 13:59:07', 'pendiente', 'si'),
(214, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=51', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S3_To learn further_HTML</b> y fuiste asignado a ella', '2022-10-07 13:59:24', 'pendiente', 'si'),
(215, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=82', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M05_S3_Recupera aprendizajes: fuentes de información_HTML</b> y fuiste asignado a ella', '2022-10-07 14:00:34', 'pendiente', 'si'),
(216, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=68', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M06_S3_Likes, Dislikes, Hate_SCORM</b> y fuiste asignado a ella', '2022-10-07 14:03:57', 'pendiente', 'si'),
(217, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=80', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M05_S2_Recupera aprendizajes: opinar, leer, escribir y hablar_HTML</b> y fuiste asignado a ella', '2022-10-07 14:04:24', 'pendiente', 'si'),
(218, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=81', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M05_S3_Recupera aprendizajes: conocimiento científico_HTML</b> y fuiste asignado a ella', '2022-10-07 14:04:47', 'pendiente', 'si'),
(219, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=95', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M04_S3_Recupera aprendizajes. Oralidad y escritura_HTML</b> y fuiste asignado a ella', '2022-10-07 14:05:54', 'pendiente', 'si'),
(220, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=94', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M04_S3_Formas de literatura actuales_HTML</b> y fuiste asignado a ella', '2022-10-07 14:06:44', 'pendiente', 'si'),
(221, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=96', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M04_S3_Para saber más. Sócrates y los sofistas_HTML</b> y fuiste asignado a ella', '2022-10-07 14:07:15', 'pendiente', 'si'),
(222, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=109', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M03_S2_Biología en la vida cotidiana_HTML</b> y fuiste asignado a ella', '2022-10-07 14:07:51', 'pendiente', 'si'),
(223, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=108', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M03_S2_Biología_HTML</b> y fuiste asignado a ella', '2022-10-07 14:08:26', 'pendiente', 'si'),
(224, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=110', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M03_S2_Fenómeno natural: representaciones_SCORM</b> y fuiste asignado a ella', '2022-10-07 14:09:28', 'pendiente', 'si'),
(225, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=67', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M06_S3_Expressing hobbies and abilities_SCORM</b> y fuiste asignado a ella', '2022-10-07 14:27:38', 'pendiente', 'si'),
(226, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=57', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-07 15:20:01', 'pendiente', 'si'),
(227, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=66', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M06_S3_Can, Can\'t_SCORM</b> y fuiste asignado a ella', '2022-10-10 10:18:07', 'pendiente', 'si'),
(228, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=58', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-10 10:59:38', 'pendiente', 'si'),
(229, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=59', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-11 11:37:22', 'pendiente', 'si'),
(230, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=60', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-11 12:40:41', 'pendiente', 'si'),
(232, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=72', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-11 16:56:15', 'pendiente', 'si'),
(235, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=73', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-13 11:45:52', 'pendiente', 'si'),
(236, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=74', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-13 12:25:20', 'pendiente', 'si'),
(237, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=86', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-13 13:30:23', 'pendiente', 'si'),
(238, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=87', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-13 14:20:09', 'pendiente', 'si'),
(239, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=88', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-13 15:03:24', 'pendiente', 'si'),
(240, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=100', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-13 17:15:17', 'pendiente', 'si'),
(241, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=101', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-13 17:40:58', 'pendiente', 'si'),
(242, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=102', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-13 17:54:30', 'pendiente', 'si'),
(243, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=114', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-13 18:26:36', 'pendiente', 'si'),
(244, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=115', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-13 18:55:10', 'pendiente', 'si'),
(245, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=116', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-13 19:21:57', 'pendiente', 'si'),
(252, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=16', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S1_La guerra y el sacrificio en los mexicas_HTML</b> y fuiste asignado a ella', '2022-10-18 12:14:45', 'pendiente', 'si'),
(253, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=16', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 12:16:55', 'pendiente', 'si'),
(254, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=17', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 12:18:25', 'pendiente', 'si'),
(255, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=15', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 12:18:35', 'pendiente', 'si'),
(256, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=29', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 12:19:26', 'pendiente', 'si'),
(257, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=31', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 12:19:37', 'pendiente', 'si'),
(258, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=30', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 12:19:47', 'pendiente', 'si'),
(259, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=8', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 12:20:16', 'pendiente', 'si'),
(260, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=11', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 12:20:25', 'pendiente', 'si'),
(261, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=9', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 12:20:33', 'pendiente', 'si'),
(263, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=47', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 14:59:42', 'pendiente', 'si'),
(264, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=44', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 15:00:18', 'pendiente', 'si'),
(265, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=48', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 15:00:35', 'pendiente', 'si'),
(266, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=45', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-18 15:00:47', 'pendiente', 'si'),
(267, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=46', 'tareas', 'Se ha actualizado la tarea <b>Nueva tarea de ejemplo</b> y fuiste asignado a ella', '2022-10-18 15:18:29', 'pendiente', 'no'),
(269, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=46', 'tareas', 'Se ha actualizado la tarea <b>Nueva tarea de ejemplo</b> y fuiste asignado a ella', '2022-10-18 15:18:30', 'leido', 'si'),
(270, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=63', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:11:13', 'pendiente', 'si'),
(271, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=64', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:11:26', 'pendiente', 'si'),
(272, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=65', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:11:35', 'pendiente', 'si'),
(273, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=79', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:11:51', 'pendiente', 'si'),
(274, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=78', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:12:03', 'pendiente', 'si'),
(275, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=77', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:12:12', 'pendiente', 'si'),
(276, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=91', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:12:27', 'pendiente', 'si'),
(277, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=92', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:12:38', 'pendiente', 'si'),
(278, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=93', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:12:48', 'pendiente', 'si'),
(279, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=105', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:13:08', 'pendiente', 'si'),
(280, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=106', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:13:21', 'pendiente', 'si'),
(281, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=107', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:13:32', 'pendiente', 'si'),
(282, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=119', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:14:12', 'pendiente', 'si'),
(283, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=120', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:14:22', 'pendiente', 'si'),
(284, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=121', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-10-21 12:14:32', 'pendiente', 'si'),
(285, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=27', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-01 14:32:21', 'leido', 'no'),
(286, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=28', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-01 14:33:18', 'leido', 'no'),
(287, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=28', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S2_Presidencia de Francisco I. Madero_HTML</b> y fuiste asignado a ella', '2022-11-01 14:33:31', 'pendiente', 'no'),
(288, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=43', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-03 12:15:00', 'pendiente', 'si'),
(289, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=43', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S2_Memories_HTML</b> y fuiste asignado a ella', '2022-11-03 12:15:21', 'pendiente', 'si'),
(290, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=42', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-03 13:02:03', 'pendiente', 'si'),
(291, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=41', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S1_To learn further_HTML</b> y fuiste asignado a ella', '2022-11-07 17:22:19', 'pendiente', 'si'),
(292, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=122', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M02_S1_Realización profesional_SCORM</b>', '2022-11-09 12:58:41', 'leido', 'no'),
(293, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=123', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M02_S1_Oralidad_HTML</b>', '2022-11-09 13:08:07', 'leido', 'no'),
(294, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=124', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M02_S1_Para saber más: Ortografía_HTML</b>', '2022-11-09 13:09:55', 'leido', 'no'),
(301, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=128', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M02_S2_Para practicar más_HTML</b>', '2022-11-09 13:21:57', 'leido', 'si'),
(302, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=129', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M02_S2_Pasos para resumir_SCORM</b>', '2022-11-09 13:35:12', 'leido', 'si'),
(303, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=130', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M02_S3_El relato_HTML</b>', '2022-11-09 13:36:57', 'leido', 'si'),
(304, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=131', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M02_S3_¿Qué es el comentario?_HTML</b>', '2022-11-09 13:39:27', 'leido', 'no'),
(305, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M02_S3_¿Qué es la reseña?_HTML</b>', '2022-11-09 13:41:59', 'leido', 'no'),
(309, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=136', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M01_S1_Las TIC en la sociedad_SCORM</b>', '2022-11-09 14:32:59', 'leido', 'no'),
(310, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=136', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M01_S1_Las TIC en la sociedad_SCORM</b> y fuiste asignado a ella', '2022-11-09 14:34:38', 'leido', 'no'),
(311, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=137', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M01_S1_Para saber más: El porqué de las TIC en educación_HTML</b>', '2022-11-09 14:56:36', 'leido', 'no'),
(312, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=138', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M01_S2_Comportamiento digital_HTML</b>', '2022-11-09 14:59:35', 'leido', 'no'),
(316, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=142', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M01_S3_Para saber más: Sociedad de la información o sociedad del conocimiento_HTML</b>', '2022-11-09 16:22:32', 'leido', 'si'),
(317, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=143', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M00_S1_¿Qué hay en Mi Aula?_HTML</b>', '2022-11-09 16:27:09', 'leido', 'si'),
(318, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=143', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M00_S1_¿Qué hay en Mi Aula?_SCORM</b> y fuiste asignado a ella', '2022-11-09 16:28:07', 'leido', 'si'),
(319, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=144', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M00_S2_Asesor en la didáctica disciplinar_HTML</b>', '2022-11-09 16:30:44', 'leido', 'si'),
(320, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=145', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M00_S2_¿Cómo nos comunicamos?_HTML</b>', '2022-11-09 16:36:33', 'leido', 'no'),
(321, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=146', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M00_S3_¿Cómo aprenderé?_SCORM</b>', '2022-11-09 16:38:39', 'leido', 'no'),
(325, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=150', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M00_S3_Estrategias de aprendizaje_HTML</b>', '2022-11-09 17:23:41', 'leido', 'no'),
(326, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=151', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M00_S3_¿El plagio, falta grave?_HTML</b>', '2022-11-09 17:25:12', 'leido', 'no'),
(327, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=152', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M00_S3_Foros de apoyo_HTML</b>', '2022-11-09 17:26:42', 'leido', 'no'),
(328, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=149', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-10 14:22:33', 'pendiente', 'si'),
(329, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=148', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-10 14:43:02', 'pendiente', 'si'),
(330, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=122', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M02_S1_Realización personal_SCORM</b> y fuiste asignado a ella', '2022-11-15 17:06:42', 'pendiente', 'si'),
(331, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=123', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M02_S1_Oralidad_HTML</b> y fuiste asignado a ella', '2022-11-15 17:07:33', 'pendiente', 'si'),
(332, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=124', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M02_S1_Para saber más: Ortografía_HTML</b> y fuiste asignado a ella', '2022-11-15 17:07:52', 'pendiente', 'si'),
(333, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=137', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M01_S1_Para saber más: El porqué de las TIC en educación_HTML</b> y fuiste asignado a ella', '2022-11-15 17:08:38', 'pendiente', 'si'),
(334, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=138', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M01_S2_Comportamiento digital_HTML</b> y fuiste asignado a ella', '2022-11-15 17:09:24', 'pendiente', 'si'),
(335, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=150', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M00_S3_Estrategias de aprendizaje_HTML</b> y fuiste asignado a ella', '2022-11-15 17:10:33', 'pendiente', 'si'),
(336, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=151', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M00_S3_¿El plagio, falta grave?_HTML</b> y fuiste asignado a ella', '2022-11-15 17:11:09', 'pendiente', 'si');
INSERT INTO `notificaciones` (`ID`, `ID_USUARIO`, `ENLACE`, `GRUPO`, `NOTIFICACION_CONTENIDO`, `FECHA_CREACION`, `ESTADO`, `LEIDO`) VALUES
(337, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=152', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M00_S3_Foros de apoyo_HTML</b> y fuiste asignado a ella', '2022-11-15 17:11:26', 'pendiente', 'si'),
(338, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=136', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M01_S1_Las TIC en la sociedad_SCORM</b> y fuiste asignado a ella', '2022-11-15 17:12:19', 'pendiente', 'si'),
(339, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=62', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 13:32:08', 'pendiente', 'si'),
(340, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=75', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 13:36:35', 'pendiente', 'si'),
(341, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=61', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 13:38:45', 'pendiente', 'si'),
(342, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=89', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 14:19:45', 'pendiente', 'si'),
(343, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=76', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 14:22:46', 'pendiente', 'si'),
(344, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=90', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 14:38:40', 'pendiente', 'si'),
(345, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=103', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 14:56:59', 'pendiente', 'si'),
(346, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=118', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 14:58:20', 'pendiente', 'si'),
(347, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=117', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 16:56:34', 'pendiente', 'si'),
(348, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=104', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 17:27:54', 'pendiente', 'si'),
(349, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=131', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 17:35:00', 'leido', 'si'),
(350, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 17:58:23', 'leido', 'si'),
(351, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=145', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 18:00:10', 'leido', 'si'),
(352, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=146', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-17 18:01:40', 'leido', 'si'),
(353, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=27', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S2_El Porfiriato_HTML</b> y fuiste asignado a ella', '2022-11-17 18:02:11', 'leido', 'si'),
(354, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=28', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S2_Presidencia de Francisco I. Madero_HTML</b> y fuiste asignado a ella', '2022-11-17 18:02:33', 'leido', 'si'),
(356, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=46', 'tareas', 'Se ha actualizado la tarea <b>Nueva tarea de ejemplo</b> y fuiste asignado a ella', '2022-11-17 18:02:52', 'leido', 'si'),
(357, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=149', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-30 11:47:14', 'pendiente', 'si'),
(358, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=149', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M00_S3_Criterios de evaluación_SCORM</b> y fuiste asignado a ella', '2022-11-30 11:47:32', 'pendiente', 'si'),
(359, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=136', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-30 12:43:52', 'leido', 'no'),
(360, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=148', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-11-30 12:56:53', 'pendiente', 'no'),
(361, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=136', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M01_S1_Las TIC en la sociedad_SCORM</b> y fuiste asignado a ella', '2022-11-30 13:58:26', 'pendiente', 'si'),
(362, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=136', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M01_S1_Las TIC en la sociedad_SCORM</b> y fuiste asignado a ella', '2022-11-30 13:59:31', 'pendiente', 'si'),
(363, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=128', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-01 13:29:30', 'pendiente', 'si'),
(364, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=129', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-01 13:40:07', 'pendiente', 'si'),
(365, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=130', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-01 13:41:44', 'pendiente', 'si'),
(366, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=142', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-01 13:43:44', 'pendiente', 'si'),
(367, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=144', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-01 13:45:47', 'pendiente', 'si'),
(368, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=143', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-01 13:48:28', 'pendiente', 'si'),
(369, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=149', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-02 14:13:42', 'pendiente', 'si'),
(370, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=149', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-02 14:16:04', 'pendiente', 'si'),
(371, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=136', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-02 14:49:14', 'pendiente', 'si'),
(372, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=59', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:05:26', 'pendiente', 'si'),
(373, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=59', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:05:27', 'pendiente', 'si'),
(374, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=63', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:05:59', 'pendiente', 'si'),
(375, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=60', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:06:44', 'pendiente', 'si'),
(376, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=62', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:07:20', 'pendiente', 'si'),
(377, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=66', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:07:41', 'pendiente', 'si'),
(378, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=68', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:08:04', 'pendiente', 'si'),
(379, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=72', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:08:37', 'pendiente', 'si'),
(380, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=79', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:09:01', 'pendiente', 'si'),
(381, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=74', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:09:43', 'pendiente', 'si'),
(382, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=74', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:09:43', 'pendiente', 'si'),
(383, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=80', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:19:44', 'pendiente', 'si'),
(384, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=81', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:20:05', 'pendiente', 'si'),
(385, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=87', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:20:40', 'pendiente', 'si'),
(386, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=86', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:20:57', 'pendiente', 'si'),
(387, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=90', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:21:14', 'pendiente', 'si'),
(388, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=94', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:21:37', 'pendiente', 'si'),
(389, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=96', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:22:16', 'leido', 'si'),
(390, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=92', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:22:35', 'leido', 'si'),
(391, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=92', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:22:39', 'leido', 'si'),
(392, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=105', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:23:13', 'leido', 'si'),
(393, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=100', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:23:44', 'leido', 'si'),
(394, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=107', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:24:03', 'leido', 'si'),
(395, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=106', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:24:31', 'leido', 'si'),
(396, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=108', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:24:49', 'leido', 'si'),
(397, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=115', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:25:12', 'leido', 'si'),
(398, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=116', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:25:45', 'leido', 'si'),
(399, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=119', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:26:05', 'leido', 'si'),
(400, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=120', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 16:26:39', 'leido', 'si'),
(401, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=149', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M00_S3_Criterios de evaluación_SCORM</b> y fuiste asignado a ella', '2022-12-06 16:41:00', 'pendiente', 'si'),
(402, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=144', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 17:42:03', 'leido', 'si'),
(404, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=150', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 17:43:19', 'leido', 'si'),
(405, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=151', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 17:43:36', 'leido', 'si'),
(406, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=152', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 17:43:59', 'leido', 'si'),
(407, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=143', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 17:44:12', 'leido', 'si'),
(410, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=59', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M06_S1_Question Words_HTML</b> y fuiste asignado a ella', '2022-12-06 17:48:14', 'pendiente', 'si'),
(411, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=74', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M05_S2_Investigación documental_HTML</b> y fuiste asignado a ella', '2022-12-06 17:49:33', 'leido', 'si'),
(412, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=88', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 18:06:06', 'leido', 'si'),
(413, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=93', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 18:06:43', 'leido', 'si'),
(414, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=76', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 18:08:11', 'leido', 'si'),
(415, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=78', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-06 18:08:39', 'leido', 'si'),
(420, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=131', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-13 14:29:49', 'pendiente', 'no'),
(421, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-13 14:39:08', 'leido', 'no'),
(422, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=145', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-13 14:51:11', 'pendiente', 'si'),
(423, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=146', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-13 14:56:23', 'leido', 'no'),
(424, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=146', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-13 15:04:55', 'leido', 'si'),
(425, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=146', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-13 17:45:03', 'pendiente', 'no'),
(426, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=150', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-13 18:30:54', 'pendiente', 'no'),
(427, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=151', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-14 06:57:18', 'pendiente', 'no'),
(428, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=152', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-14 07:16:32', 'pendiente', 'no'),
(429, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=151', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M00_S3_¿El plagio, falta grave?_HTML</b> y fuiste asignado a ella', '2022-12-14 11:09:04', 'pendiente', 'si'),
(430, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=62', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-14 11:24:59', 'pendiente', 'si'),
(431, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=150', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-14 13:23:24', 'leido', 'no'),
(432, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=152', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-14 13:32:40', 'leido', 'no'),
(433, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=66', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-16 11:40:26', 'pendiente', 'si'),
(434, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M02_S3_¿Qué es la reseña?_HTML</b> y fuiste asignado a ella', '2022-12-16 13:38:24', 'pendiente', 'si'),
(435, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=68', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-16 14:55:51', 'pendiente', 'no'),
(436, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=117', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-16 17:11:04', 'pendiente', 'no'),
(437, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=118', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-16 17:24:22', 'pendiente', 'no'),
(438, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=104', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-16 17:39:22', 'pendiente', 'no'),
(439, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=80', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-19 12:52:48', 'pendiente', 'no'),
(440, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=81', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-19 13:01:47', 'pendiente', 'no'),
(441, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=94', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-19 15:05:06', 'pendiente', 'no'),
(442, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=103', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-19 17:15:08', 'pendiente', 'no'),
(443, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=110', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-19 17:26:23', 'pendiente', 'no'),
(444, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=109', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-19 17:35:05', 'pendiente', 'no'),
(445, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=89', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-19 17:45:25', 'pendiente', 'no'),
(446, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=95', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 16:51:45', 'pendiente', 'no'),
(447, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=95', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 16:53:16', 'pendiente', 'no'),
(448, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=61', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 17:19:52', 'pendiente', 'no'),
(449, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=75', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 17:43:47', 'pendiente', 'no'),
(450, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=82', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 17:54:49', 'pendiente', 'no'),
(451, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=67', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 18:05:33', 'pendiente', 'no'),
(452, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=138', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 18:19:24', 'pendiente', 'no'),
(453, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=137', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 18:24:37', 'pendiente', 'no'),
(454, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=137', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 18:27:20', 'pendiente', 'no'),
(455, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=124', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 18:37:05', 'pendiente', 'si'),
(456, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=124', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 18:37:29', 'pendiente', 'no'),
(457, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=123', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 18:46:02', 'pendiente', 'no'),
(458, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=122', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 19:04:42', 'pendiente', 'no'),
(459, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=96', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-20 22:36:49', 'pendiente', 'no'),
(460, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=108', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-23 00:40:59', 'pendiente', 'no'),
(461, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=76', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-23 01:11:04', 'pendiente', 'no'),
(462, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=90', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-23 01:31:21', 'pendiente', 'no'),
(463, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=96', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-23 01:39:15', 'pendiente', 'no'),
(464, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=118', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-26 20:46:36', 'leido', 'no'),
(465, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=117', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-26 20:56:03', 'leido', 'no'),
(466, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=108', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-26 21:00:16', 'leido', 'no'),
(467, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=109', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-26 21:06:12', 'leido', 'no'),
(468, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=110', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-26 21:14:35', 'leido', 'no'),
(469, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=103', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-26 21:19:30', 'leido', 'no'),
(470, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=104', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-26 21:24:56', 'leido', 'no'),
(471, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=96', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-26 21:58:20', 'leido', 'no'),
(472, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=90', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-26 22:03:09', 'leido', 'no'),
(473, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=95', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-26 22:08:32', 'leido', 'no'),
(474, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=89', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-26 22:12:54', 'leido', 'no'),
(475, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=94', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-26 23:00:09', 'leido', 'no'),
(476, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=76', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 12:43:07', 'leido', 'no'),
(477, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=67', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 12:51:45', 'leido', 'no'),
(478, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=82', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 13:34:29', 'leido', 'no'),
(479, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=75', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 13:40:31', 'leido', 'no'),
(480, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=61', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 13:46:45', 'leido', 'no'),
(481, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=81', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 13:50:37', 'leido', 'no'),
(482, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=80', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 13:55:30', 'leido', 'no'),
(483, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=68', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 14:08:50', 'leido', 'no'),
(484, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=122', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 14:15:47', 'leido', 'no'),
(485, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=123', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 14:29:31', 'leido', 'no'),
(486, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=124', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 14:56:56', 'leido', 'no'),
(487, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=137', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 14:58:22', 'leido', 'no'),
(488, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=138', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 15:00:45', 'leido', 'no'),
(489, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=146', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 15:03:49', 'leido', 'no'),
(490, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=131', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 15:06:24', 'leido', 'no'),
(491, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=151', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 15:10:36', 'leido', 'no'),
(492, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=145', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 15:13:00', 'leido', 'no'),
(493, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=136', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 15:16:40', 'leido', 'no'),
(494, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 15:20:44', 'leido', 'no'),
(495, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=62', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 15:29:13', 'leido', 'no'),
(496, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=66', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-27 15:35:24', 'leido', 'no'),
(499, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=66', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M06_S3_Can, Can\'t_SCORM</b> y fuiste asignado a ella', '2022-12-28 00:45:33', 'pendiente', 'no'),
(500, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=66', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-28 00:46:54', 'pendiente', 'no'),
(501, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=108', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-28 00:55:06', 'pendiente', 'no'),
(502, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=136', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-28 23:42:50', 'pendiente', 'no'),
(503, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=151', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-28 23:46:53', 'pendiente', 'no'),
(504, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=138', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-28 23:57:44', 'pendiente', 'no'),
(505, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=137', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 00:33:47', 'pendiente', 'no'),
(506, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=124', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 00:40:00', 'pendiente', 'no'),
(507, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=123', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 00:45:51', 'pendiente', 'no'),
(508, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=122', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 00:58:46', 'pendiente', 'no'),
(509, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=67', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 01:22:45', 'pendiente', 'no'),
(510, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=82', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 01:32:33', 'pendiente', 'no'),
(511, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=81', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 01:37:06', 'pendiente', 'no'),
(513, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=68', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 01:52:43', 'pendiente', 'no'),
(514, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=94', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 02:03:29', 'pendiente', 'no'),
(515, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=95', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 02:09:49', 'pendiente', 'no'),
(516, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=96', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 02:15:52', 'pendiente', 'no'),
(517, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=110', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 02:20:09', 'pendiente', 'no'),
(518, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=109', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-29 02:24:49', 'pendiente', 'no'),
(519, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 11:13:11', 'leido', 'no'),
(520, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 11:13:11', 'pendiente', 'no'),
(521, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 11:27:04', 'pendiente', 'si'),
(522, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 11:27:05', 'pendiente', 'no'),
(523, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 13:49:02', 'pendiente', 'si'),
(524, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 13:49:02', 'pendiente', 'no'),
(525, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 14:18:42', 'pendiente', 'no'),
(526, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=62', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 15:55:14', 'pendiente', 'si'),
(527, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=61', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 15:57:06', 'pendiente', 'no'),
(528, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=75', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 15:58:26', 'pendiente', 'no'),
(529, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=76', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 15:59:44', 'pendiente', 'si'),
(530, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=89', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 16:15:39', 'pendiente', 'no'),
(531, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=90', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 16:28:28', 'pendiente', 'si'),
(532, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=145', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 16:35:06', 'pendiente', 'si'),
(533, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=76', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 16:46:02', 'pendiente', 'si'),
(534, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=104', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 16:53:57', 'pendiente', 'si'),
(535, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 17:00:47', 'pendiente', 'no'),
(536, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 17:01:02', 'leido', 'no'),
(537, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=118', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 17:05:37', 'pendiente', 'si'),
(538, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=117', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 17:18:02', 'pendiente', 'no'),
(539, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=103', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 17:37:40', 'pendiente', 'no'),
(540, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=132', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2022-12-30 18:03:40', 'pendiente', 'no'),
(541, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=143', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-02 09:22:23', 'leido', 'si'),
(542, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=144', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-02 09:35:41', 'pendiente', 'no'),
(543, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=143', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-02 11:13:23', 'pendiente', 'si'),
(544, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=128', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-02 11:18:58', 'pendiente', 'si'),
(545, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=129', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-02 11:32:29', 'pendiente', 'no'),
(546, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=130', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-02 17:28:50', 'pendiente', 'si'),
(547, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=60', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-02 17:51:24', 'pendiente', 'si'),
(548, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=143', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-03 14:04:38', 'pendiente', 'si'),
(549, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=59', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-03 17:15:42', 'pendiente', 'no'),
(550, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=119', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-03 17:46:25', 'pendiente', 'no'),
(551, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=120', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-04 11:58:50', 'pendiente', 'si'),
(552, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=63', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-04 14:35:49', 'pendiente', 'no'),
(553, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=72', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-05 10:48:02', 'pendiente', 'si'),
(554, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=79', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-05 11:27:03', 'pendiente', 'no'),
(555, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=87', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-05 13:02:33', 'pendiente', 'no'),
(556, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=86', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-05 13:41:26', 'pendiente', 'si'),
(557, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=74', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-05 14:00:06', 'pendiente', 'si'),
(558, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=88', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-05 17:29:06', 'pendiente', 'si'),
(559, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=88', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-05 17:32:59', 'pendiente', 'si'),
(560, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=78', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-05 17:39:20', 'pendiente', 'si'),
(561, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=88', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M04_S2_Literatura en México_HTML</b> y fuiste asignado a ella', '2023-01-05 17:42:54', 'pendiente', 'si'),
(562, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=74', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M05_S2_Investigación documental_HTML</b> y fuiste asignado a ella', '2023-01-05 17:43:52', 'pendiente', 'si'),
(563, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=149', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M00_S3_Criterios de evaluación_SCORM</b> y fuiste asignado a ella', '2023-01-06 11:23:49', 'pendiente', 'si'),
(564, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=92', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-06 11:44:47', 'pendiente', 'si'),
(565, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=100', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-06 12:18:57', 'pendiente', 'si'),
(566, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=93', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-06 12:26:35', 'pendiente', 'no'),
(568, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=144', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-06 13:26:00', 'pendiente', 'si'),
(569, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=129', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-06 13:30:23', 'pendiente', 'si'),
(571, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=87', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-06 13:41:06', 'pendiente', 'si'),
(574, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=59', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-06 13:59:51', 'pendiente', 'si'),
(576, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=142', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-06 14:09:15', 'pendiente', 'si'),
(577, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=142', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-06 14:09:15', 'pendiente', 'no'),
(578, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=121', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-09 09:32:59', 'pendiente', 'no'),
(579, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=57', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-09 12:04:24', 'pendiente', 'no'),
(581, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=142', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-09 14:02:41', 'pendiente', 'si'),
(582, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=57', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-09 14:30:38', 'pendiente', 'si'),
(583, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=143', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-09 14:50:55', 'pendiente', 'si'),
(585, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=130', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-09 14:56:09', 'pendiente', 'si'),
(586, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=128', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-09 14:57:35', 'pendiente', 'si'),
(588, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=100', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-09 15:01:21', 'pendiente', 'si'),
(590, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=88', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-09 18:01:33', 'pendiente', 'si');
INSERT INTO `notificaciones` (`ID`, `ID_USUARIO`, `ENLACE`, `GRUPO`, `NOTIFICACION_CONTENIDO`, `FECHA_CREACION`, `ESTADO`, `LEIDO`) VALUES
(591, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=136', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M01_S1_Las TIC en la sociedad_SCORM</b> y fuiste asignado a ella', '2023-01-09 18:02:48', 'pendiente', 'no'),
(592, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=86', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-09 18:07:49', 'pendiente', 'si'),
(594, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=74', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-10 10:54:20', 'pendiente', 'si'),
(595, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=72', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-10 10:56:28', 'pendiente', 'si'),
(596, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=60', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-10 10:59:31', 'pendiente', 'si'),
(597, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=114', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-10 13:32:59', 'pendiente', 'no'),
(598, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=73', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-10 14:48:58', 'pendiente', 'no'),
(600, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=64', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-10 16:10:29', 'pendiente', 'no'),
(601, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=65', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-10 16:28:09', 'pendiente', 'no'),
(602, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=77', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-10 16:50:36', 'pendiente', 'no'),
(603, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=101', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-10 17:10:21', 'pendiente', 'no'),
(604, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=102', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-10 17:35:28', 'pendiente', 'no'),
(605, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=91', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-10 18:18:52', 'pendiente', 'no'),
(606, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=58', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-11 09:37:42', 'pendiente', 'no'),
(607, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=58', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-11 09:59:33', 'pendiente', 'si'),
(608, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=114', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-11 10:01:41', 'pendiente', 'si'),
(610, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=102', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-11 10:06:36', 'pendiente', 'si'),
(611, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=101', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-11 10:08:35', 'pendiente', 'si'),
(615, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=73', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-11 10:42:55', 'pendiente', 'si'),
(616, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=107', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-12 16:37:16', 'pendiente', 'no'),
(617, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=60', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-13 12:52:52', 'pendiente', 'no'),
(618, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=57', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-13 12:54:26', 'pendiente', 'no'),
(619, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=58', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-13 12:55:58', 'pendiente', 'no'),
(620, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=59', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-13 12:57:08', 'pendiente', 'no'),
(621, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=74', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-13 13:23:12', 'pendiente', 'no'),
(622, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=72', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-13 13:26:13', 'pendiente', 'no'),
(623, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=73', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-13 13:27:29', 'pendiente', 'no'),
(624, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=86', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-13 14:15:56', 'pendiente', 'no'),
(625, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=88', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-13 16:22:34', 'pendiente', 'no'),
(626, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=87', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-13 16:23:36', 'pendiente', 'no'),
(627, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=106', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-13 17:17:23', 'pendiente', 'no'),
(628, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=115', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-13 17:27:08', 'pendiente', 'no'),
(629, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=100', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-16 11:34:28', 'pendiente', 'no'),
(630, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=101', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-16 11:36:49', 'pendiente', 'no'),
(631, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=102', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-16 11:38:30', 'pendiente', 'no'),
(632, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=114', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-16 11:39:49', 'pendiente', 'no'),
(633, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=128', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-16 11:53:59', 'pendiente', 'no'),
(634, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=129', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-16 12:06:28', 'pendiente', 'no'),
(635, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=130', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-16 12:12:53', 'pendiente', 'no'),
(636, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=142', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-16 12:17:58', 'pendiente', 'no'),
(637, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=143', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-16 12:20:05', 'pendiente', 'no'),
(638, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=116', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-17 15:07:48', 'pendiente', 'no'),
(639, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=15', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M09_S1_Áreas culturales_SCORM</b> y fuiste asignado a ella', '2023-01-19 10:24:56', 'pendiente', 'si'),
(642, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=15', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-19 10:25:50', 'pendiente', 'si'),
(643, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=114', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-19 12:33:20', 'pendiente', 'si'),
(644, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=72', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-19 12:35:26', 'pendiente', 'si'),
(645, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=59', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-19 16:29:10', 'pendiente', 'si'),
(646, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=58', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-19 16:30:30', 'pendiente', 'si'),
(647, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=57', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-19 16:37:56', 'pendiente', 'si'),
(648, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=60', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-19 16:40:13', 'pendiente', 'si'),
(649, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=142', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-19 16:41:55', 'pendiente', 'si'),
(650, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=57', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-20 17:32:39', 'pendiente', 'no'),
(651, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=58', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-20 17:34:05', 'pendiente', 'no'),
(652, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=59', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-20 17:35:43', 'pendiente', 'no'),
(653, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=60', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-20 17:37:15', 'pendiente', 'no'),
(654, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=72', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-20 17:39:19', 'pendiente', 'no'),
(655, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=128', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 12:06:39', 'pendiente', 'si'),
(656, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=129', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 12:08:00', 'pendiente', 'si'),
(657, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=130', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 12:09:20', 'pendiente', 'si'),
(658, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=116', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 13:10:45', 'pendiente', 'si'),
(659, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=115', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 13:12:14', 'pendiente', 'si'),
(662, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=102', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 13:18:28', 'pendiente', 'si'),
(663, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=101', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 13:29:34', 'pendiente', 'si'),
(664, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=100', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 13:41:40', 'pendiente', 'si'),
(665, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=88', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 13:47:39', 'pendiente', 'si'),
(666, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=87', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 13:50:52', 'pendiente', 'si'),
(667, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=74', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 13:53:16', 'pendiente', 'si'),
(668, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=73', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 13:55:32', 'pendiente', 'si'),
(674, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=157', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S1_Life stages_HTML</b>', '2023-01-30 14:32:03', 'pendiente', 'si'),
(675, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=158', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S1_Time expressions_SCORM</b>', '2023-01-30 14:41:01', 'pendiente', 'si'),
(676, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=159', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S1_To practice further_HTML</b>', '2023-01-30 14:43:18', 'pendiente', 'si'),
(677, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=160', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S1_To learn further_HTML</b>', '2023-01-30 14:53:08', 'pendiente', 'si'),
(678, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=161', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S1_Prepositions of time_HTML</b>', '2023-01-30 17:28:09', 'pendiente', 'si'),
(679, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=162', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S2_Memories_HTML</b>', '2023-01-30 17:29:54', 'pendiente', 'si'),
(686, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=169', 'tareas', 'Se te ha asignado la tarea <b>01S.04_M07_S3_To learn further_HTML</b>', '2023-01-30 18:23:10', 'pendiente', 'si'),
(688, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=157', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:27:23', 'pendiente', 'si'),
(689, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=161', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:28:39', 'pendiente', 'si'),
(690, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=158', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:30:24', 'pendiente', 'si'),
(691, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=160', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:31:56', 'pendiente', 'si'),
(692, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=159', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:33:24', 'pendiente', 'si'),
(693, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=154', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:34:39', 'pendiente', 'si'),
(694, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=162', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:36:25', 'pendiente', 'si'),
(695, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=165', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:39:20', 'pendiente', 'si'),
(696, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=163', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:40:35', 'pendiente', 'si'),
(697, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=164', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:41:41', 'pendiente', 'si'),
(698, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=166', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:42:43', 'pendiente', 'si'),
(699, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=169', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:43:55', 'leido', 'si'),
(700, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=170', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:45:16', 'pendiente', 'si'),
(701, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=167', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:46:22', 'pendiente', 'si'),
(702, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=168', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-30 18:47:33', 'pendiente', 'si'),
(703, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=157', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S1_Life stages_HTML</b> y fuiste asignado a ella', '2023-01-30 18:47:51', 'leido', 'si'),
(704, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=158', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S1_Time expressions_SCORM</b> y fuiste asignado a ella', '2023-01-30 18:48:09', 'pendiente', 'si'),
(705, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=160', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S1_To learn further_HTML</b> y fuiste asignado a ella', '2023-01-30 18:48:27', 'pendiente', 'si'),
(706, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=161', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M07_S1_Prepositions of time_HTML</b> y fuiste asignado a ella', '2023-01-30 18:48:39', 'pendiente', 'si'),
(707, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se te ha asignado la tarea <b>09C.04_Abril 07 - Día Mundial de la Salud</b>', '2023-01-31 16:08:26', 'leido', 'si'),
(708, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se te ha asignado la tarea <b>09C.04 Abril 19 Muerte de Octavio Paz</b>', '2023-01-31 16:08:52', 'leido', 'si'),
(709, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se te ha asignado la tarea <b>09C.04_Abril 22 - Día Internacional de la Madre Tierra</b>', '2023-01-31 16:09:18', 'leido', 'si'),
(710, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se te ha asignado la tarea <b>09C.04_Abril 30 - Día del niño</b>', '2023-01-31 16:09:38', 'leido', 'si'),
(711, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 30 - Día del niño</b> y fuiste asignado a ella', '2023-01-31 16:10:17', 'leido', 'si'),
(712, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 22 - Día Internacional de la Madre Tierra</b> y fuiste asignado a ella', '2023-01-31 16:10:43', 'leido', 'si'),
(713, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se ha actualizado la tarea <b>09C.04 Abril 19 Muerte de Octavio Paz</b> y fuiste asignado a ella', '2023-01-31 16:10:57', 'leido', 'si'),
(714, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 07 - Día Mundial de la Salud</b> y fuiste asignado a ella', '2023-01-31 16:11:16', 'leido', 'si'),
(715, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 30 - Día del niño</b> y fuiste asignado a ella', '2023-01-31 16:29:54', 'leido', 'si'),
(716, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 30 - Día del niño</b> y fuiste asignado a ella', '2023-01-31 16:53:59', 'leido', 'si'),
(717, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 30 - Día del niño</b> y fuiste asignado a ella', '2023-01-31 16:57:30', 'pendiente', 'si'),
(718, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 30 - Día del niño</b> y fuiste asignado a ella', '2023-01-31 17:01:05', 'leido', 'si'),
(719, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-31 17:02:10', 'pendiente', 'si'),
(720, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 07 - Día Mundial de la Salud</b> y fuiste asignado a ella', '2023-01-31 17:07:14', 'leido', 'si'),
(721, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-31 17:07:58', 'pendiente', 'si'),
(722, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se ha actualizado la tarea <b>09C.04 Abril 19 Muerte de Octavio Paz</b> y fuiste asignado a ella', '2023-01-31 17:10:34', 'leido', 'si'),
(723, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-31 17:11:16', 'leido', 'si'),
(724, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 22 - Día Internacional de la Madre Tierra</b> y fuiste asignado a ella', '2023-01-31 17:14:47', 'leido', 'si'),
(725, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-31 17:15:27', 'pendiente', 'si'),
(726, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=157', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-01-31 19:51:41', 'pendiente', 'no'),
(727, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-01 18:15:46', 'leido', 'si'),
(728, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-01 18:25:31', 'leido', 'si'),
(729, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-01 18:45:00', 'leido', 'si'),
(730, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-02 09:27:18', 'leido', 'si'),
(731, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-02 09:27:19', 'pendiente', 'no'),
(732, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-02 09:42:12', 'pendiente', 'si'),
(733, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-02 09:42:13', 'pendiente', 'no'),
(734, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=159', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-02 17:31:44', 'pendiente', 'no'),
(735, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-02 17:33:58', 'leido', 'si'),
(736, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=163', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-03 11:38:27', 'pendiente', 'no'),
(737, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-03 11:46:43', 'pendiente', 'si'),
(738, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-03 11:46:43', 'pendiente', 'no'),
(739, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=169', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-03 12:02:44', 'pendiente', 'no'),
(740, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=154', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-07 11:40:56', 'pendiente', 'no'),
(741, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=170', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-09 13:44:15', 'pendiente', 'no'),
(742, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=161', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-09 14:09:38', 'pendiente', 'no'),
(744, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=175', 'tareas', 'Se ha actualizado la tarea <b>Propuesta RED-Moodle 4</b> y fuiste asignado a ella', '2023-02-09 16:52:19', 'pendiente', 'si'),
(745, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=176', 'tareas', 'Se te ha asignado la tarea <b>Tarea uno</b>', '2023-02-09 17:22:48', 'leido', 'si'),
(746, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=177', 'tareas', 'Se te ha asignado la tarea <b>Estilos para Plantillas de RED-WEB </b>', '2023-02-09 17:29:47', 'pendiente', 'si'),
(747, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=177', 'tareas', 'Se ha actualizado la tarea <b>Estilos para Plantillas de RED-WEB </b> y fuiste asignado a ella', '2023-02-09 17:30:16', 'pendiente', 'si'),
(748, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=162', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-10 10:35:43', 'pendiente', 'no'),
(749, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=165', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-10 12:20:18', 'pendiente', 'no'),
(750, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 07 - Día Mundial de la Salud</b> y fuiste asignado a ella', '2023-02-10 12:28:51', 'leido', 'si'),
(751, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 07 - Día Mundial de la Salud</b> y fuiste asignado a ella', '2023-02-10 12:28:52', 'pendiente', 'no'),
(752, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=175', 'tareas', 'Se ha actualizado la tarea <b>Propuesta RED-Moodle 4</b> y fuiste asignado a ella', '2023-02-10 12:29:12', 'pendiente', 'si'),
(753, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se ha actualizado la tarea <b>09C.04 Abril 19 Muerte de Octavio Paz</b> y fuiste asignado a ella', '2023-02-10 12:29:28', 'pendiente', 'si'),
(754, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se ha actualizado la tarea <b>09C.04 Abril 19 Muerte de Octavio Paz</b> y fuiste asignado a ella', '2023-02-10 12:29:29', 'pendiente', 'no'),
(755, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 22 - Día Internacional de la Madre Tierra</b> y fuiste asignado a ella', '2023-02-10 12:30:17', 'leido', 'si'),
(756, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 30 - Día del niño</b> y fuiste asignado a ella', '2023-02-10 12:30:41', 'pendiente', 'si'),
(757, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 30 - Día del niño</b> y fuiste asignado a ella', '2023-02-10 12:30:42', 'pendiente', 'no'),
(758, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 30 - Día del niño</b> y fuiste asignado a ella', '2023-02-10 12:31:23', 'pendiente', 'si'),
(759, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 30 - Día del niño</b> y fuiste asignado a ella', '2023-02-10 12:31:23', 'pendiente', 'no'),
(760, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=164', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-10 12:52:11', 'pendiente', 'no'),
(761, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=178', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Elementos_Generales_Styleboard_M1</b>', '2023-02-14 11:19:18', 'leido', 'si'),
(762, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=177', 'tareas', 'Se ha actualizado la tarea <b>Estilos para Plantillas de RED-WEB </b> y fuiste asignado a ella', '2023-02-14 11:19:55', 'pendiente', 'si'),
(763, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:20', 'pendiente', 'si'),
(765, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:23', 'pendiente', 'no'),
(766, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:24', 'pendiente', 'si'),
(767, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:25', 'pendiente', 'si'),
(769, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:26', 'pendiente', 'si'),
(770, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:26', 'pendiente', 'si'),
(771, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:26', 'leido', 'si'),
(772, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:26', 'leido', 'si'),
(773, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:26', 'pendiente', 'no'),
(774, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:27', 'pendiente', 'si'),
(775, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:27', 'pendiente', 'si'),
(776, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:27', 'pendiente', 'si'),
(777, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:27', 'leido', 'si'),
(778, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:28:27', 'leido', 'si'),
(779, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:32:17', 'pendiente', 'si'),
(781, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:32:19', 'leido', 'no'),
(782, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:32:20', 'pendiente', 'si'),
(783, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:32:21', 'pendiente', 'si'),
(784, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:32:22', 'pendiente', 'si'),
(785, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:32:23', 'leido', 'si'),
(786, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Moodboards_M1</b>', '2023-02-14 11:32:24', 'leido', 'si'),
(787, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:41', 'pendiente', 'si'),
(789, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:43', 'pendiente', 'no'),
(790, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:44', 'pendiente', 'si'),
(791, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:45', 'pendiente', 'si'),
(792, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:46', 'pendiente', 'si'),
(793, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:47', 'leido', 'si'),
(794, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:47', 'leido', 'si'),
(795, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:47', 'pendiente', 'si'),
(797, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:47', 'leido', 'no'),
(798, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:47', 'pendiente', 'si'),
(799, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:47', 'pendiente', 'si'),
(800, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:48', 'pendiente', 'si'),
(801, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:48', 'leido', 'si'),
(802, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:32:48', 'leido', 'si'),
(803, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:15', 'leido', 'si'),
(805, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:17', 'leido', 'no'),
(806, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:18', 'pendiente', 'si'),
(807, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:19', 'pendiente', 'si'),
(808, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:20', 'pendiente', 'si'),
(809, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:21', 'leido', 'si'),
(810, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:21', 'leido', 'si'),
(811, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:21', 'leido', 'si'),
(813, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:22', 'leido', 'no'),
(814, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:22', 'pendiente', 'si'),
(815, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:22', 'pendiente', 'si'),
(816, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:22', 'pendiente', 'si'),
(817, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:22', 'leido', 'si'),
(818, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 11:33:22', 'leido', 'si'),
(819, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=178', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 13:08:10', 'leido', 'si'),
(820, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 15:07:42', 'leido', 'si'),
(821, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=183', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 15:19:11', 'leido', 'si'),
(822, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=184', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 15:24:46', 'leido', 'si'),
(824, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 17:48:20', 'pendiente', 'no'),
(825, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 17:48:21', 'pendiente', 'si'),
(826, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 17:48:22', 'pendiente', 'si'),
(827, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 17:48:23', 'pendiente', 'si'),
(828, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 17:48:25', 'pendiente', 'si'),
(829, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-14 17:48:27', 'pendiente', 'si'),
(831, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:56:42', 'pendiente', 'no'),
(832, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:56:44', 'pendiente', 'si'),
(833, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:56:45', 'pendiente', 'si'),
(834, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:56:47', 'pendiente', 'si'),
(835, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:56:48', 'pendiente', 'si'),
(836, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=179', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:56:49', 'pendiente', 'si'),
(837, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:09', 'pendiente', 'si'),
(839, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:11', 'pendiente', 'no'),
(840, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:12', 'pendiente', 'si'),
(841, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:13', 'pendiente', 'si'),
(842, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:15', 'pendiente', 'si'),
(843, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:16', 'leido', 'si'),
(844, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:16', 'pendiente', 'si'),
(845, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:16', 'pendiente', 'si'),
(847, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:16', 'pendiente', 'no'),
(848, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:16', 'pendiente', 'si'),
(849, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:16', 'pendiente', 'si'),
(850, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:16', 'pendiente', 'si'),
(851, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:17', 'pendiente', 'si'),
(852, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:17', 'pendiente', 'si'),
(853, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:17', 'pendiente', 'si'),
(855, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:17', 'pendiente', 'no'),
(856, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:17', 'leido', 'si');
INSERT INTO `notificaciones` (`ID`, `ID_USUARIO`, `ENLACE`, `GRUPO`, `NOTIFICACION_CONTENIDO`, `FECHA_CREACION`, `ESTADO`, `LEIDO`) VALUES
(857, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:17', 'pendiente', 'si'),
(858, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:17', 'pendiente', 'si'),
(859, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:18', 'pendiente', 'si'),
(860, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=180', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:57:18', 'pendiente', 'si'),
(861, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:58:47', 'pendiente', 'si'),
(863, '63e55c9b6b2d98.20695336', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:58:50', 'pendiente', 'no'),
(864, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:58:51', 'pendiente', 'si'),
(865, '63cb27f4c588d8.85302337', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:58:52', 'pendiente', 'si'),
(866, '63cb26f44ff981.59154321', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:58:53', 'leido', 'si'),
(867, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:58:54', 'leido', 'si'),
(868, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=181', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Moodboards_M1</b> y fuiste asignado a ella', '2023-02-15 11:58:54', 'pendiente', 'si'),
(869, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=185', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Cromatica_Modulos_2023</b>', '2023-02-15 17:17:01', 'pendiente', 'si'),
(870, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=185', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Cromatica_Modulos_2023</b> y fuiste asignado a ella', '2023-02-15 17:17:30', 'pendiente', 'si'),
(871, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=185', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Cromatica_Modulos_2023</b> y fuiste asignado a ella', '2023-02-15 17:17:31', 'pendiente', 'si'),
(872, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=185', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Cromatica_Modulo1_2023</b> y fuiste asignado a ella', '2023-02-15 17:32:24', 'leido', 'si'),
(873, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=185', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Cromatica_Modulo1_2023</b> y fuiste asignado a ella', '2023-02-15 17:32:26', 'leido', 'si'),
(875, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=186', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Propuesta_Texturas_M1</b>', '2023-02-15 18:52:48', 'leido', 'si'),
(876, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=186', 'tareas', 'Se te ha asignado la tarea <b>01S.04_Propuesta_Texturas_M1</b>', '2023-02-15 18:52:49', 'pendiente', 'si'),
(877, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-17 18:21:27', 'leido', 'si'),
(878, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-17 18:21:28', 'leido', 'si'),
(879, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=184', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-17 18:51:17', 'leido', 'si'),
(880, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=183', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-17 18:59:52', 'leido', 'si'),
(881, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-17 19:02:00', 'leido', 'si'),
(882, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-17 19:02:06', 'leido', 'si'),
(883, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-20 12:08:20', 'pendiente', 'si'),
(884, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=183', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-20 12:10:12', 'pendiente', 'si'),
(885, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=184', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-20 12:11:13', 'pendiente', 'si'),
(887, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=170', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-20 17:31:11', 'pendiente', 'si'),
(889, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=169', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-20 17:33:54', 'pendiente', 'si'),
(891, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-21 09:33:26', 'pendiente', 'si'),
(892, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=184', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-21 09:34:19', 'pendiente', 'si'),
(893, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=183', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-21 09:35:07', 'pendiente', 'si'),
(894, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-21 10:21:00', 'leido', 'si'),
(895, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-21 10:57:33', 'leido', 'si'),
(896, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=183', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Módulo 5_Expediente digital I</b> y fuiste asignado a ella', '2023-02-21 11:03:18', 'pendiente', 'si'),
(897, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=184', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Módulo 6_Expediente digital II</b> y fuiste asignado a ella', '2023-02-21 11:03:35', 'pendiente', 'si'),
(898, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Módulo 2_Servicios escolares</b> y fuiste asignado a ella', '2023-02-21 11:03:48', 'leido', 'si'),
(899, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-21 13:01:54', 'pendiente', 'si'),
(900, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-21 13:01:55', 'leido', 'si'),
(901, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 07 - Día Mundial de la Salud</b> y fuiste asignado a ella', '2023-02-21 13:25:39', 'pendiente', 'si'),
(902, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 07 - Día Mundial de la Salud</b> y fuiste asignado a ella', '2023-02-21 13:25:40', 'pendiente', 'no'),
(903, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se ha actualizado la tarea <b>09C.04 Abril 19 Muerte de Octavio Paz</b> y fuiste asignado a ella', '2023-02-21 13:26:20', 'pendiente', 'si'),
(904, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se ha actualizado la tarea <b>09C.04 Abril 19 Muerte de Octavio Paz</b> y fuiste asignado a ella', '2023-02-21 13:26:22', 'pendiente', 'no'),
(905, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 22 - Día Internacional de la Madre Tierra</b> y fuiste asignado a ella', '2023-02-21 13:31:38', 'leido', 'si'),
(906, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 30 - Día del niño</b> y fuiste asignado a ella', '2023-02-21 13:32:33', 'pendiente', 'si'),
(907, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 30 - Día del niño</b> y fuiste asignado a ella', '2023-02-21 13:32:34', 'pendiente', 'no'),
(908, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-21 14:14:22', 'leido', 'si'),
(909, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-21 14:18:47', 'pendiente', 'si'),
(910, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-21 14:18:48', 'pendiente', 'no'),
(912, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=186', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Propuesta_Texturas_M1</b> y fuiste asignado a ella', '2023-02-23 12:10:53', 'pendiente', 'si'),
(913, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=186', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Propuesta_Texturas_M1</b> y fuiste asignado a ella', '2023-02-23 12:10:55', 'pendiente', 'si'),
(915, '63cb27964cb2a3.14800375', 'http://148.207.218.173/index.php/tareas/detalles?id=186', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Propuesta_Texturas_M1</b> y fuiste asignado a ella', '2023-02-23 12:10:57', 'leido', 'si'),
(916, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=186', 'tareas', 'Se ha actualizado la tarea <b>01S.04_Propuesta_Texturas_M1</b> y fuiste asignado a ella', '2023-02-23 12:10:58', 'pendiente', 'si'),
(917, '63cb274b243f88.12842329', 'http://148.207.218.173/index.php/tareas/detalles?id=178', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-23 13:54:40', 'pendiente', 'si'),
(918, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=166', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-23 16:45:32', 'pendiente', 'no'),
(919, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=167', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-23 17:15:43', 'pendiente', 'no'),
(920, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=133', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 12:25:16', 'pendiente', 'si'),
(921, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=134', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 12:44:28', 'pendiente', 'si'),
(922, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=183', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 12:47:01', 'leido', 'si'),
(923, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=184', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 12:49:00', 'leido', 'si'),
(924, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=135', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 13:22:19', 'pendiente', 'si'),
(925, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=148', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 13:36:56', 'pendiente', 'no'),
(926, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=183', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 13:45:55', 'pendiente', 'si'),
(927, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=184', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 13:46:56', 'pendiente', 'si'),
(928, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=168', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 15:01:14', 'pendiente', 'no'),
(929, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=147', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 15:59:14', 'pendiente', 'si'),
(930, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=149', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 16:10:35', 'pendiente', 'si'),
(931, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=79', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 16:28:53', 'pendiente', 'no'),
(932, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=158', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 16:52:40', 'pendiente', 'no'),
(933, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=63', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 16:58:33', 'pendiente', 'no'),
(934, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=78', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 17:04:45', 'pendiente', 'si'),
(935, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=160', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 17:05:54', 'pendiente', 'no'),
(936, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=77', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-24 18:09:12', 'pendiente', 'no'),
(937, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=65', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 11:06:12', 'pendiente', 'no'),
(938, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=64', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 11:34:28', 'pendiente', 'no'),
(939, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=93', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 11:53:59', 'pendiente', 'no'),
(940, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=92', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 12:17:30', 'pendiente', 'no'),
(941, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=91', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 12:33:26', 'pendiente', 'no'),
(942, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=105', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 12:41:13', 'pendiente', 'si'),
(943, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=107', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 12:46:19', 'pendiente', 'no'),
(944, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=106', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 12:57:42', 'pendiente', 'no'),
(945, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=119', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 13:30:34', 'pendiente', 'no'),
(946, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=121', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 13:37:29', 'pendiente', 'no'),
(947, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=120', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 13:44:30', 'pendiente', 'no'),
(948, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=120', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 13:44:30', 'pendiente', 'no'),
(949, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 14:06:13', 'pendiente', 'si'),
(950, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 14:13:02', 'pendiente', 'si'),
(951, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 14:14:39', 'pendiente', 'si'),
(952, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 14:17:50', 'pendiente', 'si'),
(954, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=149', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 14:54:12', 'pendiente', 'si'),
(955, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=164', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 14:57:35', 'pendiente', 'no'),
(957, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=170', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 15:16:33', 'pendiente', 'no'),
(958, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=165', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 15:26:25', 'pendiente', 'no'),
(959, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=187', 'tareas', 'Se ha actualizado la tarea <b>Conoce Prepa en Línea-SEP</b> y fuiste asignado a ella', '2023-02-27 17:36:20', 'pendiente', 'si'),
(960, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=187', 'tareas', 'Se ha actualizado la tarea <b>Conoce Prepa en Línea-SEP</b> y fuiste asignado a ella', '2023-02-27 17:37:26', 'pendiente', 'si'),
(961, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=187', 'tareas', 'Se ha actualizado la tarea <b>Conoce Prepa en Línea-SEP</b> y fuiste asignado a ella', '2023-02-27 17:38:59', 'pendiente', 'si'),
(962, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=188', 'tareas', 'Se te ha asignado la tarea <b>Modelo educativo</b>', '2023-02-27 17:43:08', 'pendiente', 'si'),
(963, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=189', 'tareas', 'Se te ha asignado la tarea <b>Requerimientos tecnológicos</b>', '2023-02-27 17:44:22', 'pendiente', 'si'),
(965, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=190', 'tareas', 'Se te ha asignado la tarea <b>Aspirantes</b>', '2023-02-27 17:54:55', 'leido', 'si'),
(966, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 17:55:43', 'leido', 'si'),
(967, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=191', 'tareas', 'Se te ha asignado la tarea <b>Estudiantes</b>', '2023-02-27 17:57:11', 'leido', 'si'),
(968, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=192', 'tareas', 'Se te ha asignado la tarea <b>Asesores virtuales</b>', '2023-02-27 18:01:02', 'leido', 'si'),
(969, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 18:03:02', 'leido', 'si'),
(970, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=193', 'tareas', 'Se te ha asignado la tarea <b>Asesores en la didáctica disciplinar</b>', '2023-02-27 18:05:56', 'leido', 'si'),
(971, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=194', 'tareas', 'Se te ha asignado la tarea <b>Supervisores para el acompañamiento y la mejora educativa (SAME)</b>', '2023-02-27 18:08:55', 'leido', 'si'),
(972, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=195', 'tareas', 'Se te ha asignado la tarea <b>Responsables de Control Escolar</b>', '2023-02-27 18:13:05', 'leido', 'si'),
(973, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 18:14:18', 'leido', 'si'),
(974, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 18:15:27', 'leido', 'si'),
(975, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 18:15:29', 'leido', 'si'),
(976, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 18:16:31', 'pendiente', 'si'),
(977, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 18:19:30', 'leido', 'si'),
(978, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=149', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-27 18:29:55', 'pendiente', 'si'),
(979, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-28 09:38:47', 'pendiente', 'si'),
(980, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=183', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-28 10:12:06', 'leido', 'si'),
(981, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=184', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-28 10:14:15', 'leido', 'si'),
(982, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-28 10:17:18', 'pendiente', 'si'),
(983, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-28 10:18:32', 'leido', 'si'),
(984, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-28 10:53:42', 'pendiente', 'si'),
(985, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=183', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-28 10:54:39', 'leido', 'si'),
(986, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=184', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-28 10:59:28', 'pendiente', 'si'),
(987, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=182', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-28 10:59:51', 'leido', 'si'),
(988, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se te ha asignado la tarea <b>09C.04_Mayo_5_Aniversario_Batalla_Puebla</b>', '2023-02-28 11:09:21', 'pendiente', 'si'),
(989, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se te ha asignado la tarea <b>09C.04_Mayo_10_Día_de_la_Madre</b>', '2023-02-28 11:11:35', 'pendiente', 'si'),
(990, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se te ha asignado la tarea <b>09C.04_Mayo_15_Día_del_Maestro</b>', '2023-02-28 11:14:04', 'pendiente', 'si'),
(991, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se te ha asignado la tarea <b>09C.04_Mayo_17_Día_Mundial_Internet</b>', '2023-02-28 11:16:13', 'pendiente', 'si'),
(992, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se te ha asignado la tarea <b>09C.04_Mayo_21_Día_Mundial_Diversidad_Cultural</b>', '2023-02-28 11:19:41', 'pendiente', 'si'),
(993, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se te ha asignado la tarea <b>09C.04_Mayo_23_Día_del_Estudiante</b>', '2023-02-28 11:21:39', 'pendiente', 'si'),
(994, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=78', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-02-28 13:53:10', 'pendiente', 'si'),
(995, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=195', 'tareas', 'Se ha actualizado la tarea <b>Responsables de Control Escolar</b> y fuiste asignado a ella', '2023-03-01 18:06:29', 'pendiente', 'si'),
(996, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=195', 'tareas', 'Se ha actualizado la tarea <b>Responsables de Control Escolar</b> y fuiste asignado a ella', '2023-03-01 18:06:30', 'pendiente', 'si'),
(997, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=194', 'tareas', 'Se ha actualizado la tarea <b>Supervisores para el acompañamiento y la mejora educativa (SAME)</b> y fuiste asignado a ella', '2023-03-01 18:08:20', 'pendiente', 'si'),
(998, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=194', 'tareas', 'Se ha actualizado la tarea <b>Supervisores para el acompañamiento y la mejora educativa (SAME)</b> y fuiste asignado a ella', '2023-03-01 18:08:22', 'pendiente', 'si'),
(999, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=193', 'tareas', 'Se ha actualizado la tarea <b>Asesores en la didáctica disciplinar</b> y fuiste asignado a ella', '2023-03-01 18:08:50', 'pendiente', 'si'),
(1000, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=193', 'tareas', 'Se ha actualizado la tarea <b>Asesores en la didáctica disciplinar</b> y fuiste asignado a ella', '2023-03-01 18:08:51', 'pendiente', 'si'),
(1001, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=187', 'tareas', 'Se ha actualizado la tarea <b>Conoce Prepa en Línea-SEP</b> y fuiste asignado a ella', '2023-03-01 18:11:19', 'pendiente', 'si'),
(1002, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=187', 'tareas', 'Se ha actualizado la tarea <b>Conoce Prepa en Línea-SEP</b> y fuiste asignado a ella', '2023-03-01 18:11:20', 'pendiente', 'si'),
(1003, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=188', 'tareas', 'Se ha actualizado la tarea <b>Modelo educativo</b> y fuiste asignado a ella', '2023-03-01 18:11:36', 'pendiente', 'si'),
(1004, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=188', 'tareas', 'Se ha actualizado la tarea <b>Modelo educativo</b> y fuiste asignado a ella', '2023-03-01 18:11:37', 'leido', 'si'),
(1005, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=189', 'tareas', 'Se ha actualizado la tarea <b>Requerimientos tecnológicos</b> y fuiste asignado a ella', '2023-03-01 18:11:56', 'pendiente', 'si'),
(1006, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=189', 'tareas', 'Se ha actualizado la tarea <b>Requerimientos tecnológicos</b> y fuiste asignado a ella', '2023-03-01 18:11:57', 'leido', 'si'),
(1007, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=190', 'tareas', 'Se ha actualizado la tarea <b>Aspirantes</b> y fuiste asignado a ella', '2023-03-01 18:12:15', 'pendiente', 'si'),
(1008, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=190', 'tareas', 'Se ha actualizado la tarea <b>Aspirantes</b> y fuiste asignado a ella', '2023-03-01 18:12:16', 'leido', 'si'),
(1009, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=191', 'tareas', 'Se ha actualizado la tarea <b>Estudiantes</b> y fuiste asignado a ella', '2023-03-01 18:12:41', 'pendiente', 'si'),
(1010, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=191', 'tareas', 'Se ha actualizado la tarea <b>Estudiantes</b> y fuiste asignado a ella', '2023-03-01 18:12:43', 'leido', 'si'),
(1011, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=192', 'tareas', 'Se ha actualizado la tarea <b>Asesores virtuales</b> y fuiste asignado a ella', '2023-03-01 18:13:04', 'pendiente', 'si'),
(1012, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=192', 'tareas', 'Se ha actualizado la tarea <b>Asesores virtuales</b> y fuiste asignado a ella', '2023-03-01 18:13:05', 'leido', 'si'),
(1013, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-02 15:58:18', 'leido', 'si'),
(1014, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-02 16:22:03', 'leido', 'si'),
(1015, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-03 12:26:14', 'leido', 'si'),
(1016, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-03 13:54:04', 'leido', 'si'),
(1017, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-06 10:38:14', 'leido', 'si'),
(1018, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-06 13:05:10', 'leido', 'si'),
(1019, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-06 16:59:53', 'leido', 'si'),
(1020, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-07 11:05:32', 'leido', 'si'),
(1021, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=195', 'tareas', 'Se ha actualizado la tarea <b>Responsables de Control Escolar</b> y fuiste asignado a ella', '2023-03-07 12:19:08', 'pendiente', 'si'),
(1022, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=192', 'tareas', 'Se ha actualizado la tarea <b>Asesores virtuales</b> y fuiste asignado a ella', '2023-03-07 12:19:26', 'pendiente', 'si'),
(1023, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=191', 'tareas', 'Se ha actualizado la tarea <b>Estudiantes</b> y fuiste asignado a ella', '2023-03-07 12:19:45', 'pendiente', 'si'),
(1024, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=189', 'tareas', 'Se ha actualizado la tarea <b>Requerimientos tecnológicos</b> y fuiste asignado a ella', '2023-03-07 12:19:59', 'pendiente', 'si'),
(1025, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=188', 'tareas', 'Se ha actualizado la tarea <b>Modelo educativo</b> y fuiste asignado a ella', '2023-03-07 12:20:13', 'leido', 'si'),
(1026, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=190', 'tareas', 'Se ha actualizado la tarea <b>Aspirantes</b> y fuiste asignado a ella', '2023-03-07 15:43:07', 'leido', 'si'),
(1027, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=187', 'tareas', 'Se ha actualizado la tarea <b>Conoce Prepa en Línea-SEP</b> y fuiste asignado a ella', '2023-03-07 15:43:47', 'leido', 'si'),
(1028, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=195', 'tareas', 'Se ha actualizado la tarea <b>Responsables de Control Escolar</b> y fuiste asignado a ella', '2023-03-07 15:47:36', 'pendiente', 'si'),
(1029, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=193', 'tareas', 'Se ha actualizado la tarea <b>Asesores en la didáctica disciplinar</b> y fuiste asignado a ella', '2023-03-07 15:47:53', 'pendiente', 'si'),
(1030, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=194', 'tareas', 'Se ha actualizado la tarea <b>Supervisores para el acompañamiento y la mejora educativa (SAME)</b> y fuiste asignado a ella', '2023-03-07 15:48:13', 'pendiente', 'si'),
(1031, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=147', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-09 12:04:17', 'pendiente', 'no'),
(1032, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=105', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-09 12:33:53', 'pendiente', 'no'),
(1033, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-09 17:45:16', 'leido', 'si'),
(1036, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=133', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-13 12:32:33', 'pendiente', 'no'),
(1037, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-14 12:30:36', 'leido', 'si'),
(1040, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=73', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M05_S1_Reactivar aprendizajes_HTML</b> y fuiste asignado a ella', '2023-03-14 16:28:33', 'pendiente', 'si'),
(1041, '632b45df945454.17181395', 'http://148.207.218.173/index.php/tareas/detalles?id=73', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M05_S1_Reactivar aprendizajes_HTML</b> y fuiste asignado a ella', '2023-03-14 16:30:25', 'leido', 'si'),
(1043, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-14 16:43:40', 'leido', 'si'),
(1044, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás aasignado', '2023-03-14 16:54:00', 'pendiente', 'si'),
(1045, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-14 17:05:52', 'leido', 'si'),
(1046, '5c0653d43d92e7.75019474', 'http://148.207.218.173/index.php/tareas/detalles?id=127', 'tareas', 'Se ha actualizado la tarea <b>01S.04_M02_S2_Organización de un texto_SCORM</b> y fuiste asignado a ella', '2023-03-14 17:34:45', 'pendiente', 'si'),
(1047, '5c0653d43d92e7.75019474', 'http://148.207.218.173/index.php/tareas/detalles?id=127', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-14 17:34:52', 'leido', 'si'),
(1049, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=203', 'tareas', 'Se te ha asignado la tarea <b>Cronograma</b>', '2023-03-15 17:45:02', 'pendiente', 'si'),
(1050, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=203', 'tareas', 'Se te ha asignado la tarea <b>Cronograma</b>', '2023-03-15 17:45:04', 'pendiente', 'si'),
(1052, '63cb28a0adb2f2.67596660', 'http://148.207.218.173/index.php/tareas/detalles?id=203', 'tareas', 'Se ha actualizado la tarea <b>Cronograma</b> y fuiste asignado a ella', '2023-03-15 17:46:31', 'pendiente', 'si'),
(1053, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=203', 'tareas', 'Se ha actualizado la tarea <b>Cronograma</b> y fuiste asignado a ella', '2023-03-15 17:46:32', 'pendiente', 'si'),
(1054, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-17 10:16:32', 'leido', 'si'),
(1056, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 11:13:19', 'leido', 'si'),
(1057, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 11:50:57', 'leido', 'si'),
(1058, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 12:03:14', 'leido', 'si'),
(1059, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 13:07:46', 'leido', 'si'),
(1060, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 13:59:32', 'leido', 'si'),
(1061, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 16:38:50', 'pendiente', 'si'),
(1062, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 16:38:51', 'pendiente', 'no'),
(1063, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 16:46:49', 'leido', 'si'),
(1065, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 17:31:59', 'leido', 'si'),
(1066, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 17:33:23', 'leido', 'si'),
(1067, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 17:51:33', 'leido', 'si'),
(1068, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 18:04:23', 'pendiente', 'si'),
(1069, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 18:04:25', 'pendiente', 'no'),
(1070, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 18:05:45', 'pendiente', 'si'),
(1071, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-21 18:06:54', 'leido', 'si'),
(1072, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-22 11:41:12', 'leido', 'si'),
(1073, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-22 11:45:01', 'leido', 'si'),
(1074, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-22 16:56:07', 'pendiente', 'si'),
(1075, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-22 16:56:08', 'pendiente', 'no'),
(1076, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-22 17:17:51', 'leido', 'si'),
(1077, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-23 09:46:33', 'leido', 'si'),
(1078, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-23 10:06:29', 'pendiente', 'si'),
(1079, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-23 10:06:30', 'pendiente', 'no'),
(1080, '63cb2a6d7f0fb3.85967578', 'http://148.207.218.173/index.php/tareas/detalles?id=204', 'tareas', 'Se te ha asignado la tarea <b>Tarea prueba 1</b>', '2023-03-23 19:43:37', 'pendiente', 'si'),
(1081, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=134', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-24 12:11:20', 'pendiente', 'no'),
(1082, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=135', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-24 12:52:48', 'pendiente', 'no'),
(1083, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 13:58:25', 'leido', 'si'),
(1084, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 14:13:45', 'leido', 'si'),
(1085, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 14:13:47', 'leido', 'si'),
(1086, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 14:24:34', 'pendiente', 'si'),
(1087, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 14:24:35', 'pendiente', 'no'),
(1088, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 14:26:58', 'leido', 'si'),
(1089, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 14:45:17', 'leido', 'si'),
(1090, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 15:12:59', 'leido', 'si'),
(1091, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 15:21:08', 'leido', 'si'),
(1092, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 16:18:02', 'pendiente', 'si'),
(1093, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 16:18:03', 'pendiente', 'no'),
(1094, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 16:30:25', 'pendiente', 'si'),
(1095, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 16:30:26', 'pendiente', 'no'),
(1096, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 16:48:29', 'pendiente', 'si'),
(1097, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 16:48:31', 'pendiente', 'no'),
(1098, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 17:24:50', 'pendiente', 'si'),
(1099, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 17:24:52', 'pendiente', 'no'),
(1100, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 17:35:17', 'leido', 'si'),
(1101, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-27 17:35:18', 'pendiente', 'no'),
(1102, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 14:16:18', 'leido', 'si'),
(1103, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 14:16:19', 'pendiente', 'no'),
(1104, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 14:16:20', 'leido', 'si'),
(1105, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 14:16:22', 'pendiente', 'no');
INSERT INTO `notificaciones` (`ID`, `ID_USUARIO`, `ENLACE`, `GRUPO`, `NOTIFICACION_CONTENIDO`, `FECHA_CREACION`, `ESTADO`, `LEIDO`) VALUES
(1106, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 14:20:11', 'leido', 'si'),
(1107, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 14:20:12', 'pendiente', 'no'),
(1108, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 14:22:57', 'leido', 'si'),
(1109, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 14:22:59', 'pendiente', 'no'),
(1110, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 14:28:23', 'leido', 'si'),
(1111, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 14:28:24', 'pendiente', 'no'),
(1112, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 14:43:38', 'leido', 'si'),
(1113, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 14:45:12', 'leido', 'si'),
(1114, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 16:00:08', 'leido', 'si'),
(1115, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 16:02:50', 'leido', 'si'),
(1116, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 16:07:27', 'pendiente', 'si'),
(1117, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 16:08:32', 'pendiente', 'si'),
(1118, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 16:11:12', 'pendiente', 'si'),
(1119, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 16:13:15', 'pendiente', 'si'),
(1120, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 16:24:30', 'pendiente', 'si'),
(1121, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-29 16:27:16', 'pendiente', 'si'),
(1122, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-30 09:55:01', 'leido', 'si'),
(1123, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-30 09:55:35', 'leido', 'si'),
(1124, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-30 09:56:06', 'leido', 'si'),
(1125, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-30 10:07:28', 'leido', 'si'),
(1126, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-30 10:07:31', 'leido', 'si'),
(1127, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-30 10:17:40', 'leido', 'si'),
(1128, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-30 11:04:56', 'leido', 'si'),
(1129, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=173', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-30 11:48:07', 'leido', 'si'),
(1130, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=174', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-30 12:12:56', 'leido', 'si'),
(1131, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-30 13:03:02', 'leido', 'si'),
(1132, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Abril 07 - Día Mundial de la Salud</b> y fuiste asignado a ella', '2023-03-30 16:27:48', 'leido', 'si'),
(1133, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=171', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-30 16:28:48', 'pendiente', 'si'),
(1134, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se ha actualizado la tarea <b>09C.04 Abril 19 Muerte de Octavio Paz</b> y fuiste asignado a ella', '2023-03-30 16:29:38', 'leido', 'si'),
(1135, '636ae845774a90.50892287', 'http://148.207.218.173/index.php/tareas/detalles?id=172', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-03-30 16:29:48', 'pendiente', 'si'),
(1136, '642734073b27e7.66765165', 'http://148.207.218.173/index.php/tareas/detalles?id=205', 'tareas', 'Se te ha asignado la tarea <b>Nueva tarea </b>', '2023-03-31 13:46:35', 'leido', 'si'),
(1137, '642734073b27e7.66765165', 'http://148.207.218.173/index.php/tareas/detalles?id=206', 'tareas', 'Se te ha asignado la tarea <b>Otra tarea</b>', '2023-03-31 13:50:03', 'leido', 'si'),
(1138, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=232', 'tareas', 'Se te ha asignado la tarea <b>Estatus actualización </b>', '2023-04-10 12:39:13', 'pendiente', 'si'),
(1139, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=187', 'tareas', 'Se ha actualizado la tarea <b>Conoce Prepa en Línea-SEP</b> y fuiste asignado a ella', '2023-04-10 13:19:23', 'pendiente', 'no'),
(1140, '633eefe21f96f3.52854199', 'http://148.207.218.173/index.php/tareas/detalles?id=232', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-10 13:44:25', 'pendiente', 'si'),
(1141, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=188', 'tareas', 'Se ha actualizado la tarea <b>Modelo educativo</b> y fuiste asignado a ella', '2023-04-10 16:45:00', 'pendiente', 'no'),
(1142, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=188', 'tareas', 'Se ha actualizado la tarea <b>Modelo educativo</b> y fuiste asignado a ella', '2023-04-10 16:46:44', 'pendiente', 'no'),
(1143, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=189', 'tareas', 'Se ha actualizado la tarea <b>Requerimientos tecnológicos</b> y fuiste asignado a ella', '2023-04-10 16:54:02', 'pendiente', 'no'),
(1144, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=189', 'tareas', 'Se ha actualizado la tarea <b>Requerimientos tecnológicos</b> y fuiste asignado a ella', '2023-04-10 16:55:53', 'pendiente', 'no'),
(1145, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=189', 'tareas', 'Se ha actualizado la tarea <b>Requerimientos tecnológicos</b> y fuiste asignado a ella', '2023-04-10 16:58:33', 'pendiente', 'no'),
(1146, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=190', 'tareas', 'Se ha actualizado la tarea <b>Aspirantes</b> y fuiste asignado a ella', '2023-04-10 17:04:14', 'pendiente', 'no'),
(1147, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=191', 'tareas', 'Se ha actualizado la tarea <b>Estudiantes</b> y fuiste asignado a ella', '2023-04-10 17:36:22', 'pendiente', 'no'),
(1148, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=191', 'tareas', 'Se ha actualizado la tarea <b>Estudiantes</b> y fuiste asignado a ella', '2023-04-10 17:36:23', 'pendiente', 'no'),
(1149, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=191', 'tareas', 'Se ha actualizado la tarea <b>Estudiantes</b> y fuiste asignado a ella', '2023-04-10 17:36:24', 'pendiente', 'no'),
(1150, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=192', 'tareas', 'Se ha actualizado la tarea <b>Asesores virtuales</b> y fuiste asignado a ella', '2023-04-10 17:38:33', 'pendiente', 'no'),
(1151, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=193', 'tareas', 'Se ha actualizado la tarea <b>Asesores en la didáctica disciplinar</b> y fuiste asignado a ella', '2023-04-10 17:41:05', 'pendiente', 'no'),
(1152, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=193', 'tareas', 'Se ha actualizado la tarea <b>Tutores escolares</b> y fuiste asignado a ella', '2023-04-11 16:36:12', 'pendiente', 'no'),
(1153, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=195', 'tareas', 'Se ha actualizado la tarea <b>Responsables de Control Escolar</b> y fuiste asignado a ella', '2023-04-11 16:59:42', 'pendiente', 'no'),
(1154, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=233', 'tareas', 'Se ha actualizado la tarea <b>Asesores en la didáctica disciplinar</b> y fuiste asignado a ella', '2023-04-11 17:10:40', 'pendiente', 'no'),
(1155, '633eef17cc43c6.86654620', 'http://148.207.218.173/index.php/tareas/detalles?id=194', 'tareas', 'Se ha actualizado la tarea <b>Supervisores para el acompañamiento y la mejora educativa (SAME)</b> y fuiste asignado a ella', '2023-04-12 15:53:59', 'pendiente', 'si'),
(1156, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=194', 'tareas', 'Se ha actualizado la tarea <b>Supervisores para el acompañamiento y la mejora educativa (SAME)</b> y fuiste asignado a ella', '2023-04-12 15:54:00', 'pendiente', 'no'),
(1157, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=194', 'tareas', 'Se ha actualizado la tarea <b>Supervisores para el acompañamiento y la mejora educativa (SAME)</b> y fuiste asignado a ella', '2023-04-12 15:54:12', 'pendiente', 'no'),
(1158, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Mayo_5_Aniversario_Batalla_Puebla</b> y fuiste asignado a ella', '2023-04-18 08:47:56', 'leido', 'si'),
(1159, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Mayo_10_Día_de_la_Madre</b> y fuiste asignado a ella', '2023-04-18 08:48:10', 'leido', 'si'),
(1160, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Mayo_15_Día_del_Maestro</b> y fuiste asignado a ella', '2023-04-18 08:49:12', 'leido', 'si'),
(1161, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Mayo_17_Día_Mundial_Internet</b> y fuiste asignado a ella', '2023-04-18 08:49:49', 'leido', 'si'),
(1162, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Mayo_21_Día_Mundial_Diversidad_Cultural</b> y fuiste asignado a ella', '2023-04-18 08:50:03', 'leido', 'si'),
(1163, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Mayo_23_Día_del_Estudiante</b> y fuiste asignado a ella', '2023-04-18 08:50:18', 'leido', 'si'),
(1164, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-25 11:43:57', 'leido', 'si'),
(1165, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-25 11:46:25', 'leido', 'si'),
(1166, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-25 11:49:43', 'leido', 'si'),
(1167, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-25 12:00:20', 'leido', 'si'),
(1168, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-25 12:12:25', 'leido', 'si'),
(1169, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-25 12:16:44', 'leido', 'si'),
(1170, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-25 13:29:30', 'pendiente', 'si'),
(1171, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-25 13:39:43', 'pendiente', 'si'),
(1172, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-25 13:45:46', 'pendiente', 'si'),
(1173, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-25 14:29:17', 'leido', 'si'),
(1174, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-25 14:33:56', 'leido', 'si'),
(1175, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-25 14:40:12', 'leido', 'si'),
(1178, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-26 12:13:24', 'leido', 'si'),
(1179, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-26 12:16:19', 'pendiente', 'si'),
(1180, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-26 12:17:40', 'pendiente', 'si'),
(1181, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-26 12:19:02', 'pendiente', 'si'),
(1182, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-26 13:34:07', 'leido', 'si'),
(1183, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-26 13:54:42', 'leido', 'si'),
(1184, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-26 15:24:52', 'leido', 'si'),
(1185, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-26 15:41:03', 'leido', 'si'),
(1186, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-26 15:48:28', 'leido', 'si'),
(1187, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-26 15:50:06', 'leido', 'si'),
(1188, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-27 09:19:14', 'leido', 'si'),
(1189, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-27 09:21:07', 'leido', 'si'),
(1190, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-27 13:06:05', 'leido', 'si'),
(1192, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-28 07:54:54', 'leido', 'si'),
(1193, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-28 09:31:30', 'leido', 'si'),
(1195, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-28 11:03:54', 'pendiente', 'no'),
(1196, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-28 11:48:37', 'leido', 'si'),
(1197, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-28 11:50:11', 'leido', 'si'),
(1198, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-28 12:13:32', 'leido', 'si'),
(1199, '633eeece335cd2.35066473', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-28 12:15:05', 'leido', 'si'),
(1200, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-28 14:31:48', 'leido', 'si'),
(1201, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-28 14:33:00', 'leido', 'si'),
(1202, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-04-28 14:39:58', 'leido', 'si'),
(1203, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-02 11:30:30', 'pendiente', 'si'),
(1204, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-02 11:30:32', 'pendiente', 'no'),
(1205, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-02 15:42:55', 'leido', 'si'),
(1206, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-02 15:48:25', 'leido', 'si'),
(1207, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-02 15:49:58', 'pendiente', 'no'),
(1208, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-02 15:51:06', 'pendiente', 'no'),
(1209, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-02 15:51:52', 'leido', 'si'),
(1211, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 11:17:11', 'leido', 'si'),
(1212, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 11:29:19', 'pendiente', 'si'),
(1213, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 11:29:20', 'pendiente', 'no'),
(1215, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:15:24', 'leido', 'si'),
(1217, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=201', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:15:26', 'leido', 'si'),
(1218, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:25:42', 'pendiente', 'si'),
(1219, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:25:43', 'pendiente', 'no'),
(1220, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:25:44', 'pendiente', 'si'),
(1221, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:25:45', 'pendiente', 'no'),
(1222, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:25:46', 'pendiente', 'si'),
(1223, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:25:47', 'pendiente', 'no'),
(1224, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:25:48', 'leido', 'si'),
(1225, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:25:48', 'pendiente', 'no'),
(1226, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:28:51', 'leido', 'si'),
(1227, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:28:53', 'pendiente', 'no'),
(1228, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:33:19', 'leido', 'si'),
(1229, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:33:20', 'pendiente', 'no'),
(1230, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:40:28', 'leido', 'si'),
(1231, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 14:40:29', 'pendiente', 'no'),
(1232, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-03 15:34:07', 'leido', 'si'),
(1234, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=196', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-04 10:39:49', 'leido', 'si'),
(1237, '64585d73c125e7.84936271', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se te ha asignado la tarea <b>fisica aplicada</b>', '2023-05-07 20:28:54', 'leido', 'si'),
(1238, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se ha actualizado la tarea <b>fisica aplicada</b> y fuiste asignado a ella', '2023-05-07 20:42:21', 'pendiente', 'no'),
(1239, '64585d73c125e7.84936271', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se ha actualizado la tarea <b>fisica aplicada</b> y fuiste asignado a ella', '2023-05-07 20:42:22', 'leido', 'si'),
(1240, '642734073b27e7.66765165', 'http://148.207.218.173/index.php/tareas/detalles?id=63', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-07 20:51:05', 'pendiente', 'no'),
(1241, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=63', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-07 20:51:06', 'pendiente', 'no'),
(1242, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-08 09:01:54', 'leido', 'si'),
(1243, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Mayo_10_Día_de_la_Madre</b> y fuiste asignado a ella', '2023-05-08 09:43:07', 'pendiente', 'no'),
(1244, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Mayo_15_Día_del_Maestro</b> y fuiste asignado a ella', '2023-05-08 09:45:38', 'pendiente', 'no'),
(1245, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se ha actualizado la tarea <b>09C.04_Mayo_17_Día_Mundial_Internet</b> y fuiste asignado a ella', '2023-05-08 09:45:58', 'pendiente', 'no'),
(1246, '62a8a43bb67fa6.38495185', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-08 09:53:34', 'pendiente', 'no'),
(1249, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se ha actualizado la tarea <b>fisica aplicada</b> y fuiste asignado a ella', '2023-05-08 20:38:35', 'pendiente', 'no'),
(1250, '64585d73c125e7.84936271', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se ha actualizado la tarea <b>fisica aplicada</b> y fuiste asignado a ella', '2023-05-08 20:38:37', 'pendiente', 'si'),
(1251, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se ha actualizado la tarea <b>fisica aplicada</b> y fuiste asignado a ella', '2023-05-08 20:41:36', 'pendiente', 'no'),
(1253, '63cb2915916798.85801765', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se ha actualizado la tarea <b>fisica aplicada</b> y fuiste asignado a ella', '2023-05-08 20:41:38', 'leido', 'si'),
(1254, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se ha actualizado la tarea <b>fisica aplicada</b> y fuiste asignado a ella', '2023-05-08 20:41:39', 'pendiente', 'no'),
(1255, '64585d73c125e7.84936271', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se ha actualizado la tarea <b>fisica aplicada</b> y fuiste asignado a ella', '2023-05-08 20:41:40', 'leido', 'si'),
(1257, '6345f3d21f53b8.76043717', 'http://148.207.218.173/index.php/tareas/detalles?id=78', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-09 09:17:46', 'pendiente', 'si'),
(1258, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-09 16:26:25', 'leido', 'si'),
(1259, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-09 16:28:30', 'leido', 'si'),
(1260, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-09 16:31:13', 'leido', 'si'),
(1261, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-09 16:37:18', 'leido', 'si'),
(1262, '632b472f497b95.12743913', 'http://148.207.218.173/index.php/tareas/detalles?id=78', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-09 17:47:56', 'leido', 'si'),
(1263, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-10 08:33:57', 'pendiente', 'no'),
(1264, '636ae6f2b13177.70285172', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-10 08:41:28', 'leido', 'si'),
(1265, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=197', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-10 08:43:39', 'leido', 'si'),
(1266, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-10 08:45:37', 'pendiente', 'no'),
(1267, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=199', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-10 08:49:00', 'leido', 'si'),
(1268, '62a8da0d97a8f6.25904684', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-10 08:55:14', 'pendiente', 'no'),
(1269, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=200', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-10 09:32:11', 'leido', 'si'),
(1270, '632b46a0cdf025.04927926', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se ha actualizado la tarea <b>fisica aplicada</b> y fuiste asignado a ella', '2023-05-10 10:01:40', 'pendiente', 'no'),
(1271, '63cb2915916798.85801765', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se ha actualizado la tarea <b>fisica aplicada</b> y fuiste asignado a ella', '2023-05-10 10:01:41', 'pendiente', 'si'),
(1272, '632b47e9ba5356.01109483', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se ha actualizado la tarea <b>fisica aplicada</b> y fuiste asignado a ella', '2023-05-10 10:01:44', 'pendiente', 'no'),
(1273, '64585d73c125e7.84936271', 'http://148.207.218.173/index.php/tareas/detalles?id=234', 'tareas', 'Se ha actualizado la tarea <b>fisica aplicada</b> y fuiste asignado a ella', '2023-05-10 10:01:45', 'pendiente', 'no'),
(1274, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-10 12:31:35', 'leido', 'si'),
(1275, '636ae6f2b13177.70285172', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-10 13:05:22', 'leido', 'si'),
(1276, '636ae7e47631d0.53211866', 'http://148.207.218.173/index.php/tareas/detalles?id=198', 'tareas', 'Se agregó un mensaje a la tarea <b></b> en la que estás asignado', '2023-05-10 13:10:48', 'leido', 'si'),
(1277, '5c0653d43d92e7.75019474', 'http://148.207.218.173/index.php/tareas/detalles?id=235', 'tareas', 'Se te ha asignado la tarea <b>09C.05_Proceso de registro_INFOGRAFIA_G45.png</b>', '2023-05-12 10:26:07', 'pendiente', 'si'),
(1278, '5c0653d43d92e7.75019474', 'http://148.207.218.173/index.php/tareas/detalles?id=236', 'tareas', 'Se te ha asignado la tarea <b>09C.03 Guía_de_registro_2022_G48_VF.pdf</b>', '2023-05-12 10:30:14', 'pendiente', 'si'),
(1279, '5c0653d43d92e7.75019474', 'http://148.207.218.173/index.php/tareas/detalles?id=237', 'tareas', 'Se te ha asignado la tarea <b>Guía_de_bienvenida_para_el_estudiante_2023.pdf</b>', '2023-05-12 10:36:45', 'pendiente', 'si'),
(1280, '5c0653d43d92e7.75019474', 'http://148.207.218.173/index.php/tareas/detalles?id=238', 'tareas', 'Se te ha asignado la tarea <b>Recurso 1 infográfia</b>', '2023-05-12 11:41:21', 'pendiente', 'si'),
(1281, '5c0653d43d92e7.75019474', 'http://148.207.218.173/index.php/tareas/detalles?id=239', 'tareas', 'Se te ha asignado la tarea <b>Recurso 2 Guía estudiantes</b>', '2023-05-12 11:41:36', 'leido', 'si'),
(1282, '5c0653d43d92e7.75019474', 'http://148.207.218.173/index.php/tareas/detalles?id=240', 'tareas', 'Se te ha asignado la tarea <b>Recurso 3 Video instructivo</b>', '2023-05-12 11:41:50', 'leido', 'si');

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
(1, 'titulo_sitio', 'POLARIS', 'varchar', 'sistema', 0),
(2, 'modo_mantenimiento', 'no', 'boolean', 'sistema', 1),
(3, 'modo_debug', 'no', 'boolean', 'sistema', 2),
(6, 'correo_sitio', 'produccionmultimedia@prepaenlinea.sep.gob.mx', 'varchar', 'contacto', 0),
(7, 'mailer_host', 'mail.cshservers.com', 'varchar', 'sistema', 4),
(8, 'mailer_port', '587', 'varchar', 'sistema', 5),
(9, 'mailer_user', 'servidor@cshservers.com', 'varchar', 'sistema', 6),
(10, 'mailer_pass', '123Servidor#', 'varchar', 'sistema', 7),
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
  `ID_AREA` int(11) NOT NULL DEFAULT 1,
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
  `ORDEN` int(11) NOT NULL DEFAULT 0,
  `VALIDACION` varchar(255) DEFAULT 'si',
  `ID_LISTA` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`ID_PROYECTO`, `ID_AREA`, `PROYECTO_NOMBRE`, `URL`, `PROYECTO_DESCRIPCION`, `IMAGEN`, `IMAGEN_FONDO`, `DURACION`, `FECHA_INICIO`, `FECHA_FINAL`, `FECHA_ENTREGA`, `ENLACE_ENTREGABLE`, `ENLACE_EDITABLE`, `COLOR`, `TIPO`, `PRIORIDAD`, `ESTADO`, `ORDEN`, `VALIDACION`, `ID_LISTA`) VALUES
(4, 1, 'Actualización Módulo 06', 'actualizacion-modulo-06', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2022-09-22', '2022-10-22', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(5, 1, 'Actualización Módulo 05', 'actualizacion-modulo-05', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2022-09-22', '2022-10-22', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(6, 1, 'Actualización Módulo 04', 'actualizacion-modulo-04', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2022-09-22', '2022-10-22', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(7, 1, 'Actualización Módulo 03', 'actualizacion-modulo-03', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2022-09-22', '2022-10-22', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(8, 1, 'Actualización Módulo 02', 'actualizacion-modulo-02', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2022-11-09', '2022-12-09', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(9, 1, 'Actualización Módulo 01', 'actualizacion-modulo-01', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2022-11-09', '2022-12-09', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(10, 1, 'Actualización Módulo 00', 'actualizacion-modulo-00', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2022-11-09', '2022-12-09', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(12, 1, 'Actualización Módulo 07', 'actualizacion-modulo-07', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2023-01-30', '2023-02-18', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(14, 1, 'Efemérides 2023', 'efemerides-2023', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2023-01-31', '2023-06-30', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(18, 1, 'Rediseño MCC', 'rediseno-mcc', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2023-02-09', '2023-12-15', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(20, 1, 'Actualizacion RED-Moodle 4', 'actualizacion-red-moodle-4', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2023-02-09', '2023-12-15', NULL, '', 'https://drive.google.com/drive/folders/1AxC3q4r_0N9aIWNvQLPqbvrabK2TPBR2?usp=sharing', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(30, 1, 'Campaña Soy Prepa en Línea-SEP', 'campana-soy-prepa-en-linea-sep', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2023-02-14', '2024-02-14', NULL, 'https://drive.google.com/drive/folders/19CQqJFYdA-iefhZQad1XlTuyY98MUU5F?usp=share_link', '', 'primary', 'general', 'normal', 'terminado', 0, 'si', 0),
(32, 1, 'Inventario de contenidos', 'inventario-de-contenidos', '<p>Corrección de estilo de los contenidos para el portal de PL-SEP</p><p><br></p><p><a href=\"https://docs.google.com/spreadsheets/d/1FZQ7z3qW6WMCcvrE1DVSwVOUiJgO6wwopElEI3hoQrE/edit#gid=165657942\" target=\"_blank\"><b>Excel del inventario de contenidos</b></a> (Matriz)<br><br><br></p>', 'default.jpg', 'fondo_default.jpg', 'temporal', '2023-02-27', '2023-03-27', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(39, 1, '03C.07_POA_DTE_Componente_1_2023', '03c07_poa_dte_componente_1_2023', '<p><b>Programa de capacitación sobre el uso de la identidad institucional y \r\nrecursos educativos en las direcciones de PL-SEP implementado.</b></p><p>Nombre del indicador. Porcentaje de recursos educativos e informativos de PL-SEP que cuentan con la identidad institucional.</p><p>Definición. Mide el porcentaje de recursos educativos e informativos de PL-SEP que cuentan con la identidad institucional.</p><p>Medios de verificación. Documento diagnóstico, paquete gráfico de identidad institucional, curso o taller de capacitación y bitácora de revisión y retroalimentación de cada dirección de PL-SEP.</p><p>Tendencia: Ascendente</p><p>Meta programada para 2023. 50%<br></p>', 'default.jpg', 'fondo_default.jpg', 'temporal', '2023-03-01', '2023-12-29', NULL, 'https://drive.google.com/drive/folders/1YJpB3E1-D99XdXI-dzWGD9eeWGLYdBpg?usp=share_link', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(41, 1, '03C.07_POA_DTE_Componente_2_2023', '03c07_poa_dte_componente_2_2023', '<p><span style=\"font-size:15px;color:#000000;font-weight:normal;text-decoration:none;font-family:\'docs-Calibri\';font-style:normal;text-decoration-skip-ink:none;\"> </span><b>Recursos educativos digitales con los lineamientos de calidad producidos.</b></p><p>Nombre del indicador. Porcentaje de recursos educativos digitales que cuentan con los aspectos tecnológicos, técnicos y gráficos, entregados conforme al cronograma.</p><p>Definición. La cantidad de recursos educativos digitales que se produjeron de acuerdo con los lineamientos de calidad. </p><p>Medios de verificación. Informes de recursos producidos.</p><p>Meta programada. 80%<br><br></p>', 'default.jpg', 'fondo_default.jpg', 'temporal', '2023-03-01', '2023-12-29', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(42, 1, '03C.07_POA_DTE_Componente_3_2023', '03c07_poa_dte_componente_3_2023', '<p><b>Plan de integración de sistemas digitales implementado.</b></p><p>Nombre del indicador. Índice de cumplimiento de actividades de la primera fase del plan de integración de sistemas digitales.</p><p>Definición. Mide el cumplimiento en la implementación de la primera fase del plan de integración de acuerdo  a las actividades establecidas.<br>Anual.</p><p>Medios de verificación. Lista de verificación de compatibilidad, reportes estadísticos y carpetas de Drive con el UI kit.<br></p><p>Meta. 100% de la primera fase<br><br><br><br></p>', 'default.jpg', 'fondo_default.jpg', 'temporal', '2023-03-01', '2023-12-31', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(43, 1, 'Proyecto KRE3', 'Proyecto-KRE3', '', 'default.jpg', 'fondo_default.jpg', 'permanente', NULL, NULL, NULL, NULL, NULL, 'primary', 'general', 'media', 'activo', 0, 'si', 0),
(44, 1, 'Proyecto 6567', 'Proyecto-6567', '', 'default.jpg', 'fondo_default.jpg', 'permanente', NULL, NULL, NULL, NULL, NULL, 'primary', 'general', 'media', 'activo', 0, 'si', 0),
(45, 1, 'Verificación RED de accesibilidad', 'verificacion-red-de-accesibilidad', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2023-04-03', '2023-05-03', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 0),
(46, 1, 'Prueba de manuel de reportes de accesibilidad', 'prueba-de-manuel-de-reportes-de-accesibilidad', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2023-05-12', '2023-06-12', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 5),
(47, 1, 'Validacion de REDs Ivonne', 'validacion-de-reds-ivonne', '', 'default.jpg', 'fondo_default.jpg', 'temporal', '2023-05-12', '2023-06-12', NULL, '', '', 'primary', 'general', 'normal', 'activo', 0, 'si', 5);

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
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_ROL` int(11) UNSIGNED NOT NULL,
  `ID_TAREA` int(11) UNSIGNED NOT NULL,
  `ID_USUARIO` int(11) UNSIGNED NOT NULL,
  `ETIQUETA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `ID_TAREA` int(11) NOT NULL,
  `ID_AREA` int(11) NOT NULL DEFAULT 1,
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

INSERT INTO `tareas` (`ID_TAREA`, `ID_AREA`, `ID_PROYECTO`, `ID_TAREA_PADRE`, `ID_USUARIO`, `TAREA_DIA_COMPLETO`, `FECHA_INICIO`, `FECHA_FINAL`, `FECHA_ENTREGA`, `TAREA_TITULO`, `TAREA_DESCRIPCION`, `TAREA_ENLACE_ENTREGABLE`, `TAREA_ENLACE_EDITABLES`, `PRIORIDAD`, `COLOR`, `TIPO`, `ESTADO`) VALUES
(53, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-26', NULL, '01S.04_M06_S1_A singular thing_HTML', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1424\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Saray<br><br></p>', 'https://drive.google.com/drive/u/0/folders/1zWmhxP0znuoclUI501svhapcHTaFIWNR', 'https://drive.google.com/drive/u/0/folders/12cTkg8vsieI5XVGTlmChYGaYSAMnV7U1', 'normal', 'primary', 'general', 'pendiente'),
(54, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-26', NULL, '01S.04_M06_S1_Describing myself and others_SCORM', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1426\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1wDS1Mc-qu-SVAM3aRdS9lIiFVFaw7N17', 'https://drive.google.com/drive/u/0/folders/14XBejdymkc4W2Sr7jKgYOXsDTB6WWPMo', 'normal', 'primary', 'general', 'pendiente'),
(55, 1, 4, NULL, NULL, 'si', '2022-09-22', '2022-09-26', NULL, '01S.04_M06_S1_Qualifying Adjectives_HTML', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1428\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1h5XVSQwQxgtuUghoNhycwNXP9jaggW5f', 'https://drive.google.com/drive/u/0/folders/1nkzrT03j5iQppV0zWIDPZx9BprOucQSB', 'normal', 'primary', 'general', 'pendiente'),
(56, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-26', NULL, '01S.04_M06_S1_Possessive Adjectives_SCORM', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1429\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Laura<br>QA: Gaby<br><br></p>', 'https://drive.google.com/drive/u/0/folders/1PCCYRtRHkSXr1M3vPF2YjXvv0b2kZf8P', 'https://drive.google.com/drive/u/0/folders/18iJS4Zzevza5M93YOGFxpDoXD2g7ahFp', 'normal', 'primary', 'general', 'pendiente'),
(57, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-26', '2023-01-30', '01S.04_M06_S1_To practice further_HTML', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1430\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1mb21hvPpguCVsq9iiNkdZf9s_bimwQpF', 'https://drive.google.com/drive/u/0/folders/1EJ5uM_Oh5RI7qawDlyNm2KqH1UrMWTwc', 'normal', 'primary', 'general', 'completo'),
(58, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-26', '2023-01-30', '01S.04_M06_S1_To learn further_HTML', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1431\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1Kkd28HVzy-e_2oRofJq-S7tueBIyzNDE', 'https://drive.google.com/drive/u/0/folders/1nmkg846crH0Sj3_C6s6YIp8JRkFKDp-c', 'normal', 'primary', 'general', 'completo'),
(59, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-26', '2023-01-30', '01S.04_M06_S1_Question Words_HTML', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1432\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/19va17s_jRf7igHWOcWHBmiM6Eg51yyyM', 'https://drive.google.com/drive/u/0/folders/15mgf_s4vI5HevaPOZA5Yo6DYOaFjHzo4', 'normal', 'primary', 'general', 'completo'),
(60, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-26', '2023-01-30', '01S.04_M06_S2_Definite Article \'The\'_HTML', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1449\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1BxcaE-Lz-evUgCkcoesgsIkH8_frm1mB', 'https://drive.google.com/drive/u/0/folders/17e1igA_zHXJadqSmEzd065FD1Z6ImChh', 'normal', 'primary', 'general', 'completo'),
(61, 1, 4, NULL, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M06_S2_There is / There are_SCORM', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1453\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1HmN7jTQiuE8ZSQ3VlSHcDGFkKUP4MnM9', 'https://drive.google.com/drive/u/0/folders/1bvYFdqOyIcBBeVI5PyS_dmBo5ssizS8f', 'normal', 'primary', 'general', 'completo'),
(62, 1, 4, NULL, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M06_S2_To learn further_SCORM', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1456\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1OP_ER9lD0JbYAgxKhF0mYdshW8cREPSL', 'https://drive.google.com/drive/u/0/folders/1RRhGIABbdrVHCAqhgjC7XKqavcvaHByu', 'normal', 'primary', 'general', 'completo'),
(63, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M06_S2_To practice further_HTML', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1457\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1DNQC2HzVrovO2TPrgjzwJ1JymypLRJzC', 'https://drive.google.com/drive/u/0/folders/184vvvnQoq6VMI6saTk_AOTTLSZd-ky6v', 'normal', 'primary', 'general', 'en desarrollo'),
(64, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M06_S2_Adverbs of time_HTML', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1458\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1_x4j_z7m27_rVEP-mE1pJfw0_Rkq9InS', 'https://drive.google.com/drive/u/0/folders/1Ui_6XRoEznMtmwEjae9bFS0t5eTup3s4', 'normal', 'primary', 'general', 'en desarrollo'),
(65, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M06_S3_Present tense_HTML', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1472\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1ufJXHRkUMdylt820CQjsWFPO_oxjydot', 'https://drive.google.com/drive/u/0/folders/1VPjX0zT5Vh2rT3Ouu2vIBJxsG9k_Z4-I', 'normal', 'primary', 'general', 'en desarrollo'),
(66, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M06_S3_Can, Can\'t_SCORM', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1473\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1yXjtuQtJr9liicGjOG-48LacoAl6BPUu', 'https://drive.google.com/drive/u/0/folders/1DygRsZGcd77BGmXwfr2nwSk-nXJuvMD_', 'normal', 'primary', 'general', 'completo'),
(67, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M06_S3_Expressing hobbies and abilities_SCORM', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1476\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1mvZuKMW1veeOb7J0S_goGY2R0vBKVDfg', 'https://drive.google.com/drive/u/0/folders/1_rMLD040ZggrBWlXrE52cKnGacyJx5z6', 'normal', 'primary', 'general', 'completo'),
(68, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M06_S3_Likes, Dislikes, Hate_SCORM', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1478\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1AT619nQVmanH3dMbivda4-n7aMoU1KO5', 'https://drive.google.com/drive/u/0/folders/1UFZdLkJ_C3-m_6rZcJ2ufF_ZVcvAIM-u', 'normal', 'primary', 'general', 'completo'),
(69, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M06_S3_My Schedule_SCORM', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1482\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Laura<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1tSv0iskgteKqMaORZuRPhy76aooPx8_w', 'https://drive.google.com/drive/u/0/folders/1Tq5AllBr01ys4U_ymjBAVp-dKp4179jL', 'normal', 'primary', 'general', 'pendiente'),
(70, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M06_S3_To practice further_HTML', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1483\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Laura<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/103fxKsS1_EBObmQyo1BrfKZcFAbnj34_', 'https://drive.google.com/drive/u/0/folders/1mVumFrbby7PiZ3Eixdmw5jeVhTs5gbux', 'normal', 'primary', 'general', 'pendiente'),
(71, 1, 4, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M06_S3_Adverbs of time_HTML', '<p><a href=\"https://g37c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1484\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Laura<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/19UdVf8y7mqmHzwvlAB36dUfeREqeJ1dE', 'https://drive.google.com/drive/u/0/folders/1JNQPJaxXdvLTDDJw_Srub79oKG3fqs1v', 'normal', 'primary', 'general', 'pendiente'),
(72, 1, 5, 0, NULL, 'si', '2022-09-22', '2022-09-27', '2023-01-30', '01S.04_M05_S1_Tipos de argumento_SCORM', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1411\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1DocwaL6lhkmgtCRGM-mr9a_x7dv_vcrz', 'https://drive.google.com/drive/u/0/folders/1jMZPeHyW20-uNLig4CnwKkUzXjx7xqh7', 'normal', 'primary', 'general', 'completo'),
(73, 1, 0, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M05_S1_Reactivar aprendizajes_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1418\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1fJBHDESg6Nf32AgTE1eVSAtdJ9fdqk1-', 'https://drive.google.com/drive/u/0/folders/1eR_jWmxMSjPk7NQsB3nHruD4lZc3hq7T', 'normal', 'primary', 'general', 'en desarrollo'),
(74, 1, 5, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M05_S2_Investigación documental_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1430\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/19T5pQXWVeI6M7zGlaApgZxJxDsdx0mIm', 'https://drive.google.com/drive/u/0/folders/1nQTyIZXhaXmk98-DMhR-6gbOig5dTqsN', 'normal', 'primary', 'general', 'en desarrollo'),
(75, 1, 5, NULL, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M05_S2_Informática en la investigación_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1433\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1Uj6giQ4J9Rwe97aUvdyTYEC25f2SuDwp', 'https://drive.google.com/drive/u/0/folders/12wxdhTeKBALkRjqT_lIiXLm5IxHiBmrg', 'normal', 'primary', 'general', 'completo'),
(76, 1, 5, NULL, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M05_S2_Búsqueda de información en internet_SCORM', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1434\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1gMNdFWJM20fsPMToLl2rJrWEbBGyqL_I', 'https://drive.google.com/drive/u/0/folders/1DgPexJEw4uTyJ11cABhzcJEWl4vf7oJx', 'normal', 'primary', 'general', 'completo'),
(77, 1, 5, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M05_S2_Textos y razonamientos propios_SCORM', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1436\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1pZiRY_QoDRmR0abpWY_Sy8qGHXDdbhVE', 'https://drive.google.com/drive/u/0/folders/1rC5HXBprUfHzUVbVR5AHnQ2B3iWKlajb', 'normal', 'primary', 'general', 'en desarrollo'),
(78, 1, 5, 0, NULL, 'si', '2022-09-22', '2022-09-27', '2023-05-10', '01S.04_M05_S2_Recupera aprendizajes: interdisciplinariedad e intertextualidad_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1437\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1ciXBVN9wxXbgrSxj8H7Iwyzub2C0qk7M', 'https://drive.google.com/drive/u/0/folders/1I6824uTM3ISkPYhgDeW6YY6RMDDSZwwX', 'normal', 'primary', 'general', 'completo'),
(79, 1, 5, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M05_S2_Estructura y elementos de un diálogo_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1441\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1fnGiY4mK4gXYV7vJyw-VoSkpspTV9hTE', 'https://drive.google.com/drive/u/0/folders/1uqKJpxY5p1zeKa7vUjPszrB-N6low7Dm', 'normal', 'primary', 'general', 'en desarrollo'),
(80, 1, 5, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M05_S2_Recupera aprendizajes: opinar, leer, escribir y hablar_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1444\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1kCE7_4wsSTpYinJqImoLJVlKtmvUOnS4', 'https://drive.google.com/drive/u/0/folders/1rupl_BEObRU2Peqa2GLI7l3ziV-6JuJZ', 'normal', 'primary', 'general', 'en desarrollo'),
(81, 1, 5, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M05_S3_Recupera aprendizajes: conocimiento científico_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1454\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1bspP6iHBDgSOR2g39QF1sdzPnAkyDCTK', 'https://drive.google.com/drive/u/0/folders/15dogAMcImmIa8FJJSvjcd2ZGPQOV3Xxw', 'normal', 'primary', 'general', 'completo'),
(82, 1, 5, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M05_S3_Recupera aprendizajes: fuentes de información_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1460\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1vekPLm2IYPZ0iPnwSEOX482MCTlW9c6q', 'https://drive.google.com/drive/u/0/folders/1rKGyxgNgg2VUMAEctKBFQqX7aHg1ivYd', 'normal', 'primary', 'general', 'completo'),
(83, 1, 6, NULL, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M04_S1_Recupera aprendizajes: análisis de un texto_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1310\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/18ZxsE7E0gck2Gr2H4hhQY7_9peThVmwv', 'https://drive.google.com/drive/u/0/folders/1bVeG9ujzqhZMEru06fT8u9F3eENMNr9e', 'normal', 'primary', 'general', 'pendiente'),
(84, 1, 6, NULL, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M04_S1_Poesía y lírica_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1316\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1f09rZs_zyVXf-Ie7Dp4KK7h6ErBUeu4M', 'https://drive.google.com/drive/u/0/folders/1pGsiaMg7Xt5OTq_9ocmWHboRNDGxOe1a', 'normal', 'primary', 'general', 'pendiente'),
(85, 1, 6, NULL, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M04_S2_Literatura: ficción y realidad_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1328\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1YIfW98cZ-N43PcWt7dRSvEc18gYfxOWQ', 'https://drive.google.com/drive/u/0/folders/19lrXGJp2Z36qW0ozWvrDKH6aGkX9mjls', 'normal', 'primary', 'general', 'pendiente'),
(86, 1, 6, 0, NULL, 'si', '2022-09-22', '2022-09-27', '2023-01-30', '01S.04_M04_S2_Para saber más. El sentido de la vida_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1330\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1Zcj6SRCHQ-ZIrFvUUGPfiaWf2fPSVsy_', 'https://drive.google.com/drive/u/0/folders/1VszYSNjE1zIkM2t4JTt4NkynmXj1LpBt', 'normal', 'primary', 'general', 'completo'),
(87, 1, 6, NULL, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M04_S2_Literatura en los siglos XIX y XX_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1332\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1qiANaW7DscgapPg5GrC-ge6g9GPs-L1I', 'https://drive.google.com/drive/u/0/folders/1sP_H_yN-cxwndKjffZdby9JctiKPtfKR', 'normal', 'primary', 'general', 'en desarrollo'),
(88, 1, 6, 0, NULL, 'si', '2022-09-22', '2022-09-27', NULL, '01S.04_M04_S2_Literatura en México_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1333\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1HoL6fz_Km5YIBNWLry6Tt9_gTYDE09oK', 'https://drive.google.com/drive/u/0/folders/1deieBZxpY3qhl7e67q6Tx-g_Q6g8l_Oe', 'normal', 'primary', 'general', 'en desarrollo'),
(89, 1, 6, 0, NULL, 'si', '2022-09-22', '2022-09-28', '2023-01-06', '01S.04_M04_S2_Para saber más. Glosario_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1335\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1UipC45L7AtAGAH8NZ5KyRZB1Fg6RBOH0', 'https://drive.google.com/drive/u/0/folders/1bzX7iGtIGWO0P4wadai9yV3WP0Brpies', 'normal', 'primary', 'general', 'completo'),
(90, 1, 6, NULL, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M04_S2_Recupera aprendizajes: Características de la sociedad contemporánea_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1336\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1dARluw3W65d99FEpNDp512HoO3UMMLiI', 'https://drive.google.com/drive/u/0/folders/1IqzoWQRkHoPRsZEtY3bCbOmYaztf16sz', 'normal', 'primary', 'general', 'completo'),
(91, 1, 6, 0, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M04_S3_Experiencias estéticas_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1347\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1Vi-tDbKqNB5kDN-bP23KcNoMkEL2TOdV', 'https://drive.google.com/drive/u/0/folders/1CW1msAsqzqokTP70WwIoWk2h9wPZPAgQ', 'normal', 'primary', 'general', 'en desarrollo'),
(92, 1, 6, 0, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M04_S3_Recupera aprendizajes. TIC y literatura_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1349\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/103c3Ck3Pp8qP0A0i8pbz4d93ab3-eTH3', 'https://drive.google.com/drive/u/0/folders/1UvzZ4nCuGrM7byX0lHnh2lAIZPH9euMB', 'normal', 'primary', 'general', 'en desarrollo'),
(93, 1, 6, 0, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M04_S3_Para saber más. El arte en la era digital_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1351\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1A_yurN4g-txcAb80oxqvqtpalBmy0U-_', 'https://drive.google.com/drive/u/0/folders/1QwM2qB1_g-ka1j-W5CGjkT9BGpet0ePG', 'normal', 'primary', 'general', 'en desarrollo'),
(94, 1, 6, 0, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M04_S3_Formas de literatura actuales_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1353\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/119DZCOcIkekxGjErSfbaefMmkDs3Hcgk', 'https://drive.google.com/drive/u/0/folders/1y8y6iRaEmRUOJXv5FI5EaCXy4VU3Lnk0', 'normal', 'primary', 'general', 'completo'),
(95, 1, 6, 0, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M04_S3_Recupera aprendizajes. Oralidad y escritura_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1354\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1FhUxuXW1x4VX1XU7G2jF6Mjb1b1N89Zl', 'https://drive.google.com/drive/u/0/folders/18vlN2UBLVf-8Tz_i2ehtjj4P5XNO4EYv', 'normal', 'primary', 'general', 'completo'),
(96, 1, 6, 0, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M04_S3_Para saber más. Sócrates y los sofistas_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1356\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1Vnl8erWVLLYCMUjdE_V874JYIF2rNeXK', 'https://drive.google.com/drive/u/0/folders/1SYQf6-mAGE-qu3HUA4b_sp6B1uyud0Gw', 'normal', 'primary', 'general', 'completo'),
(97, 1, 6, NULL, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M04_S4_Para saber más. ¿Cómo hacer una historieta?_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1387\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1vSqUvRUdMQj0_nQUSkoE7c_jclwHC2DK', 'https://drive.google.com/drive/u/0/folders/1dICUd9qyTQbvb8XGAVUr5I40salVxU0D', 'normal', 'primary', 'general', 'pendiente'),
(98, 1, 6, NULL, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M04_S4_Para saber más. ¿Cómo usar Pixton?_HTML', '<p><a href=\"https://g38c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1388\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1zwAIR4HgkqU1AS9iexT2lzp6jKVosAfj', 'https://drive.google.com/drive/u/0/folders/15zye2PX0FR1ei6XzTixyMPz-4ZH9nfYV', 'normal', 'primary', 'general', 'pendiente'),
(99, 1, 7, NULL, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M03_S1_Lectura y escritura_SCORM', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1193\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1O_oHTEdMFDX3FIO-I7VhIIaZsLwDTa06', 'https://drive.google.com/drive/u/0/folders/1N4lflZmTxqnwkLutvck7Jfm2l-ANVRZf', 'normal', 'primary', 'general', 'pendiente'),
(100, 1, 7, NULL, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M03_S1_Estrategias de estudio_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1194\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1LDEYlahAhwfrErdk45p9mZIzV4jXtxwl', 'https://drive.google.com/drive/u/0/folders/1gBZ3ZhqaDfMCriI5lga-1TxGejlHzx_0', 'normal', 'primary', 'general', 'en desarrollo'),
(101, 1, 7, NULL, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M03_S1_Reconstrucción y análisis de hechos históricos_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1196\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1wwjwiRs2dWh7dtnFONP3I2kxOaeE3feh', 'https://drive.google.com/drive/u/0/folders/1vVmk2F9IFfXUBM-rHXfbzM4fUwthLhv4', 'normal', 'primary', 'general', 'en desarrollo'),
(102, 1, 7, NULL, NULL, 'si', '2022-09-22', '2022-09-28', NULL, '01S.04_M03_S1_Condiciones sociohistóricas y culturales_SCORM', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1198\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1loIvhRnoP9AZuj7cgFSZNBH1_3tNm2E_', 'https://drive.google.com/drive/u/0/folders/1iw-TNFrrZpvJG2df9igN3mOIYtWQ0B7O', 'normal', 'primary', 'general', 'en desarrollo'),
(103, 1, 7, 0, NULL, 'si', '2022-09-22', '2022-09-29', '2023-01-06', '01S.04_M03_S1_Análisis de datos e información_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1204\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/14SsfZ1qZ0qf5LHGM9BSJv701ELcPEorQ', 'https://drive.google.com/drive/u/0/folders/1mmZfMD-RV9B7o-B37HkWOrsc5yaWAbM7', 'normal', 'primary', 'general', 'completo'),
(104, 1, 7, NULL, NULL, 'si', '2022-09-22', '2022-09-29', NULL, '01S.04_M03_S1_Lenguaje_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1207\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1BuGqd66lW7huVbNeAwQZ1lT7ZMhNEwaF', 'https://drive.google.com/drive/u/0/folders/1pbiGN5oD-iECgFwJqnZ7OLfusIRUNR2b', 'normal', 'primary', 'general', 'completo'),
(105, 1, 7, 0, NULL, 'si', '2022-09-22', '2022-09-29', NULL, '01S.04_M03_S1_Ciencia y conocimiento espontáneo_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1208\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1EuQOJ3MIvAN9QA5oIj8xfHiBGqCTc1p6', 'https://drive.google.com/drive/u/0/folders/1t7AeI3BIjevprcCSTD2GqMM0L4yiYMWF', 'normal', 'primary', 'general', 'en desarrollo'),
(106, 1, 7, 0, NULL, 'si', '2022-09-22', '2022-09-29', NULL, '01S.04_M03_S1_Sentido común y conocimiento científico_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1209\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Gaby<br><br></p>', 'https://drive.google.com/drive/u/0/folders/1yfQL3tNhRWx2D6V446j-PzCia7vHJQH_', 'https://drive.google.com/drive/u/0/folders/1rXKeL8NLA-dDjcG3g5OZIx9N-VVADfNp', 'normal', 'primary', 'general', 'en desarrollo'),
(107, 1, 7, 0, NULL, 'si', '2022-09-22', '2022-09-29', NULL, '01S.04_M03_S1_Para saber más… La construcción del conocimiento_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1210\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1saP5XfRe873VA0H04jLHiJrlrTdZbKu7', 'https://drive.google.com/drive/u/0/folders/1PtVHY7Ewl37yktnj7s9jeODmenxzpCv3', 'normal', 'primary', 'general', 'en desarrollo'),
(108, 1, 7, 0, NULL, 'si', '2022-09-22', '2022-09-29', NULL, '01S.04_M03_S2_Biología_HTML', '<p><a href=\"https://g39c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1227\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1J_LrctcgtqqK08kEzIMkGxOHBRjX4cYz', 'https://drive.google.com/drive/u/0/folders/1UMoh5omURunhPx8CuTboHmM5oJkuxEPD', 'normal', 'primary', 'general', 'completo'),
(109, 1, 7, 0, NULL, 'si', '2022-09-22', '2022-09-29', '2023-01-06', '01S.04_M03_S2_Biología en la vida cotidiana_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1230\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1sG_OcKdI-2l3fa4QaI7wJOHMFXBbK3eN', 'https://drive.google.com/drive/u/0/folders/1vD8nDu8iYqhxWaMOhpSVmD5lFYfozlLq', 'normal', 'primary', 'general', 'completo'),
(110, 1, 7, 0, NULL, 'si', '2022-09-22', '2022-09-29', NULL, '01S.04_M03_S2_Fenómeno natural: representaciones_SCORM', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1231\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1L0xm0OPrzqUY8BokCN-nVltZNI-IJ5Eh', 'https://drive.google.com/drive/u/0/folders/1cuNc7EqB1IWaYQCVHcbKJ_NIvyGrwa9j', 'normal', 'primary', 'general', 'completo'),
(111, 1, 7, NULL, NULL, 'si', '2022-09-22', '2022-09-29', NULL, '01S.04_M03_S2_Explicar y entender un fenómeno natural_SCORM', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1232\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/10x25syBfHBDv4JhoH8MY9mp9GaI9fjJ_', 'https://drive.google.com/drive/u/0/folders/1Wm6PBMNhBxT3jELZfYKiWxH-9JvmlySc', 'normal', 'primary', 'general', 'pendiente'),
(112, 1, 7, NULL, NULL, 'si', '2022-09-22', '2022-09-29', NULL, '01S.04_M03_S2_Ecosistemas_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1234\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/198N1Cy4fR-YFsYwG8wvOhVj9lic1r944', 'https://drive.google.com/drive/u/0/folders/1On4POdAM4kDICAxbVQc6H5wJySFwxvXp', 'normal', 'primary', 'general', 'pendiente'),
(113, 1, 7, NULL, NULL, 'si', '2022-09-22', '2022-09-29', NULL, '01S.04_M03_S2_Intertextualidad e interdisciplinariedad_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1235\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/14qXCLWg7WqIrZijrM-N4G37lL2VCRik8', 'https://drive.google.com/drive/u/0/folders/1ztXtclvuSO5LcvmWpHQxgeitxxARRvdp', 'normal', 'primary', 'general', 'pendiente'),
(114, 1, 7, NULL, NULL, 'si', '2022-09-22', '2022-09-29', NULL, '01S.04_M03_S3_El lenguaje de la ciencia_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1248\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1SDo77DIKpn3F77veXkld5QunSZBKv9ir', 'https://drive.google.com/drive/u/0/folders/15KRlG7z27KVYLCfKj9CaCE-KaKHG6Qc3', 'normal', 'primary', 'general', 'en desarrollo'),
(115, 1, 7, NULL, NULL, 'si', '2022-09-23', '2022-09-29', NULL, '01S.04_M03_S3_Antropología_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1251\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/18Ar7kuMVK5I3FgSEj7YieBi9sD24--YR', 'https://drive.google.com/drive/u/0/folders/1osVRFKCR9e4o0-DAxGb98SKqPldMhzUl', 'normal', 'primary', 'general', 'en desarrollo'),
(116, 1, 7, NULL, NULL, 'si', '2022-09-23', '2022-09-29', NULL, '01S.04_M03_S3_El mundo contemporáneo_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1253\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/14EjESUgqLiEfNn-8zkmqXmJGRKKDDGfs', 'https://drive.google.com/drive/u/0/folders/1YVDfdoT926EZXi6dwB2SHjFXgu54oo4M', 'normal', 'primary', 'general', 'en desarrollo'),
(117, 1, 7, NULL, NULL, 'si', '2022-09-23', '2022-09-30', NULL, '01S.04_M03_S3_Relaciones sociales_SCORM', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1255\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/17wpnnWAmpyY07SuH2EY3gWpxXrWicbg_', 'https://drive.google.com/drive/u/0/folders/1LqX5XImy3IABUI82PaowU3oaJtVXj1ys', 'normal', 'primary', 'general', 'completo'),
(118, 1, 7, NULL, NULL, 'si', '2022-09-23', '2022-09-30', NULL, '01S.04_M03_S3_Fundamentalismo_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1256\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1DXtjWMEy9CJZyqevH-GOQJilVyHGgsSa', 'https://drive.google.com/drive/u/0/folders/11Y6OUnimdJO7yAegzvS0GaDi5MgcyYt_', 'normal', 'primary', 'general', 'completo'),
(119, 1, 7, 0, NULL, 'si', '2022-09-23', '2022-09-30', NULL, '01S.04_M03_S3_Globalización_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1257\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1WUwciL9J4fzyN-25iEXN0DWRhae1vcSC', 'https://drive.google.com/drive/u/0/folders/1OwKUkXpmU8dfumvJTndsIdBTBP74edPu', 'normal', 'primary', 'general', 'en desarrollo'),
(120, 1, 7, 0, NULL, 'si', '2022-09-23', '2022-09-30', NULL, '01S.04_M03_S3_Para saber más: Leer y escribir críticamente_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1260\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1Ib2S31gmPvv6IZrXXgbmxBNxLOWeG9re', 'https://drive.google.com/drive/u/0/folders/1WIL-Eu4NH7lEhSEFwR41Cceo_wOdLG9_', 'normal', 'primary', 'general', 'en desarrollo'),
(121, 1, 7, 0, NULL, 'si', '2022-09-23', '2022-09-30', NULL, '01S.04_M03_S3_Para saber más: Guerra fría, origen y desarrollo_HTML', '<p><a href=\"https://g41c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1261\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1XenBCDDszEuPXHI8RC0_JFrazXMkaOI0', 'https://drive.google.com/drive/u/0/folders/1qP9hVKvWaZA3VQkAAGp3WKjln-n_NbPH', 'normal', 'primary', 'general', 'en desarrollo'),
(122, 1, 8, 0, NULL, 'si', '2022-11-09', '1969-12-31', NULL, '01S.04_M02_S1_Realización personal_SCORM', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=994\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Laura<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/11vHfeAFjWLqP-IEHuOV3BxALnd_X017B', 'https://drive.google.com/drive/u/0/folders/1e3rN47k1EzX9Vx9woeWuIPnFaoymPUh2', 'normal', 'primary', 'general', 'completo'),
(123, 1, 8, 0, NULL, 'si', '2022-11-09', '1969-12-31', NULL, '01S.04_M02_S1_Oralidad_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=999\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Laura<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1XWT_YRqDiDdtukyxwr6gD26z-9YHCwMA', 'https://drive.google.com/drive/u/0/folders/1xRbeHN3Spi0DTFlLTg3HDeSW2DGdG1dG', 'normal', 'primary', 'general', 'completo'),
(124, 1, 8, 0, NULL, 'si', '2022-11-09', '1969-12-31', NULL, '01S.04_M02_S1_Para saber más: Ortografía_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1001\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Laura<br>QA: Gaby</p>', 'https://drive.google.com/drive/u/0/folders/1dxfRwX33CDUBrBqQA-jTnfWeVUfTqrr5', 'https://drive.google.com/drive/u/0/folders/11GyvQ59PPIefAIufmB52ytg7VQfqm1KB', 'normal', 'primary', 'general', 'completo'),
(125, 1, 8, 0, NULL, 'si', '2022-11-09', '1969-12-31', NULL, '01S.04_M02_S2_Lectura por gusto no por obligación_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1017\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Laura<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/11ylyxNzNM0Zq4zmoIHosi-fuhYiQIbg5', 'https://drive.google.com/drive/u/0/folders/1NBcTsoqDJOMhpg3yyKvOdGNDzOcAWyVc', 'normal', 'primary', 'general', 'en desarrollo'),
(126, 1, 8, 0, NULL, 'si', '2022-11-09', '2022-12-09', NULL, '01S.04_M02_S2_Estrategias de lectura_SCORM', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1018\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Laura<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1LmWHhdm05ZER4a6zbkD2j8cent2Z5Fji', 'https://drive.google.com/drive/u/0/folders/1bf8i7r2ZRJiDohnRGh7aOSdLiSV1MTcC', 'normal', 'primary', 'general', 'pendiente'),
(127, 1, 8, 0, NULL, 'si', '2022-11-09', '1969-12-31', NULL, '01S.04_M02_S2_Organización de un texto_SCORM', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1021\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Laura<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1_9rJlOHR6k-LOY_8KMtlXPQpMi1YzHCq', 'https://drive.google.com/drive/u/0/folders/10v-KYRjPBOuO930-a77Z82A_vHWyaHK1', 'normal', 'primary', 'general', 'pendiente'),
(128, 1, 8, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M02_S2_Para practicar más_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1023\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Laura<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1buPTZuNEKuCcfixvVgRtO4mlRMV2qiSS', 'https://drive.google.com/drive/u/0/folders/1SdY_sU2VOVH8KNn6EH99a_g_9q-zqYZd', 'normal', 'primary', 'general', 'en desarrollo'),
(129, 1, 8, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M02_S2_Pasos para resumir_SCORM', '<a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1028\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Laura<br>QA: Saray<br>', 'https://drive.google.com/drive/u/0/folders/1xsXyU3We9JQ2gEY3Kl-REikTxZhnJfJF', 'https://drive.google.com/drive/u/0/folders/1GUEYmRA1ogv3G16ZuM0LCxf8DNK14f2F', 'normal', 'primary', 'general', 'en desarrollo'),
(130, 1, 8, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M02_S3_El relato_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1039\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Laura<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1Q3luqmTCplUNg7ZmI17Vs3dAsD2eonky', 'https://drive.google.com/drive/u/0/folders/1WvvMLwjdi3EaYsR4vwegFPYdOdS5blZw', 'normal', 'primary', 'general', 'en desarrollo'),
(131, 1, 8, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M02_S3_¿Qué es el comentario?_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1041\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Laura<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1863F4H1nRpMIAsbc5Dfnn-6Cd_vxqsCZ', 'https://drive.google.com/drive/u/0/folders/1IMLRVYDcHPjxWgSxJlfUFCwWT2U8ue9o', 'normal', 'primary', 'general', 'completo'),
(132, 1, 8, 0, NULL, 'si', '2022-11-09', '1969-12-31', NULL, '01S.04_M02_S3_¿Qué es la reseña?_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1043\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Laura<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1SOJXGtA_rIh6K9AloPEqye9Rgw6-atE8', 'https://drive.google.com/drive/u/0/folders/1ujWuYahYu2LvR3nBJ51FqKEjdgrtFoSl', 'normal', 'primary', 'general', 'completo'),
(133, 1, 8, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M02_S3_Para saber más_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1045\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Laura<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1j2IjlUXmzYnrnkGiaSKvKPdJd2uKcHJc', 'https://drive.google.com/drive/u/0/folders/17COhnlfp88iwU50sr1kaM5CLgXMJn7Sn', 'normal', 'primary', 'general', 'en desarrollo'),
(134, 1, 8, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M02_S3_Reseñas de textos_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1046\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Laura<br>QA: Gaby<br><br></p>', 'https://drive.google.com/drive/u/0/folders/1I_d3FiqzIrhbxqMreODE10_A6DVzeP7Z', 'https://drive.google.com/drive/u/0/folders/16SdFVgZfj9Otsm-B4_OuWc7Ij5fuHUKg', 'normal', 'primary', 'general', 'en desarrollo'),
(135, 1, 9, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M01_S1_Bibliotecas virtuales_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1097\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Laura<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1FWMkpg7TEP0pcrYoA7lQn2VFiCz_DI66', 'https://drive.google.com/drive/u/0/folders/1MPIQhzi-o7wp0mU8SfkbP5sgaJFH75lS', 'normal', 'primary', 'general', 'en desarrollo'),
(136, 1, 9, 0, NULL, 'si', '2022-11-09', '2022-12-09', '2023-01-30', '01S.04_M01_S1_Las TIC en la sociedad_SCORM', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1100\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Laura<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1FVFbCdR1cPwWlavifgbOqOstREHafkKH', 'https://drive.google.com/drive/u/0/folders/1GWgUmlmqCEL_L7xax9NqvmxZFz-KpSPQ', 'normal', 'primary', 'general', 'completo'),
(137, 1, 9, 0, NULL, 'si', '2022-11-09', '1969-12-31', NULL, '01S.04_M01_S1_Para saber más: El porqué de las TIC en educación_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1101\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Laura<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1wcgLUuTeMgi3MzJfU2vyuGRkJlLkpdKv', 'https://drive.google.com/drive/u/0/folders/1CfgxHBmT4Y5uyjN79DuY8FD-0RWmHE4X', 'normal', 'primary', 'general', 'completo'),
(138, 1, 9, 0, NULL, 'si', '2022-11-09', '1969-12-31', NULL, '01S.04_M01_S2_Comportamiento digital_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1125\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/17qM6KysIHnLztN4P9XeUGb4jv2MrdEqs', 'https://drive.google.com/drive/u/0/folders/1UW1n44O26zxc0flCk1bStXRZvfH_C0uP', 'normal', 'primary', 'general', 'completo'),
(139, 1, 9, 0, NULL, 'si', '2022-11-09', '1969-12-31', NULL, '01S.04_M01_S2_El uso de la computación en la nube_SCORM', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1126\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Laura<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/13FJMPyjN6GANT2AhzdCGPmj4LzJykCw3', 'https://drive.google.com/drive/u/0/folders/1Q_iZi7NBt9vzwyRYVbh_W4IzyDduNZwa', 'normal', 'primary', 'general', 'pendiente'),
(140, 1, 9, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M01_S3_Entornos digitales de aprendizaje_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1139\" target=\"_blank\">Recurso de referencia</a><br></p><p>Producción: Manu<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1ciGH14cF936QRnJkSwak03MvJUYzB4Jf', 'https://drive.google.com/drive/u/0/folders/1sXuhLE8V21URtRravffCQ4G21svON4lm', 'normal', 'primary', 'general', 'pendiente'),
(141, 1, 9, 0, NULL, 'si', '2022-11-09', '1969-12-31', NULL, '01S.04_M01_S3_Para saber más: ¿Cómo publicar presentaciones digitales en la web?_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1140\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Manu<br>Corrección de estilo: Laura<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1A-U2S8yB_jzWA0q41QeZ5e9yOq8F7Hol', 'https://drive.google.com/drive/u/0/folders/1vip5w4Q5LFNBOvsaiofw0oOMSU5Jec-0', 'normal', 'primary', 'general', 'pendiente'),
(142, 1, 9, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M01_S3_Para saber más: Sociedad de la información o sociedad del conocimiento_HTML', '<p><a href=\"https://g43c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1141\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1M80cSYaE5et6Wn-KpcOa4Wgy1YFqVPU0', 'https://drive.google.com/drive/u/0/folders/1-WOm_iSl54-uXoxA0-UVepfh-MAp6Uqw', 'normal', 'primary', 'general', 'en desarrollo'),
(143, 1, 10, 0, NULL, 'si', '2022-11-09', '2022-12-09', '2023-01-19', '01S.04_M00_S1_¿Qué hay en Mi Aula?_SCORM', '<p><a href=\"https://prope1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1602\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1HSMFimIm7JVVTbbjzrzifnHDiUu3MGmP', 'https://drive.google.com/drive/u/0/folders/1moOXDoXvkTNtcigsTzsMkcrxNCPeW2x5', 'normal', 'primary', 'general', 'completo'),
(144, 1, 10, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M00_S2_Asesor en la didáctica disciplinar_HTML', '<p><a href=\"https://prope1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1625\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Sam<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/12UjJfDw5QMIr-akVoHza2BO2ArsTM_69', 'https://drive.google.com/drive/u/0/folders/1l9lqH375f6_box1tlH0XFcyXo1QkA9qc', 'normal', 'primary', 'general', 'en desarrollo'),
(145, 1, 10, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M00_S2_¿Cómo nos comunicamos?_HTML', '<p><a href=\"https://prope1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1629\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1UrWx4h0k7e1yZ2MLcFpLO8li3HYmQ9z6', 'https://drive.google.com/drive/u/0/folders/1bSk0q0qFUzGaMPHWth5Ib_O7RjVyq-G3', 'normal', 'primary', 'general', 'completo'),
(146, 1, 10, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M00_S3_¿Cómo aprenderé?_SCORM', '<p><a href=\"https://prope1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1646\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Frida<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1YcgeQ2KRjG548YKFyAd2TZ0GvE2-5JCS', 'https://drive.google.com/drive/u/0/folders/1GQmBEdUsYQoQneTRGuxAQ5PntKe_r0KC', 'normal', 'primary', 'general', 'completo'),
(147, 1, 10, 0, NULL, 'si', '2022-11-09', '1969-12-31', NULL, '01S.04_M00_S3_Mapa curricular_HTML', '<p><a href=\"https://prope1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1649\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Laura<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1nuoNuZpYzRfkZOBgi82guaCS5eTw_vbc', 'https://drive.google.com/drive/u/0/folders/1rFs5EvUsQxLL8CH275SCVHTU6RBL3gJT', 'normal', 'primary', 'general', 'en desarrollo');
INSERT INTO `tareas` (`ID_TAREA`, `ID_AREA`, `ID_PROYECTO`, `ID_TAREA_PADRE`, `ID_USUARIO`, `TAREA_DIA_COMPLETO`, `FECHA_INICIO`, `FECHA_FINAL`, `FECHA_ENTREGA`, `TAREA_TITULO`, `TAREA_DESCRIPCION`, `TAREA_ENLACE_ENTREGABLE`, `TAREA_ENLACE_EDITABLES`, `PRIORIDAD`, `COLOR`, `TIPO`, `ESTADO`) VALUES
(148, 1, 10, NULL, NULL, 'si', '2022-11-09', NULL, NULL, '01S.04_M00_S3_Proceso de trayectoria escolar_HTML', '<p><a href=\"https://prope1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1650\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1TJ7lQAUNncIc8bpnglPm3_S6uj0guFRZ', 'https://drive.google.com/drive/u/0/folders/1SLkMHLK9mRu3GZ4mV_ta4nyEARa7rb2X', 'normal', 'primary', 'general', 'en desarrollo'),
(149, 1, 10, 0, NULL, 'si', '2022-11-09', '1969-12-31', '2023-05-09', '01S.04_M00_S3_Criterios de evaluación_SCORM', '<p><a href=\"https://prope1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1652\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Gonzalo<br>Corrección de estilo: Laura (reasignado)<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1Ht7wMBY9nudMrqxdIZWpGL8rehwr4VVc', 'https://drive.google.com/drive/u/0/folders/1_gjHXXPtjiyz4mvecasYySxBAIjGXfK5', 'normal', 'primary', 'general', 'completo'),
(150, 1, 10, 0, NULL, 'si', '2022-11-09', '1969-12-31', '2022-12-28', '01S.04_M00_S3_Estrategias de aprendizaje_HTML', '<p><a href=\"https://prope1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1658\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1nG62DpYP_Dkx6wccStmHjS9G_-PhPOjF', 'https://drive.google.com/drive/u/0/folders/1sJAMb_MD6uk_U6bxMWK3HcMzHZ2tG7-V', 'normal', 'primary', 'general', 'completo'),
(151, 1, 10, 0, NULL, 'si', '2022-11-09', '1969-12-31', NULL, '01S.04_M00_S3_¿El plagio, falta grave?_HTML', '<p><a href=\"https://prope1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1663\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Gaby<br></p>', 'https://drive.google.com/drive/u/0/folders/1XabZEtyxqJ5UXUbvuhcn2WaNeriHU5yD', 'https://drive.google.com/drive/u/0/folders/1MMxcpnmSkTRYyIGMTsOgraUYXnsOawh2', 'normal', 'primary', 'general', 'completo'),
(152, 1, 10, 0, NULL, 'si', '2022-11-09', '1969-12-31', '2022-12-28', '01S.04_M00_S3_Foros de apoyo_HTML', '<p><a href=\"https://prope1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1664\" target=\"_blank\">Recurso de referencia</a><br><br>Producción: Jorge<br>Corrección de estilo: Abraham<br>QA: Saray<br></p>', 'https://drive.google.com/drive/u/0/folders/1pXzLbCU87bL6oZ-g2ZAjujLACmfxFgVa', 'https://drive.google.com/drive/u/0/folders/1jU8flYC6yl1xwvUYBRpAb9GPvyNYuFSh', 'normal', 'primary', 'general', 'completo'),
(153, 1, 12, NULL, NULL, 'si', '2023-01-30', '2023-02-11', NULL, '01S.04_M07_S1_The gerund_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1435\" target=\"_blank\" style=\"font-family: sans-serif;\"><u>Recurso de referencia</u></a><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Manu</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Laura</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1hddlQB1GHNKURC32KvBxf0BPPAarAGW9', 'https://drive.google.com/drive/u/0/folders/1-wzusFtbpL1tq4r3a4pEuV-6d-vBzKVO', 'normal', 'primary', 'general', 'pendiente'),
(154, 1, 12, NULL, NULL, 'si', '2023-01-30', '2023-02-11', NULL, '01S.04_M07_S1_Trying something new_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1440\" target=\"_blank\">Recurso de referencia</a><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Manu</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Abraham</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1gkVMbM0PV4FWYFm0p6dnpUUEmGaslKa2', 'https://drive.google.com/drive/u/0/folders/1QdwX1rx_qXQayYFy8Gh2LAjE7a3p3TyO', 'normal', 'primary', 'general', 'en desarrollo'),
(155, 1, 12, 0, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S1_What was happening when you…?_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1445\" target=\"_blank\"><u>Recurso de referencia</u></a><br></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Manu</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Laura</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/19pV6yaoRUKx0AK5CV2PnLkSmN4MyIYrG', 'https://drive.google.com/drive/u/0/folders/1dYMN0FcXRQMF5t8VNAGbKSIuRP5x7SX_', 'normal', 'primary', 'general', 'pendiente'),
(156, 1, 12, NULL, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S1_When and while_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1448\" target=\"_blank\"><u>Recurso de referencia</u></a><br></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Manu</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Abraham</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1m1yfKydeLzfpZVjpKJumQb492BbrMgDk', 'https://drive.google.com/drive/u/0/folders/15DqkNQYtfDc4IxkwRIfnth7d8_CJ89AD', 'normal', 'primary', 'general', 'pendiente'),
(157, 1, 12, 0, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S1_Life stages_HTML', '<p><u><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1452\" target=\"_blank\">Recurso de referencia</a></u></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Sam</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Laura</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1pkh2G7SYtBci22wyBsDUE12BiAqiwxFI', 'https://drive.google.com/drive/u/0/folders/1I55qhvkDqqo-qDAgQ-uT2H3He6-44ych', 'normal', 'primary', 'general', 'en desarrollo'),
(158, 1, 12, 0, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S1_Time expressions_SCORM', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1453\" target=\"_blank\"><u>Recurso de referencia</u></a></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Sam</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Abraham</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br><br></p>', 'https://drive.google.com/drive/u/0/folders/1tRZn4xrb9CQ0XRDyWx6ImSUndhXPEupU', 'https://drive.google.com/drive/u/0/folders/1I-dNScmFjDocOZ537aNG-7z4iFdeMBHv', 'normal', 'primary', 'general', 'en desarrollo'),
(159, 1, 12, NULL, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S1_To practice further_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1454\" target=\"_blank\"><u>Recurso de referencia</u></a></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Sam</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Laura</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p><p><br></p>', 'https://drive.google.com/drive/u/0/folders/1ZMfj9x5zrt2YgQjqm4chgpUpoMJ57opq', 'https://drive.google.com/drive/u/0/folders/1t0k2WP78vzX5G-2WtdNfxrwAoRulfvtB', 'normal', 'primary', 'general', 'en desarrollo'),
(160, 1, 12, 0, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S1_To learn further_HTML', '<p><u><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1455\" target=\"_blank\">Recurso de referencia</a></u></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Sam</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Abraham</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1x3KSgC9p0zAd6-150USPX_j8gk9LiGex', 'https://drive.google.com/drive/u/0/folders/1AQ67NPBBgKIDvO9hLLAkGR4VtsdjOVtl', 'normal', 'primary', 'general', 'en desarrollo'),
(161, 1, 12, 0, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S1_Prepositions of time_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1456\" target=\"_blank\"><u>Recurso de referencia</u></a><br></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Sam</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Laura</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1f9DCA5D8ut4uychYzjip55Yt5Kd0fdF9', 'https://drive.google.com/drive/u/0/folders/1HkssAfZ32nSAOq4gI4YybazfxttPIU-0', 'normal', 'primary', 'general', 'en desarrollo'),
(162, 1, 12, NULL, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S2_Memories_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1490\" target=\"_blank\"><u>Recurso de referencia</u></a><br></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Sam</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Abraham</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1kzhqJ92yzdIj69-cHlT5Q6lvRFWj32HJ', 'https://drive.google.com/drive/u/0/folders/1ntNNf1c-uh4EC6jmJKQzSZUhyjxcT-PD', 'normal', 'primary', 'general', 'en desarrollo'),
(163, 1, 12, NULL, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S2_To learn further_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1491\" target=\"_blank\"><u>Recurso de referencia</u></a><br></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Gonzalo</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Laura</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1QVhlUrbZc8JQZOTBJe631vnHPXZZtwJf', 'https://drive.google.com/drive/u/0/folders/1peXDe2NEnp2RAZrktaj-BPKGaeXfAg7k', 'normal', 'primary', 'general', 'en desarrollo'),
(164, 1, 12, NULL, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S2_To practice further_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1492\" target=\"_blank\"><u>Recurso de referencia</u></a><br></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Gonzalo</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Abraham</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1vbAPsppG18iIYKvtkNGyn4f6FHdlskid', 'https://drive.google.com/drive/u/0/folders/1FVkY2l1Z_9UUpQ14n7r8WHizxuX0Jcub', 'normal', 'primary', 'general', 'en desarrollo'),
(165, 1, 12, NULL, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S2_My lifetime_SCORM', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1494\" target=\"_blank\"><u>Recurso de referencia</u></a><br></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Gonzalo</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Abraham</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1R8PURFhNyl2PYsMV3w01PhCpTaYvgP3m', 'https://drive.google.com/drive/u/0/folders/1UeM5Vfaze3UtzDR2tBY9izrgc6WV8RrC', 'normal', 'primary', 'general', 'en desarrollo'),
(166, 1, 12, NULL, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S3_I will do it_SCORM', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/scorm/view.php?id=1506\" target=\"_blank\"><u>Recurso de referencia</u></a><br></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Gonzalo</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Abraham</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1G2BLfv31LekjoLZpW3RmsUG_TfaeUNOv', 'https://drive.google.com/drive/u/0/folders/1HG2AR8gz8g8lF7E_sdCEO2V3xoUu6rKy', 'normal', 'primary', 'general', 'en desarrollo'),
(167, 1, 12, NULL, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S3_What are you going to do?_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1509\" target=\"_blank\"><u>Recurso de referencia</u></a><br></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Gonzalo</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Abraham</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1I1arV7azeVVHJefomD77LRaUgsFL1aIW', 'https://drive.google.com/drive/u/0/folders/1AoM1PbDbAKGSKNGDDESDXeyagCtYRVpo', 'normal', 'primary', 'general', 'en desarrollo'),
(168, 1, 12, NULL, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S3_Would you like to…?_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1515\" target=\"_blank\"><u>Recurso de referencia</u></a><br></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Gonzalo</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Abraham</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/14Q__reHbzcNtfS4mPyc_BPBkFkF_2npl', 'https://drive.google.com/drive/u/0/folders/1fgv1-Pj0KgEqkMcm6gPq_Vkw5bBAIjfg', 'normal', 'primary', 'general', 'en desarrollo'),
(169, 1, 12, NULL, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S3_To learn further_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1522\" target=\"_blank\"><u>Recurso de referencia</u></a><br></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Sam</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Laura</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1LirFUMmxy3ybm7N297Z4u2sLnEsl74bG', 'https://drive.google.com/drive/u/0/folders/1qCNYwgnbeHQ0_3MjB21oSt81R60-Ans-', 'normal', 'primary', 'general', 'en desarrollo'),
(170, 1, 12, 0, NULL, 'si', '2023-01-30', '2023-02-18', NULL, '01S.04_M07_S3_To practice further_HTML', '<p><a href=\"https://g36c1.prepaenlinea.sep.gob.mx/mod/page/view.php?id=1523\" target=\"_blank\"><u>Recurso de referencia</u></a><br></p><p><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Gonzalo</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Laura</span><br style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"caret-color: rgb(121, 131, 143); color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Saray</span><br></p>', 'https://drive.google.com/drive/u/0/folders/1hAvVLPl_gKaOVRftThzq28ekeiWjb0UA', 'https://drive.google.com/drive/u/0/folders/1Hs27DX9aWEud7vZodZqAlbuXKY0vpUHS', 'normal', 'primary', 'general', 'en desarrollo'),
(171, 1, 0, 0, NULL, 'si', '2023-01-31', '2023-03-15', '2023-03-30', '09C.04_Abril 07 - Día Mundial de la Salud', '<p>Guion: Mariana</p><p>Corrección de estilo: Abraham</p><p>Producción: Joe </p>', 'https://drive.google.com/drive/folders/1wStu3sb77AnKkrQw6DgLiljXKshVy0B3?usp=share_link', 'https://drive.google.com/drive/folders/1zMJY-7Uv_u4t7riTgtWhZMhZfe0BgLUA?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(172, 1, 0, 0, NULL, 'si', '2023-01-31', '2023-03-15', '2023-03-30', '09C.04 Abril 19 Muerte de Octavio Paz', '<p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-family: \"Helvetica Neue\";\">Guion: Mariana</p><p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-family: \"Helvetica Neue\";\">Corrección de estilo: Abraham</p><p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-family: \"Helvetica Neue\";\">Producción: Joe</p><p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-family: \"Helvetica Neue\";\"><br></p><p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-family: \"Helvetica Neue\";\"><br></p>', 'https://drive.google.com/drive/folders/1QFmKC09xPaF3fDqEuEtN_nRQ6AKtfEC1?usp=share_link', 'https://drive.google.com/drive/folders/1d2uv6V8uZFZDOTqdcz2inDy-qQowXyYF?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(173, 1, 0, 0, NULL, 'si', '2023-01-31', '2023-03-15', NULL, '09C.04_Abril 22 - Día Internacional de la Madre Tierra', '<p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-family: \"Helvetica Neue\";\"><span style=\"font-size: 14px;\">Guion: Mariana</span></p><p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-family: \"Helvetica Neue\";\"><span style=\"font-size: 14px;\">Corrección de estilo: Abraham</span></p><p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-family: \"Helvetica Neue\";\"><span style=\"font-size: 14px;\">Producción: Joe</span><span style=\"font-size: 14px;\">﻿</span></p>', 'https://drive.google.com/drive/folders/1-krRxfdNVg4SlZyuaZGdcyTeLRX-HZNt?usp=share_link', 'https://drive.google.com/drive/folders/1Fv97WnQwI0bjgTsLnrQU1lhL8BH1q8FE?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(174, 1, 0, 0, NULL, 'si', '2023-01-31', '2023-03-15', NULL, '09C.04_Abril 30 - Día del niño', '<p>Comunicación: Mariana</p><p>Corrección de estilo: Abraham</p><p>Producción: Joe</p><p><br></p>', 'https://drive.google.com/drive/folders/1jp3J_2wvIMm25afxqO4KVhYv1Wwe9N9x?usp=share_link', 'https://drive.google.com/drive/folders/1E85-anEAIzBVJfAUMPOfcM8qBBywPfz_?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(175, 1, 0, 0, NULL, 'si', '2023-02-09', '2023-02-15', NULL, 'Propuesta RED-Moodle 4', '<p>¡Hola, Nekh!</p><p>Comparto contigo la asignación para que puedas generar una propuesta de trabajo del proyecto.</p><p><br></p><p>Cualquier cosa estaré pendiente</p><p>Saludos</p>', '', 'https://drive.google.com/drive/folders/1Hz5W5_8eYPNsv3aD7s6sCw4Df9gkoH7b?usp=sharing', 'normal', 'primary', 'general', '20'),
(177, 1, 18, 0, NULL, 'si', '2023-02-09', '2023-02-15', NULL, 'Estilos para Plantillas de RED-WEB ', '<p><br></p>', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(178, 1, 18, NULL, NULL, 'si', '2023-02-13', '2023-02-17', NULL, '01S.04_Elementos_Generales_Styleboard_M1', '<p>Hola Danna, te dejo la tarea que comentamos el día de ayer.</p><p>Saludos.</p>', '', 'https://drive.google.com/drive/folders/1NBhFo8TiRmFg5sVsNrSg37V62w5qFwHj?usp=sharing', 'normal', 'primary', 'general', 'completo'),
(179, 1, 18, 0, NULL, 'si', '2023-02-10', '2023-02-14', '2023-02-15', '01S.04_Moodboards_M1', '<p>Hola, comparto la tarea para que puedan subir las propuestas de moodboard.</p><p>Saludos :)</p><p><br></p>', '', 'https://drive.google.com/drive/folders/1SQNYCN2sAuXFNHbEtZvvMa3_DZlAraOH?usp=sharing', 'normal', 'primary', 'general', 'completo'),
(180, 1, 18, 0, NULL, 'si', '2023-02-10', '2023-02-14', '2023-02-15', '01S.04_Moodboards_M1', '<p>Hola, comparto la tarea para que puedan subir las propuestas de moodboard.</p><p>Saludos :)</p><p><br></p>', '', 'https://drive.google.com/drive/folders/1SQNYCN2sAuXFNHbEtZvvMa3_DZlAraOH?usp=sharing', 'normal', 'primary', 'general', 'completo'),
(181, 1, 18, 0, NULL, 'si', '2023-02-10', '2023-02-14', '2023-02-15', '01S.04_Moodboards_M1', '<p>Hola, comparto la tarea para que puedan subir las propuestas de moodboard.</p><p>Saludos :)</p><p><br></p>', '', 'https://drive.google.com/drive/folders/1SQNYCN2sAuXFNHbEtZvvMa3_DZlAraOH?usp=sharing', 'normal', 'primary', 'general', 'completo'),
(182, 1, 30, 0, NULL, 'si', '2023-02-14', '2023-02-28', NULL, '09C.04_Módulo 2_Servicios escolares', '', 'https://drive.google.com/drive/folders/1vZz8268_ilLesy6UVYdjyP_Ede_evnxs?usp=share_link', 'https://drive.google.com/drive/folders/1cM--851R8u2X1nYHb0qspdBMnubN8BTn?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(183, 1, 30, 0, NULL, 'si', '2023-02-14', '2023-02-28', NULL, '09C.04_Módulo 5_Expediente digital I', '', 'https://drive.google.com/drive/folders/1v8CVsa2ox9VDRAdz3TBxY79t0ZA4aIp2?usp=share_link', 'https://drive.google.com/drive/folders/14gBa7T0-Z9VPZpoGLzxobZFl_lDRhLZZ?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(184, 1, 30, 0, NULL, 'si', '2023-02-14', '2023-02-28', NULL, '09C.04_Módulo 6_Expediente digital II', '', 'https://drive.google.com/drive/folders/1ELuDAxrWIkVyg9Qq3H116HKufsyF7Uj3?usp=share_link', 'https://drive.google.com/drive/folders/1HrjLUuGMWJpaAnyWRFnCs-_rmNN9TYSi?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(185, 1, 18, 0, NULL, 'si', '2023-02-15', '2023-02-20', NULL, '01S.04_Cromatica_Modulo1_2023', '<p>Hola Yan, comparto la asignación para que trabajes en la paleta de M1.</p><p>Saludos</p>', '', 'https://drive.google.com/drive/folders/1uw0q0QlpWQaC0YXh3243KeRNzGVz-fYz?usp=sharing', 'normal', 'primary', 'general', 'en desarrollo'),
(186, 1, 18, 0, NULL, 'si', '2023-02-15', '2023-02-17', '2023-02-23', '01S.04_Propuesta_Texturas_M1', '<p>Comparto tarea para trabajar en ella.</p><p>Yan podrías subir tu archivo editable en la carpeta :)</p><p>Gracias </p>', 'https://drive.google.com/drive/folders/1mb7kme4axEqOAmHhk-YqPk-rNQoZM9r4?usp=sharing', 'https://drive.google.com/drive/folders/1EkM-DCfIFJmmiEVrnDCXvC3iGX8nlyuw?usp=sharing', 'normal', 'primary', 'general', 'completo'),
(187, 1, 32, 0, NULL, 'si', '2023-02-27', '2023-03-06', NULL, 'Conoce Prepa en Línea-SEP', '<p><a href=\"https://docs.google.com/document/d/1yBoFm7mrgEOuyqVPkE-St6WtrbwZ6rUPQSpJhT3I0EY/edit?usp=sharing\" target=\"_blank\"><b>Archivo</b></a></p><p>Área responsable del recurso - DTE<br><br>Producción: Gonzalo<br>Corrección de estilo: Liz<br>QA: Gaby<br></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(188, 1, 32, 0, NULL, 'si', '2023-02-27', '2023-03-06', NULL, 'Modelo educativo', '<p><b><a href=\"https://docs.google.com/document/d/1dDal6zeIWBlsMEshXgzyUCZakcjyJTsay33z2mSFQwQ/edit#heading=h.ifknqf1fesgx\" target=\"_blank\">Archivo</a></b></p><p>Área responsable del contenido - <span style=\"font-family: Roboto, Arial; font-size: 12pt;\">DSAyDC</span></p><p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Producción: Gonzalo</span><br style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Corrección de estilo: Liz</span><br style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">QA: Gaby</span><br></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(189, 1, 32, 0, NULL, 'si', '2023-02-27', '2023-03-06', NULL, 'Requerimientos tecnológicos', '<p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><a href=\"https://docs.google.com/document/d/14EEdyFPbZ3uaynoAFtLUJRXXQQi6TDNA8nGj718HwVg/edit?usp=sharing\" target=\"_blank\" style=\"color: rgb(121, 131, 143); text-decoration: none;\"><span style=\"font-weight: bolder;\">Archivo</span></a></p><p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Área responsable del recurso - DTE<br><br>Producción: Gonzalo<br>Corrección de estilo: Liz<br>QA: Gaby</p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(190, 1, 32, 0, NULL, 'si', '2023-02-27', '2023-03-06', NULL, 'Aspirantes', '<p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><a href=\"https://docs.google.com/document/d/1xGhKcr0zOAmTYYOiuOFmM4AA5SjpKXZyt69H5X5jX-0/edit#\" target=\"_blank\" style=\"color: rgb(121, 131, 143); text-decoration: none;\"><span style=\"font-weight: bolder;\">Archivo</span></a></p><p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Área responsable del recurso - <span data-sheets-value=\"{\"1\":2,\"2\":\"DSAyDC\"}\" data-sheets-userformat=\"{\"2\":14979,\"3\":{\"1\":0},\"4\":{\"1\":2,\"2\":16777215},\"10\":1,\"12\":0,\"14\":{\"1\":2,\"2\":0},\"15\":\"Roboto, RobotoDraft, Helvetica, Arial, sans-serif\",\"16\":12}\" style=\"color: rgb(0, 0, 0); font-size: 12pt; font-family: Roboto, Arial;\">DSAyDC</span><br><br>Producción: Gonzalo<br>Corrección de estilo: Liz<br>QA: Gaby</p><p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><br></p><p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><br></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(191, 1, 32, 0, NULL, 'si', '2023-02-27', '2023-03-06', NULL, 'Estudiantes', '<p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><a href=\"https://docs.google.com/document/d/1Ap3dhtDZz_PzwUhgDygI9qvcO0yseRaw-EJfTPw6WUs/edit#\" target=\"_blank\" style=\"color: rgb(121, 131, 143); text-decoration: none;\"><span style=\"font-weight: bolder;\">Archivo</span></a></p><p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Área responsable del recurso - <span data-sheets-value=\"{\"1\":2,\"2\":\"DSAyDC\"}\" data-sheets-userformat=\"{\"2\":14979,\"3\":{\"1\":0},\"4\":{\"1\":2,\"2\":16777215},\"10\":1,\"12\":0,\"14\":{\"1\":2,\"2\":0},\"15\":\"Roboto, RobotoDraft, Helvetica, Arial, sans-serif\",\"16\":12}\" style=\"color: rgb(0, 0, 0); font-size: 12pt; font-family: Roboto, Arial;\">DSAyDC</span><br><br>Producción: Gonzalo<br>Corrección de estilo: Liz<br>QA: Gaby</p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(192, 1, 32, 0, NULL, 'si', '2023-02-27', '2023-03-06', NULL, 'Asesores virtuales', '<p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><a href=\"https://docs.google.com/document/d/1J5Slnaa5YgXEWH_9PfLG-GnVa5KwldBQLfwqhD_fH-U/edit#\" target=\"_blank\" style=\"color: rgb(121, 131, 143); text-decoration: none;\"><span style=\"font-weight: bolder;\">Archivo</span></a></p><p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Área responsable del recurso - <span style=\"color: rgb(0, 0, 0); font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; font-size: 13px; white-space: pre-wrap;\">DSAyDC</span><br><br>Producción: Gonzalo<br>Corrección de estilo: Liz<br>QA: Gaby</p><p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><br></p><p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><br></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(193, 1, 32, 0, NULL, 'si', '2023-02-27', '2023-03-06', NULL, 'Tutores escolares', '<p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><a href=\"https://docs.google.com/document/d/1CVWTyZ8-rWAM1b-qHhkoqf87Z44nJ6fmtEoV4pCGyzk/edit#\" target=\"_blank\" style=\"color: rgb(121, 131, 143); text-decoration: none;\"><span style=\"font-weight: bolder;\">Archivo</span></a></p><p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Área responsable del recurso - <span data-sheets-value=\"{\"1\":2,\"2\":\"DSAyDC\"}\" data-sheets-userformat=\"{\"2\":14979,\"3\":{\"1\":0},\"4\":{\"1\":2,\"2\":16777215},\"10\":1,\"12\":0,\"14\":{\"1\":2,\"2\":0},\"15\":\"Roboto, RobotoDraft, Helvetica, Arial, sans-serif\",\"16\":12}\" style=\"color: rgb(0, 0, 0); font-size: 12pt; font-family: Roboto, Arial;\">DSAyDC</span><br><br>Producción: Gonzalo<br>Corrección de estilo: Liz<br>QA: Gaby</p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(194, 1, 32, 0, NULL, 'si', '2023-02-27', '2023-03-06', NULL, 'Supervisores para el acompañamiento y la mejora educativa (SAME)', '<p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><a href=\"https://docs.google.com/document/d/1NgnqfYZPfxor7qdb-fL6QtCETznKjM4DGiLNGqlamXM/edit#\" target=\"_blank\" style=\"color: rgb(121, 131, 143); text-decoration: none;\"><span style=\"font-weight: bolder;\">Archivo</span></a></p><p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Área responsable del recurso - <span style=\"color: rgb(0, 0, 0); font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; font-size: 13px; white-space: pre-wrap;\">DAyME</span><br><br>Producción: Gonzalo<br>Corrección de estilo: Liz<br>QA: Gaby</p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(195, 1, 32, 0, NULL, 'si', '2023-02-27', '2023-03-06', NULL, 'Responsables de Control Escolar', '<p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\"><a href=\"https://docs.google.com/document/d/1v7RKi88Myj2xVNDQ3rb1aJ65JsCWHYnEsyewf6_u46I/edit#\" target=\"_blank\" style=\"color: rgb(121, 131, 143); text-decoration: none;\"><span style=\"font-weight: bolder;\">Archivo</span></a></p><p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif;\">Área responsable del recurso - DCE<br><br>Producción: Gonzalo<br>Corrección de estilo: Liz<br>QA: Gaby</p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(196, 1, 14, 0, NULL, 'si', '2023-02-28', '2023-04-25', '2023-05-10', '09C.04_Mayo_5_Aniversario_Batalla_Puebla', '<p>Hola Liz, te comparto el <a href=\"https://drive.google.com/drive/folders/1Nrxt-2gOzg4k_Eak3nHtgeyc4xcy2GOo?usp=share_link\" target=\"_blank\">guion</a> para su primera revisión.</p><p>Saludos.</p>', 'https://drive.google.com/drive/folders/1oneEH085f0JAMa1E-eMnS-ksiNHqbIJk?usp=share_link', 'https://drive.google.com/drive/folders/1wCdJVPZMFXxwlVEW1R4JanPkvPupKE15?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(197, 1, 14, 0, NULL, 'si', '2023-02-28', '2023-04-25', NULL, '09C.04_Mayo_10_Día_de_la_Madre', '<p>Hola Liz, buenos días.</p><p>Te comparto el <a href=\"https://drive.google.com/drive/folders/1byR3NpM9ZE2llbLjxpQsspPa8g3EojtF?usp=share_link\" target=\"_blank\">guion</a> para tu revisión, saludos.</p>', 'https://drive.google.com/drive/folders/1VVFdKlSDRVHKAcnl9Za9H3crVfeAs5zx?usp=share_link', 'https://drive.google.com/drive/folders/1rx_-qtBFFgmTZR0mTq453S5XRrD4SEu1?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(198, 1, 14, 0, NULL, 'si', '2023-02-28', '2023-04-25', NULL, '09C.04_Mayo_15_Día_del_Maestro', '<p>Buen día Liz :)</p><p>¿Me ayudarías con la revisión del <a href=\"https://drive.google.com/drive/folders/1B9H7Pa1WBBnI83xR21Tpgav6g9EkI_JI?usp=share_link\" target=\"_blank\">guion</a>?</p>', 'https://drive.google.com/drive/folders/1ySf8t-TP6mYtv9lgZJsYYAgNDhuVDLtL?usp=share_link', 'https://drive.google.com/drive/folders/1yT8S2YwWXRcvAU8r1-DiYLS-EN42dsCu?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(199, 1, 14, 0, NULL, 'si', '2023-02-28', '2023-04-25', NULL, '09C.04_Mayo_17_Día_Mundial_Internet', '<p>Hola Liz, buen día.</p><p>Te asigno el <a href=\"https://drive.google.com/drive/folders/1u_FS9c00dLAB5_ngW0_emSZ3Pc6MWxyM?usp=share_link\" target=\"_blank\">guion</a> para su primera revisión. Saludos :)</p>', 'https://drive.google.com/drive/folders/15FeZNeTJ60cbPee4fSjOOSKxY-4sERKH?usp=share_link', 'https://drive.google.com/drive/folders/1dUdfq1bgPSy0VUkhhZdo0kSHRXf2LU-E?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(200, 1, 14, 0, NULL, 'si', '2023-02-28', '2023-04-25', NULL, '09C.04_Mayo_21_Día_Mundial_Diversidad_Cultural', '<p>Buenos días Liz :)</p><p>¿Me ayudas a revisar el siguiente <a href=\"https://drive.google.com/drive/folders/1dOdTUHkFGSUmUsQ7q2WoFu9BD5ew04HB?usp=share_link\" target=\"_blank\">guion</a>?</p>', 'https://drive.google.com/drive/folders/1Av0FGm-ss8IdkP3vEW-JpULvV3Q_Y-4V?usp=share_link', 'https://drive.google.com/drive/folders/1x9Kmz8WMvtpTrYLgxSbk64KjuNXwABGj?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(201, 1, 14, 0, NULL, 'si', '2023-02-28', '2023-04-25', '2023-05-10', '09C.04_Mayo_23_Día_del_Estudiante', '<p>Liz, buenos días :)</p><p>Te comparto el <a href=\"https://drive.google.com/drive/folders/1Hq29qH8lAjnDeANvnui4jgmsOwmdMAj9?usp=share_link\" target=\"_blank\">guion</a> para su primera revisión, saludos.</p>', 'https://drive.google.com/drive/folders/1bhOvFRBp4wvkKLCvfnIlBWcNyY8CFFzI?usp=share_link', 'https://drive.google.com/drive/folders/1FKQKOwClki5P2pgXetMkCT5ne039OQej?usp=share_link', 'normal', 'primary', 'general', 'completo'),
(202, 1, 18, NULL, NULL, 'si', '2023-03-13', NULL, NULL, '03C.07_Lista_de_cotejo_RED_Editables_VF', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(203, 1, 39, 0, NULL, 'si', '2023-03-15', '2023-03-28', NULL, 'Cronograma', '<p>2023<br>GENERAL - 28 de marzo<br>1. Cronograma general<br>2. Crear justificación<br><br>DIAGNOSTICO (Direcciones)<br>1. Crear el formulario (asignar enlace de comunicación y asesor por dirección, establecer relación, actividades y perfil - incluir opción para sesión presencial)(COM-PROD)<br>2. Sesión con directores (argumentar la importancia de la implementación)<br>3. Implementación del formulario<br>4. Interpretación de resultados<br>5. Sesión con enlaces de comunicación (sesiones de capacitación e información)<br><br>PAQUETES GRÁFICOS<br>1. Plan satisfacer las necesidades del formulario (armar paquete de insumos de identidad)<br>2. Entrega de paquetes<br>3. Sesiones informativas (COM-PROD) con temas generales de identidad y pertenencia (comunidad PL-SEP - finales de año)<br><br>2024<br>1. Sesiones de contexto de cambio de administración<br>2. Taller de implementación de identidad<br>3. Periodo de validación (DTE-temporal 6 meses | Enlaces permanentes, con posibilidad de acercarse a la DTE)<br></p>', 'https://drive.google.com/drive/folders/1YJpB3E1-D99XdXI-dzWGD9eeWGLYdBpg?usp=share_link', '', 'normal', 'primary', 'general', 'en desarrollo'),
(204, 1, 0, NULL, NULL, 'si', '2023-03-23', NULL, NULL, 'Tarea prueba 1', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(205, 1, 0, NULL, NULL, 'si', '2023-03-31', '2023-04-21', NULL, 'Nueva tarea ', '<p>Esta ss una descripción de la tarea</p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(206, 1, 0, NULL, NULL, 'si', '2023-03-31', NULL, NULL, 'Otra tarea', '<p>Descripción de la otra tarea</p>', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(207, 1, 45, NULL, NULL, 'si', '2023-04-03', NULL, NULL, 'M22 S2 Infografia prueba', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(208, 1, 14, 0, NULL, 'si', '2023-04-06', '2023-05-11', NULL, ' 09C.04_Junio_7_Día_de_la_Libertad_de_expresión', '<p><a href=\"https://drive.google.com/drive/folders/1frMxxCrG1o6gAZ7xRp_tXspcVJdenTiG?usp=share_link\" target=\"_blank\">Carpeta</a></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(209, 1, 14, 0, NULL, 'si', '2023-04-06', '2023-05-11', NULL, '09C.04_Junio_20_Día _más_feliz_del_año', '<p><a href=\"https://drive.google.com/drive/folders/1sZGQ3xiOGxHQVBRvdHnKRWWy-arjC8Wk?usp=sharing\" target=\"_blank\">Carpeta</a></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(210, 1, 14, 0, NULL, 'si', '2023-04-06', '2023-05-11', NULL, '09C.04_Junio_30_Día_Mundial_de_las_Redes_Sociales', '<p><a href=\"https://drive.google.com/drive/folders/1mqb0kqrPB1nNZNg0i01wFeUvapr_kQMm?usp=share_link\" target=\"_blank\">Carpeta</a></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(211, 1, 14, 0, NULL, 'si', '2023-04-06', '2023-06-05', NULL, '09C.04_Julio_3_Las_mujeres_mexicanas_votan_por_primera_vez', '<p><a href=\"https://drive.google.com/drive/folders/1JSPA9iNJRiHKps4tl3vlUQfDhVddNdmv?usp=share_link\" target=\"_blank\">Carpeta</a></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(212, 1, 14, 0, NULL, 'si', '2023-04-06', '2023-06-05', NULL, '09C.04_Julio_15_Día_Mundial_Habilidades_Juventud', '<p><a href=\"https://drive.google.com/drive/folders/1dXfiKgdJGzK3HmE22eVR5_9ru3YpwD-g?usp=share_link\" target=\"_blank\">Carpeta</a></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(213, 1, 14, 0, NULL, 'si', '2023-04-06', '2023-06-05', NULL, '09C.04_Julio_30_Día_internacional_amistad', '<p><a href=\"https://drive.google.com/drive/folders/1iK5iXlgXfNacjGLkfdds7JgB-rzlJtS6?usp=share_link\" target=\"_blank\">Carpeta</a></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(214, 1, 14, 0, NULL, 'si', '2023-04-06', '2023-05-11', NULL, '09C.04_Junio_18_Día_del_Padre', '<p><a href=\"https://drive.google.com/drive/folders/1VoRkTK0vr8BmvSOq_wzrQRkrIIxLl_Qb?usp=sharing\" target=\"_blank\">Carpeta</a></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(215, 1, 14, 0, NULL, 'si', '2023-04-07', '2023-07-05', NULL, ' 09C.04_Agosto_8_Natalicio_de_Emiliano_Zapata ', '<a href=\"https://drive.google.com/drive/u/0/folders/1MoHguEDMhkbWuyrz9JxyWGyGqolqRC-2\" target=\"_blank\">Editables&nbsp; &nbsp;</a> &nbsp; &nbsp; <a href=\"https://drive.google.com/drive/u/0/folders/1QkiDtSZNAPdo-s99b9Bs1RX1QP7o9b7i\" target=\"_blank\">&nbsp;Entregables</a>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(216, 1, 14, 0, NULL, 'si', '2023-04-07', '2023-07-05', NULL, ' 09C.04_Agosto_9_Día_Internacional_de_los_Pueblos_Indígenas', '<p><a href=\"https://drive.google.com/drive/u/0/folders/1S9Cgylt-dJmVRhYNvEambdAWDaa-XL_F\" target=\"_blank\">Editables</a>&nbsp; &nbsp; <a href=\"https://drive.google.com/drive/u/0/folders/1uGUqgEz64DJtatqFCal9c0K7rwASCT59\" target=\"_blank\">&nbsp; &nbsp;Entregables</a></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(217, 1, 14, 0, NULL, 'si', '2023-04-07', '2023-07-05', NULL, ' 09C.04_Agosto_12_Día_Internacional_de_la _Juventud', '<p><a href=\"https://drive.google.com/drive/u/0/folders/1tWQNK-9E3Lten2qxILQNqybN97ISl9JL\" target=\"_blank\">Editables</a>&nbsp; &nbsp;<a href=\"https://drive.google.com/drive/u/0/folders/1VGAqoxJbPn8D_LMeZB_JKBsgNu9n5v2y\" target=\"_blank\"> Entregables</a></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(218, 1, 14, 0, NULL, 'si', '2023-04-07', '2023-08-04', NULL, ' 09C.04_Septiembre_8_Día_Internacional_de_la_Alfabetización', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(219, 1, 14, 0, NULL, 'si', '2023-04-07', '2023-08-04', NULL, ' 09C.04_Septiembre_24_Noveno_Aniversario_de_Prepa_en_Línea-SEP', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(220, 1, 14, NULL, NULL, 'si', '2023-04-07', '2023-09-05', NULL, ' 09C.04_Octubre_2_Conmemoración_de_la_matanza_de_Tlatelolco_en_1968', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(221, 1, 14, 0, NULL, 'si', '2023-04-07', '2023-09-05', NULL, ' 09C.04_Octubre_10_Día_Mundial_de_la_Salud_Mental', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(222, 1, 14, 0, NULL, 'si', '2023-04-07', '2023-09-05', NULL, '09C.04_Octubre_12_Día_de_la_Resistencia_Indígena ', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(223, 1, 14, NULL, NULL, 'si', '2023-04-07', '2023-09-05', NULL, ' 09C.04_Octubre_19_Día_Internacional_de_la_Lucha_contra_el_Cáncer_de_Mama', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(224, 1, 14, NULL, NULL, 'si', '2023-04-07', '2023-10-06', NULL, ' 09C.04_Noviembre_2_Día_de_Muertos', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(225, 1, 14, NULL, NULL, 'si', '2023-04-07', '2023-10-06', NULL, ' 09C.04_Octubre_3_Día_Internacional_contra_la_Violencia_y_el_Acoso_en_la_escuela_incluido_el_Ciberacoso', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(226, 1, 14, NULL, NULL, 'si', '2023-04-07', '2023-10-06', NULL, ' 09C.04_Noviembre_20_113_Aniversario_del_inicio_de_la_Revolución_Mexicana', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(227, 1, 14, NULL, NULL, 'si', '2023-04-07', '2023-10-06', NULL, ' 09C.04_Noviembre_25_Día_Internacional_de_la_Eliminación_de_la_Violencia_contra_la_Mujer', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(228, 1, 14, 0, NULL, 'si', '2023-04-07', '2023-11-06', NULL, ' 09C.04_Diciembre_2_Día_Internacional_para_la_Abolición_de_la_Esclavitud', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(229, 1, 14, NULL, NULL, 'si', '2023-04-07', '2023-11-06', NULL, '09C.04_Diciembree_10_Día_Mundial_de_los_Derechos_Humanos', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(230, 1, 14, NULL, NULL, 'si', '2023-04-07', '2023-11-06', NULL, ' 09C.04_Diciembre_24_Fiestas_decembrinas', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(231, 1, 14, NULL, NULL, 'si', '2023-04-07', '2023-11-06', NULL, '09C.04_Diciembre_31_Año_Nuevo', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(232, 1, 32, NULL, NULL, 'si', '2023-04-10', NULL, NULL, 'Estatus actualización ', '<p><a href=\"https://docs.google.com/document/d/1aFtqgT_Tn9fHz2NY8A0jR12sDE30k-Ed/edit\" target=\"_blank\">Actualización de contenidos</a> del portal de PL-SEP</p>', '', '', 'normal', 'primary', 'general', 'en desarrollo'),
(233, 1, 32, 0, NULL, 'si', '2023-04-11', '1969-12-31', NULL, 'Asesores en la didáctica disciplinar', '<p><a href=\"https://docs.google.com/document/d/1LjUnhR94DIy_ARx7OWXK5KuJElpmFqvDztLKU277jMI/edit?usp=sharing\" target=\"_blank\">Archivo</a></p>', '', '', 'normal', 'primary', 'general', 'pendiente');
INSERT INTO `tareas` (`ID_TAREA`, `ID_AREA`, `ID_PROYECTO`, `ID_TAREA_PADRE`, `ID_USUARIO`, `TAREA_DIA_COMPLETO`, `FECHA_INICIO`, `FECHA_FINAL`, `FECHA_ENTREGA`, `TAREA_TITULO`, `TAREA_DESCRIPCION`, `TAREA_ENLACE_ENTREGABLE`, `TAREA_ENLACE_EDITABLES`, `PRIORIDAD`, `COLOR`, `TIPO`, `ESTADO`) VALUES
(234, 1, 4, 0, NULL, 'si', '2023-05-07', '2023-05-09', NULL, 'fisica aplicada', '<blockquote style=\"text-align: center;\"><u><b>Que es la Fisica Aplicada?</b></u></blockquote><p style=\"text-align: justify; \"><b style=\"color: rgb(32, 33, 34); font-size: 14px;\">Física aplicada</b><span style=\"color: rgb(32, 33, 34); font-size: 14px;\"> es un término genérico que indica la parte de la física que se interesa particularmente por el uso de </span><a href=\"https://es.wikipedia.org/wiki/Tecnolog%C3%ADas\" class=\"mw-redirect\" title=\"Tecnologías\" style=\"text-decoration: none; color: rgb(51, 102, 204); background: none rgb(255, 255, 255); overflow-wrap: break-word; font-family: sans-serif; font-size: 14px; font-weight: 400;\">tecnologías</a><span style=\"color: rgb(32, 33, 34); font-size: 14px;\">. \"Aplicada\" se distingue de \"pura\" mediante una sutil combinación de factores como la </span><a href=\"https://es.wikipedia.org/wiki/Utilidad_(econom%C3%ADa)\" title=\"Utilidad (economía)\" style=\"text-decoration: none; color: rgb(51, 102, 204); background: none rgb(255, 255, 255); overflow-wrap: break-word; font-family: sans-serif; font-size: 14px; font-weight: 400;\">motivación</a><span style=\"color: rgb(32, 33, 34); font-size: 14px;\"> de investigación, y la relación entre tecnología y </span><a href=\"https://es.wikipedia.org/wiki/Ciencia\" title=\"Ciencia\" style=\"text-decoration: none; color: rgb(51, 102, 204); background: none rgb(255, 255, 255); overflow-wrap: break-word; font-family: sans-serif; font-size: 14px; font-weight: 400;\">ciencia</a><span style=\"color: rgb(32, 33, 34); font-size: 14px;\">, </span><br></p><p></p>', '', '', 'normal', 'primary', 'general', 'pendiente'),
(235, 1, 46, NULL, NULL, 'si', '2023-05-12', NULL, NULL, '09C.05_Proceso de registro_INFOGRAFIA_G45.png', '', 'https://drive.google.com/file/d/1zgA55-c73hZLkZ5SOY9HIb-ep2FA257x/view?usp=sharing', '', 'normal', 'primary', 'general', 'en desarrollo'),
(236, 1, 46, NULL, NULL, 'si', '2023-05-12', NULL, NULL, '09C.03 Guía_de_registro_2022_G48_VF.pdf', '', 'https://drive.google.com/file/d/1Z03tPYvjKaHx6Cya-C25nduGKwBSyNbX/view?usp=sharing', '', 'normal', 'primary', 'general', 'en desarrollo'),
(237, 1, 46, NULL, NULL, 'si', '2023-05-12', NULL, NULL, 'Guía_de_bienvenida_para_el_estudiante_2023.pdf', '', 'https://drive.google.com/file/d/1H5StKDxe6iGSMVed0K3OIBAgIOvRtOKc/view?usp=sharing', '', 'normal', 'primary', 'general', 'en desarrollo'),
(238, 1, 47, NULL, NULL, 'si', '2023-05-12', NULL, NULL, 'Recurso 1 infográfia', '', '#', '', 'normal', 'primary', 'general', 'pendiente'),
(239, 1, 47, NULL, NULL, 'si', '2023-05-12', NULL, NULL, 'Recurso 2 Guía estudiantes', '', '', '', 'normal', 'primary', 'general', 'pendiente'),
(240, 1, 47, NULL, NULL, 'si', '2023-05-12', NULL, NULL, 'Recurso 3 Video instructivo', '', '', '', 'normal', 'primary', 'general', 'pendiente');

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
(12, 54, 'Se actualizó la información de la tarea', '632b45df945454.17181395', '5c0653d43d92e7.75019474', '2022-09-22 10:27:53', '', '', 'mensaje'),
(13, 54, 'Se actualizó la información de la tarea', '632b45df945454.17181395', '5c0653d43d92e7.75019474', '2022-09-22 10:28:05', '', '', 'mensaje'),
(14, 53, 'Ahora puedo editarlo', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2022-09-22 10:29:04', '', '', 'mensaje'),
(15, 59, 'Se actualizó la información de la tarea', '632b45df945454.17181395', '632b45df945454.17181395', '2022-09-22 10:41:15', '', '', 'mensaje'),
(16, 74, 'Se actualizó la información de la tarea', '632b45df945454.17181395', '632b45df945454.17181395', '2022-09-22 12:09:32', '', '', 'mensaje'),
(42, 63, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-09-28 14:33:57', '', '', 'mensaje'),
(43, 64, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-09-29 12:47:24', '', '', 'mensaje'),
(49, 65, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-03 12:21:09', '', '', 'mensaje'),
(50, 79, '<p>Este es un SCORM</p>', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-03 12:51:03', '', '', 'mensaje'),
(51, 79, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-03 13:23:23', '', '', 'mensaje'),
(52, 78, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-03 13:37:00', '', '', 'mensaje'),
(53, 77, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-03 14:16:17', '', '', 'mensaje'),
(93, 57, '<p>Hola Abraham</p><p>Solicito tu ayuda para la revisión del siguiente <a href=\"https://drive.google.com/drive/u/0/folders/1tlVfZhKy97l8Y-doFJwzIHnnpvLmXfO7\" target=\"_blank\">documento</a>.</p><p>Saludos!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-07 14:20:01', '', '', 'reasignacion'),
(95, 58, '<p>Buen día Abraham!</p><p>Solicito tu ayuda para la revisión del siguiente <a href=\"https://drive.google.com/drive/u/0/folders/1Vv4559DIGbRVCCOorgefmUl2lCtKShRY\" target=\"_blank\">recurso</a>.</p><p>Saludos!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-10 09:59:38', '', '', 'reasignacion'),
(96, 59, '<p>Hola Abraham, buen día.</p><p>Solicito tu ayuda para la revisión del siguiente <a href=\"https://drive.google.com/drive/u/0/folders/16WNS57VU3c-LExTrnZtvKBrUli35WNdL\" target=\"_blank\">recurso.</a></p><p>Saludos!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-11 10:37:22', '', '', 'reasignacion'),
(97, 60, '<p>Abraham buen día!!!</p><p>Ayuda con la revisión del siguiente <a href=\"https://drive.google.com/drive/u/0/folders/1CirY722-_wIcx6xuCyvAbnWM7qBZG3L4\" target=\"_blank\">recurso</a>, porfa.</p><p>Saludos!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-11 11:40:41', '', '', 'reasignacion'),
(98, 91, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-11 15:38:41', '', '', 'mensaje'),
(99, 72, '<p>Abraham, hola.</p><p>Podrías revisar el siguiente <a href=\"https://drive.google.com/drive/u/0/folders/1eYVF5wLwHkiel0pTrkIdUMDtbSpJOWCX\" target=\"_blank\">recurso</a>, porfa?</p><p>Saludos!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-11 15:56:15', '', '', 'reasignacion'),
(100, 92, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-12 10:20:54', '', '', 'mensaje'),
(101, 93, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-12 10:33:05', '', '', 'mensaje'),
(102, 73, '<p>Hola Abraham!</p><p>El siguiente <a href=\"https://drive.google.com/drive/u/0/folders/1J1C2t4W5XOBKpBRwjQV40y9o67XHVahW\" target=\"_blank\">recurso</a> esta listo para tu revisión.</p><p>Saludos!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-13 10:45:52', '', '', 'reasignacion'),
(103, 74, '<p>Buen día Abraham!</p><p>Ayuda porfa con la revisión del siguiente <a href=\"https://drive.google.com/drive/u/0/folders/1lP3dzpaCimTxsWUidaJ_KaLLmOgMNwnp\" target=\"_blank\">recurso</a>.</p><p>Saludos!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-13 11:25:20', '', '', 'reasignacion'),
(104, 86, '<p>Abraham, hola!</p><p>Solicito de tu apoyo para la revisión de este <a href=\"https://drive.google.com/drive/u/0/folders/1yhBYGimX-x4cd4KrkBGTbyce5pGK3d-C\" target=\"_blank\">recurso</a>.</p><p>Saludos!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-13 12:30:23', '', '', 'reasignacion'),
(105, 87, '<p>Saludos Abraham!</p><p>Por favor ayúdame con la revisión del siguiente <a href=\"https://drive.google.com/drive/u/0/folders/18078dqT4aUO7rlAKaxTiI9YiawNrtDtc\" target=\"_blank\">recurso</a>.</p><p>Que tengas buen día!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-13 13:20:09', '', '', 'reasignacion'),
(106, 88, '<p>Abraham buen día!</p><p>Te saludo con gusto, pero además solicito de tu revisión para este <a href=\"https://drive.google.com/drive/u/0/folders/17VMopW-axPIcLl5sCCTpzo7xohOfCSxA\" target=\"_blank\">recurso</a>.</p><p>Gracias!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-13 14:03:24', '', '', 'reasignacion'),
(107, 100, '<p>Abraham, buenas tardes.<br></p><p>Por favor realizar la revisión del siguiente <a href=\"https://drive.google.com/drive/u/0/folders/185jJEqh8LLW8FyZxzKlUzDX70LGfaxj9\" target=\"_blank\">recurso</a>.</p><p>Saludos!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-13 16:15:17', '', '', 'reasignacion'),
(108, 101, '<p>Abraham hola.</p><p>Ayuda para la revisión del siguiente <a href=\"https://drive.google.com/drive/u/0/folders/1ZLSX7GvTUeDAmHDQ4cq1x6o-OSyXaMCm\" target=\"_blank\">documento</a>.</p><p>Saludos<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-13 16:40:58', '', '', 'reasignacion'),
(109, 102, '<p>Abraham, buenas tardes!</p><p>Solicito tu ayuda para la revisión de este <a href=\"https://drive.google.com/drive/u/0/folders/1J4OnfvL6E2r_25mCzIFSemauxM_lTDGy\" target=\"_blank\">recurso</a>.</p><p>Saludos<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-13 16:54:30', '', '', 'reasignacion'),
(110, 114, '<p>Hola Abraham!</p><p>Ayuda para revisar el contenido del siguiente <a href=\"https://drive.google.com/drive/u/0/folders/1s9jAjNjw3TY-jhOtnx559pV_qtsM0lh3\" target=\"_blank\">recurso</a>.</p><p>Saludos!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-13 17:26:35', '', '', 'reasignacion'),
(111, 115, '<p>Abraham!</p><p>Hola buenas tardes, podrías ayudarme a revisar el siguiente <a href=\"https://drive.google.com/drive/u/0/folders/1_hUI8Z_XERst43aArMKkTNYd-45JWVjV\" target=\"_blank\">archivo</a>?</p><p>Saludos<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-13 17:55:10', '', '', 'reasignacion'),
(112, 116, '<p>Abraham, hola!</p><p>Porfa revisar este <a href=\"https://drive.google.com/drive/u/0/folders/1rorWZ3-ki5KeuUb-P1cfsEnLrX3Dgsmr\" target=\"_blank\">recurso</a>.</p><p>Saludos!<br></p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-10-13 18:21:57', '', '', 'reasignacion'),
(113, 105, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-17 15:25:43', '', '', 'mensaje'),
(114, 106, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-17 15:43:56', '', '', 'mensaje'),
(115, 107, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-17 15:50:03', '', '', 'mensaje'),
(116, 119, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-18 10:45:16', '', '', 'mensaje'),
(117, 120, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-18 10:59:29', '', '', 'mensaje'),
(118, 121, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '632b472f497b95.12743913', '2022-10-18 11:13:08', '', '', 'mensaje'),
(135, 63, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:11:13', '', '', 'reasignacion'),
(136, 64, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:11:26', '', '', 'reasignacion'),
(137, 65, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:11:35', '', '', 'reasignacion'),
(138, 79, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:11:51', '', '', 'reasignacion'),
(139, 78, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:12:03', '', '', 'reasignacion'),
(140, 77, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:12:12', '', '', 'reasignacion'),
(141, 91, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:12:27', '', '', 'reasignacion'),
(142, 92, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:12:38', '', '', 'reasignacion'),
(143, 93, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:12:48', '', '', 'reasignacion'),
(144, 105, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:13:08', '', '', 'reasignacion'),
(145, 106, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:13:21', '', '', 'reasignacion'),
(146, 107, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:13:32', '', '', 'reasignacion'),
(147, 119, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:14:12', '', '', 'reasignacion'),
(148, 120, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:14:22', '', '', 'reasignacion'),
(149, 121, '<p><span style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Hola Abraham, te comparto el&nbsp;recurso que se encuentra&nbsp;en la carpeta de Entregables&nbsp;para su revisión, gracias, ¡Saludos!</span><br></p><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-10-21 11:14:32', '', '', 'reasignacion'),
(157, 126, 'Se actualizó la información de la tarea', '632b45df945454.17181395', '5c0653d43d92e7.75019474', '2022-11-09 12:18:20', '', '', 'mensaje'),
(158, 126, 'Se actualizó la información de la tarea', '632b45df945454.17181395', '5c0653d43d92e7.75019474', '2022-11-09 12:18:52', '', '', 'mensaje'),
(159, 126, 'Se actualizó la información de la tarea', '632b45df945454.17181395', '5c0653d43d92e7.75019474', '2022-11-09 12:19:27', '', '', 'mensaje'),
(160, 136, 'Se actualizó la información de la tarea', '632b45df945454.17181395', '632b47e9ba5356.01109483', '2022-11-09 13:34:38', '', '', 'mensaje'),
(161, 143, 'Se actualizó la información de la tarea', '632b45df945454.17181395', '632b45df945454.17181395', '2022-11-09 15:28:07', '', '', 'mensaje'),
(162, 149, '<p>Hola Abraham, buen día, te comparto el recurso para corrección de estilo<br><br><a href=\"https://drive.google.com/drive/u/0/folders/1stOrlQhPlL5mfOh2phsskh-NkCuyvVfV\" target=\"_blank\">Recurso</a><br><br>Gracias, ¡Saludos!</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-11-10 13:22:33', '', '', 'reasignacion'),
(163, 148, '<p>Hola buen día Abraham, te comparto el recurso para corrección de estilo.<br><br><a href=\"https://drive.google.com/drive/u/0/folders/1KndoaNMAMrvuDh_5K2oUZTy6OZy-Qrt2\" target=\"_blank\">Recurso</a><br><br>Gracias.¡Saludos!</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b472f497b95.12743913', '633eef17cc43c6.86654620', '2022-11-10 13:43:02', '', '', 'reasignacion'),
(190, 149, '<p>Hola Lau, te reasigno la tarea.</p><p>Saludos</p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-11-30 10:47:14', '', '', 'reasignacion'),
(191, 149, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-11-30 10:47:32', '', '', 'mensaje'),
(192, 136, '<p>Hola Jorge, no se te olvide esta tarea por favor.&nbsp;</p><p>Saludos :)</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-11-30 11:43:52', '', '', 'reasignacion'),
(193, 148, '<p>Comparto mi <a href=\"https://drive.google.com/file/d/1uiGCKEh7ghTwHC-VWN0dgDIf-XkTRF-p/view\" target=\"_blank\">revisión</a> Saray, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-11-30 11:56:53', '', '', 'reasignacion'),
(196, 128, '<p>Hola Laura!</p><p>El recurso esta listo para tu <a href=\"https://drive.google.com/drive/u/0/folders/1BaqV3OSHdcF6CCgONzITEj2_VnPJOjyb\" target=\"_blank\">revisión</a>.</p><p>Saludos.</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eeece335cd2.35066473', '2022-12-01 12:29:30', '', '', 'reasignacion'),
(197, 129, '<p>Buen día Laura!</p><p>Por favor solicito tu ayuda para la <a href=\"https://drive.google.com/drive/u/0/folders/1BnUxskQB6_cK3xdquFXFZuPMNs3AM4ja\" target=\"_blank\">revisión</a> del siguiente recurso.</p><p>Gracias!</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eeece335cd2.35066473', '2022-12-01 12:40:07', '', '', 'reasignacion'),
(198, 130, '<p>Hola!</p><p>Solicito tu apoyo para la <a href=\"https://drive.google.com/drive/u/0/folders/1nrK2K6yznuoXYW8c0zwbH14JDuBrwnIL\" target=\"_blank\">revisión</a> del siguiente recurso.</p><p>Saludos!</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eeece335cd2.35066473', '2022-12-01 12:41:44', '', '', 'reasignacion'),
(199, 142, '<p>Qué hay Abraham!</p><p>Porfa, apóyanos con tu <a href=\"https://drive.google.com/drive/u/0/folders/1BEcCg5bYQD_9z0gBB19Cax_vjGz-niMO\" target=\"_blank\">revisión</a> del siguiente recurso.</p><p>Saludos!</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-12-01 12:43:44', '', '', 'reasignacion'),
(200, 144, '<p>Hola Abraham!</p><p>Solicito tu ayuda para la <a href=\"https://drive.google.com/drive/u/0/folders/1zP1bcxlxLhJvxh2NLBPTuBcFJHUtV7OB\" target=\"_blank\">revisión</a> del siguiente recurso.</p><p>Saludos!</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-12-01 12:45:47', '', '', 'reasignacion'),
(201, 143, '<p>Hola!</p><p>Para este recurso solicitamos de tu ayuda para la <a href=\"https://drive.google.com/drive/u/0/folders/1kXuGBvXPZIVsJO8WGoFLfzlRs_3fPwxG\" target=\"_blank\">revisión</a> del mismo.</p><p>Saludos!</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b45df945454.17181395', '633eef17cc43c6.86654620', '2022-12-01 12:48:28', '', '', 'reasignacion'),
(202, 149, '<p>Te comparto la revisión del <a href=\"https://drive.google.com/file/d/1noqGMQcTV9NqSvMf-kodBwNUmxV2oJNP/view?usp=sharing\" target=\"_blank\">recurso</a>.&nbsp;</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2022-12-02 13:13:42', '', '', 'reasignacion'),
(203, 149, 'En el recurso faltan las imágenes.', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2022-12-02 13:16:04', '', '', 'mensaje'),
(204, 136, '<p>Te comparto la revisión del <a href=\"https://drive.google.com/drive/u/0/folders/1Xn-Gd9K6V6YU1ZZepXZhG1rBXfHAgq3T\" target=\"_blank\">recurso</a>. Te comento que faltan las imágenes.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2022-12-02 13:49:14', '', '', 'reasignacion'),
(205, 59, '<p>Hola, el recurso lo revisará Laura. Gracias</p><br>', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620, 633eeece335cd2.35066473', '2022-12-06 15:05:26', '', '', 'reasignacion'),
(206, 63, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:05:59', '', '', 'reasignacion'),
(207, 60, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:06:44', '', '', 'reasignacion'),
(208, 62, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:07:20', '', '', 'reasignacion'),
(209, 66, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:07:41', '', '', 'reasignacion'),
(210, 68, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:08:04', '', '', 'reasignacion'),
(211, 72, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:08:37', '', '', 'reasignacion'),
(212, 79, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:09:01', '', '', 'reasignacion'),
(213, 74, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620, 633eeece335cd2.35066473', '2022-12-06 15:09:43', '', '', 'reasignacion'),
(214, 80, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:19:44', '', '', 'reasignacion'),
(215, 81, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:20:05', '', '', 'reasignacion'),
(216, 87, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:20:40', '', '', 'reasignacion'),
(217, 86, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:20:57', '', '', 'reasignacion'),
(218, 90, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:21:14', '', '', 'reasignacion'),
(219, 94, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:21:37', '', '', 'reasignacion'),
(220, 96, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:22:16', '', '', 'reasignacion'),
(221, 92, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:22:35', '', '', 'reasignacion'),
(222, 92, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:22:39', '', '', 'reasignacion'),
(223, 105, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:23:13', '', '', 'reasignacion'),
(224, 100, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:23:44', '', '', 'reasignacion'),
(225, 107, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:24:03', '', '', 'reasignacion'),
(226, 106, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:24:31', '', '', 'reasignacion'),
(227, 108, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:24:49', '', '', 'reasignacion'),
(228, 115, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:25:12', '', '', 'reasignacion'),
(229, 116, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:25:45', '', '', 'reasignacion'),
(230, 119, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:26:05', '', '', 'reasignacion'),
(231, 120, '<p>Hola, el recurso lo revisará Laura. Gracias<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:26:39', '', '', 'reasignacion'),
(232, 149, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 15:41:00', '', '', 'mensaje'),
(233, 144, '<p>Hola, este recurso lo revisará Laura.&nbsp;</p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 16:42:03', '', '', 'reasignacion'),
(234, 147, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2022-12-06 16:42:23', '', '', 'mensaje'),
(235, 150, '<p>Hola, este recurso lo revisará Laura.&nbsp;<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 16:43:19', '', '', 'reasignacion'),
(236, 151, '<p>Hola, este recurso lo revisará Laura.&nbsp;<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 16:43:36', '', '', 'reasignacion'),
(237, 152, '<p>Hola, este recurso lo revisará Laura.&nbsp;<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 16:43:59', '', '', 'reasignacion'),
(238, 143, '<p>Hola, este recurso lo revisará Laura.&nbsp;<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 16:44:12', '', '', 'reasignacion'),
(239, 139, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '5c0653d43d92e7.75019474', '2022-12-06 16:44:56', '', '', 'mensaje'),
(240, 141, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '5c0653d43d92e7.75019474', '2022-12-06 16:45:15', '', '', 'mensaje'),
(241, 59, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 16:48:14', '', '', 'mensaje'),
(242, 74, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 16:49:33', '', '', 'mensaje'),
(243, 88, '<p>Hola, este recurso lo revisará Laura.</p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 17:06:06', '', '', 'reasignacion'),
(244, 93, '<p>Hola, este recurso lo revisará Laura.<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 17:06:43', '', '', 'reasignacion'),
(245, 76, '<p>Hola, este recurso lo revisará Laura.<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 17:08:11', '', '', 'reasignacion'),
(246, 78, '<p>Hola, este recurso lo revisará Laura.<br></p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2022-12-06 17:08:39', '', '', 'reasignacion'),
(247, 71, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '5c0653d43d92e7.75019474', '2022-12-06 17:13:43', '', '', 'mensaje'),
(248, 70, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '5c0653d43d92e7.75019474', '2022-12-06 17:13:57', '', '', 'mensaje'),
(249, 69, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '5c0653d43d92e7.75019474', '2022-12-06 17:14:17', '', '', 'mensaje'),
(250, 56, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '5c0653d43d92e7.75019474', '2022-12-06 17:14:45', '', '', 'mensaje'),
(251, 131, '<p>Sin observaciones. Saludos</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-13 13:29:49', '', '', 'reasignacion'),
(252, 132, '<p>Descargué el recurso, pero no abre. ¿Me ayudas a revisarlo?</p><br>', '633eeece335cd2.35066473', '632b46a0cdf025.04927926', '2022-12-13 13:39:08', '', '', 'reasignacion'),
(253, 145, '<p>Comparto la revisión del <a href=\"https://drive.google.com/file/d/1G3BRCL5draDHxf-zd0Isf-i8NdG6ZFjV/view?usp=sharing\" target=\"_blank\">recurso</a>. Saludos</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2022-12-13 13:51:11', '', '', 'reasignacion'),
(254, 146, '¿Podrás revisar el recurso? No corresponde con esta tarea, el que se abre dice \"¿Cómo nos comunicamos?\". Gracias<br>', '633eeece335cd2.35066473', '632b46a0cdf025.04927926', '2022-12-13 13:56:23', '', '', 'reasignacion'),
(256, 146, '<p>Sin obsevaciones.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-13 16:45:03', '', '', 'reasignacion'),
(257, 150, '<p>Te comparto la revisión del <a href=\"https://drive.google.com/drive/u/0/folders/1SXGOpGfVKRCWtGinKhoBca1Rn13NeQ94\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-13 17:30:54', '', '', 'reasignacion'),
(258, 151, '<p>Te comparto la revisión del <a href=\"https://drive.google.com/file/d/1Yylftdn-rqkaOnX2pCQAPlgkTRREgkdA/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-14 05:57:18', '', '', 'reasignacion'),
(259, 152, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/138uZvls-83Jm4FPbRqxfmBpJWGgG0iwD/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-14 06:16:32', '', '', 'reasignacion'),
(260, 151, 'Se actualizó la información de la tarea', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2022-12-14 10:09:04', '', '', 'mensaje'),
(261, 62, '<p>Gaby, te comparto la revisión del <a href=\"https://drive.google.com/file/d/17ZAxrxNAkk8jmr49KbS4_qEXbVLkgSsT/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2022-12-14 10:24:59', '', '', 'reasignacion'),
(262, 150, '<p>Hola Jorge, no tengo comentarios, aplica los de Lau, menos el del PDF porque no aplica. Ya coloca el archivo en su carpeta de versión final y el editable en su carpeta. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-14 12:23:24', '', '', 'reasignacion'),
(263, 152, '<p>Hola Jorge, no tengo comentarios, favor de aplicar los de Lau. De una vez deja el recurso en versiones finales y el editable.</p><p>Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-14 12:32:40', '', '', 'reasignacion'),
(264, 66, '<p>Gaby, te comparto la revisión del <a href=\"https://drive.google.com/drive/u/0/folders/1Y7HjoFTqNacK8u-umB5pp8Q-92n_A7eY\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2022-12-16 10:40:26', '', '', 'reasignacion'),
(266, 68, '<p>Comparto la revisión del <a href=\"https://drive.google.com/drive/u/0/folders/1T0rFLw51i2kXEkKMtZg8QMoML0xeRlHa\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-16 13:55:51', '', '', 'reasignacion'),
(267, 117, '<p>Saray te comparto mi <a href=\"https://drive.google.com/drive/u/0/folders/1eeENsgJvq91Oe83cibxA1wTPaeoArbgO\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-16 16:11:04', '', '', 'reasignacion'),
(268, 118, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/1-X7gtAZtyYJdyJ6RhfnA1Zmr0cM6zYy6/view\" target=\"_blank\">revisión</a>, solo tengo un comentario, gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-16 16:24:22', '', '', 'reasignacion'),
(269, 104, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/1J9RlawKtOPDtIZF-8sZi33goutc5GAK1/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-16 16:39:22', '', '', 'reasignacion'),
(270, 80, '<p>Hola, Saray, no tengo observaciones. Saludos</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-19 11:52:48', '', '', 'reasignacion'),
(271, 81, '<p>Comparto la revisión del <a href=\"https://drive.google.com/file/d/1KX8XjwmIsP82EeCd06aeEDdgQiPVHeli/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-19 12:01:47', '', '', 'reasignacion'),
(272, 94, '<p>Comparto la revisión del <a href=\"https://drive.google.com/file/d/1oopKwi9DAC3o04yGIqpGRBbyKN-B0Yop/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-19 14:05:06', '', '', 'reasignacion'),
(273, 103, '<p>Saray comparto mi <a href=\"https://drive.google.com/drive/u/0/folders/1Ir7B89x5eGWvFk_H0qHPGYb8xiHyicbX\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-19 16:15:08', '', '', 'reasignacion'),
(274, 110, '<p>Saray comparto mi <a href=\"https://drive.google.com/file/d/1v7bNTkoyOtzPQsm3OqdWOfxis948RgLf/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-19 16:26:23', '', '', 'reasignacion'),
(275, 109, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/1D5ZFarQSCroUFvSwfs1JLIjZr6Jjb08I/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-19 16:35:05', '', '', 'reasignacion'),
(276, 89, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/1Vbrh0FUE9gliMI8WaGXw1XpBO7sdYhNg/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-19 16:45:25', '', '', 'reasignacion'),
(277, 95, '<p>Saray te comparto mi <a href=\"http://135Abraham#\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saluditos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-20 15:51:45', '', '', 'reasignacion'),
(278, 95, '<p><a href=\"https://drive.google.com/file/d/185fQcZ4-vOPdB7hmq3Hnz1QyDbliDv9d/view\" target=\"_blank\">Enlace correcto</a>&nbsp;:)&nbsp;</p>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-20 15:53:16', '', '', 'mensaje'),
(279, 61, '<p>Saray te comparto mi <a href=\"https://drive.google.com/drive/u/0/folders/1b02S4DFxD7MQQWi5xD0PzcsD5lvTJUTk\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-20 16:19:52', '', '', 'reasignacion'),
(280, 75, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/16l6V0xB7JOWmbBkgyIV60AdTyyRMscM3/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-20 16:43:47', '', '', 'reasignacion'),
(281, 82, '<p>Saray comparto mi <a href=\"https://drive.google.com/file/d/11G6weZMbQUn8j383OrM8rUkZmw6dw78-/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-20 16:54:49', '', '', 'reasignacion'),
(282, 67, '<p>Saray comparto mi <a href=\"https://drive.google.com/drive/u/0/folders/1t0givLrYYMkSgQtBhQ2myaYcOhc1eNfc\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-20 17:05:33', '', '', 'reasignacion'),
(283, 138, '<p>Saray comparto mi <a href=\"https://drive.google.com/file/d/17fGmoIhQp_nhBbd-W2_GwTfTsabWp4ju/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-20 17:19:24', '', '', 'reasignacion'),
(284, 137, '<p>Saray comparto mi <a href=\"https://drive.google.com/file/d/1-fzT9ofXAyGXwGH88yuAYj5Mo5vOz48W/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-20 17:24:37', '', '', 'reasignacion'),
(285, 137, '<p>Saray este es el <a href=\"https://drive.google.com/file/d/1VTIwI3y-jCia_gKxnnz17uCfJWNLhcXH/view\" target=\"_blank\">enlace</a></p><p>¡Gracias!</p>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-20 17:27:20', '', '', 'mensaje'),
(286, 124, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/1FZ0_P2X2K0-AuemSZb69J2IV204obCwa/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p>', '633eef17cc43c6.86654620', '633eef17cc43c6.86654620', '2022-12-20 17:37:05', '', '', 'mensaje'),
(287, 124, '<p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">Saray te comparto mi&nbsp;<a href=\"https://drive.google.com/file/d/1FZ0_P2X2K0-AuemSZb69J2IV204obCwa/view\" target=\"_blank\" style=\"color: rgb(128, 66, 149); text-decoration: none;\">revisión</a>, muchas gracias.&nbsp;</p><p style=\"color: rgb(121, 131, 143); font-family: Montserrat, sans-serif; background-color: rgb(248, 247, 252);\">¡Saludos!</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-20 17:37:29', '', '', 'reasignacion'),
(288, 123, '<p>Saray comparto mi <a href=\"https://drive.google.com/file/d/1OrnHWjkKuZR6SL9qs7hl82ZachQiucDa/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saluditos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-20 17:46:02', '', '', 'reasignacion'),
(289, 122, '<p>Saray comparto mi <a href=\"https://drive.google.com/drive/u/0/folders/1ES7gh4THYsE1dYPgbOgPC2HUEGiMpoyi\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2022-12-20 18:04:42', '', '', 'reasignacion'),
(290, 96, '<p>Comparto la revisión del <a href=\"https://drive.google.com/file/d/1HH7ttTScVxAcRDrM055Hq-ImFfe_jmQ4/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-20 21:36:49', '', '', 'reasignacion'),
(291, 108, '<p>Comparto la revisión del <a href=\"https://drive.google.com/file/d/1fBfPQsiFKdPbDdi7Nbem09yGLlkK2V2D/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-22 23:40:59', '', '', 'reasignacion'),
(292, 76, '<p>Comparto la revisión del <a href=\"https://drive.google.com/drive/u/0/folders/19wo1zYUzcadd3CH0jzlxGiL0cY7PKPhO\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-23 00:11:04', '', '', 'reasignacion'),
(293, 90, '<p>Comparto la revisión del <a href=\"https://drive.google.com/file/d/1m81v7BtdW6IArO3ph19V6p7VtNKtwKS7/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-23 00:31:21', '', '', 'reasignacion'),
(294, 96, '<p>Saray, modifiqué el archivo. Este es el nuevo <a href=\"https://drive.google.com/file/d/1nwd2rfTfSE8zTot_sacT1_wWp9U16zQA/view?usp=sharing\" target=\"_blank\">enlace</a>.</p>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-23 00:39:15', '', '', 'mensaje'),
(295, 118, '<p>Hola Frida, no tengo comentarios. Favor de aplicar el de Abraham. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-26 19:46:36', '', '', 'reasignacion'),
(296, 117, '<p>Hola Frida, no tengo comentarios. Favor de aplicar los comentarios de Abraham que apliquen. Saludos<br></p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-26 19:56:03', '', '', 'reasignacion'),
(297, 108, '<p>Hola Jorge, no tengo comentarios. Favor de aplicar los de Lau. Saludos<br></p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-26 20:00:16', '', '', 'reasignacion'),
(298, 109, '<p>Hola Jorge, no tengo comentarios. Favor de aplicar el de Abraham. Saludos<br></p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-26 20:06:12', '', '', 'reasignacion'),
(299, 110, '<p>Hola Jorge, favor de aplicar el comentario de Abraham. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-26 20:14:35', '', '', 'reasignacion'),
(300, 103, '<p>Hola Frida, favor de aplicar los comentarios de Abraham. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-26 20:19:30', '', '', 'reasignacion'),
(301, 104, '<p>Hola Frida, favor de aplicar los comentarios de CE. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-26 20:24:56', '', '', 'reasignacion'),
(302, 96, '<p>Hola Jorge, no tengo comentarios adicionales, favor de aplicar los de CE. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-26 20:58:20', '', '', 'reasignacion'),
(303, 90, '<p>Hola Frida, favor de aplicar los comentarios de CE. Yo tampoco pude ver la imagen. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-26 21:03:09', '', '', 'reasignacion'),
(304, 95, '<p>Hola Jorge, favor de aplicar los comentarios de CE. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-26 21:08:32', '', '', 'reasignacion'),
(305, 89, '<p>Hola Frida, sin comentarios, favor de aplicar el de Abraham. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-26 21:12:54', '', '', 'reasignacion'),
(306, 94, '<p>Hola Jorge, favor de aplicar los comentarios de CE. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-26 22:00:09', '', '', 'reasignacion'),
(307, 76, '<p>Hola Frida, comparto <a href=\"https://drive.google.com/drive/u/0/folders/19wo1zYUzcadd3CH0jzlxGiL0cY7PKPhO\" target=\"_blank\">comentarios</a>.&nbsp;</p><p>Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-27 11:43:07', '', '', 'reasignacion'),
(308, 67, '<p>Hola Jorge, comparto <a href=\"https://drive.google.com/drive/u/0/folders/1t0givLrYYMkSgQtBhQ2myaYcOhc1eNfc\" target=\"_blank\">comentarios</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 11:51:45', '', '', 'reasignacion'),
(309, 82, '<p>Hola Jorge, favor de aplicar los comentarios de CE. En mi caso sí pude abrir los enlaces correctos, pero verifica por favor qué pasó. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 12:34:29', '', '', 'reasignacion'),
(310, 75, '<p>Hola Frida, no tengo comentarios, favor de aplicar los de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-27 12:40:31', '', '', 'reasignacion'),
(311, 61, '<p>Hola Frida, favor de aplicar los comentarios de CE. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-27 12:46:45', '', '', 'reasignacion'),
(312, 81, '<p>Hola Jorge, no tengo comentarios, favor de aplicar los de Lau. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 12:50:37', '', '', 'reasignacion'),
(313, 80, '<p>Hola Jorge, tampoco tengo comentarios, favor de colocar el recurso en su carpeta de versiones finales y el editable en su carpeta también. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 12:55:30', '', '', 'reasignacion'),
(314, 68, '<p>Hola Jorge, comparto <a href=\"https://drive.google.com/drive/u/0/folders/1T0rFLw51i2kXEkKMtZg8QMoML0xeRlHa\" target=\"_blank\">comentarios</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 13:08:50', '', '', 'reasignacion'),
(315, 122, '<p>Hola Jorge, te comparto <a href=\"https://drive.google.com/drive/u/0/folders/1ES7gh4THYsE1dYPgbOgPC2HUEGiMpoyi\" target=\"_blank\">comentarios</a>.&nbsp;</p><p>Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 13:15:47', '', '', 'reasignacion'),
(316, 123, '<p>Hola Jorge, favor de aplicar los comentarios de Lau. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 13:29:31', '', '', 'reasignacion'),
(317, 124, '<p>Hola Jorge, favor de aplicar los comentarios de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 13:56:56', '', '', 'reasignacion'),
(318, 137, '<p>Hola Jorge, favor de aplicar los comentarios de Lau. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 13:58:22', '', '', 'reasignacion'),
(319, 138, '<p>Hola Jorge, favor de aplicar los comentarios de Abraham. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 14:00:45', '', '', 'reasignacion'),
(320, 146, '<p>Hola Frida, tampoco tengo comentarios, favor de dejar el editable y el recurso en sus carpetas correspondientes. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-27 14:03:49', '', '', 'reasignacion'),
(321, 131, '<p>Hola Frida, tampoco tengo comentarios. Favor de dejar el editable y el recurso en sus carpetas correspondientes. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-27 14:06:24', '', '', 'reasignacion'),
(322, 151, '<p>Hola Jorge, favor de aplicar los comentarios de Ab. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 14:10:36', '', '', 'reasignacion'),
(323, 145, '<p>Hola Frida, sin comentarios, favor de aplicar los de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-27 14:13:00', '', '', 'reasignacion'),
(324, 136, '<p>Hola Jorge, comparto <a href=\"https://drive.google.com/drive/u/0/folders/1Xn-Gd9K6V6YU1ZZepXZhG1rBXfHAgq3T\" target=\"_blank\">comentarios</a>. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 14:16:40', '', '', 'reasignacion'),
(325, 132, '<p>Hola Frida, yo tampoco pude descargar el recurso, por favor apóyanos a revisar, muchas gracias.&nbsp;</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-27 14:20:44', '', '', 'reasignacion'),
(326, 62, '<p>Hola Frida, favor de aplicar los comentarios de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-27 14:29:13', '', '', 'reasignacion'),
(327, 66, '<p>Hola Jorge, comparto <a href=\"https://drive.google.com/drive/u/0/folders/1Y7HjoFTqNacK8u-umB5pp8Q-92n_A7eY\" target=\"_blank\">comentarios</a>. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '632b47e9ba5356.01109483', '2022-12-27 14:35:24', '', '', 'reasignacion'),
(350, 132, '<p>Hola, sigo sin poder abrir el archivo. ¿Podrás revisarlo?</p><br>', '633eeece335cd2.35066473', '632b46a0cdf025.04927926, 62a8a43bb67fa6.38495185', '2022-12-30 10:13:11', '', '', 'reasignacion'),
(353, 132, '<p>Comparto la revisión del <a href=\"https://drive.google.com/file/d/1LKsbFAagMpXWGA5xy98i-oINzXwdWiG0/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2022-12-30 13:18:42', '', '', 'reasignacion'),
(365, 132, '<p>Hola Frida, comparto <a href=\"https://drive.google.com/file/d/1LKsbFAagMpXWGA5xy98i-oINzXwdWiG0/view?usp=sharing\" target=\"_blank\">comentarios</a>.&nbsp;</p><p>Saludos</p>', '62a8a43bb67fa6.38495185', '62a8a43bb67fa6.38495185', '2022-12-30 16:00:47', '', '', 'mensaje'),
(366, 132, '<br>', '62a8a43bb67fa6.38495185', '632b46a0cdf025.04927926', '2022-12-30 16:01:02', '', '', 'reasignacion'),
(371, 143, '<p>Sam, no puedo abrir el archivo. Tuve el mismo problema con otro, tal vez son los signos y las tildes. ¿Podrás eliminarlos y volverlo a pasar?</p><br>', '633eeece335cd2.35066473', '632b45df945454.17181395', '2023-01-02 08:22:23', '', '', 'reasignacion'),
(372, 144, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1hWaNA4RBblJM0NwWntkU5mvVNE7R_Ko9/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-02 08:35:41', '', '', 'reasignacion'),
(373, 143, '<p>Hola Lau!!!</p><p>Actualicé el archivo descargable quitando los signos y el acento, espero se pueda abrir así... sino fuera así, quedo atento por cualquier cosa.</p><p>Saludos!!!</p><br>', '632b45df945454.17181395', '633eeece335cd2.35066473', '2023-01-02 10:13:23', '', '', 'reasignacion'),
(374, 128, '<p>Gaby, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1_pjXmeUu_Er62xteeQqc9MjVOJdEUDvJ/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-02 10:18:58', '', '', 'reasignacion'),
(375, 129, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/13y3KwYR4Hs_6qwf8zeC4ZErpbRR0k4gr/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-02 10:32:29', '', '', 'reasignacion'),
(376, 130, '<p>Gaby, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1eEqkjZGBinQiZ_sRHppFxZ-YzUMKfLH9/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-02 16:28:50', '', '', 'reasignacion');
INSERT INTO `tareas_mensajes` (`ID`, `ID_TAREA`, `MENSAJE`, `ID_USUARIO`, `ASIGNACIONES`, `FECHA_REGISTRO`, `ENLACE`, `ADJUNTO`, `TIPO`) VALUES
(377, 60, '<p>Gaby, te comparto la revisión del <a href=\"https://drive.google.com/file/d/11JZACXvAkaJtNqUmTEu5oOw0rReL3rq0/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-02 16:51:24', '', '', 'reasignacion'),
(378, 143, '<p>Gaby, no tengo observaciones.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-03 13:04:38', '', '', 'reasignacion'),
(379, 59, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1See1WR7wClQKW3KmiUVCd3t7pY6XuiPN/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-03 16:15:42', '', '', 'reasignacion'),
(380, 119, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/15CSyq6-z6FGTnf5ebB3tP3galebtlFTf/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-03 16:46:25', '', '', 'reasignacion'),
(381, 120, '<p>Gaby, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1yxBY8SNIjRUAjhMsrG6BoqNirON8N8K-/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-04 10:58:50', '', '', 'reasignacion'),
(382, 63, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1l9TpB4jfs9qDEHr_sOALUQgGv4I9hXQr/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-04 13:35:49', '', '', 'reasignacion'),
(383, 72, '<p>Gaby, te comparto la revisión del <a href=\"https://drive.google.com/drive/u/0/folders/1702AbDwFFpNV0YlpaRQ3LNjaSet6NUSd\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-05 09:48:02', '', '', 'reasignacion'),
(384, 79, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/drive/u/0/folders/1uXcuoIh5ms_sId5qNlscSd6xPFgVSyFu\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-05 10:27:03', '', '', 'reasignacion'),
(385, 87, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1R5xr0MTHFKakpPC1SubtBfPnTW2peIaC/view?usp=sharing\" target=\"_blank\">recurso.</a></p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-05 12:02:33', '', '', 'reasignacion'),
(386, 86, '<p>Gaby, no tengo comentarios.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-05 12:41:26', '', '', 'reasignacion'),
(387, 74, '<p>Gaby, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1NRV_eVBatUisJKmB-BYSmz9_QsXib2GS/view?usp=sharing\" target=\"_blank\">recurso</a>.</p>', '633eeece335cd2.35066473', '633eeece335cd2.35066473', '2023-01-05 13:00:06', '', '', 'mensaje'),
(388, 88, '<p>Gaby, te comparto la revisión del r<a href=\"https://drive.google.com/file/d/1uH0_L9Zo8jQGYQj49PaVzt50MwIW8T9p/view?usp=sharing\" target=\"_blank\">ecurso</a>.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-05 16:29:06', '', '', 'reasignacion'),
(389, 88, '<p>Gaby, agregué un cambio. Esta es la última versión del <a href=\"https://drive.google.com/file/d/1Q4l3fjghtMq0lSN9QOvqz6MIKZJkbLYN/view?usp=sharing\" target=\"_blank\">recurso</a>.</p>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-05 16:32:59', '', '', 'mensaje'),
(390, 78, '<p>Gaby, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1pQJoBEP1GW6paMV5EP5nwgGNH-q_NbPO/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-05 16:39:20', '', '', 'reasignacion'),
(391, 88, 'Se actualizó la información de la tarea', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-05 16:42:54', '', '', 'mensaje'),
(392, 74, 'Se actualizó la información de la tarea', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-05 16:43:52', '', '', 'mensaje'),
(393, 149, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '6345f3d21f53b8.76043717', '2023-01-06 10:23:49', '', '', 'mensaje'),
(394, 136, '<p>Ya quedó la <a href=\"https://drive.google.com/drive/u/0/folders/1FVFbCdR1cPwWlavifgbOqOstREHafkKH\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 10:35:26', '', '', 'reasignacion'),
(395, 117, '<p>Gracias, ya quedó la <a href=\"https://drive.google.com/file/d/1S-NPu1qMCh_iQOtKU__h8Om_wz7EApSY/view?usp=share_link\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 10:38:46', '', '', 'reasignacion'),
(396, 103, '<p>Lista la <a href=\"https://drive.google.com/file/d/17r9tAkseLPfhy0eoj5PTytVttOYjHGrT/view?usp=share_link\" target=\"_blank\">versión final.&nbsp;</a></p><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 10:43:48', '', '', 'reasignacion'),
(397, 92, '<p>Gaby, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1JYlqV05n7QOU7HdpwaDHS80woPv5i_ok/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-06 10:44:47', '', '', 'reasignacion'),
(398, 109, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1sG_OcKdI-2l3fa4QaI7wJOHMFXBbK3eN\" target=\"_blank\">versión final.&nbsp;</a></p><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 10:57:40', '', '', 'reasignacion'),
(399, 110, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1L0xm0OPrzqUY8BokCN-nVltZNI-IJ5Eh\" target=\"_blank\">versión final.</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 10:59:05', '', '', 'reasignacion'),
(400, 108, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1J_LrctcgtqqK08kEzIMkGxOHBRjX4cYz\" target=\"_blank\">versión final.</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:00:57', '', '', 'reasignacion'),
(401, 89, '<p>Lista la <a href=\"https://drive.google.com/file/d/1j7NskWm2vWPTp0j7Tj9iylSuIYLbwot3/view?usp=share_link\" target=\"_blank\">versión final.&nbsp;</a></p><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:03:50', '', '', 'reasignacion'),
(402, 89, '', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:04:21', '', '', 'mensaje'),
(403, 96, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1Vnl8erWVLLYCMUjdE_V874JYIF2rNeXK\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:06:24', '', '', 'reasignacion'),
(404, 95, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1FhUxuXW1x4VX1XU7G2jF6Mjb1b1N89Zl\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:08:48', '', '', 'reasignacion'),
(405, 94, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/119DZCOcIkekxGjErSfbaefMmkDs3Hcgk\" target=\"_blank\">versión final.</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:11:35', '', '', 'reasignacion'),
(406, 75, '<p>Lista la <a href=\"https://drive.google.com/file/d/11n5uSmVJKw0W8UjI3iLY3EWRC5Dlx5yI/view?usp=share_link\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:12:55', '', '', 'reasignacion'),
(407, 68, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1AT619nQVmanH3dMbivda4-n7aMoU1KO5\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:14:32', '', '', 'reasignacion'),
(408, 81, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1bspP6iHBDgSOR2g39QF1sdzPnAkyDCTK\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:16:59', '', '', 'reasignacion'),
(409, 82, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1vekPLm2IYPZ0iPnwSEOX482MCTlW9c6q\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:18:51', '', '', 'reasignacion'),
(410, 100, '<p>Gaby, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1ddQ8dbD5FlQpbxjDyqXn0Iv4YzKB-z57/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '6345f3d21f53b8.76043717', '2023-01-06 11:18:57', '', '', 'reasignacion'),
(411, 67, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1mvZuKMW1veeOb7J0S_goGY2R0vBKVDfg\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:21:51', '', '', 'reasignacion'),
(412, 66, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1yXjtuQtJr9liicGjOG-48LacoAl6BPUu\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:25:36', '', '', 'reasignacion'),
(413, 93, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1Sl4nqZEgTOG3o3iV68vQTzUnaHs55Uiw/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-06 11:26:35', '', '', 'reasignacion'),
(414, 132, '<br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:26:46', '', '', 'reasignacion'),
(415, 122, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/11vHfeAFjWLqP-IEHuOV3BxALnd_X017B\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:28:11', '', '', 'reasignacion'),
(416, 123, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1XWT_YRqDiDdtukyxwr6gD26z-9YHCwMA\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:29:44', '', '', 'reasignacion'),
(417, 124, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1dxfRwX33CDUBrBqQA-jTnfWeVUfTqrr5\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:31:14', '', '', 'reasignacion'),
(418, 137, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1wcgLUuTeMgi3MzJfU2vyuGRkJlLkpdKv\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:33:05', '', '', 'reasignacion'),
(419, 138, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/17qM6KysIHnLztN4P9XeUGb4jv2MrdEqs\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 11:34:50', '', '', 'reasignacion'),
(420, 151, '<p>Lista la <a href=\"https://drive.google.com/drive/u/0/folders/1XabZEtyxqJ5UXUbvuhcn2WaNeriHU5yD\" target=\"_blank\">versión final.&nbsp;</a></p><br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 12:01:48', '', '', 'reasignacion'),
(421, 152, '<br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 12:06:26', '', '', 'reasignacion'),
(422, 150, '<br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 12:06:43', '', '', 'reasignacion'),
(423, 146, '<br>Se cambio el estado a: <b>completo</b>', '62a8a43bb67fa6.38495185', '', '2023-01-06 12:07:31', '', '', 'mensaje'),
(424, 148, '<p>Hola Gonzalo, no tengo comentarios. Aplica el de Lau, los de las imágenes no aplica. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-06 12:11:10', '', '', 'reasignacion'),
(425, 144, '<p>Hola Sam, yo tampoco pude ver las imágenes. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-06 12:26:00', '', '', 'reasignacion'),
(426, 131, '<br>Se cambio el estado a: <b>completo</b>', '62a8a43bb67fa6.38495185', '', '2023-01-06 12:27:35', '', '', 'mensaje'),
(427, 129, '<p>Hola Sam, no tengo comentarios. Favor de aplicar los de Lau. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-06 12:30:23', '', '', 'reasignacion'),
(428, 119, '<p>Hola Gonzalo, comparto <a href=\"https://drive.google.com/file/d/15CSyq6-z6FGTnf5ebB3tP3galebtlFTf/view?usp=sharing\" target=\"_blank\">comentarios</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-06 12:36:14', '', '', 'reasignacion'),
(429, 87, '<p>Hola Sam, comparto <a href=\"https://drive.google.com/file/d/1R5xr0MTHFKakpPC1SubtBfPnTW2peIaC/view?usp=sharing\" target=\"_blank\">comentarios</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-06 12:41:06', '', '', 'reasignacion'),
(430, 93, '<p>Hola Gonzalo, no tengo comentarios. Favor de aplicar el de Lau. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-06 12:44:08', '', '', 'reasignacion'),
(431, 79, '<p>Hola Gonzalo, comparto <a href=\"https://drive.google.com/drive/u/0/folders/1uXcuoIh5ms_sId5qNlscSd6xPFgVSyFu\" target=\"_blank\">comentarios</a>.&nbsp;</p><p>Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-06 12:52:15', '', '', 'reasignacion'),
(432, 59, '<p>Hola Sam, comparto <a href=\"https://drive.google.com/file/d/1See1WR7wClQKW3KmiUVCd3t7pY6XuiPN/view?usp=sharing\" target=\"_blank\">comentarios</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-06 12:59:51', '', '', 'reasignacion'),
(433, 61, '<br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-06 13:00:50', '', '', 'reasignacion'),
(434, 63, '<p>Hola Gonzalo, comparto <a href=\"https://drive.google.com/file/d/1l9TpB4jfs9qDEHr_sOALUQgGv4I9hXQr/view?usp=sharing\" target=\"_blank\">comentarios</a>.&nbsp;</p><p>Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-06 13:03:53', '', '', 'reasignacion'),
(435, 142, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/1OiEQuyGHBrnSN0wZiWisQOLEwGtF2MSK/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '633eef17cc43c6.86654620, 62a8a43bb67fa6.38495185', '2023-01-06 13:09:15', '', '', 'reasignacion'),
(436, 121, '<p>Saray comparto mi <a href=\"https://drive.google.com/file/d/1LYWLFb625k7fNjnl_cM9XWrJs4yTk20Q/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-01-09 08:32:59', '', '', 'reasignacion'),
(437, 57, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/1nsQIlIjQtj7aNhzNyidQVzmrQlSZtMAS/view\" target=\"_blank\">revisión</a>, hay dos enlaces rotos pero encontré los nuevos que corresponden a la descripción de la tarea, tengo duda de si se pueden cambiar o no. Muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-01-09 11:04:24', '', '', 'reasignacion'),
(438, 121, '<p>Hola Gonzalo, no tengo comentarios, favor de aplicar el de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-09 12:54:21', '', '', 'reasignacion'),
(439, 142, '<p>Hola Sam, no tengo comentarios, favor de aplicar el de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-09 13:02:41', '', '', 'reasignacion'),
(440, 57, '<p>Hola Sam, no tengo comentarios, los enlaces que no abren (puntos 11 y 15) no se pueden cambiar por el momento, sólo se pueden cambiar cosas de puntuación, no de contenido por favor. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-09 13:30:38', '', '', 'reasignacion'),
(441, 145, '<br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-09 13:46:32', '', '', 'reasignacion'),
(442, 143, '<p>sin comentarios Sam, ya lo puedes colocar en la carpeta de versiones finales. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-09 13:50:55', '', '', 'reasignacion'),
(443, 149, '<p>Hola Gonzalo, comparto <a href=\"https://drive.google.com/file/d/1noqGMQcTV9NqSvMf-kodBwNUmxV2oJNP/view?usp=sharing\" target=\"_blank\">comentarios</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-09 13:53:53', '', '', 'reasignacion'),
(444, 130, '<p>Hola Sam, comparto <a href=\"https://drive.google.com/file/d/1eEqkjZGBinQiZ_sRHppFxZ-YzUMKfLH9/view?usp=sharing\" target=\"_blank\">comentarios</a>. Saray</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-09 13:56:09', '', '', 'reasignacion'),
(445, 128, '<p>Hola Sam, me aparece el mismo mensaje, verificar, tal vez sólo sea en la red de la oficina. Saray</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-09 13:57:35', '', '', 'reasignacion'),
(446, 120, '<p>Hola Gonzalo, sin comentarios, favor de aplicar los de Lau. Saray</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-09 13:59:16', '', '', 'reasignacion'),
(447, 118, '<br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-09 13:59:40', '', '', 'reasignacion'),
(448, 104, '<br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-09 14:00:03', '', '', 'reasignacion'),
(449, 100, '<p>Hola Sam, los comentarios de las referencias no aplican por el momento, sólo las de puntuación. No tengo comentarios. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-09 14:01:21', '', '', 'reasignacion'),
(450, 90, '<br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-09 14:02:07', '', '', 'reasignacion'),
(451, 76, '<br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-09 14:02:55', '', '', 'reasignacion'),
(452, 62, '<br>Se cambio el estado a: <b>completo</b><br>', '62a8a43bb67fa6.38495185', '', '2023-01-09 14:03:45', '', '', 'reasignacion'),
(453, 92, '<p>Hola Gonzalo, yo si pude escuchar el audio, pero tengo el mismo comentario de Laura, falta el enlace para descargar el audio. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-09 16:56:31', '', '', 'reasignacion'),
(454, 88, '<p>Hola Sam, no tengo comentarios, favor de aplicar los de Lau, los que apliquen. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-09 17:01:33', '', '', 'reasignacion'),
(455, 136, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '62a8a43bb67fa6.38495185', '2023-01-09 17:02:48', '', '', 'mensaje'),
(456, 86, '<p>Hola Sam, sin comentarios, favor de colocar el recurso en su carpeta de versión final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-09 17:07:49', '', '', 'reasignacion'),
(457, 78, '<p>Hola Gonzalo, sin comentarios, por favor aplica el de Lau. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-09 17:13:09', '', '', 'reasignacion'),
(458, 74, '<p>Hola Sam, no tengo comentarios. Yo sí pude abrir el enlace. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-10 09:54:20', '', '', 'reasignacion'),
(459, 72, '<p>Hola Sam, no tengo comentarios, favor de aplicar los de Lau. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-10 09:56:28', '', '', 'reasignacion'),
(460, 60, '<p>Hola Sam, comparto <a href=\"https://drive.google.com/file/d/11JZACXvAkaJtNqUmTEu5oOw0rReL3rq0/view?usp=sharing\" target=\"_blank\">comentarios</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-10 09:59:31', '', '', 'reasignacion'),
(461, 114, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/1vS8ZV0BxfK1xPhaUJzCjC3ZNrnLKn_Y4/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-01-10 12:32:59', '', '', 'reasignacion'),
(462, 73, '<p>Saray comparto mi <a href=\"https://drive.google.com/drive/u/0/folders/1J1C2t4W5XOBKpBRwjQV40y9o67XHVahW\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-01-10 13:48:58', '', '', 'reasignacion'),
(463, 105, '<p>Gonzalo, no encontré el archivo en su carpeta. ¿Me podrás pasar el enlace?</p><br>', '633eeece335cd2.35066473', '632b472f497b95.12743913', '2023-01-10 14:03:44', '', '', 'reasignacion'),
(464, 64, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/1YLSufev0V9Ye3ebMJSr2FVL6vN0h319v/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-01-10 15:10:29', '', '', 'reasignacion'),
(465, 65, '<p>Saray comparto mi <a href=\"https://drive.google.com/file/d/1cLSbDETr6Ya6SUnuXtIcd_YU6t8SWLjG/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-01-10 15:28:09', '', '', 'reasignacion'),
(466, 77, '<p>Saray comparto mi <a href=\"https://drive.google.com/drive/u/0/folders/1LXDCqewZPFEsYwQlE_2QBGJXl_DBBxqa\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-01-10 15:50:36', '', '', 'reasignacion'),
(467, 101, '<p>Saray comparto mi <a href=\"https://drive.google.com/file/d/1ttFuivI7U3Q5yIP7J9ZWb19QMuYgSbEy/view\" target=\"_blank\">revisión</a> para QA, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-01-10 16:10:21', '', '', 'reasignacion'),
(468, 102, '<p>Saray comparto mi <a href=\"https://drive.google.com/drive/u/0/folders/1J4OnfvL6E2r_25mCzIFSemauxM_lTDGy\" target=\"_blank\">revisión</a>, muchas gracias.</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-01-10 16:35:28', '', '', 'reasignacion'),
(469, 91, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/16YxGfxxpMjKxI5wvfUgE22_k1Jszgujy/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-01-10 17:18:52', '', '', 'reasignacion'),
(470, 58, '<p>Saray comparto mi <a href=\"https://drive.google.com/file/d/1xbY1xQY_-MlM8oeW2yt78S1HY-shgRTW/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-01-11 08:37:42', '', '', 'reasignacion'),
(471, 58, '<p>Hola Sam, no tengo comentarios, favor de aplicar los de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-11 08:59:33', '', '', 'reasignacion'),
(472, 114, '<p>Hola Sam, no tengo comentarios, favor de aplicar los de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-11 09:01:41', '', '', 'reasignacion'),
(473, 91, '<p>Hola Gonzalo, no tengo comentarios, favor de aplicar los de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-11 09:04:04', '', '', 'reasignacion'),
(474, 102, '<p>Hola Sam, no tengo comentarios, favor de aplicar los de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-11 09:06:36', '', '', 'reasignacion'),
(475, 101, '<p>Hola Sam, muy bien, sin comentarios. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-11 09:08:35', '', '', 'reasignacion'),
(476, 77, '<p>Hola Gonzalo, comparto <a href=\"https://drive.google.com/drive/u/0/folders/1LXDCqewZPFEsYwQlE_2QBGJXl_DBBxqa\" target=\"_blank\">comentarios</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-11 09:14:20', '', '', 'reasignacion'),
(477, 65, '<p>Hola Gonzalo, no tengo comentarios, favor de aplicar los de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-11 09:18:38', '', '', 'reasignacion'),
(478, 64, '<p>Hola Gonzalo, bien, no tengo comentarios, favor de aplicar los de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-11 09:21:14', '', '', 'reasignacion'),
(479, 73, '<p>Hola Sam, no tengo comentarios, favor de aplicar los de Sam. Los comentarios de los PDF no aplica. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-11 09:42:55', '', '', 'reasignacion'),
(480, 107, '<p>Saray, no tengo observaciones.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-12 15:37:16', '', '', 'reasignacion'),
(481, 60, '<p>Hola Saray!<br>cambios aplicados en el <a href=\"https://drive.google.com/drive/u/0/folders/1CirY722-_wIcx6xuCyvAbnWM7qBZG3L4\" target=\"_blank\">recurso</a>.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-13 11:52:52', '', '', 'reasignacion'),
(482, 57, '<p>Que tal Saray!</p><p>He aplicado los <a href=\"https://drive.google.com/drive/u/0/folders/1tlVfZhKy97l8Y-doFJwzIHnnpvLmXfO7\" target=\"_blank\">cambios</a> al recurso.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-13 11:54:26', '', '', 'reasignacion'),
(483, 58, '<p>Saray saludos!</p><p>Apliqué los <a href=\"https://drive.google.com/drive/u/0/folders/1Vv4559DIGbRVCCOorgefmUl2lCtKShRY\" target=\"_blank\">cambios</a> solicitados.</p><p>Quedo atento.</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-13 11:55:58', '', '', 'reasignacion'),
(484, 59, '<p>Hola!</p><p>Te comento Saray que lo <a href=\"https://drive.google.com/drive/u/0/folders/16WNS57VU3c-LExTrnZtvKBrUli35WNdL\" target=\"_blank\">cambios</a> los he aplicado.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-13 11:57:08', '', '', 'reasignacion'),
(485, 74, '<p>Hola Saray!</p><p>Cambios aplicados al recurso.</p><p>Saludos!<a href=\"https://drive.google.com/drive/u/0/folders/1lP3dzpaCimTxsWUidaJ_KaLLmOgMNwnp\" target=\"_blank\">https://drive.google.com/drive/u/0/folders/1lP3dzpaCimTxsWUidaJ_KaLLmOgMNwnp</a></p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-13 12:23:12', '', '', 'reasignacion'),
(486, 72, '<p>Hola!</p><p>He actualizado lo solicitado en el <a href=\"https://drive.google.com/drive/u/0/folders/1eYVF5wLwHkiel0pTrkIdUMDtbSpJOWCX\" target=\"_blank\">recurso</a>.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-13 12:26:13', '', '', 'reasignacion'),
(487, 73, '<p>Buen día Saray!</p><p>Apliqué los <a href=\"https://drive.google.com/drive/u/0/folders/1J1C2t4W5XOBKpBRwjQV40y9o67XHVahW\" target=\"_blank\">cambios</a> correspondientes.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-13 12:27:29', '', '', 'reasignacion'),
(488, 86, '<p>Hola Saray!</p><p>El documento ya esta en la carpeta de <a href=\"https://drive.google.com/drive/u/0/folders/1Zcj6SRCHQ-ZIrFvUUGPfiaWf2fPSVsy_\" target=\"_blank\">VF</a>.</p><p>Saludos</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-13 13:15:56', '', '', 'reasignacion'),
(489, 88, '<p>Hola Saray!</p><p><a href=\"https://drive.google.com/drive/u/0/folders/17VMopW-axPIcLl5sCCTpzo7xohOfCSxA\" target=\"_blank\">Cambios</a> aplicados en el recurso.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-13 15:22:34', '', '', 'reasignacion'),
(490, 87, '<p>Que hay Saray!</p><p>He aplicado los <a href=\"https://drive.google.com/drive/u/0/folders/18078dqT4aUO7rlAKaxTiI9YiawNrtDtc\" target=\"_blank\">cambios</a> solicitados.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-13 15:23:36', '', '', 'reasignacion'),
(491, 106, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1FWFrcIBB70sjVLU9zTGPL853M6sCMff3/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-13 16:17:23', '', '', 'reasignacion'),
(492, 115, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1WZKb6EAiKNSHr5aWPNACEhj_SrFZkjuR/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-13 16:27:08', '', '', 'reasignacion'),
(493, 100, '<p>Hola Saray!</p><p>Cambios aplicados al <a href=\"https://drive.google.com/drive/u/0/folders/185jJEqh8LLW8FyZxzKlUzDX70LGfaxj9\" target=\"_blank\">recurso</a>.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-16 10:34:28', '', '', 'reasignacion'),
(494, 101, '<p>Saray buen día!</p><p>Las <a href=\"https://drive.google.com/drive/u/0/folders/1ZLSX7GvTUeDAmHDQ4cq1x6o-OSyXaMCm\" target=\"_blank\">cambios</a> solicitados los he hecho en el recurso.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-16 10:36:49', '', '', 'reasignacion'),
(495, 102, '<p>Buen día!</p><p><a href=\"https://drive.google.com/drive/u/0/folders/1J4OnfvL6E2r_25mCzIFSemauxM_lTDGy\" target=\"_blank\">Cambios</a> realizados en el recurso.</p><p>Saludos Saray!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-16 10:38:30', '', '', 'reasignacion'),
(496, 114, '<p>Saray, qué hay!</p><p>Te paso el siguiente recurso con los <a href=\"https://drive.google.com/drive/u/0/folders/1s9jAjNjw3TY-jhOtnx559pV_qtsM0lh3\" target=\"_blank\">cambios</a> realizados.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-16 10:39:49', '', '', 'reasignacion'),
(497, 128, '<p>Hola buen día!</p><p>El <a href=\"https://drive.google.com/drive/u/0/folders/1BaqV3OSHdcF6CCgONzITEj2_VnPJOjyb\" target=\"_blank\">cambio</a> lo he realizado; sin embargo, respecto al mensaje que aparece no es cuestión nuestra, ni de la red, consultando con Manu me dijo esto:</p><p>\"aplicaciones.info\" no ha pagado su certificado de seguridad.... la verdad creo que en estos casos lo que debería de pasar es que se regrese a académico para que reemplacen el enlace por uno actualizado.<br><br>Saludos Saray!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-16 10:53:59', '', '', 'reasignacion'),
(498, 129, '<p>Hola!</p><p>Ya quedó, los <a href=\"https://drive.google.com/drive/u/0/folders/1BnUxskQB6_cK3xdquFXFZuPMNs3AM4ja\" target=\"_blank\">cambios</a> los he hecho.</p><p>Saludos Saray!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-16 11:06:28', '', '', 'reasignacion'),
(499, 130, '<p>Qué hay Saray!</p><p><a href=\"https://drive.google.com/drive/u/0/folders/1nrK2K6yznuoXYW8c0zwbH14JDuBrwnIL\" target=\"_blank\">Cambios</a> aplicados al recurso.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-16 11:12:53', '', '', 'reasignacion'),
(500, 142, '<p>Saray, hola!</p><p><a href=\"https://drive.google.com/drive/u/0/folders/1BEcCg5bYQD_9z0gBB19Cax_vjGz-niMO\" target=\"_blank\">Cambios</a> aplicados al recurso.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-16 11:17:58', '', '', 'reasignacion'),
(501, 143, '<p>Hola Saray!</p><p>El recurso ya se encuentra en la carpeta de <a href=\"https://drive.google.com/drive/u/0/folders/1HSMFimIm7JVVTbbjzrzifnHDiUu3MGmP\" target=\"_blank\">VF</a>.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-16 11:20:05', '', '', 'reasignacion'),
(502, 116, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1AkeJTbRDktz_UD0EIHj01Nj9xa8GY7IM/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-17 14:07:48', '', '', 'reasignacion'),
(505, 114, '<p>Gracias Sam, todo en orden, ya lo puedes colocar en las versiones finales. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-19 11:33:20', '', '', 'reasignacion'),
(506, 72, '<p>Gracias Sam, ya puedes colocarlo en versiones finales. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-19 11:35:26', '', '', 'reasignacion'),
(507, 59, '<p>Hola Sam, todo en orden, sólo que vi que los reproductores de los audios de la sección <b>WHY</b> se ven más hacia la derecha, ¿los puedes alinear con los demás? Muchas gracias.&nbsp;</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-19 15:29:10', '', '', 'reasignacion'),
(508, 58, '<p>Muy bien Sam, ya lo puedes colocar en su carpeta final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-19 15:30:30', '', '', 'reasignacion'),
(509, 57, '<p>Hola Sam, bien, ya puedes colocar el recurso en su carpeta. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-19 15:37:56', '', '', 'reasignacion'),
(510, 60, '<p>Hola Sam, muy bien, ya puedes colocarlo en su carpeta final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-19 15:40:13', '', '', 'reasignacion'),
(511, 142, '<p>Hola Sam, todo en orden, ya puedes colocarlo en su carpeta final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-19 15:41:55', '', '', 'reasignacion'),
(512, 57, '<p>Listo Saray!</p><p>El archivo ya se encuentra en la carpeta de <a href=\"https://drive.google.com/drive/u/0/folders/1mb21hvPpguCVsq9iiNkdZf9s_bimwQpF\" target=\"_blank\">VF</a>.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-20 16:32:39', '', '', 'reasignacion'),
(513, 58, '<p>Saludos Saray!</p><p>El archivo esta en la carpeta de <a href=\"https://drive.google.com/drive/u/0/folders/1Kkd28HVzy-e_2oRofJq-S7tueBIyzNDE\" target=\"_blank\">VF.</a></p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-20 16:34:05', '', '', 'reasignacion'),
(514, 59, '<p>Realicé el ajuste Saray.</p><p>y el archivo ya esta en la carpeta de <a href=\"https://drive.google.com/drive/u/0/folders/19va17s_jRf7igHWOcWHBmiM6Eg51yyyM\" target=\"_blank\">VF</a>.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-20 16:35:43', '', '', 'reasignacion'),
(515, 60, '<p>Saray qué hay!</p><p>El archivo esta listo en la carpeta de <a href=\"https://drive.google.com/drive/u/0/folders/1BxcaE-Lz-evUgCkcoesgsIkH8_frm1mB\" target=\"_blank\">VF</a>.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-20 16:37:15', '', '', 'reasignacion'),
(516, 72, '<p>Saray!</p><p>Te aviso que el archivo está listo en la carpeta de <a href=\"https://drive.google.com/drive/u/0/folders/1DocwaL6lhkmgtCRGM-mr9a_x7dv_vcrz\" target=\"_blank\">VF</a>.</p><p>Saludos!</p><br>', '632b45df945454.17181395', '62a8a43bb67fa6.38495185', '2023-01-20 16:39:19', '', '', 'reasignacion'),
(517, 128, '<p>Gracias Sam, favor de colocar el recurso final en su carpeta. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-30 11:06:39', '', '', 'reasignacion'),
(518, 129, '<p>Gracias Sam, todo en orden, favor de colocar el recurso en su carpeta final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-30 11:08:00', '', '', 'reasignacion'),
(519, 130, '<p>Excelente Sam, favor de colocar el recurso final en su carpeta. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-30 11:09:20', '', '', 'reasignacion'),
(520, 116, '<p>Hola Sam, comparto <a href=\"https://drive.google.com/file/d/1AkeJTbRDktz_UD0EIHj01Nj9xa8GY7IM/view\" target=\"_blank\">comentarios</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-30 12:10:45', '', '', 'reasignacion'),
(521, 115, '<p>Hola Sam, no tengo comentarios adicionales a los de Lau. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-30 12:12:14', '', '', 'reasignacion'),
(522, 107, '<p>Hola Gonzalo, tampoco tengo comentarios del recurso. **Por favor no olvides siempre colocar el enlace del recurso en tu mensaje. Ya puedes colocar el recurso en la carpeta de versión final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-30 12:14:09', '', '', 'reasignacion'),
(523, 106, '<p>Hola Gonzalo, tengo los mismos comentarios que Lau. No olvides siempre colocar el hipervínculo de tu recurso.&nbsp;</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-01-30 12:16:40', '', '', 'reasignacion'),
(524, 102, '<p>Gracias Sam, ya lo puedes colocar en su carpeta final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-30 12:18:28', '', '', 'reasignacion'),
(525, 101, '<p>Hola Sa, todo en orden, ya puedes colocar el recurso en su carpeta final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-30 12:29:34', '', '', 'reasignacion'),
(526, 100, '<p>Gracias Sam, favor de colocar el recurso en su carpeta final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-30 12:41:40', '', '', 'reasignacion'),
(527, 88, '<p>Hola Sam, muy bien, ya puedes colocar el recurso en su carpeta final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-30 12:47:39', '', '', 'reasignacion'),
(528, 87, '<p>Hola Sam, todo en orden, ya puedes colocar el recurso en su carpeta final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-30 12:50:52', '', '', 'reasignacion'),
(529, 74, '<p>Muy bien Sam, ya puedes colocar el recurso en su carpeta final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-30 12:53:16', '', '', 'reasignacion'),
(530, 73, '<p>Hola Sam, muy bien, favor de colocar el recurso en su carpeta final. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-01-30 12:55:32', '', '', 'reasignacion'),
(531, 155, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '5c0653d43d92e7.75019474', '2023-01-30 13:29:48', '', '', 'mensaje'),
(532, 157, '<p>Hola Lau, agradeceré tu apoyo con la revisión de este <a href=\"https://drive.google.com/file/d/1BhyQAjnGpK1wfcGAtdwDATAkU1_MxCNE/view?usp=share_link\" target=\"_blank\">recurso</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2023-01-30 17:27:23', '', '', 'reasignacion'),
(533, 161, '<p>Hola Lau, agradeceré tu apoyo con la revisión de este <a href=\"https://drive.google.com/file/d/14MwK-uDsBY6tGR_HEXj2XrGYesAzZiXV/view?usp=share_link\" target=\"_blank\">recurso</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2023-01-30 17:28:39', '', '', 'reasignacion'),
(534, 158, '<p>Hola Abraham, agradeceré mucho tu apoyo con la revisión de este <a href=\"https://drive.google.com/file/d/1O98kMVHXz7uLI9urIKrizuYnNgMmltpw/view?usp=share_link\" target=\"_blank\">recurso</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620', '2023-01-30 17:30:24', '', '', 'reasignacion'),
(535, 160, '<p>Hola Abraham, agradeceré mucho tu apoyo con la revisión de este <a href=\"https://drive.google.com/file/d/1tPStShQM37liFqQbs0lsOiAQx9D-LEqd/view?usp=share_link\" target=\"_blank\">recurso</a>. Saludos</p><br>', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620', '2023-01-30 17:31:56', '', '', 'reasignacion'),
(536, 159, '<p>Hola Lau, agradeceré mucho tu apoyo con la revisión de este <a href=\"https://drive.google.com/file/d/1Og_A-l-i6TvNWrRai310X_hIXZa88czw/view?usp=share_link\" target=\"_blank\">recurso</a>. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2023-01-30 17:33:24', '', '', 'reasignacion'),
(537, 154, '<p>Hola Abraham, agradeceré mucho tu apoyo con la revisión de este <a href=\"https://drive.google.com/file/d/1AwkpGB9a2YNZn4-H3DPhYKq0OR65XTwO/view?usp=share_link\" target=\"_blank\">recurso</a>. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620', '2023-01-30 17:34:39', '', '', 'reasignacion'),
(538, 162, '<p>Hola Abraham, solicito tu apoyo para la revisión de este <a href=\"https://drive.google.com/file/d/1nv4ksf97jEPJGW3J9hfZDun8e0fblpP9/view?usp=share_link\" target=\"_blank\">recurso</a> por favor. Muchas gracias</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620', '2023-01-30 17:36:25', '', '', 'reasignacion'),
(539, 165, '<p>Hola Abraham, por favor apóyame con la revisión de este <a href=\"https://drive.google.com/file/d/1BKJ7VrqDSPxZ7bwQJEaL4iW9WXUUs8rq/view?usp=share_link\" target=\"_blank\">recurso</a>. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620', '2023-01-30 17:39:20', '', '', 'reasignacion'),
(540, 163, '<p>Hola Lau, por favor apóyame a revisar este <a href=\"https://drive.google.com/file/d/11sXaeNwbtjvGVabKmwDueVthntOi9Kcl/view?usp=share_link\" target=\"_blank\">recurso</a>. Muchas gracias</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2023-01-30 17:40:35', '', '', 'reasignacion'),
(541, 164, '<p>Hola Abraham, por favor apóyame con la revisión de este <a href=\"https://drive.google.com/file/d/1pwumrXnYS6E8uqR2_XFKnHPiNHda0aCP/view?usp=share_link\" target=\"_blank\">recurso</a>. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620', '2023-01-30 17:41:41', '', '', 'reasignacion'),
(542, 166, '<p>Hola Abraham, por favor apóyame a revisar este <a href=\"https://drive.google.com/file/d/1Gxqc8akLXaecQx2oCJ6O-Ajo8rH57aWu/view?usp=share_link\" target=\"_blank\">recurso</a>. Muchas gracias</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620', '2023-01-30 17:42:43', '', '', 'reasignacion'),
(543, 169, '<p>Hola Lau, por favor apóyame con la revisión de este <a href=\"https://drive.google.com/file/d/11fdG1rXWgR54z1pS4LftnG2jeNo4C24R/view?usp=share_link\" target=\"_blank\">recurso</a>. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2023-01-30 17:43:55', '', '', 'reasignacion'),
(544, 170, '<p>Hola Lau, por favor apóyame con la revisión de este <a href=\"https://drive.google.com/file/d/1Ze16qzWQcBDpeAYfTfNVZ40WWHmpQsX3/view?usp=share_link\" target=\"_blank\">recurso</a>. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2023-01-30 17:45:16', '', '', 'reasignacion'),
(545, 167, '<p>Hola Abraham, por favor apóyame con la revisión de este <a href=\"https://drive.google.com/file/d/1ArsWiyGtJ_vzhDdMOWoah8gKskw9Zlax/view?usp=share_link\" target=\"_blank\">recurso</a>. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620', '2023-01-30 17:46:22', '', '', 'reasignacion'),
(546, 168, '<p>Hola Abraham, por favor apóyame con la revisión de este <a href=\"https://drive.google.com/file/d/1feS-DQat23VrO4vw74Rjqa8USKuVZQW-/view?usp=share_link\" target=\"_blank\">recurso</a>. Saludos</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620', '2023-01-30 17:47:33', '', '', 'reasignacion'),
(547, 157, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2023-01-30 17:47:51', '', '', 'mensaje'),
(548, 158, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620', '2023-01-30 17:48:09', '', '', 'mensaje'),
(549, 160, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '633eef17cc43c6.86654620', '2023-01-30 17:48:27', '', '', 'mensaje'),
(550, 161, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2023-01-30 17:48:39', '', '', 'mensaje'),
(551, 174, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-01-31 15:10:17', '', '', 'mensaje'),
(552, 173, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-01-31 15:10:43', '', '', 'mensaje'),
(553, 172, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-01-31 15:10:57', '', '', 'mensaje'),
(554, 171, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-01-31 15:11:16', '', '', 'mensaje'),
(555, 174, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-01-31 15:29:54', '', '', 'mensaje'),
(556, 174, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '633eefe21f96f3.52854199', '2023-01-31 15:53:59', '', '', 'mensaje'),
(557, 174, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '633eefe21f96f3.52854199', '2023-01-31 15:57:30', '', '', 'mensaje'),
(558, 174, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '633eefe21f96f3.52854199', '2023-01-31 16:01:05', '', '', 'mensaje'),
(559, 174, '<p>Hola Liz, buena tarde.&nbsp;</p><p>Te comparto el <a href=\"https://drive.google.com/drive/folders/1eWv7Nh99a71QQP49Dd3-bdqtNZMI_TCZ?usp=share_link\" target=\"_blank\">guion</a>&nbsp;para su revisión, saludos.</p>', '636ae7e47631d0.53211866', '633eefe21f96f3.52854199', '2023-01-31 16:02:10', '', '', 'mensaje'),
(560, 171, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '633eefe21f96f3.52854199', '2023-01-31 16:07:14', '', '', 'mensaje'),
(561, 171, '<p>Hola Liz, te comparto el <a href=\"https://drive.google.com/drive/folders/1OkoxbSnk-ky4GItS2dzR3y7jIf3KH3mY?usp=share_link\" target=\"_blank\">guion</a> para su revisión.</p><p>Saludos :)</p>', '636ae7e47631d0.53211866', '633eefe21f96f3.52854199', '2023-01-31 16:07:58', '', '', 'mensaje'),
(562, 172, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '633eefe21f96f3.52854199', '2023-01-31 16:10:34', '', '', 'mensaje'),
(563, 172, '<p>Hola Liz, buena tarde.</p><p>¿Me ayudarías a revisar el siguiente <a href=\"https://drive.google.com/drive/folders/1vBLv27guomL9xR8YcJt1W_b_ew3RHGKV?usp=share_link\" target=\"_blank\">guion</a>?</p>', '636ae7e47631d0.53211866', '633eefe21f96f3.52854199', '2023-01-31 16:11:16', '', '', 'mensaje'),
(564, 173, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '633eefe21f96f3.52854199', '2023-01-31 16:14:47', '', '', 'mensaje'),
(565, 173, '<p>Hola Liz, te asigno el <a href=\"https://drive.google.com/drive/folders/1r55usxLHLH3qi7j-8bS-PKwG7Pe4NTDH?usp=share_link\" target=\"_blank\">guion</a> para su revisión.</p><p>Saludos :)</p>', '636ae7e47631d0.53211866', '633eefe21f96f3.52854199', '2023-01-31 16:15:27', '', '', 'mensaje'),
(566, 157, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/12dLA_-c_-cipcggRXK15KBHczVdFhMWN/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-01-31 18:51:41', '', '', 'reasignacion'),
(567, 174, '<p>Hola, Mariana</p><p><br></p><p>Te asigno<a href=\"https://docs.google.com/document/d/15wCf1jzhLE_9ksD6qqKBiU1eX6FO-O9A/edit?usp=share_link&amp;ouid=103939789605101088343&amp;rtpof=true&amp;sd=true\" target=\"_blank\"> el guion </a>para tu revisión.</p><p><br></p><p><br></p><p>Saludos</p><br>', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-02-01 17:15:46', '', '', 'reasignacion'),
(568, 173, '<p>Hola, Mariana:</p><p><br></p><p>Te comparto <a href=\"https://docs.google.com/document/d/19RioZfxC6kioLvLiVRC_5qBu1N67BjCY/edit?usp=share_link&amp;ouid=103939789605101088343&amp;rtpof=true&amp;sd=true\" target=\"_blank\">el guion</a> para tu revisión.</p><p><br></p><p>Saludos.</p>', '633eefe21f96f3.52854199', '633eefe21f96f3.52854199', '2023-02-01 17:25:31', '', '', 'mensaje'),
(569, 172, '<p>Hola Mariana:</p><p><br></p><p>Te comparto <a href=\"https://docs.google.com/document/d/1Bogq3lnOTfQoaF6Ylveat5GeQb4ERU_1/edit?usp=share_link&amp;ouid=103939789605101088343&amp;rtpof=true&amp;sd=true\" target=\"_blank\">el guion </a>para tu revisión.</p><p><br></p><p><br></p><p>Saludos.</p><br>', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-02-01 17:45:00', '', '', 'reasignacion'),
(570, 174, '<p>Gracias Liz :)</p><p>Buenos días, Gaby y Saray les comparto el <a href=\"https://docs.google.com/document/d/1uBLE4ipJZY4eb4rYpQEBbxddeXkePs29/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a> para su VoBo.</p><p>Saludos.</p><br>', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-02-02 08:27:18', '', '', 'reasignacion'),
(571, 172, '<p>Buenos días Saray y Gaby :)</p><p>¿Me ayudarían con su VoBo en el <a href=\"https://docs.google.com/document/d/1EF9mH7FGQt1L6XeAIrGXWGaEq-UbnUj_/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a>?</p><p><br></p><p>Saludos.</p><br>', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-02-02 08:42:12', '', '', 'reasignacion'),
(572, 159, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/12YCKV10EHbFjyNlwAyjr6lQ529blqNi4/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-02-02 16:31:44', '', '', 'reasignacion');
INSERT INTO `tareas_mensajes` (`ID`, `ID_TAREA`, `MENSAJE`, `ID_USUARIO`, `ASIGNACIONES`, `FECHA_REGISTRO`, `ENLACE`, `ADJUNTO`, `TIPO`) VALUES
(573, 171, '<p>Hola, Mariana:</p><p><br></p><p>Te comparto<a href=\"https://docs.google.com/document/d/1QLXp0_IAgN_5zKvMOoNJ-gZTjHRtx4Dd/edit?usp=share_link&amp;ouid=103939789605101088343&amp;rtpof=true&amp;sd=true\" target=\"_blank\"> el guion</a> revisado.</p><p><br></p><p><br></p><p>Saludos.</p><br>', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-02-02 16:33:58', '', '', 'reasignacion'),
(574, 163, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1hpbtFK8Hu6MuIUYUZfiOYCgOwBfO9uRo/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-02-03 10:38:27', '', '', 'reasignacion'),
(575, 171, '<p>Buen día Gaby y Saray, ¿me ayudarían con su VoBo en el <a href=\"https://docs.google.com/document/d/1nTRFsLEedTN_LQBQt2Z_7WbJuCGB962L/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a>?</p><p>Saludos :)</p><br>', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-02-03 10:46:43', '', '', 'reasignacion'),
(576, 169, '<p>Saray, te comparto la revisión del <a href=\"https://cshservers.com/polaris/tareas/detalles?id=169\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-02-03 11:02:44', '', '', 'reasignacion'),
(577, 154, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/1TfZB9z8ucRgpfLEyo4Y_InDX_HfdAUIa/view\" target=\"_blank\">revisión</a> para QA, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-02-07 10:40:56', '', '', 'reasignacion'),
(578, 170, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1smYxYuuNHDOO1HKrMkxk0KFDw7YoLsjy/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-02-09 12:44:15', '', '', 'reasignacion'),
(579, 161, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1xhyiTt3Bws5z_sewqQHUQyzTQ5OR3yM3/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-02-09 13:09:38', '', '', 'reasignacion'),
(580, 175, 'Se actualizó la información de la tarea', '63cb2915916798.85801765', '63cb27f4c588d8.85302337', '2023-02-09 15:52:19', '', '', 'mensaje'),
(581, 177, 'Se actualizó la información de la tarea', '63cb28a0adb2f2.67596660', '63cb27f4c588d8.85302337', '2023-02-09 16:30:16', '', '', 'mensaje'),
(582, 162, '<p>Saray te comparto mi <a href=\"https://drive.google.com/file/d/1Lg1nk0w9D0jKTMYiu1urs10zITp296cj/view\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-02-10 09:35:43', '', '', 'reasignacion'),
(583, 165, '<p>Saray comparto mi <a href=\"https://drive.google.com/drive/u/0/folders/1DK5qzon-r01DUn1AJjlDLN6o6jJh5pVz\" target=\"_blank\">revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-02-10 11:20:18', '', '', 'reasignacion'),
(584, 171, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-02-10 11:28:51', '', '', 'mensaje'),
(585, 175, 'Se actualizó la información de la tarea', '63cb2915916798.85801765', '63cb27f4c588d8.85302337', '2023-02-10 11:29:12', '', '', 'mensaje'),
(586, 172, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-02-10 11:29:28', '', '', 'mensaje'),
(587, 173, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '633eefe21f96f3.52854199', '2023-02-10 11:30:17', '', '', 'mensaje'),
(588, 174, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-02-10 11:30:41', '', '', 'mensaje'),
(589, 174, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-02-10 11:31:23', '', '', 'mensaje'),
(590, 164, 'Comparto mi <a href=\"https://drive.google.com/file/d/13YnU4_l-b5soIIHcQO6QodH6MPh_Ax1d/view\" target=\"_blank\">revisión</a>, Saray. ¡Saludos!&nbsp;<br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-02-10 11:52:11', '', '', 'reasignacion'),
(591, 177, 'Se actualizó la información de la tarea', '63cb2915916798.85801765', '63cb27f4c588d8.85302337', '2023-02-14 11:19:55', '', '', 'mensaje'),
(592, 179, '<p>Gracias Vonchis!<br><br>PD. Esto es un comentario de prueba! :D</p><p><br></p>', '63cb2a6d7f0fb3.85967578', '63cb28a0adb2f2.67596660, 63cb2915916798.85801765, 63e55c9b6b2d98.20695336, 63cb2a6d7f0fb3.85967578, 63cb27f4c588d8.85302337, 63cb26f44ff981.59154321, 63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-14 11:32:41', '', '', 'mensaje'),
(593, 179, '<p>Gracias Vonchis!<br><br>PD. Esto es un comentario de prueba! :D</p><p><br></p>', '63cb2a6d7f0fb3.85967578', '63cb28a0adb2f2.67596660, 63cb2915916798.85801765, 63e55c9b6b2d98.20695336, 63cb2a6d7f0fb3.85967578, 63cb27f4c588d8.85302337, 63cb26f44ff981.59154321, 63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-14 11:32:47', '', '', 'mensaje'),
(594, 179, '<p>Si me llego pero no dice el nombre entonces no se sabe de quien es.&nbsp;</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '63cb2915916798.85801765', '63cb28a0adb2f2.67596660, 63cb2915916798.85801765, 63e55c9b6b2d98.20695336, 63cb2a6d7f0fb3.85967578, 63cb27f4c588d8.85302337, 63cb26f44ff981.59154321, 63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-14 11:33:15', '', '', 'reasignacion'),
(595, 179, '<p>Si me llego pero no dice el nombre entonces no se sabe de quien es.&nbsp;</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '63cb2915916798.85801765', '63cb28a0adb2f2.67596660, 63cb2915916798.85801765, 63e55c9b6b2d98.20695336, 63cb2a6d7f0fb3.85967578, 63cb27f4c588d8.85302337, 63cb26f44ff981.59154321, 63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-14 11:33:21', '', '', 'reasignacion'),
(596, 178, '<p>Hola Von, ya subi la lista de <a href=\"https://docs.google.com/document/d/19LNw-qVpyz6BDQehBDcaEKHOx2mSFVZq/edit?usp=sharing&amp;ouid=109131014069329693634&amp;rtpof=true&amp;sd=true\" target=\"_blank\">elemntos</a> para la elaboración del Styleboard.</p><p>Saludos ☺️</p>', '63cb274b243f88.12842329', '63cb274b243f88.12842329', '2023-02-14 13:08:10', '', '', 'mensaje'),
(597, 182, '<p>Hola Miguel, te comparto el <a href=\"https://docs.google.com/document/d/1WsGTnfv558tKh9UnRRAO2avnR3OuVRCT/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion actualizado</a> con los cambios en el arte y copy para este recurso.</p><p>Saludos :)</p><br>', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-02-14 15:07:42', '', '', 'reasignacion'),
(598, 183, '<p>Hola Miguel te comparto el <a href=\"https://docs.google.com/document/d/1UJ-fdVCObFvW9UteabWGt8SfuoOqmj1i/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion actualizado</a> para el ajuste del recurso.</p><br>', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-02-14 15:19:11', '', '', 'reasignacion'),
(599, 184, '<p>Hola Miguel te asigno el <a href=\"https://docs.google.com/document/d/1kBt0O208uw4D_IlmozSgSq7uOBtqs0kD/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion actualizado</a> para los ajustes en el recurso.</p><br>', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-02-14 15:24:46', '', '', 'reasignacion'),
(600, 179, '<p>Otro comentario de prueba.<br></p><br>', '63cb28a0adb2f2.67596660', '63cb2915916798.85801765, 63e55c9b6b2d98.20695336, 63cb2a6d7f0fb3.85967578, 63cb27f4c588d8.85302337, 63cb26f44ff981.59154321, 63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-14 17:48:19', '', '', 'reasignacion'),
(601, 179, 'Se actualizó la información de la tarea', '63cb2915916798.85801765', '63cb2915916798.85801765, 63e55c9b6b2d98.20695336, 63cb2a6d7f0fb3.85967578, 63cb27f4c588d8.85302337, 63cb26f44ff981.59154321, 63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-15 11:56:40', '', '', 'mensaje'),
(602, 180, 'Se actualizó la información de la tarea', '63cb2915916798.85801765', '63cb28a0adb2f2.67596660, 63cb2915916798.85801765, 63e55c9b6b2d98.20695336, 63cb2a6d7f0fb3.85967578, 63cb27f4c588d8.85302337, 63cb26f44ff981.59154321, 63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-15 11:57:09', '', '', 'mensaje'),
(603, 180, 'Se actualizó la información de la tarea', '63cb2915916798.85801765', '63cb28a0adb2f2.67596660, 63cb2915916798.85801765, 63e55c9b6b2d98.20695336, 63cb2a6d7f0fb3.85967578, 63cb27f4c588d8.85302337, 63cb26f44ff981.59154321, 63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-15 11:57:16', '', '', 'mensaje'),
(604, 180, 'Se actualizó la información de la tarea', '63cb2915916798.85801765', '63cb28a0adb2f2.67596660, 63cb2915916798.85801765, 63e55c9b6b2d98.20695336, 63cb2a6d7f0fb3.85967578, 63cb27f4c588d8.85302337, 63cb26f44ff981.59154321, 63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-15 11:57:17', '', '', 'mensaje'),
(605, 181, 'Se actualizó la información de la tarea', '63cb2915916798.85801765', '63cb28a0adb2f2.67596660, 63cb2915916798.85801765, 63e55c9b6b2d98.20695336, 63cb2a6d7f0fb3.85967578, 63cb27f4c588d8.85302337, 63cb26f44ff981.59154321, 63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-15 11:58:47', '', '', 'mensaje'),
(606, 185, 'Se actualizó la información de la tarea', '63cb2915916798.85801765', '63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-15 17:17:30', '', '', 'mensaje'),
(607, 185, 'Se actualizó la información de la tarea', '63cb2915916798.85801765', '63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-15 17:32:24', '', '', 'mensaje'),
(608, 182, '<p>Hola Mariana, dejo la Versión con los ajustes en <a href=\"https://drive.google.com/drive/folders/1CZpjHk7ncYgpPyn16AljZRi45bQ1YmfI\" target=\"_blank\">Versión Final</a>, saludos.</p><p>También actualice el <a href=\"https://drive.google.com/drive/folders/1cM--851R8u2X1nYHb0qspdBMnubN8BTn\" target=\"_blank\">editable</a> en su carpeta.</p><br>', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866, 62a8da0d97a8f6.25904684', '2023-02-17 18:21:27', '', '', 'reasignacion'),
(609, 184, '<p>Hola Mariana, te asigno la tarjeta con los ajustes, queda en <a href=\"https://drive.google.com/drive/folders/1ELuDAxrWIkVyg9Qq3H116HKufsyF7Uj3\" target=\"_blank\">Versión final</a>, también actualicé el <a href=\"https://drive.google.com/drive/folders/1P0NfIfwydXKtGFpkXs4wJmO4XKSyoshr\" target=\"_blank\">editable</a>, saludos.</p><br>', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-02-17 18:51:17', '', '', 'reasignacion'),
(610, 183, '<p>Hola Mariana, te asigno la galería con los ajustes, dejo la <a href=\"https://drive.google.com/drive/folders/1v8CVsa2ox9VDRAdz3TBxY79t0ZA4aIp2\" target=\"_blank\">Versión final</a> y el <a href=\"https://drive.google.com/drive/folders/1nbJJb-6AlctO6jKxRoOCIJv9G1928hn8\" target=\"_blank\">editables</a> en sus carpetas, saludos.</p><br>', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-02-17 18:59:52', '', '', 'reasignacion'),
(611, 182, '<br>', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-02-17 19:02:00', '', '', 'reasignacion'),
(612, 182, '<br>', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-02-17 19:02:06', '', '', 'reasignacion'),
(613, 182, '<p>Hola Laura, buen día.</p><p>¿Me ayudarías con la revisión del <a href=\"https://drive.google.com/drive/folders/1CZpjHk7ncYgpPyn16AljZRi45bQ1YmfI?usp=share_link\" target=\"_blank\">guion y recursos</a>? Adjunto la <a href=\"https://drive.google.com/drive/folders/1vZz8268_ilLesy6UVYdjyP_Ede_evnxs?usp=share_link\" target=\"_blank\">carpeta de destino</a>.</p><p>Saludos.</p><br>', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-02-20 12:08:20', '', '', 'reasignacion'),
(614, 183, '<p>Hola Laura. ¿Me ayudarías con la revisión del <a href=\"https://drive.google.com/drive/folders/1gyhQTkYQvhZrBnBmX7GZsLU2ykp95UKr?usp=share_link\" target=\"_blank\">guion y los recursos</a>&nbsp;actualizados?</p><p>Saludos.</p><br>', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-02-20 12:10:12', '', '', 'reasignacion'),
(615, 184, '<p>Buen día Laura, ¿me ayudarías con la revisión del <a href=\"https://drive.google.com/drive/folders/1iHQoVA2yPR9siMtCwF110voS9jcN5z1j?usp=share_link\" target=\"_blank\">guion y los recursos </a>actualizados?</p><p>Saludos :)</p><br>', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-02-20 12:11:13', '', '', 'reasignacion'),
(616, 164, '<p>Hola Gonzalo, no tengo comentarios adicionales a los de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-02-20 17:29:05', '', '', 'reasignacion'),
(617, 170, '<p>Hola Gonzalo, no tengo comentarios adicionales a los de Lau. Saludos</p><br>', '62a8a43bb67fa6.38495185', '633eeece335cd2.35066473', '2023-02-20 17:31:11', '', '', 'reasignacion'),
(618, 170, 'Se actualizó la información de la tarea', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-02-20 17:31:52', '', '', 'mensaje'),
(619, 169, '<p>Hola Sam, no tengo comentarios adicionales. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b45df945454.17181395', '2023-02-20 17:33:54', '', '', 'reasignacion'),
(620, 165, '<p>Hola Gonzalo, no tengo comentarios adicionales a los de Ab. Saludos</p><br>', '62a8a43bb67fa6.38495185', '632b472f497b95.12743913', '2023-02-20 17:39:47', '', '', 'reasignacion'),
(621, 182, '<p>Hola team, dejo el PDF para revisión, en la carpeta <a href=\"https://drive.google.com/drive/folders/1qLat_4LMEQGrKOJo3ss3jno7J2ctafWR\" target=\"_blank\">Revisión PROD</a>, saludos.</p>', '62a8da0d97a8f6.25904684', '633eeece335cd2.35066473', '2023-02-21 09:33:26', '', '', 'mensaje'),
(622, 184, '<p>Hola Lau, dejo el PDF para revisión en la carpeta <a href=\"https://drive.google.com/drive/folders/1gIp0XXuX5Q0nM4ZAH2EvrFb2F8-1inQ3\" target=\"_blank\">Revisión PROD</a>, saludos.</p>', '62a8da0d97a8f6.25904684', '633eeece335cd2.35066473', '2023-02-21 09:34:19', '', '', 'mensaje'),
(623, 183, '<p>Hola Lau, dejo el PDF para poder comentar, en la carpeta <a href=\"https://drive.google.com/drive/folders/1J31Of5EN3m1UuaJMogieKeWHg9FdzhLI\" target=\"_blank\">Revisión PROD</a>, saludos.</p>', '62a8da0d97a8f6.25904684', '633eeece335cd2.35066473', '2023-02-21 09:35:07', '', '', 'mensaje'),
(624, 182, '<p>Mariana, te comparto la revisión del <a href=\"https://docs.google.com/document/d/1J5R8LmKZAcS_6GFuVlNkpgF2CmcEyIOs/edit?usp=sharing&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion</a>. En la carpeta que menciona Miguel, agregué la revisión del PDF.</p><br>', '633eeece335cd2.35066473', '636ae7e47631d0.53211866', '2023-02-21 10:21:00', '', '', 'reasignacion'),
(625, 182, '<p>Hola Miguel, me ayudas a aplicar los cambios en <a href=\"https://drive.google.com/file/d/1cSjtbsSgynHRX4VkLCIIYmrQc6M6hjlr/view?usp=share_link\" target=\"_blank\">los recursos</a>.</p><p>También agregué dos comentarios para resaltar unas palabras en la tarjeta de Credencial.</p><p>Saludos :)</p><br>', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-02-21 10:57:33', '', '', 'reasignacion'),
(626, 183, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-02-21 11:03:18', '', '', 'mensaje'),
(627, 184, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-02-21 11:03:35', '', '', 'mensaje'),
(628, 182, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-02-21 11:03:48', '', '', 'mensaje'),
(629, 182, '<p>Listo chicas dejo la V4 en <a href=\"https://drive.google.com/drive/folders/1qLat_4LMEQGrKOJo3ss3jno7J2ctafWR\" target=\"_blank\">Revisión PROD</a>, saludos.</p><br>', '62a8da0d97a8f6.25904684', '633eeece335cd2.35066473, 636ae7e47631d0.53211866', '2023-02-21 13:01:54', '', '', 'reasignacion'),
(630, 171, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-02-21 13:25:39', '', '', 'mensaje'),
(631, 172, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-02-21 13:26:20', '', '', 'mensaje'),
(632, 173, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '636ae7e47631d0.53211866', '2023-02-21 13:31:38', '', '', 'mensaje'),
(633, 174, 'Se actualizó la información de la tarea', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-02-21 13:32:33', '', '', 'mensaje'),
(634, 182, '<p>Gracias Miguel :)</p><p>¿Me ayudarías a subir la <a href=\"https://drive.google.com/drive/folders/1vZz8268_ilLesy6UVYdjyP_Ede_evnxs?usp=share_link\" target=\"_blank\">Versión final</a> y el editable en las carpetas correspondientes?</p><p>Saludos.</p><br>', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-02-21 14:14:22', '', '', 'reasignacion'),
(635, 173, '<p>Hola Gaby y Saray.</p><p>¿Me ayudarían con su VoBo en el <a href=\"https://docs.google.com/document/d/1JkMxhBp-a9oehVZN7TmTr4OuXvjuP6Sr/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a>?</p><p>Saludos :)</p><br>', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-02-21 14:18:47', '', '', 'reasignacion'),
(636, 186, 'Se actualizó la información de la tarea', '63cb2915916798.85801765', '63cb2915916798.85801765, 63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-23 12:10:52', '', '', 'mensaje'),
(637, 186, 'Se actualizó la información de la tarea', '63cb2915916798.85801765', '63cb2915916798.85801765, 63cb27964cb2a3.14800375, 63cb274b243f88.12842329', '2023-02-23 12:10:56', '', '', 'mensaje'),
(638, 178, '<p>Gracias, Danna lo reviso y si tengo obervaciones te comento.&nbsp;</p><br>Se cambio el estado a: <b>completo</b>', '63cb2915916798.85801765', '63cb274b243f88.12842329', '2023-02-23 13:54:40', '', '', 'mensaje'),
(639, 166, '<p>Saray te comparto <a href=\"https://drive.google.com/drive/u/0/folders/1zhYCIem6xYZgtaYGKdjVOKFLGp74OGT1\" target=\"_blank\">mi revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-02-23 16:45:32', '', '', 'reasignacion'),
(640, 167, '<p>Hola Saray, te comparto <a href=\"https://drive.google.com/file/d/1lnhRotUVPS3e6AYzB2LF1vPhmmU2EA1l/view\" target=\"_blank\">mi revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-02-23 17:15:43', '', '', 'reasignacion'),
(641, 133, '<p>Hola Laura te comparto el <a href=\"https://drive.google.com/file/d/17nfQHv3IYi46oR3mzg3JEpThMMkGFZae/view?usp=share_link\" target=\"_blank\">recurso</a> para su revisión, gracias</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b472f497b95.12743913', '633eeece335cd2.35066473', '2023-02-24 12:25:16', '', '', 'reasignacion'),
(642, 134, '<p>Hola Laura te comparto el <a href=\"https://drive.google.com/file/d/1vYWrEAsbbItArP0npelePNdor-Chb0uP/view?usp=share_link\" target=\"_blank\">recurso </a>para su revisión,gracias</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b472f497b95.12743913', '633eeece335cd2.35066473', '2023-02-24 12:44:28', '', '', 'reasignacion'),
(643, 183, '<p>Mariana, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1Qtg1sNqtWNfOdbzdlJS7NrMv8mEG86Fk/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>', '633eeece335cd2.35066473', '636ae7e47631d0.53211866', '2023-02-24 12:47:01', '', '', 'reasignacion'),
(644, 184, '<p>Mariana, no tengo observaciones. Saludos</p><br>', '633eeece335cd2.35066473', '636ae7e47631d0.53211866', '2023-02-24 12:49:00', '', '', 'reasignacion'),
(645, 135, '<p>Hola Laura, te comparto el <a href=\"https://drive.google.com/file/d/1PmaDXkxjnLknQZ6kUNPI6NiU7NORdV4x/view?usp=share_link\" target=\"_blank\">recurso </a>para su revisión, gracias</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b472f497b95.12743913', '633eeece335cd2.35066473', '2023-02-24 13:22:19', '', '', 'reasignacion'),
(646, 148, '<p>Hola Saray los cambios ya fueron realizados del <a href=\"https://drive.google.com/file/d/12ExaiSqLY2CgewJ2LIuRoI-ZdNh3-J58/view?usp=share_link\" target=\"_blank\">recurso</a>&nbsp;gracias&nbsp;</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-24 13:36:56', '', '', 'reasignacion'),
(647, 183, '<p>Hola Miguel, me ayudas a aplicar los <a href=\"https://drive.google.com/file/d/1Qtg1sNqtWNfOdbzdlJS7NrMv8mEG86Fk/view?usp=share_link\" target=\"_blank\">cambios</a>&nbsp;necesarios para subir la Versión final y editable en sus carpetas correspondientes.</p><p>Saludos :)</p><br>', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-02-24 13:45:55', '', '', 'reasignacion'),
(648, 184, '<p>Hola Miguel, ¿me ayudas a subir Versión final y editable en sus carpetas?</p><p>Saludos :)</p><br>', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-02-24 13:46:56', '', '', 'reasignacion'),
(649, 168, '<p>Hola Saray, te comparto <a href=\"https://drive.google.com/file/d/1lXEwGpRJP2j6DbYQnB_uiKGSQkVRjMvt/view\" target=\"_blank\">mi revisión</a>. Muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-02-24 15:01:14', '', '', 'reasignacion'),
(650, 147, '<p>Hola Laura te comparto el <a href=\"https://drive.google.com/file/d/1yU-JHQRViIs_i0F0UOQtVkki8WNxU-uf/view?usp=share_link\" target=\"_blank\">recurso</a> para su revisión gracias</p><br>Se cambio el estado a: <b>en desarrollo</b><br>', '632b472f497b95.12743913', '633eeece335cd2.35066473', '2023-02-24 15:59:14', '', '', 'reasignacion'),
(651, 149, '<p>Hola Gaby el <b><a href=\"https://drive.google.com/file/d/1LaMx1JlJUQmoniENbR2LL4zpjBHmr1i8/view?usp=share_link\" target=\"_blank\">recurso </a></b>ya esta actualizado, gracias</p><br>', '632b472f497b95.12743913', '6345f3d21f53b8.76043717', '2023-02-24 16:10:35', '', '', 'reasignacion'),
(652, 79, '<p>Hola Saray el <b><a href=\"https://drive.google.com/file/d/19RdBaYA3pC4rhD37a6Khq5OBpudsdRKp/view?usp=share_link\" target=\"_blank\">recurso </a></b>ya esta actualizado, gracias</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-24 16:28:53', '', '', 'reasignacion'),
(653, 158, '<p>Hola Saray, ¿cómo estás? Te comparto <a href=\"https://drive.google.com/drive/u/0/folders/13FAX26RIdi_RVoUWkfbjy9XE9_dBC_sv\" target=\"_blank\">mi revisión</a> para QA, muchas gracias.</p><p>¡Saludos!</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-02-24 16:52:40', '', '', 'reasignacion'),
(654, 63, '<p>Hola Saray comparto el <b><a href=\"https://drive.google.com/file/d/1QFau7QhIMRctuX3hz3qZ_BDeNUZ7bmN2/view?usp=share_link\" target=\"_blank\">recurso </a></b>actualizado,gracias</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-24 16:58:33', '', '', 'reasignacion'),
(655, 78, '<p>Hola Gaby el <b><a href=\"https://drive.google.com/file/d/1_yKMrVSPo0511AxaJkYEQbjb-8uuedXe/view?usp=share_link\" target=\"_blank\">recurso </a></b>ya esta actualizado gracias</p><br>', '632b472f497b95.12743913', '6345f3d21f53b8.76043717', '2023-02-24 17:04:45', '', '', 'reasignacion'),
(656, 160, '<p>Hola Saray, te comparto <a href=\"https://drive.google.com/file/d/15sIRtnfoLAUCiOismqyQwXN_p2SDrjT5/view\" target=\"_blank\">mi revisión</a>, muchas gracias.&nbsp;</p><p>¡Saludos!&nbsp;</p><br>', '633eef17cc43c6.86654620', '62a8a43bb67fa6.38495185', '2023-02-24 17:05:54', '', '', 'reasignacion'),
(657, 77, '<p>Hola Saray el <b><a href=\"https://drive.google.com/file/d/1-9gLYK2gCDHHlBuusZ7Fjcalc7-bSjv3/view?usp=share_link\" target=\"_blank\">recurso </a></b>ya esta actualizado, gracias</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-24 18:09:12', '', '', 'reasignacion'),
(658, 65, '<p>Hola Saray, e comparo el <b>recurso</b> actualizado, gracias</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 11:06:12', '', '', 'reasignacion'),
(659, 64, '<p>Hola Saray el <b><a href=\"https://drive.google.com/file/d/1XpV7Qa0K5pR8-xdT2fwf5q4gNIB5EN46/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya esta actualizado, gracias.</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 11:34:28', '', '', 'reasignacion'),
(660, 93, '<p>Hola Saray, el <b><a href=\"https://drive.google.com/file/d/114mMOgx56WSkDtAre17ZUoUO_jAMyyNP/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya esta actualizado, gracias</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 11:53:59', '', '', 'reasignacion'),
(661, 92, '<p>Hola Saray, el <b><a href=\"https://drive.google.com/file/d/1L6G9s2Rpp86E_hTmn1GzgkW8DFsjCu0E/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya esta actualizado, gracias.</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 12:17:30', '', '', 'reasignacion'),
(662, 91, '<p>Hola Saray el <b><a href=\"https://drive.google.com/file/d/13NXWsexg-8Fcth_ZaJIuC_mjScwMxGCi/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya esta actualizado, geacias.</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 12:33:26', '', '', 'reasignacion'),
(663, 105, '<p>Hola Lau te comparto el <b><a href=\"https://drive.google.com/file/d/1CICOIuSacGrumvp8_3Dk07xTXuaL5rDj/view?usp=share_link\" target=\"_blank\">recurso</a></b>, gracias</p><br>', '632b472f497b95.12743913', '633eeece335cd2.35066473', '2023-02-27 12:41:13', '', '', 'reasignacion'),
(664, 107, '<p>Hola Saray, el recurso ya esta en las <b><a href=\"https://drive.google.com/drive/u/0/folders/1saP5XfRe873VA0H04jLHiJrlrTdZbKu7\" target=\"_blank\">carpeta de versión final</a></b>, gracias saludos</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 12:46:19', '', '', 'reasignacion'),
(665, 106, '<p>Hola Saray el <b><a href=\"https://drive.google.com/file/d/1OzrumyOOXYQcfmJOLzt5eMimpuY3BmCq/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya esta actualizado, gracias</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 12:57:42', '', '', 'reasignacion'),
(666, 119, '<p>Hola Saray el <b><a href=\"https://drive.google.com/file/d/11HT5cNf9gSOEcknO358VxMUw8fqDRbMo/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya esta actualizado, gracias</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 13:30:34', '', '', 'reasignacion'),
(667, 121, '<p>Hola Saray, el <b><a href=\"https://drive.google.com/file/d/1lNNUu6-5Pr2zAtwRY-BUdKy0Fv4kzrm7/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya esta actualizado, gracias.</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 13:37:29', '', '', 'reasignacion'),
(668, 120, '<p>Hola Saray el <b><a href=\"https://drive.google.com/file/d/10eU0d_LpUSFdP4JaHHOtYZmmzrf5qs4_/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya esta actualizado, gracias.</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 13:44:30', '', '', 'reasignacion'),
(669, 120, '<p>Hola Saray el <b><a href=\"https://drive.google.com/file/d/10eU0d_LpUSFdP4JaHHOtYZmmzrf5qs4_/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya esta actualizado, gracias.</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 13:44:30', '', '', 'reasignacion'),
(670, 171, '<p>Hola Mariana, muy bien, no tengo comentarios. Saludos</p><br>', '62a8a43bb67fa6.38495185', '6345f3d21f53b8.76043717', '2023-02-27 14:06:13', '', '', 'reasignacion'),
(671, 172, '<p>Hola Mariana, muy bien, sin comentarios. Saludos</p><br>', '62a8a43bb67fa6.38495185', '6345f3d21f53b8.76043717', '2023-02-27 14:13:02', '', '', 'reasignacion'),
(672, 173, '<p>Muy bien Mariana, sin comentarios. Saludos</p><br>', '62a8a43bb67fa6.38495185', '6345f3d21f53b8.76043717', '2023-02-27 14:14:39', '', '', 'reasignacion'),
(673, 174, '<p>Hola Mariana, muy bien, también se puede incluir que compartan una foto de sus juguetes o de ellos de niños, además de las reacciones, lo dejo a tu consideración. Saludos</p><br>', '62a8a43bb67fa6.38495185', '6345f3d21f53b8.76043717', '2023-02-27 14:17:50', '', '', 'reasignacion'),
(674, 149, '<p>Revisado Gonzalo, gracias. Dejar vf en carpetas correspondientes.</p><p>saludos</p><br>', '6345f3d21f53b8.76043717', '632b472f497b95.12743913, 6345f3d21f53b8.76043717', '2023-02-27 14:54:11', '', '', 'reasignacion'),
(675, 164, '<p>Hola Saray el <b><a href=\"https://drive.google.com/file/d/1pwumrXnYS6E8uqR2_XFKnHPiNHda0aCP/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya esta actualizado, gracias</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 14:57:35', '', '', 'reasignacion'),
(676, 149, '<p>probando reasignación.</p><br>', '6345f3d21f53b8.76043717', '632b472f497b95.12743913', '2023-02-27 15:00:41', '', '', 'reasignacion'),
(677, 170, '<p>Hola Saray, el <b><a href=\"https://drive.google.com/file/d/1Ze16qzWQcBDpeAYfTfNVZ40WWHmpQsX3/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya esta actualizado, gracias.</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 15:16:33', '', '', 'reasignacion'),
(678, 165, '<p>Hola Saray el <b><a href=\"https://drive.google.com/file/d/1BKJ7VrqDSPxZ7bwQJEaL4iW9WXUUs8rq/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya esa actualizado, gracias.</p><br>', '632b472f497b95.12743913', '62a8a43bb67fa6.38495185', '2023-02-27 15:26:25', '', '', 'reasignacion'),
(679, 187, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '633eefe21f96f3.52854199', '2023-02-27 17:36:20', '', '', 'mensaje'),
(680, 187, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '633eefe21f96f3.52854199', '2023-02-27 17:37:26', '', '', 'mensaje'),
(681, 187, 'Se actualizó la información de la tarea', '632b472f497b95.12743913', '633eefe21f96f3.52854199', '2023-02-27 17:38:59', '', '', 'mensaje'),
(682, 78, '<p>Hola Gonzalo revisé RED y enlace no esta activo.</p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '632b472f497b95.12743913', '2023-02-27 17:51:20', '', '', 'reasignacion'),
(683, 171, '<p>Muy bien Mariana, sin observaciones.</p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866', '2023-02-27 17:55:43', '', '', 'reasignacion'),
(684, 172, '<p>Gracias Mariana, el único comentario es..se puede incluir alguna reflexión como: ¿Has leído alguna de sus obras?, comparte tus experiencias, ¿qué emociones te generó la lectura?.... lo dejo a tu crirterio.</p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866', '2023-02-27 18:03:02', '', '', 'reasignacion'),
(685, 173, '<p>gracias Mariana! dejo un breve comentario.</p><p><br></p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866', '2023-02-27 18:14:18', '', '', 'reasignacion'),
(686, 173, '<p>los comentarios están <a href=\"https://docs.google.com/document/d/1JkMxhBp-a9oehVZN7TmTr4OuXvjuP6Sr/edit\" target=\"_blank\">aquí.</a></p>', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866', '2023-02-27 18:15:27', '', '', 'mensaje'),
(687, 173, '<p>los comentarios están <a href=\"https://docs.google.com/document/d/1JkMxhBp-a9oehVZN7TmTr4OuXvjuP6Sr/edit\" target=\"_blank\">aquí.</a></p>', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866', '2023-02-27 18:15:29', '', '', 'mensaje'),
(688, 171, '<p>Hola Abraham, ¿me ayudas a revisar el <a href=\"https://docs.google.com/document/d/1nTRFsLEedTN_LQBQt2Z_7WbJuCGB962L/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a>?</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eef17cc43c6.86654620', '2023-02-27 18:16:31', '', '', 'reasignacion'),
(689, 174, '<p>Muy bien Mariana, sin observaciones.</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866', '2023-02-27 18:19:30', '', '', 'reasignacion'),
(690, 149, '<p>Hola Gaby el recurso ya esta en la carpeta de <b><a href=\"https://drive.google.com/drive/u/0/folders/1Ht7wMBY9nudMrqxdIZWpGL8rehwr4VVc\" target=\"_blank\">VF</a></b> gracias</p><br>Reasignado a:', '632b472f497b95.12743913', '6345f3d21f53b8.76043717', '2023-02-27 18:29:55', '', '', 'reasignacion'),
(691, 172, '<p>Buenos días Abraham :)</p><p>Te comparto el <a href=\"https://docs.google.com/document/d/1EF9mH7FGQt1L6XeAIrGXWGaEq-UbnUj_/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a>, ¿me ayudarías a revisarlo?&nbsp;</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eef17cc43c6.86654620', '2023-02-28 09:38:47', '', '', 'reasignacion'),
(692, 183, '<p>Hola Mariana quedan listos los cambios, dejo la <a href=\"https://drive.google.com/drive/u/0/folders/1v8CVsa2ox9VDRAdz3TBxY79t0ZA4aIp2\" target=\"_blank\">Versión final</a>, saludos.</p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-02-28 10:12:06', '', '', 'reasignacion'),
(693, 184, '<p>Listo Mariana, dejo el PNG en <a href=\"https://drive.google.com/drive/folders/1ELuDAxrWIkVyg9Qq3H116HKufsyF7Uj3\" target=\"_blank\">Versión Final</a>, saludos.</p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-02-28 10:14:15', '', '', 'reasignacion'),
(694, 173, '<p>Buenos días Abraham :)</p><p>¿Me ayudarías con tu revisión en el <a href=\"https://docs.google.com/document/d/1JkMxhBp-a9oehVZN7TmTr4OuXvjuP6Sr/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a>?</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eef17cc43c6.86654620', '2023-02-28 10:17:18', '', '', 'reasignacion'),
(695, 182, '<p>Hola, listo Mariana, queda la <a href=\"https://drive.google.com/drive/folders/1vZz8268_ilLesy6UVYdjyP_Ede_evnxs\" target=\"_blank\">Versión final</a> y editable, saludos.</p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-02-28 10:18:32', '', '', 'reasignacion'),
(696, 174, '<p>Hola Abraham, buenos días :)</p><p>¿Me ayudarías con tu revisión en el <a href=\"https://docs.google.com/document/d/1uBLE4ipJZY4eb4rYpQEBbxddeXkePs29/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a>?</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eef17cc43c6.86654620', '2023-02-28 10:53:42', '', '', 'reasignacion'),
(697, 183, '<p>Agregado en parrilla.</p><br>Se cambio el estado a: <b>completo</b><br>Reasignado a:', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-02-28 10:54:39', '', '', 'reasignacion'),
(698, 184, '<p>Agregado en parrilla, gracias :)</p><br>Se cambio el estado a: <b>completo</b><br>Reasignado a:', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-02-28 10:59:28', '', '', 'reasignacion'),
(699, 182, '<p>Agregado a parrilla.</p><br>Se cambio el estado a: <b>completo</b><br>Reasignado a:', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-02-28 10:59:51', '', '', 'reasignacion'),
(700, 78, '<p>Hola Gaby el <b><a href=\"https://drive.google.com/file/d/1_yKMrVSPo0511AxaJkYEQbjb-8uuedXe/view?usp=share_link\" target=\"_blank\">recurso</a></b> ya lo actualice, tiene problema con la liga que aparece abajo ?</p><br>Reasignado a:', '632b472f497b95.12743913', '6345f3d21f53b8.76043717', '2023-02-28 13:53:10', '', '', 'reasignacion'),
(701, 195, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eef17cc43c6.86654620, 633eefe21f96f3.52854199', '2023-03-01 18:06:29', '', '', 'mensaje'),
(702, 194, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eef17cc43c6.86654620, 633eefe21f96f3.52854199', '2023-03-01 18:08:20', '', '', 'mensaje'),
(703, 193, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eef17cc43c6.86654620, 633eefe21f96f3.52854199', '2023-03-01 18:08:50', '', '', 'mensaje'),
(704, 187, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eef17cc43c6.86654620, 633eefe21f96f3.52854199', '2023-03-01 18:11:19', '', '', 'mensaje'),
(705, 188, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eef17cc43c6.86654620, 633eefe21f96f3.52854199', '2023-03-01 18:11:36', '', '', 'mensaje'),
(706, 189, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eef17cc43c6.86654620, 633eefe21f96f3.52854199', '2023-03-01 18:11:56', '', '', 'mensaje'),
(707, 190, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eef17cc43c6.86654620, 633eefe21f96f3.52854199', '2023-03-01 18:12:15', '', '', 'mensaje'),
(708, 191, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eef17cc43c6.86654620, 633eefe21f96f3.52854199', '2023-03-01 18:12:41', '', '', 'mensaje'),
(709, 192, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eef17cc43c6.86654620, 633eefe21f96f3.52854199', '2023-03-01 18:13:04', '', '', 'mensaje'),
(710, 171, '<p>Mariana, ¿cómo estás?, te comparto mis <a href=\"https://docs.google.com/document/d/1XYylbIFKCjYotEG35Q8rhz0h0j-74W56/edit#heading=h.u2s3qr94dgo8\" target=\"_blank\">comentarios</a>. Gracias.&nbsp;</p><p>¡Saludos!</p><br>Reasignado a:', '633eef17cc43c6.86654620', '636ae7e47631d0.53211866', '2023-03-02 15:58:18', '', '', 'reasignacion'),
(711, 171, '<p>Hola Joe, buena tarde.</p><p>Te asigno el <a href=\"https://docs.google.com/document/d/1GM2gbp_V5ZApppnHcv-DyAgkZqlQcG_6/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion</a> para empezar con su producción. Se tratará de una galería de 6 imágenes.</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae845774a90.50892287', '2023-03-02 16:22:03', '', '', 'reasignacion'),
(712, 172, '<p>Mariana, ¿cómo estás?, te comparto mi <a href=\"https://docs.google.com/document/d/1vl_ot59iBvf-gMiaS1TIwjM5p87ZJXIO/edit\" target=\"_blank\">revisión</a>.&nbsp;</p><p>Gracias. ¡Saludos!</p><br>Reasignado a:', '633eef17cc43c6.86654620', '636ae7e47631d0.53211866', '2023-03-03 12:26:14', '', '', 'reasignacion'),
(713, 172, '<p>Hola Joe, linda tarde :)</p><p>Te asigno el <a href=\"https://docs.google.com/document/d/1C_dp19B7S18d_l2lMFQ4JRSoR4eYripo/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion</a> para empezar con la producción del recurso. Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae845774a90.50892287', '2023-03-03 13:54:04', '', '', 'reasignacion'),
(714, 173, '<p>Buenos días, ¿cómo estás Mariana? Te comparto el guion con mis <a href=\"https://docs.google.com/document/d/1WaYE7kPhPc8YIR4zUYXRHpWk4n0oQPR3/edit#\" target=\"_blank\">comentarios</a>, muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>Reasignado a:', '633eef17cc43c6.86654620', '636ae7e47631d0.53211866', '2023-03-06 10:38:14', '', '', 'reasignacion'),
(715, 173, '<p>Hola Joe :) Te comparto el <a href=\"https://docs.google.com/document/d/1EkfyUbzrKNZKmL6W-gaAjBLxTQ4EQYbF/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion</a> para empezar con la producción del recurso.</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae845774a90.50892287', '2023-03-06 13:05:10', '', '', 'reasignacion'),
(716, 174, '<p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;\">Mariana, ¿cómo estás?, te comparto algunos&nbsp;<a href=\"https://docs.google.com/document/d/1d9biDrMOwad7R4AyiCAdekgWdkx4Qeia/edit#heading=h.ko7phhqj0ihr\"><span class=\"s1\" style=\"color: rgb(220, 161, 13);\">comentarios</span></a>.&nbsp;</p><p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;\"><br></p><p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;\">¡Gracias y saludos!&nbsp;</p><br>Reasignado a:', '633eef17cc43c6.86654620', '636ae7e47631d0.53211866', '2023-03-06 16:59:53', '', '', 'reasignacion'),
(717, 174, '<p>Buen día Joe :) Te asigno el <a href=\"https://docs.google.com/document/d/19D6sxPE2bFMNdCuLFzHUEz0sWrJ9RBYu/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion</a> para empezar con su producción.</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae845774a90.50892287', '2023-03-07 11:05:32', '', '', 'reasignacion'),
(718, 195, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eefe21f96f3.52854199', '2023-03-07 12:19:08', '', '', 'mensaje'),
(719, 192, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eefe21f96f3.52854199', '2023-03-07 12:19:26', '', '', 'mensaje'),
(720, 191, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eefe21f96f3.52854199', '2023-03-07 12:19:45', '', '', 'mensaje'),
(721, 189, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eefe21f96f3.52854199', '2023-03-07 12:19:59', '', '', 'mensaje'),
(722, 188, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eefe21f96f3.52854199', '2023-03-07 12:20:13', '', '', 'mensaje'),
(723, 190, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eefe21f96f3.52854199', '2023-03-07 15:43:07', '', '', 'mensaje'),
(724, 187, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eefe21f96f3.52854199', '2023-03-07 15:43:47', '', '', 'mensaje'),
(725, 195, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eef17cc43c6.86654620', '2023-03-07 15:47:36', '', '', 'mensaje'),
(726, 193, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eef17cc43c6.86654620', '2023-03-07 15:47:53', '', '', 'mensaje'),
(727, 194, 'Se actualizó la información de la tarea', '633eefe21f96f3.52854199', '633eef17cc43c6.86654620', '2023-03-07 15:48:13', '', '', 'mensaje'),
(728, 147, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1VidFYNx9BhD04yBXW9SpG1qn1fX1yh_Q/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>Reasignado a:', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-03-09 12:04:17', '', '', 'reasignacion'),
(729, 105, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1TRTY5SQnxc6iSuaioubIavrqHdr30PHt/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>Reasignado a:', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-03-09 12:33:53', '', '', 'reasignacion'),
(730, 172, '<p>Hola Mariana dejo <a href=\"https://drive.google.com/drive/folders/1PLNzUV0xcmbhNEW55xB1FlqypbN6-OE2\" target=\"_blank\">el recurso de Octavio Paz </a>para revisión, saludos y gracias.</p><br>Reasignado a:', '636ae845774a90.50892287', '636ae7e47631d0.53211866', '2023-03-09 17:45:16', '', '', 'reasignacion'),
(731, 172, '<p>Hola César, te asigno el <a href=\"https://drive.google.com/file/d/1ooe5gyQkINivVn54hFRoX0_A8brDfxYm/view?usp=share_link\" target=\"_blank\">recurso V1</a> para su primera revisión del diseño.</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-03-10 10:35:42', '', '', 'reasignacion'),
(732, 133, '<p>Saray, no tengo observaciones. Saludos</p><br>Reasignado a:', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-03-13 12:32:33', '', '', 'reasignacion'),
(733, 171, '<p>Hola Mariana. Dejo <a href=\"https://drive.google.com/drive/folders/1OCqbh61r-KlmxPPlfGOFs_k-fM6FRXQI\" target=\"_blank\">el recurso producido para revisión</a>, saludos y gracias.</p><br>Reasignado a:', '636ae845774a90.50892287', '636ae7e47631d0.53211866', '2023-03-14 12:30:36', '', '', 'reasignacion'),
(734, 171, '<p>Hola César, te comparto el <a href=\"https://drive.google.com/file/d/1loM0bkULpflMT4pOPbUcfdSzG7Sao1xa/view?usp=share_link\" target=\"_blank\">recurso V1</a> para la revisión del diseño :)</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-03-14 13:11:10', '', '', 'reasignacion'),
(735, 125, 'Se actualizó la información de la tarea', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2023-03-14 13:49:17', '', '', 'mensaje'),
(736, 172, '<p>Hola Mariana, comparto <a href=\"https://drive.google.com/file/d/1DPtOzBPODy-AvZpYSu0nsu-0DIuv2Qj9/view?usp=share_link\" target=\"_blank\">comentarios</a>. Gracias</p><br>Reasignado a:', '636ae6f2b13177.70285172', '636ae7e47631d0.53211866', '2023-03-14 16:37:05', '', '', 'reasignacion'),
(737, 171, '<p>Hola Mariana, comparto <a href=\"https://drive.google.com/file/d/1g_UFL_bivZbhiHMobnTZEDmzrjC0yDJg/view?usp=share_link\" target=\"_blank\">comentarios</a>. Gracias</p><br>Reasignado a:', '636ae6f2b13177.70285172', '636ae7e47631d0.53211866', '2023-03-14 16:43:40', '', '', 'reasignacion'),
(738, 171, '<p>Hola Abraham, ¿nos ayudarías con tu revisión CE en el <a href=\"https://drive.google.com/file/d/1g_UFL_bivZbhiHMobnTZEDmzrjC0yDJg/view?usp=share_link\" target=\"_blank\">recurso V1</a>?</p><p>Bonita tarde :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eef17cc43c6.86654620', '2023-03-14 16:54:00', '', '', 'reasignacion'),
(739, 172, '<p>Buenas tardes Abraham, te comparto el <a href=\"https://drive.google.com/file/d/1DPtOzBPODy-AvZpYSu0nsu-0DIuv2Qj9/view?usp=share_link\" target=\"_blank\">recurso V1</a> para tu revisión :)</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eef17cc43c6.86654620', '2023-03-14 17:05:52', '', '', 'reasignacion'),
(740, 127, '<p>Hola</p>', '5c0653d43d92e7.75019474', '5c0653d43d92e7.75019474', '2023-03-14 17:34:52', '', '', 'mensaje'),
(741, 173, '<p>Hola Mariana buenos días, te dejo <a href=\"https://drive.google.com/drive/folders/1y2nmrIqlWSOXpqnmj5i3xytFtdiw_ozJ\" target=\"_blank\">el recurso para revisión</a>, saludos y gracias.</p><br>Reasignado a:', '636ae845774a90.50892287', '636ae7e47631d0.53211866', '2023-03-17 10:16:32', '', '', 'reasignacion'),
(742, 173, '<p>No tengo obs, muchas gracias Joe :)</p><p>Hola César, te comparto el <a href=\"https://drive.google.com/drive/folders/1y2nmrIqlWSOXpqnmj5i3xytFtdiw_ozJ?usp=share_link\" target=\"_blank\">recurso V1</a> para su revisión de diseño.</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-03-17 12:17:08', '', '', 'reasignacion'),
(743, 171, '<p>Mariana, ¿cómo estás?, comparto <a href=\"https://drive.google.com/file/d/1r4ZcOaZotfl_DjFVHIFEyRDur9wZ_iNQ/view\" target=\"_blank\">comentarios</a>. Muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>Reasignado a:', '633eef17cc43c6.86654620', '636ae7e47631d0.53211866', '2023-03-21 11:13:19', '', '', 'reasignacion'),
(744, 171, '<p>Hola Joe, buenos días :)</p><p>Te comparto los <a href=\"https://drive.google.com/file/d/1r4ZcOaZotfl_DjFVHIFEyRDur9wZ_iNQ/view?usp=share_link\" target=\"_blank\">ajustes del recurso</a> para aplicar cambios, saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae845774a90.50892287', '2023-03-21 11:50:57', '', '', 'reasignacion'),
(745, 172, '<p>Mariana, ¿cómo estás?, te comparto mis <a href=\"https://drive.google.com/file/d/1fhV7IpXzVMaEMEkIMDSKoxekwnz2xhrf/view\" target=\"_blank\">comentarios</a>.&nbsp;</p><p>Muchas gracias y saludos.&nbsp;</p><br>Reasignado a:', '633eef17cc43c6.86654620', '636ae7e47631d0.53211866', '2023-03-21 12:03:14', '', '', 'reasignacion'),
(746, 174, '<p>Hola, buenas tardes Mariana, te dejo <a href=\"https://drive.google.com/drive/folders/1G2EgwpmCUSHj583rmiegOEpb_mJD7GFe\" target=\"_blank\">el recursos del día del niño para revisión</a>, saludos y gracias.</p><br>Reasignado a:', '636ae845774a90.50892287', '636ae7e47631d0.53211866', '2023-03-21 13:07:46', '', '', 'reasignacion'),
(747, 171, '<p>Hola Mariana, buenas tardes, dejo la <a href=\"https://drive.google.com/drive/folders/1OCqbh61r-KlmxPPlfGOFs_k-fM6FRXQI\" target=\"_blank\">V2 del recursos del día&nbsp;</a><span style=\"font-size: 1rem;\"><a href=\"https://drive.google.com/drive/folders/1OCqbh61r-KlmxPPlfGOFs_k-fM6FRXQI\" target=\"_blank\">de la salud </a>con las obs&nbsp;</span>aplicadas, saludos y gracias.<br></p><br>Reasignado a:', '636ae845774a90.50892287', '636ae7e47631d0.53211866', '2023-03-21 13:59:32', '', '', 'reasignacion'),
(748, 171, '<p><p>Buenas tardes Gaby y Saray, les comparto el <a href=\"https://drive.google.com/file/d/1D4J5NSndvlomILUnO_IjLMOkqhpux_vt/view?usp=share_link\" target=\"_blank\">recurso V2</a>&nbsp;del 7 de abril para su VoBo, saludos :)</p><a href=\"https://drive.google.com/drive/folders/1OCqbh61r-KlmxPPlfGOFs_k-fM6FRXQI?usp=share_link\" target=\"_blank\">Revisión PROD</a></p><p><br>Reasignado a:</p>', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-03-21 16:38:50', '', '', 'mensaje'),
(749, 172, '<p>Hola Joe, buena tarde :)</p><p>¿Me ayudarías a aplicar los cambios en el <a href=\"https://drive.google.com/file/d/1fhV7IpXzVMaEMEkIMDSKoxekwnz2xhrf/view?usp=share_link\" target=\"_blank\">recurso</a>? Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae845774a90.50892287', '2023-03-21 16:46:49', '', '', 'reasignacion');
INSERT INTO `tareas_mensajes` (`ID`, `ID_TAREA`, `MENSAJE`, `ID_USUARIO`, `ASIGNACIONES`, `FECHA_REGISTRO`, `ENLACE`, `ADJUNTO`, `TIPO`) VALUES
(750, 174, '<p>Gracias Joe, quedaron geniales :)</p><p>Buenas tardes César, ¿me ayudarías a <a href=\"https://drive.google.com/file/d/1rpVb2yEH6suVMjBDercwH1KiEM1sLXwI/view?usp=share_link\" target=\"_blank\">revisar el recurso V1</a>? Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-03-21 16:49:56', '', '', 'reasignacion'),
(751, 174, '<p>Muy bien, solo creo que le falta un acento a la palabra \"Estas\" en la primera tarjeta. Saludos.</p><br>Reasignado a:', '636ae6f2b13177.70285172', '636ae7e47631d0.53211866', '2023-03-21 17:31:59', '', '', 'reasignacion'),
(752, 173, 'Sin comentarios. Saludos.<br>Reasignado a:', '636ae6f2b13177.70285172', '636ae7e47631d0.53211866', '2023-03-21 17:33:23', '', '', 'reasignacion'),
(753, 172, '<p>Hola Mariana buenas tardes, dejo la <a href=\"https://drive.google.com/drive/folders/1PLNzUV0xcmbhNEW55xB1FlqypbN6-OE2\" target=\"_blank\">V2 del recurso de Octavio Paz</a>, saludos y gracias.</p><br>Reasignado a:', '636ae845774a90.50892287', '636ae7e47631d0.53211866', '2023-03-21 17:51:33', '', '', 'reasignacion'),
(754, 172, '<p>Buenas tardes Gaby y Saray, les comparto el <a href=\"https://drive.google.com/file/d/10W0-jnd2dZGE5oVGrs_ZCQaJkx0tst-8/view?usp=share_link\" target=\"_blank\">recurso</a> para su VoBo.</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-03-21 18:04:23', '', '', 'reasignacion'),
(755, 174, '<p>Hola Abraham :)&nbsp;</p><p>¿Me ayudarías con la revisión del <a href=\"https://drive.google.com/file/d/1rpVb2yEH6suVMjBDercwH1KiEM1sLXwI/view\" target=\"_blank\">siguiente recurso?</a></p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eef17cc43c6.86654620', '2023-03-21 18:05:45', '', '', 'reasignacion'),
(756, 173, '<p>Hola Abraham :)&nbsp;</p><p>Te comparto el <a href=\"https://drive.google.com/drive/folders/1y2nmrIqlWSOXpqnmj5i3xytFtdiw_ozJ?usp=share_link\" target=\"_blank\">recurso</a> para su revisión CE, saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eef17cc43c6.86654620', '2023-03-21 18:06:54', '', '', 'reasignacion'),
(757, 174, '<p>Hola, solo tengo un <a href=\"https://drive.google.com/file/d/1uDVWjjsgHzdhYOok3YqNeoBTowbyqvJA/view\" target=\"_blank\">comentario</a>. Por otra parte, sobre el demostrativo \"Estas\", aunque se puede tildar, siempre y cuando exista&nbsp;ambigüedad, se sigue recomendando no hacerlo.&nbsp;</p><p>Muchas gracias y saludos.&nbsp;</p><br>Reasignado a:', '633eef17cc43c6.86654620', '636ae7e47631d0.53211866', '2023-03-22 11:41:12', '', '', 'reasignacion'),
(758, 173, '<p>Hola :)</p><p>Recurso revisado y sin comentarios, todo al 100. Muchas gracias.&nbsp;</p><p>¡Saludos!</p><br>Reasignado a:', '633eef17cc43c6.86654620', '636ae7e47631d0.53211866', '2023-03-22 11:45:01', '', '', 'reasignacion'),
(759, 173, '<p>Hola Gaby y Saray, les comparto el <a href=\"https://drive.google.com/drive/folders/1y2nmrIqlWSOXpqnmj5i3xytFtdiw_ozJ?usp=share_link\" target=\"_blank\">recurso</a> para su VoBo.</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-03-22 16:56:07', '', '', 'reasignacion'),
(760, 174, '<p>Gracias chicos, Joe te asigno de nuevo el <a href=\"https://drive.google.com/file/d/1uDVWjjsgHzdhYOok3YqNeoBTowbyqvJA/view\" target=\"_blank\">recurso</a> para realizar el cambio.&nbsp;</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae845774a90.50892287', '2023-03-22 17:17:51', '', '', 'reasignacion'),
(761, 174, '<p>Hola Mariana, buenos días, te dejo la <a href=\"https://drive.google.com/drive/folders/1G2EgwpmCUSHj583rmiegOEpb_mJD7GFe\" target=\"_blank\">V2 del recurso del día del niño</a>, saludos y gracias.</p><br>Reasignado a:', '636ae845774a90.50892287', '636ae7e47631d0.53211866', '2023-03-23 09:46:33', '', '', 'reasignacion'),
(762, 174, '<p>Buenos días Gaby y Saray, les comparto el <a href=\"https://www.facebook.com/PrepaEnLineadelaSEP/posts/pfbid08k5sqUFbB6L3dmBCnR8fsXWNeXZDKfykWowLnGNPSBhUXyD1ABCjDmiooqaxph7Wl\" target=\"_blank\">recurso</a> para su VoBo.</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-03-23 10:06:29', '', '', 'reasignacion'),
(763, 134, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1Jq0KTay0DRF_qSTbRWJOMeJxeWLVlPH5/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>Reasignado a:', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-03-24 12:11:20', '', '', 'reasignacion'),
(764, 135, '<p>Saray, te comparto la revisión del <a href=\"https://drive.google.com/file/d/1gxrBgASgbt5Y3gux2UDNuR-2Lv369L7T/view?usp=sharing\" target=\"_blank\">recurso</a>.</p><br>Reasignado a:', '633eeece335cd2.35066473', '62a8a43bb67fa6.38495185', '2023-03-24 12:52:48', '', '', 'reasignacion'),
(765, 196, '<p>Hola Mariana</p><p><br></p><p>Te comparto el guion revisado del Aniversario de la Batalla de Puebla.</p><p><br></p><p>Saludos</p><br>Reasignado a:', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-03-27 13:58:25', '', '', 'reasignacion'),
(766, 197, '<p>Buenas tardes, Mariana:</p><p><br></p><p>Te comparto <a href=\"https://docs.google.com/document/d/14Hii97keA8R1QXtHzITwJ69HwNFlS2Ld/edit?usp=share_link&amp;ouid=103939789605101088343&amp;rtpof=true&amp;sd=true\" target=\"_blank\">el guion </a>del 10 de mayo revisado.</p><p><br></p><p>Saludos</p><br>Reasignado a:', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-03-27 14:13:45', '', '', 'reasignacion'),
(767, 197, '<p>Buenas tardes, Mariana:</p><p><br></p><p>Te comparto <a href=\"https://docs.google.com/document/d/14Hii97keA8R1QXtHzITwJ69HwNFlS2Ld/edit?usp=share_link&amp;ouid=103939789605101088343&amp;rtpof=true&amp;sd=true\" target=\"_blank\">el guion </a>del 10 de mayo revisado.</p><p><br></p><p>Saludos</p><br>Reasignado a:', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-03-27 14:13:47', '', '', 'reasignacion'),
(768, 196, '<p>Buen lunes Gaby y Saray :)</p><p>Les comparto el <a href=\"https://docs.google.com/document/d/11Tvce-7tiz-Nz4isFSR_e45bz3nBBxv2/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a> para continuar con su VoBo.&nbsp;</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-03-27 14:24:34', '', '', 'reasignacion'),
(769, 198, '<p>Hola, Mariana,</p><p><br></p><p>Te comparto el <a href=\"https://docs.google.com/document/d/1AT82jrnj9GGlt8v6rMuNTplvF1K-c2KY/edit?usp=share_link&amp;ouid=103939789605101088343&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion del Día de Maestro.</a></p><p><br></p><p>Saludos</p><br>Reasignado a:', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-03-27 14:26:58', '', '', 'reasignacion'),
(770, 199, '<p>Hola Mariana:</p><p><br></p><p>Te comparto el<a href=\"https://docs.google.com/document/d/1qbVG9BDm_FhCd02bM1Lik1nHRoUwMSvj/edit?usp=share_link&amp;ouid=103939789605101088343&amp;rtpof=true&amp;sd=true\" target=\"_blank\"> guion revisado</a> del Día Mundial del Internet.</p><p><br></p><p><br></p><p>Saludos</p><br>Reasignado a:', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-03-27 14:45:17', '', '', 'reasignacion'),
(771, 200, '<p>Hola Mariana:</p><p><br></p><p>Te comparto el <a href=\"https://docs.google.com/document/d/1AKQL036DxEEkm_7e9VSL2xXoS9b-jDkI/edit?usp=share_link&amp;ouid=103939789605101088343&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion revisado</a> del Día de la Diversidad Cultural.</p><p><br></p><p><br></p><p>Saludos</p><p><br></p><br>Reasignado a:', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-03-27 15:12:59', '', '', 'reasignacion'),
(772, 201, '<p>Hola Mariana:</p><p><br></p><p>Te comparto el <a href=\"https://docs.google.com/document/d/1Tig7NKNEl7cizjDkKbv8Ikd_CMgAA3Hs/edit?usp=share_link&amp;ouid=103939789605101088343&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion del Día del Estudiante </a>revisado.</p><p><br></p><p><br></p><p>Saludos</p><br>Reasignado a:', '633eefe21f96f3.52854199', '636ae7e47631d0.53211866', '2023-03-27 15:21:08', '', '', 'reasignacion'),
(773, 197, '<p>Hola Gaby y Saray, les comparto el <a href=\"https://docs.google.com/document/d/1MIc2Fuio3aROfdMi6R2hjRsMd7i-BrPL/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a> para continuar con su VoBo.</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-03-27 16:18:02', '', '', 'reasignacion'),
(774, 198, '<p>Hola Gaby y Saray, ¿me ayudarían con su VoBo en el siguiente <a href=\"https://docs.google.com/document/d/1Ljp9s67MmcWULxwEJtk2-4WvsdGI8Rx0/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a>?</p><p>Linda tarde :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-03-27 16:30:25', '', '', 'reasignacion'),
(775, 199, '<p>Buenas tardes Gaby y Saray :)</p><p>¿Me ayudarían con su VoBo en el siguiente <a href=\"https://docs.google.com/document/d/1k6PHZJnmZHS9iakH_soy0ffYYQoTv4Mq/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a>?</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-03-27 16:48:29', '', '', 'reasignacion'),
(776, 200, '<p>Hola, buenas tardes Gaby y Saray.</p><p>Les comparto el <a href=\"https://docs.google.com/document/d/1qDmH7COJlz-CcqXyc9BfMWxQqKA55baB/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a> para continuar con su VoBo, saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-03-27 17:24:50', '', '', 'reasignacion'),
(777, 201, '<p>Hola Gaby y Saray :)&nbsp;</p><p>¿Me ayudarían con su VoBo en el siguiente <a href=\"https://docs.google.com/document/d/1_uwBA7d5ekhlBFOkVE4wMDOcXfyv-lvc/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a>?</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-03-27 17:35:17', '', '', 'reasignacion'),
(778, 171, '<p>Muy bien Mariana, no tengo observaciones.</p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866, 62a8a43bb67fa6.38495185', '2023-03-29 14:16:18', '', '', 'reasignacion'),
(779, 171, '<p>Muy bien Mariana, no tengo observaciones.</p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866, 62a8a43bb67fa6.38495185', '2023-03-29 14:16:20', '', '', 'reasignacion'),
(780, 172, '<p>Muy bien Mariana!!, sin observaciones.</p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866, 62a8a43bb67fa6.38495185', '2023-03-29 14:20:11', '', '', 'reasignacion'),
(781, 173, '<p>Sin observaciones Mariana, todo ok.</p><p><br></p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866, 62a8a43bb67fa6.38495185', '2023-03-29 14:22:57', '', '', 'reasignacion'),
(782, 174, '<p>Muy bien Mariana!!!!</p><p><span style=\"font-size: 1rem;\">aludos</span><br></p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866, 62a8a43bb67fa6.38495185', '2023-03-29 14:28:23', '', '', 'reasignacion'),
(783, 171, '<p>Hola Mariana, todo en orden, muy bien. Saludos</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '636ae7e47631d0.53211866', '2023-03-29 14:43:38', '', '', 'reasignacion'),
(784, 174, '<p>Me encantó, muchas gracias. Saludos</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '636ae7e47631d0.53211866', '2023-03-29 14:45:12', '', '', 'reasignacion'),
(785, 172, '<p>Hola Mariana, sólo tengo una duda, en el arte 2 veo la foto del libro de El laberinto de la soledad con otros títulos, según yo, esa compilación salió años después y no en 1950 como dice el texto (pero no estoy segura), por favor apóyame a revisar, si se puede cambiar la imagen por la portada del libro donde viene sólo el laberinto, sería mejor. Cualquier cosa, quedo atenta. Saludos</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '636ae7e47631d0.53211866', '2023-03-29 16:00:08', '', '', 'reasignacion'),
(786, 173, '<p>Muy bonito Mariana, sin comentarios. Saludos</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '636ae7e47631d0.53211866', '2023-03-29 16:02:50', '', '', 'reasignacion'),
(787, 196, '<p>Hola Mariana, muchas gracias, no tengo comentarios. Saludos</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '6345f3d21f53b8.76043717', '2023-03-29 16:07:27', '', '', 'reasignacion'),
(788, 197, '<p>Bellísimo, me encantó. Saludos</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '6345f3d21f53b8.76043717', '2023-03-29 16:08:32', '', '', 'reasignacion'),
(789, 198, '<p>Hola Mariana, está muy bonito. Sugiero que se cambie o elimine la palabra \"enseñanza\", es un término más de la modalidad presencial que no tenemos en nuestro Modelo educativo. Todo lo demás está perfecto. Saludos</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '6345f3d21f53b8.76043717', '2023-03-29 16:11:12', '', '', 'reasignacion'),
(790, 199, '<p>Muchas gracias Mariana, veo que las publicaciones han evolucionado y no nos quedamos en sólo dar una definición de la efeméride, aplaudo el progreso y esfuerzo de tu parte. Saludos</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '6345f3d21f53b8.76043717', '2023-03-29 16:13:15', '', '', 'reasignacion'),
(791, 200, '<p>Hola Mariana, muy bien, todo en orden. Saludos</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '6345f3d21f53b8.76043717', '2023-03-29 16:24:30', '', '', 'reasignacion'),
(792, 201, '<p>Awww, me encantó el guion. Excelente trabajo Mariana. Sólo, por favor cambia lo siguiente:</p><p><span style=\"background-color: transparent; font-family: Montserrat, sans-serif; font-size: 11pt; white-space: pre-wrap;\">Quienes saludan a toda la clase.</span></p><p><span style=\"background-color: transparent; font-family: Montserrat, sans-serif; font-size: 11pt; white-space: pre-wrap;\">Porque no tenemos clases en PL-SEP, eso es de presencial. Puedes poner: Quienes saludan a todos en los foros y sesiones. </span></p><p><br></p><p>Saludos</p><p>&nbsp;</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '6345f3d21f53b8.76043717', '2023-03-29 16:27:16', '', '', 'reasignacion'),
(793, 171, '<p>Hola Joe, buen día.&nbsp;</p><p>¿Me ayudarías a subir Versión final y editable en sus carpetas?&nbsp;</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae845774a90.50892287', '2023-03-30 09:55:01', '', '', 'reasignacion'),
(794, 173, '<p>Hola Joe, buen día.&nbsp;</p><p>¿Me ayudarías a subir Versión final y editable en sus carpetas?&nbsp;</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae845774a90.50892287', '2023-03-30 09:55:35', '', '', 'reasignacion'),
(795, 174, '<p>Hola Joe, buen día.&nbsp;</p><p>¿Me ayudarías a subir Versión final y editable en sus carpetas?&nbsp;</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae845774a90.50892287', '2023-03-30 09:56:06', '', '', 'reasignacion'),
(796, 172, '<p>Hola Joe, ¿me ayudarías a aplicar el cambio en el arte? Te comparto en el <a href=\"https://drive.google.com/file/d/10W0-jnd2dZGE5oVGrs_ZCQaJkx0tst-8/view?usp=sharing\" target=\"_blank\">recurso </a>el comentario con dos enlaces para extraer la portada del año correspondiente :)</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae845774a90.50892287', '2023-03-30 10:07:28', '', '', 'reasignacion'),
(797, 172, '<p>Hola Joe, ¿me ayudarías a aplicar el cambio en el arte? Te comparto en el <a href=\"https://drive.google.com/file/d/10W0-jnd2dZGE5oVGrs_ZCQaJkx0tst-8/view?usp=sharing\" target=\"_blank\">recurso </a>el comentario con dos enlaces para extraer la portada del año correspondiente :)</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae845774a90.50892287', '2023-03-30 10:07:31', '', '', 'reasignacion'),
(798, 171, '<p>Hola Mariana, buenos días, listo <a href=\"https://drive.google.com/drive/folders/1EUxJrz1O8gd9METFWfweAB1RxTi7GfyQ\" target=\"_blank\">el editable en su carpeta</a> y <a href=\"https://drive.google.com/drive/folders/1wStu3sb77AnKkrQw6DgLiljXKshVy0B3\" target=\"_blank\">las VF en su carpeta</a>, saludos y gracias.</p><br>Reasignado a:', '636ae845774a90.50892287', '636ae7e47631d0.53211866', '2023-03-30 10:17:40', '', '', 'reasignacion'),
(799, 171, '<p>Gracias team :) <span style=\"font-size: 1rem;\">Agregado a parrilla.</span></p><br>Se cambio el estado a: <b>completo</b><br>Reasignado a:', '636ae7e47631d0.53211866', '', '2023-03-30 11:04:56', '', '', 'reasignacion'),
(800, 173, 'Buenos días Mariana, dejo la <a href=\"https://drive.google.com/drive/folders/1-krRxfdNVg4SlZyuaZGdcyTeLRX-HZNt\" target=\"_blank\">VF en su carpeta</a> y <a href=\"https://drive.google.com/drive/folders/1TGDvWoa_jGj496WahxwiSScVgzOXlPKl\" target=\"_blank\">el editable</a>, saludos y gracias.<br>Reasignado a:', '636ae845774a90.50892287', '636ae7e47631d0.53211866', '2023-03-30 11:48:07', '', '', 'reasignacion'),
(801, 173, '<p>Gracias team :) Agregado a parrilla.</p><br>Se cambio el estado a: <b>completo</b><br>Reasignado a:', '636ae7e47631d0.53211866', '', '2023-03-30 12:10:05', '', '', 'reasignacion'),
(802, 174, '<p>Hola, buenas tardes, dejo la <a href=\"https://drive.google.com/drive/folders/1jp3J_2wvIMm25afxqO4KVhYv1Wwe9N9x\" target=\"_blank\">VF del recurso</a> y <a href=\"https://drive.google.com/drive/folders/1Z_kfcF_Q7PGzMcfN7ecoIflLJzBKOnK3\" target=\"_blank\">su editable</a>, saludos y gracias.</p><br>Reasignado a:', '636ae845774a90.50892287', '636ae7e47631d0.53211866', '2023-03-30 12:12:56', '', '', 'reasignacion'),
(803, 172, '<p>Hola Mariana, buenas tardes, dejo la <a href=\"https://drive.google.com/drive/folders/1QFmKC09xPaF3fDqEuEtN_nRQ6AKtfEC1\" target=\"_blank\">VF del recurso</a> y <a href=\"https://drive.google.com/drive/folders/1LhQb2UrzSGmVd7fEDB48fEteKQDJEFTn\" target=\"_blank\">su editable</a>, saludos y gracias.</p><br>Reasignado a:', '636ae845774a90.50892287', '636ae7e47631d0.53211866', '2023-03-30 13:03:02', '', '', 'reasignacion'),
(804, 172, '<p>Gracias :) Agregado a parrilla.</p><br>Se cambio el estado a: <b>completo</b><br>Reasignado a:', '636ae7e47631d0.53211866', '', '2023-03-30 13:31:14', '', '', 'reasignacion'),
(805, 174, '<p>Gracias team :) Agregado a parrilla.</p><br>Se cambio el estado a: <b>completo</b><br>Reasignado a:', '636ae7e47631d0.53211866', '', '2023-03-30 13:34:18', '', '', 'reasignacion'),
(806, 171, '<p><br></p>', '636ae7e47631d0.53211866', '', '2023-03-30 16:28:48', '', '', 'mensaje'),
(807, 172, '<p><br></p>', '636ae7e47631d0.53211866', '', '2023-03-30 16:29:48', '', '', 'mensaje'),
(808, 232, '<p>Hola :)</p><p>Comparto el estatus de cada dirección:&nbsp;</p><p><a href=\"https://docs.google.com/document/d/1aFtqgT_Tn9fHz2NY8A0jR12sDE30k-Ed/edit\" target=\"_blank\">DSAyDC</a></p><p><a href=\"https://docs.google.com/document/d/1FxeS58MIvo-gEpbOB8GzZZH9b6lX7IVi/edit\" target=\"_blank\">DTyDIE</a></p><p><a href=\"https://docs.google.com/document/d/18EtfFjvrV3FxHcMXCpJmSL0ys7ah0_js/edit\" target=\"_blank\">DCE</a></p><p><a href=\"https://docs.google.com/document/d/1qFdq3r5rfqRmttoMYhkwV3M5k9_HbJH1/edit#\" target=\"_blank\">DAyME</a></p><p>Quedo al pendiente de cualquier duda o comentario, gracias.&nbsp;<br><br><br><br><br></p>', '633eef17cc43c6.86654620', '633eefe21f96f3.52854199', '2023-04-10 14:44:25', '', '', 'mensaje'),
(809, 215, '<p>Hola Dennise:</p><p><br></p><p>Te comparto el <a href=\"https://docs.google.com/document/d/1u_jaU72Mj2a04KEwBW6fB4F2JXFu2_ph/edit?usp=share_link&amp;ouid=103939789605101088343&amp;rtpof=true&amp;sd=true\" target=\"_blank\">archivo</a> con mi revisión.</p><p><br></p><p>Saludos.</p>', '633eefe21f96f3.52854199', '', '2023-04-17 13:28:04', '', '', 'mensaje'),
(810, 216, '<p>Hola Dennise</p><p>Te comparto <a href=\"https://docs.google.com/document/d/13JtaXRCXBmfvOIHHLPNQMwV75fw9x0DT/edit?usp=share_link&amp;rtpof=true&amp;sd=true\" target=\"_blank\">el archivo</a> con mi revisión.</p><p><br></p><p>saludos.</p>', '633eefe21f96f3.52854199', '', '2023-04-17 15:26:19', '', '', 'mensaje'),
(811, 217, '<p>Hola Denise,</p><p><br></p><p>Te comparto <a href=\"https://docs.google.com/document/d/1pqI6w2bm5dBCileKyvYjAgspldb6Dmw-/edit?usp=share_link&amp;ouid=103939789605101088343&amp;rtpof=true&amp;sd=true\" target=\"_blank\">el enlace</a> con mi revisión.</p><p><br></p><p><br></p><p>Saludos</p>', '633eefe21f96f3.52854199', '', '2023-04-17 16:50:42', '', '', 'mensaje'),
(812, 201, '<p>Gracias Mariana!! sin observaciones!!</p><p>saludos</p><p><br></p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866', '2023-04-25 11:43:57', '', '', 'reasignacion'),
(813, 196, '<p>Gracias Mariana revisado y sin observaciones.</p><p><br></p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866', '2023-04-25 11:46:25', '', '', 'reasignacion'),
(814, 197, '<p>Muy bien Mariana, sin comentarios.</p><p><br></p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866', '2023-04-25 11:49:43', '', '', 'reasignacion'),
(815, 198, '<p>Gracias Mariana, sin observaciones adicionales.</p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866', '2023-04-25 12:00:20', '', '', 'reasignacion'),
(816, 199, '<p>Bien Mariana, excelente.. coincido con el comentario de Saray!!!.</p><p><br></p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866', '2023-04-25 12:12:25', '', '', 'reasignacion'),
(817, 200, '<p>gracias Mariana!!, sin observaciones.</p><p><br></p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866', '2023-04-25 12:16:44', '', '', 'reasignacion'),
(818, 196, '<p>Hola Lau, buen día.</p><p>¿Me ayudarías con tu revisión CE en el siguiente <a href=\"https://docs.google.com/document/d/11Tvce-7tiz-Nz4isFSR_e45bz3nBBxv2/edit?usp=sharing&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion</a>?</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-04-25 13:29:30', '', '', 'reasignacion'),
(819, 197, '<p>Hola Lau, buena tarde :)</p><p>Te comparto el <a href=\"https://docs.google.com/document/d/1MIc2Fuio3aROfdMi6R2hjRsMd7i-BrPL/edit?usp=sharing&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a> para continuar con la revisión CE, saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-04-25 13:39:43', '', '', 'reasignacion'),
(820, 198, '<p>Hola Lau, te comparto el <a href=\"https://docs.google.com/document/d/1Ljp9s67MmcWULxwEJtk2-4WvsdGI8Rx0/edit?usp=sharing&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a> para continuar con su revisión, linda tarde :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-04-25 13:45:46', '', '', 'reasignacion'),
(821, 196, '<p>Hola, sin observaciones :)</p><br>Reasignado a:', '633eeece335cd2.35066473', '636ae7e47631d0.53211866', '2023-04-25 14:29:17', '', '', 'reasignacion'),
(822, 197, '<p>Te comparto la revisión del <a href=\"https://docs.google.com/document/d/1DCwWAIXgM8PQf0VYIzj0gevYmKE5jVsM/edit?usp=sharing&amp;ouid=100307162334333370338&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion</a>.</p><br>Reasignado a:', '633eeece335cd2.35066473', '636ae7e47631d0.53211866', '2023-04-25 14:33:56', '', '', 'reasignacion'),
(823, 198, '<p>Te comparto la revisión del <a href=\"https://docs.google.com/document/d/1GRgy2mPCLCpfhRk2ZjRYT3RWITOJQo7A/edit?usp=sharing&amp;ouid=100307162334333370338&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion</a>.</p><br>Reasignado a:', '633eeece335cd2.35066473', '636ae7e47631d0.53211866', '2023-04-25 14:40:12', '', '', 'reasignacion'),
(824, 198, '<p>Hola César, buen miércoles.</p><p>¿Me ayudarías con la producción del <a href=\"https://docs.google.com/document/d/1H9rzWx0b32mAqcEAEp2JcmUt7mGBWKMT/edit?usp=sharing&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">siguiente recurso</a>?</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-04-26 11:32:18', '', '', 'reasignacion'),
(825, 196, '<p>Hola César, buen día.</p><p>¿Me ayudarías con la producción del <a href=\"https://docs.google.com/document/d/11Tvce-7tiz-Nz4isFSR_e45bz3nBBxv2/edit?usp=sharing&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">siguiente recurso</a>?</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-04-26 12:11:27', '', '', 'reasignacion'),
(826, 197, '<p>Hola Miguel, buena tarde :)</p><p><span style=\"font-size: 1rem;\">Te comparto el <a href=\"https://docs.google.com/document/d/1VP3DhEmJ8QCEyBLbJXXZmRhIeiAraU5S/edit?usp=share_link&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a> para comenzar con la producción del recurso, saludos.</span></p><p><br></p><br>Reasignado a:', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-04-26 12:13:24', '', '', 'reasignacion'),
(827, 199, '<p>Hola Lau, buen día.</p><p>Te comparto el <a href=\"https://docs.google.com/document/d/1k6PHZJnmZHS9iakH_soy0ffYYQoTv4Mq/edit?usp=sharing&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion</a> para continuar con la revisión CE, saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-04-26 12:16:19', '', '', 'reasignacion'),
(828, 200, '<p>Buena tarde Lau, te asigno el <a href=\"https://docs.google.com/document/d/1qDmH7COJlz-CcqXyc9BfMWxQqKA55baB/edit?usp=sharing&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion</a> para continuar con su revisión CE.</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-04-26 12:17:40', '', '', 'reasignacion'),
(829, 201, '<p>Hola Lau, buen miércoles.</p><p>¿Me ayudarías con tu revisión CE en el <a href=\"https://docs.google.com/document/d/1_uwBA7d5ekhlBFOkVE4wMDOcXfyv-lvc/edit?usp=sharing&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">siguiente guion</a>?</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-04-26 12:19:02', '', '', 'reasignacion'),
(830, 196, '<p>Hola Mariana, dejo <a href=\"https://drive.google.com/file/d/16WNG8BXeK14EedJ-2Zlqi4gy4MMYN7Wo/view?usp=share_link\" target=\"_blank\">versión 1</a> de la efeméride. Saludos.</p><br>Reasignado a:', '636ae6f2b13177.70285172', '636ae7e47631d0.53211866', '2023-04-26 13:34:07', '', '', 'reasignacion'),
(831, 198, '<p>Hola Mariana dejo la <a href=\"https://drive.google.com/file/d/1FPLL38APyGAbxBNnMNqRIizTRM7BHWID/view?usp=share_link\" target=\"_blank\">primera versión</a> del recurso. Quedo atento a tus comentarios. Saludos.</p><br>Reasignado a:', '636ae6f2b13177.70285172', '636ae7e47631d0.53211866', '2023-04-26 13:54:42', '', '', 'reasignacion'),
(832, 199, '<p>Hola, sin observaciones :)</p><br>Reasignado a:', '633eeece335cd2.35066473', '636ae7e47631d0.53211866', '2023-04-26 15:24:52', '', '', 'reasignacion'),
(833, 196, '<p>Gracias César, no tengo obs :)</p><p>Hola Miguel, te comparto el <a href=\"https://drive.google.com/file/d/16WNG8BXeK14EedJ-2Zlqi4gy4MMYN7Wo/view?usp=sharing\" target=\"_blank\">recurso V1</a> para continuar con su revisión.</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-04-26 15:41:03', '', '', 'reasignacion'),
(834, 198, '<p>Gracias César, me gusto el cambio de vector a foto. Solo agregó un comentario.</p><p>Hola Miguel, te asigno el <a href=\"https://drive.google.com/drive/folders/1CR6ggWj_25wA_dcFEIkWdh08zZGbr7M1?usp=share_link\" target=\"_blank\">recurso</a> para continuar con el proceso de validación, saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-04-26 15:48:28', '', '', 'reasignacion'),
(835, 199, '<p>Hola Miguel, ¿me ayudarías con la producción del <a href=\"https://docs.google.com/document/d/1k6PHZJnmZHS9iakH_soy0ffYYQoTv4Mq/edit?usp=sharing&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">siguiente guion</a>?</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-04-26 15:50:06', '', '', 'reasignacion'),
(836, 198, '<p>Hola Lau, nos ayudas con la revisión del recurso producido, dejo un par de <a href=\"https://drive.google.com/drive/folders/1CR6ggWj_25wA_dcFEIkWdh08zZGbr7M1\" target=\"_blank\">obs</a>, saludos.</p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '633eeece335cd2.35066473', '2023-04-27 09:19:14', '', '', 'reasignacion'),
(837, 196, '<p>Sin observaciones, Lau nos apoyas con la revisión del&nbsp;<a href=\"https://drive.google.com/file/d/16WNG8BXeK14EedJ-2Zlqi4gy4MMYN7Wo/view?usp=sharing\" target=\"_blank\" style=\"font-size: 1rem; font-weight: 400; color: rgb(128, 66, 149); text-decoration: none; background-color: rgb(248, 247, 252); font-family: Montserrat, sans-serif;\">recurso V1</a><span style=\"font-size: 1rem;\">, saludos.</span></p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '633eeece335cd2.35066473', '2023-04-27 09:21:07', '', '', 'reasignacion'),
(838, 197, '<p>Hola Mariana te asigno para iniciar las <a href=\"https://drive.google.com/drive/folders/17XRmoFn1s8X71NIDST0AL7buU13B6zRs\" target=\"_blank\">revisiones</a>, saludos.</p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-04-27 13:06:05', '', '', 'reasignacion'),
(839, 197, '<p>Gracias Miguel, solo tengo un comentario.</p><p>Hola César, te asigno el <a href=\"https://drive.google.com/file/d/162QoJBUVMzfxVKs2IndDReaT_eTFyLSs/view?usp=share_link\" target=\"_blank\">recurso V1</a> para seguir con su revisión.</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-04-27 13:13:00', '', '', 'reasignacion'),
(840, 199, '<p>Hola Mariana, te dejo la <a href=\"https://drive.google.com/drive/folders/1GY_uH6OEKNn3DJdR7ug7Gim3dN8i2lHJ\" target=\"_blank\">V1</a> producida, saludos.</p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-04-28 07:54:54', '', '', 'reasignacion'),
(841, 198, '<p>Sin observaciones.</p><br>Reasignado a:', '633eeece335cd2.35066473', '636ae7e47631d0.53211866', '2023-04-28 09:31:30', '', '', 'reasignacion'),
(842, 199, '<p>Gracias Miguel, no tengo obs.</p><p>Buen día César, ¿me ayudarías con tu revisión en el <a href=\"https://drive.google.com/drive/folders/1GY_uH6OEKNn3DJdR7ug7Gim3dN8i2lHJ?usp=share_link\" target=\"_blank\">recurso V1</a>?</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-04-28 10:13:49', '', '', 'reasignacion'),
(843, 198, '<p>Hola Gaby y Saray :) Buen día, les comparto el <a href=\"https://drive.google.com/file/d/1JZt9zSdRGbb7ANU6W-93NQrrWMCUBEEl/view?usp=share_link\" target=\"_blank\">recurso V1</a> para seguir con su validación.</p><p>Saludos.</p><br>Reasignado a:<br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-04-28 11:03:54', '', '', 'reasignacion'),
(844, 199, '<p>Hola Mariana, sin comentarios. Saludos.</p><br>Reasignado a:', '636ae6f2b13177.70285172', '636ae7e47631d0.53211866', '2023-04-28 11:48:37', '', '', 'reasignacion'),
(845, 197, '<p>Hola Mariana. Mi único comentario sería que la fecha se pierde un poco. Saludos.</p><br>Reasignado a:', '636ae6f2b13177.70285172', '636ae7e47631d0.53211866', '2023-04-28 11:50:11', '', '', 'reasignacion'),
(846, 199, '<p>Hola Lau, buena tarde.</p><p>¿Me ayudarías con tu revisión en el <a href=\"https://drive.google.com/drive/folders/1GY_uH6OEKNn3DJdR7ug7Gim3dN8i2lHJ?usp=share_link\" target=\"_blank\">siguiente recurso</a>?&nbsp;</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-04-28 12:13:32', '', '', 'reasignacion'),
(847, 197, '<p>Gracias César.</p><p>Hola Lau, te comparto el <a href=\"https://drive.google.com/file/d/162QoJBUVMzfxVKs2IndDReaT_eTFyLSs/view?usp=sharing\" target=\"_blank\">recurso V1</a> para continuar con su revisión.</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '633eeece335cd2.35066473', '2023-04-28 12:15:05', '', '', 'reasignacion'),
(848, 196, '<p>Sin observaciones :)</p><br>Reasignado a:', '633eeece335cd2.35066473', '62a8da0d97a8f6.25904684', '2023-04-28 14:31:48', '', '', 'reasignacion'),
(849, 197, '<p>Sin observaciones :)</p><br>Reasignado a:', '633eeece335cd2.35066473', '636ae7e47631d0.53211866', '2023-04-28 14:33:00', '', '', 'reasignacion'),
(850, 199, '<p>Sin observaciones :)&nbsp;</p><br>Reasignado a:', '633eeece335cd2.35066473', '636ae7e47631d0.53211866', '2023-04-28 14:39:58', '', '', 'reasignacion'),
(851, 196, '<p>Hola Saray y Gaby, les asigno para validación de la <a href=\"https://drive.google.com/file/d/16WNG8BXeK14EedJ-2Zlqi4gy4MMYN7Wo/view\" target=\"_blank\">efeméride</a>, saludos.</p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-05-02 11:30:30', '', '', 'reasignacion'),
(852, 200, '<p>Sin observaciones :)</p><br>Reasignado a:', '633eeece335cd2.35066473', '636ae7e47631d0.53211866', '2023-05-02 15:42:55', '', '', 'reasignacion'),
(853, 200, '<p>Hola Miguel, buena tarde :)</p><p>Te asigno el <a href=\"https://docs.google.com/document/d/1qDmH7COJlz-CcqXyc9BfMWxQqKA55baB/edit?usp=sharing&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V1</a> para comenzar con la producción del recurso.</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-05-02 15:48:25', '', '', 'reasignacion'),
(854, 197, '<p>Hola Gaby y Saray, buena tarde.</p><p>¿Me ayudarían con su VoBo en el <a href=\"https://drive.google.com/file/d/162QoJBUVMzfxVKs2IndDReaT_eTFyLSs/view?usp=sharing\" target=\"_blank\">siguiente recurso</a>?</p><p>Saludos :)</p><br>Reasignado a:<br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-05-02 15:49:58', '', '', 'reasignacion'),
(855, 199, '<p>Gracias team :)</p><p>Hola Gaby y Saray, les comparto el <a href=\"https://drive.google.com/drive/folders/1GY_uH6OEKNn3DJdR7ug7Gim3dN8i2lHJ?usp=share_link\" target=\"_blank\">siguiente recurso</a> para continuar con su validación.</p><p>Saludos.</p><br>Reasignado a:<br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-05-02 15:51:06', '', '', 'reasignacion'),
(856, 201, '<p>Comparto la revisión del <a href=\"https://docs.google.com/document/d/1PLuoq5j9nV2uw708w3nCpm7H2hsOzdx0/edit?usp=sharing&amp;ouid=100307162334333370338&amp;rtpof=true&amp;sd=true\" target=\"_blank\">recurso</a>.</p><br>Reasignado a:', '633eeece335cd2.35066473', '636ae7e47631d0.53211866', '2023-05-02 15:51:52', '', '', 'reasignacion'),
(857, 201, '<p>Gracias Lau.</p><p>Buenos días César, ¿me ayudarías con la producción del <a href=\"https://docs.google.com/document/d/1E9WVjkwNl0X_n_tuf72LwSPUlzEJcCli/edit?usp=sharing&amp;ouid=105875375683005621138&amp;rtpof=true&amp;sd=true\" target=\"_blank\">guion V2</a>?</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-05-03 08:14:25', '', '', 'reasignacion'),
(858, 201, '<p>Hola Mariana, <a href=\"https://drive.google.com/file/d/1lmm3VVu-OAaQA9tlJM-512DUrqdvetw6/view?usp=share_link\" target=\"_blank\">regreso V1</a> para empezar proceso de validación. Saludos.</p><br>Reasignado a:', '636ae6f2b13177.70285172', '636ae7e47631d0.53211866', '2023-05-03 11:17:11', '', '', 'mensaje'),
(859, 201, '<p>Gracias César, no tengo comentarios.</p><p>Hola Gaby y Saray, les comparto el <a href=\"https://drive.google.com/drive/folders/1spD2RZmy-LZb2iC6Vupg-WMibSLf-g7x?usp=share_link\" target=\"_blank\">recurso V1</a> para continuar con el proceso.&nbsp;</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '6345f3d21f53b8.76043717, 62a8a43bb67fa6.38495185', '2023-05-03 11:29:19', '', '', 'reasignacion'),
(860, 201, '<p>Me encantó!!, sin observaciones.</p><p><br></p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae6f2b13177.70285172, 636ae7e47631d0.53211866', '2023-05-03 14:15:23', '', '', 'reasignacion'),
(861, 201, '<p>Me encantó!!, sin observaciones.</p><p><br></p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae6f2b13177.70285172, 636ae7e47631d0.53211866', '2023-05-03 14:15:25', '', '', 'reasignacion'),
(862, 196, '<p>Listo, revisado y sin observaciones,</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '62a8da0d97a8f6.25904684, 62a8a43bb67fa6.38495185', '2023-05-03 14:25:42', '', '', 'reasignacion'),
(863, 196, '<p>Listo, revisado y sin observaciones,</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '62a8da0d97a8f6.25904684, 62a8a43bb67fa6.38495185', '2023-05-03 14:25:44', '', '', 'reasignacion'),
(864, 196, '<p>Listo, revisado y sin observaciones,</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '62a8da0d97a8f6.25904684, 62a8a43bb67fa6.38495185', '2023-05-03 14:25:46', '', '', 'reasignacion'),
(865, 196, '<p>Listo, revisado y sin observaciones,</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '62a8da0d97a8f6.25904684, 62a8a43bb67fa6.38495185', '2023-05-03 14:25:48', '', '', 'reasignacion'),
(866, 199, '<p>Garcias Mariana revisado y sin observaciones!</p><p><br></p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866, 62a8a43bb67fa6.38495185', '2023-05-03 14:28:51', '', '', 'reasignacion'),
(867, 198, '<p>Gracias revisado y dejo <a href=\"https://drive.google.com/drive/folders/1CR6ggWj_25wA_dcFEIkWdh08zZGbr7M1\" target=\"_blank\">observación.</a></p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866, 62a8a43bb67fa6.38495185', '2023-05-03 14:33:19', '', '', 'reasignacion'),
(868, 197, '<p>Gracias Marian dejo<a href=\"https://drive.google.com/drive/folders/17XRmoFn1s8X71NIDST0AL7buU13B6zRs\" target=\"_blank\"> obsrevaciones.</a></p><p><br></p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '636ae7e47631d0.53211866, 62a8a43bb67fa6.38495185', '2023-05-03 14:40:28', '', '', 'reasignacion'),
(869, 196, '<p>Hola Mariana te asigno para programar la publicación.</p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-05-03 15:34:07', '', '', 'reasignacion'),
(870, 196, '<p>Agregada a parilla.&nbsp;</p><p>César nos ayudarías a subir VF y editable en sus carpetas, saludos.&nbsp;</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-05-04 10:35:57', '', '', 'reasignacion'),
(871, 196, '<p>HOla Mariana, dejo <a href=\"https://drive.google.com/file/d/1xttFouGSTH79nv6Fev9qGRBNz8OH1MUl/view?usp=share_link\" target=\"_blank\">VF</a> y editable en sus carpetas. Saludos.</p><br>Reasignado a:<br>Se cambio el estado a: <b>completo</b>', '636ae6f2b13177.70285172', '636ae7e47631d0.53211866', '2023-05-04 10:39:49', '', '', 'mensaje'),
(872, 201, '<p>Hola César, nos ayudas a subir la Versión final y editable del recurso.</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-05-04 10:40:01', '', '', 'reasignacion'),
(873, 201, '<p>Hola Mariana, dejo <a href=\"https://drive.google.com/file/d/1CqCUzQR-3j_feLbxa6RHddscXJQBGHAK/view?usp=share_link\" target=\"_blank\">VF</a> y editable en sus carpetas. Saludos.</p><br>Se cambio el estado a: <b>completo</b>', '636ae6f2b13177.70285172', '636ae6f2b13177.70285172', '2023-05-04 10:42:04', '', '', 'mensaje'),
(875, 200, '<p>Hola Mariana, te asigno para comenzar la <a href=\"https://drive.google.com/drive/folders/1iK9f-LcQI-qzGCwAWyBZyvxhHvsAn5VD\" target=\"_blank\">revisión</a>, saludos.</p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-05-08 09:01:54', '', '', 'reasignacion'),
(876, 200, '<p>Gracias Miguel, no tengo comentarios.</p><p>Hola Saray, buen día.</p><p>Te comparto el <a href=\"https://drive.google.com/drive/folders/1iK9f-LcQI-qzGCwAWyBZyvxhHvsAn5VD?usp=share_link\" target=\"_blank\">recurso</a> para seguir con el proceso de validación, saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '62a8a43bb67fa6.38495185', '2023-05-08 09:53:34', '', '', 'reasignacion'),
(877, 149, '<p>gracias Gonzalo</p><p>solo cerrar tarea.</p><p>saludps</p><p><br></p><br>Reasignado a:', '6345f3d21f53b8.76043717', '632b472f497b95.12743913', '2023-05-08 19:05:23', '', '', 'reasignacion'),
(878, 78, '<p>si Gonzalo no se muestra el descargable.</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '632b472f497b95.12743913', '2023-05-08 19:07:18', '', '', 'reasignacion'),
(879, 78, '<p>Listo Gaby ya se encuentra en la carpeta de <a href=\"https://drive.google.com/drive/u/0/folders/1ciXBVN9wxXbgrSxj8H7Iwyzub2C0qk7M\" target=\"_blank\">entregables</a>, gracias</p><br>Reasignado a:', '632b472f497b95.12743913', '6345f3d21f53b8.76043717', '2023-05-09 09:17:46', '', '', 'reasignacion'),
(880, 149, '<p>Listo, saludos</p>', '632b472f497b95.12743913', '', '2023-05-09 09:28:02', '', '', 'mensaje'),
(881, 197, '<p>Hola Mariana, no tengo comentarios. Saludos</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '636ae7e47631d0.53211866', '2023-05-09 16:26:25', '', '', 'reasignacion'),
(882, 198, '<p>Hola Mariana, sin comentarios adicionales a los ya mencionados. Saludos</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '636ae7e47631d0.53211866', '2023-05-09 16:28:30', '', '', 'reasignacion'),
(883, 199, '<p>Hola Mariana, muy bien, no tengo comentarios. Saludos</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '636ae7e47631d0.53211866', '2023-05-09 16:31:13', '', '', 'reasignacion'),
(884, 200, '<p>Hola Mariana, me parece muy bien la imagen, de ser posible sugiero modificar una o dos personas para que se vea más diverso culturalmente, alguien con vestimenta indígena, con un kipá judío, alguien de la tercera edad, etcétera...</p><br>Reasignado a:', '62a8a43bb67fa6.38495185', '636ae7e47631d0.53211866', '2023-05-09 16:37:18', '', '', 'reasignacion'),
(885, 78, '<p>gracias Gonzalo!, solo cerrar tarea.</p><p><br></p><p>saludos</p><br>Reasignado a:', '6345f3d21f53b8.76043717', '632b472f497b95.12743913', '2023-05-09 17:47:56', '', '', 'reasignacion'),
(886, 197, '<p>Hola Miguel, ¿me ayudarías a aplicar los cambios en el <a href=\"https://drive.google.com/file/d/1gWvW57MhCPuKPcH8HZMhUT543pdUatvK/view?usp=share_link\" target=\"_blank\">recurso</a>?</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-05-10 08:33:57', '', '', 'reasignacion'),
(887, 198, '<p>Hola César, buen día.</p><p>Te comparto el <a href=\"https://drive.google.com/file/d/10inLUvYi16Fm4WeMGGE_Nc1SCs75MOb0/view?usp=share_link\" target=\"_blank\">recurso</a> con las obs para aplicar cambios.</p><p>Saludos.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-05-10 08:41:28', '', '', 'reasignacion'),
(888, 197, '<p>Listo Mariana, dejo el recurso en <a href=\"https://drive.google.com/drive/folders/1VVFdKlSDRVHKAcnl9Za9H3crVfeAs5zx\" target=\"_blank\">VF</a>, saludos.</p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-05-10 08:43:39', '', '', 'reasignacion'),
(889, 199, '<p>Hola Miguel :)</p><p>Me ayudarías a subir el editable y versión final a sus carpetas.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-05-10 08:45:37', '', '', 'reasignacion'),
(890, 199, '<p>Lista la <a href=\"https://drive.google.com/drive/folders/15FeZNeTJ60cbPee4fSjOOSKxY-4sERKH\" target=\"_blank\">VF</a>, saludos.</p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-05-10 08:49:00', '', '', 'reasignacion'),
(891, 197, '<p>Agregada a parilla.</p><p>Gracias team :)</p><br>Se cambio el estado a: <b>completo</b><br>Reasignado a:', '636ae7e47631d0.53211866', '', '2023-05-10 08:52:39', '', '', 'reasignacion'),
(892, 200, '<p>Hola Miguel, te regreso el <a href=\"https://drive.google.com/file/d/17CijRt1Xamm7wgnaOhEMm7QMmFjB5ONv/view?usp=share_link\" target=\"_blank\">recurso</a> para aplicar las obs que nos dejo Saray.</p><p>Saludos :)</p><br>Reasignado a:', '636ae7e47631d0.53211866', '62a8da0d97a8f6.25904684', '2023-05-10 08:55:14', '', '', 'reasignacion'),
(893, 199, '<p>Gracias team :)</p><p>Agregada a parrilla.</p><br>Se cambio el estado a: <b>completo</b><br>Reasignado a:', '636ae7e47631d0.53211866', '', '2023-05-10 08:58:34', '', '', 'reasignacion'),
(894, 200, '<p>Listos los ajustes, dejo la <a href=\"https://drive.google.com/drive/folders/1Av0FGm-ss8IdkP3vEW-JpULvV3Q_Y-4V\" target=\"_blank\">Vf</a> y editable, saludos.</p><br>Reasignado a:', '62a8da0d97a8f6.25904684', '636ae7e47631d0.53211866', '2023-05-10 09:32:11', '', '', 'reasignacion'),
(895, 200, '<p>Agregada a parrilla.</p><p>Gracias team :)</p><br>Se cambio el estado a: <b>completo</b><br>Reasignado a:', '636ae7e47631d0.53211866', '', '2023-05-10 09:48:35', '', '', 'reasignacion'),
(896, 198, '<p>Hola Mriana, dejo la <a href=\"https://drive.google.com/file/d/1TUei9keUFx5LiML1-Kt8dDqHZExwJhaF/view?usp=share_link\" target=\"_blank\">V2 del recurso</a>. Quedo atento a tus comentarios. Saludosl</p><br>Reasignado a:', '636ae6f2b13177.70285172', '636ae7e47631d0.53211866', '2023-05-10 12:31:35', '', '', 'reasignacion'),
(897, 198, '<p>Hola César, no tengo obs :)</p><p>Ya podemos subir el editable y versión final a sus carpetas.</p><br>Reasignado a:', '636ae7e47631d0.53211866', '636ae6f2b13177.70285172', '2023-05-10 13:05:22', '', '', 'reasignacion'),
(898, 198, '<p>Listo Mariana. Saludos</p><br>Reasignado a:', '636ae6f2b13177.70285172', '636ae7e47631d0.53211866', '2023-05-10 13:10:48', '', '', 'reasignacion'),
(899, 198, '<p>Agregada a parrilla, gracias :)</p><br>Se cambio el estado a: <b>completo</b><br>Reasignado a:', '636ae7e47631d0.53211866', '', '2023-05-11 08:33:16', '', '', 'reasignacion');

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
('5c0653d43d92e7.75019474', '', '', 'Manuel', 'Marmolejo Martínez', 'manuel.marmolejo@prepaenlinea.sep.gob.mx', '525523995604 ', '1970-01-01', 'equipo-6410f83747382.jpg', 'usuario-5f435a9e5ba50.jpg', 'primary', '$2y$10$DbFvC2gsgQG3aODXsp0a4OUN1ERS.XFFE1pe/RTDkncia0ynhuBHy', 'no', '2019-01-01 06:00:00', '2023-05-10 18:20:19', 'administrador', 'activo'),
('62a8a43bb67fa6.38495185', '', '', 'Saray', 'Navarro', 'lourdes.navarro@sems.gob.mx', '525538809907', '1969-12-31', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$wPunF9oAs9gRUdfQSNR4COVdDjG1uch/RiEfUpjOb8xrbyhay7jtK', 'si', '2022-06-14 16:07:39', '2023-03-29 20:35:33', 'usuario', 'activo'),
('62a8da0d97a8f6.25904684', '', '', 'Miguel Ángel ', 'García Viveros', 'miguel.garcia@prepaenlinea.sep.gob.mx ', '525561419921', '1986-08-16', 'equipo-63c9a36735e71.jpg', 'usuario-63c9a3e33ea70.jpg', 'primary', '$2y$10$xGiDY59bc5Chm4rkBApeyOIjslVX0oMCjKt/kFREFVOeXJDE.98F.', 'si', '2022-06-14 19:57:17', '2023-01-19 21:11:15', 'usuario', 'activo'),
('632b45df945454.17181395', '', '', 'Samuel', 'Vasquez Aquino', 'samuel.vasquez@prepaenlinea.sep.gob.mx', '525514706262', '1986-09-22', 'equipo-632b4c5baa402.jpg', 'fondo_default.jpg', 'primary', '$2y$10$XX4da/BU33d2/230zARx0uJmO/oKKlnPox5MYv7GwyZ.rs3Og0Ho6', 'si', '2022-09-21 18:11:59', '2022-09-21 18:40:36', 'usuario', 'activo'),
('632b472f497b95.12743913', '', '', 'Gonzalo', 'Torres', 'gonzalo.torres@prepaenlinea.sep.gob.mx', '525527135787', '1980-01-21', 'equipo-632b4cfa7f56d.jpg', 'usuario-632b4f043812d.jpg', 'primary', '$2y$10$HpZhHNrgBZNNVZlN7jOsA.JS58oxkXA1fUXKa3pGiVj0SyYldiOuq', 'si', '2022-09-21 18:17:35', '2022-09-21 18:52:26', 'usuario', 'activo'),
('633eeece335cd2.35066473', '', '', 'Laura', 'Martínez', 'laura.martinez@prepaenlinea.sep.gob.mx', '525523086298', '1983-08-16', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$3/.J8skIUnBtPx95RpyJs.H4T2Jph4qy8blQkRSTIVz87/0Fl2JU2', 'si', '2022-10-06 16:05:50', '2022-10-06 16:43:38', 'usuario', 'activo'),
('633eef17cc43c6.86654620', '', '', 'Abraham', 'González Flores ', 'abraham.gonzalez@prepaenlineasep.gob.mx', '527225519609', '1995-08-22', 'equipo-6414ce6e4d5d1.jpg', 'fondo_default.jpg', 'primary', '$2y$10$jh2TuqbCHW9sYXRkQRkgv.AtchiIU0Zo261WURAGGVbUpzoFDX06q', 'si', '2022-10-06 16:07:03', '2023-03-17 20:32:46', 'usuario', 'activo'),
('633eefe21f96f3.52854199', '', '', 'Lizbeth', 'Evoli', 'lizbeth.evoli@prepaenlinea.sep.gob.mx', '525620856884', '1982-09-23', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$0GsBMZmlLV2KhgQk2ahHqu1I8V2kJyOW/cKOoeHdhtRO7kZFMoKda', 'si', '2022-10-06 16:10:26', '2023-02-27 23:34:34', 'usuario', 'activo'),
('6345f3d21f53b8.76043717', '', '', 'Lucia Gabriela', 'Bonilla Jiménez', 'lucia.bonilla@prepaenlinea.sep.gob.mx ', '525535070618', '1969-12-01', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$iPO1Nklna6j/wQAlEy2DtO.P6UM1ChK2zxc5PZp4VlxT0JTUIIYy6', 'si', '2022-10-11 23:53:06', '2023-02-28 00:21:29', 'usuario', 'activo'),
('6345f518c5c2d6.73393476', '', '', 'Eduardo', 'Pérez', 'eduardo.perez@prepaenlinea.sep.gob.mx', '', '1969-12-31', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$8BztP6lbPWAWvl89DrRY9uelaCoRQx1.ZngW7DhuQwzDaDTIvFE.u', 'si', '2022-10-11 23:58:32', '2022-10-11 23:58:32', 'usuario', 'activo'),
('636ae6f2b13177.70285172', '', '', 'César', 'Alamillo Sandoval', 'cesar.alamillo@prepaenlinea.sep.gob.mx ', '525511533352', '1988-08-14', 'equipo-636aea1086499.jpg', 'fondo_default.jpg', 'primary', '$2y$10$EoiGi.9YAzWqjlZ34WbgVeBgT.PgM8m262vrGGgnRbRSMfGacIk5u', 'si', '2022-11-09 00:32:02', '2023-03-14 20:18:36', 'usuario', 'activo'),
('636ae7e47631d0.53211866', '', '', 'Mariana', 'García García', 'mariana.garcia@prepaenlinea.sep.gob.mx', '525577888266', '1995-06-05', 'equipo-6410f997054b4.jpg', 'usuario-6410f99797482.jpg', 'primary', '$2y$10$hR8BVKp1NKzrTeXK6rN8JOCTWnX8uBGqV2IgXSkMKErDBEuFItYKG', 'si', '2022-11-09 00:36:04', '2023-03-14 22:47:53', 'usuario', 'activo'),
('636ae819c96372.19213704', '', '', 'Marco', 'Sanchez', 'marco.sanchez@prepaenlinea.sep.gob.mx', '522411194655', '1969-12-31', 'equipo-6387914d950a3.jpg', 'fondo_default.jpg', 'primary', '$2y$10$ggzwBMLppLAwRMo9U24S6uVWyZvl.K6SjVEvjr0UIxBNxi8q./OuO', 'si', '2022-11-09 00:36:57', '2022-11-30 18:22:22', 'usuario', 'activo'),
('636ae845774a90.50892287', '', '', 'José Luis', 'Trujillo García', 'jose.trujillo@prepaenlinea.sep.gob.mx', '525551891203', '1984-12-02', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$JBv//saCnbVphvey/aKqHuJse7atqte179W/lKUfz3aRRVzEKwLua', 'si', '2022-11-09 00:37:41', '2022-11-09 00:44:32', 'usuario', 'activo'),
('63cb26f44ff981.59154321', '', '', 'Silvia', 'Vargas', 'silvia.vargas@prepaenlinea.sep.gob.mx', '525611699990', '1991-11-02', 'equipo-63cb2b67ed77b.jpg', 'fondo_default.jpg', 'primary', '$2y$10$gcYiC3yPAo/zlYthMP6Xaef.d8dvX3H1QVdmtHR5dQvPwTuVkuWya', 'si', '2023-01-21 00:42:44', '2023-01-21 01:02:26', 'usuario', 'activo'),
('63cb274b243f88.12842329', '', '', 'Yessica', 'maldonado', 'yessica.maldonado@sems.gob.mx', '525518047098', '1969-12-31', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$MOgaMTP47/bVHg4fvZrLG.5gNcQzxSLD4sK9wIsWu1z0E/091xGPC', 'si', '2023-01-21 00:44:11', '2023-01-21 00:44:11', 'usuario', 'activo'),
('63cb27964cb2a3.14800375', '', '', 'Yanauri', 'Juarez', 'yanauri.juarez@prepaenlinea.sep.gob.mx', '525580036255', '1999-05-21', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$IFwFBRRIf4FBdSThtafJNOrt3eBUkNaKjl4a6Y7kspcVb5rZHQDTu', 'si', '2023-01-21 00:45:26', '2023-01-23 20:08:08', 'usuario', 'activo'),
('63cb27f4c588d8.85302337', '', '', 'Nekhbet', 'Urcid', 'nekhbet.urcid@prepaenlinea.sep.gob.mx', '525551011994', '1983-01-17', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$VIvlrxTlUXSQ17f4gc./tOR3IkzXYQWeROPORAFPg5cHGAV3kmMVC', 'si', '2023-01-21 00:47:00', '2023-01-21 00:51:02', 'usuario', 'activo'),
('63cb28a0adb2f2.67596660', '', '', 'Francisco Javier Ramírez Medina', 'Ramírez Medina', 'francisco.ramirez@prepaenlinea.sep.gob.mx', '525533576667', '1970-10-07', 'equipo-641254128b85d.jpg', 'usuario-63e5885ac8873.jpg', 'primary', '$2y$10$7Xz9Z.armBfLX.iGtY9rQ.x4FAtcWBJ2dXOMuONE7RgxYi1dhOiJ.', 'si', '2023-01-21 00:49:52', '2023-03-15 23:26:38', 'usuario', 'activo'),
('63cb2915916798.85801765', '', '', 'Ivonne', 'Mayoral', 'ivonne.mayoral@prepaenlinea.sep.gob.mx', '525576564856', '1969-12-31', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$ZAZ06mV/ZHan8pPnvVQA4.rYvrN4v3qRsNkrTD9fwKtP.TriM/XKa', 'si', '2023-01-21 00:51:49', '2023-02-15 23:18:23', 'usuario', 'activo'),
('63cb2a6d7f0fb3.85967578', '', '', 'Mario', 'Carbajal', 'mario.carbajal@prepaenlinea.sep.gob.mx', '525644769021', '1989-02-15', 'equipo-641108e3925f7.jpg', 'usuario-63ebc7bc22dd9.jpg', 'primary', '$2y$10$y/G2/dBzlA7HVLG6HTetJeMGgscNX0Gl.6hrjXWnh9NeaARtv/woC', 'si', '2023-01-21 00:57:33', '2023-03-14 23:53:07', 'usuario', 'activo'),
('63e55c9b6b2d98.20695336', '', '', 'Luis', 'Alvarado', 'luis.alvarado@prepaenlinea.sep.gob.mx', '', '1969-12-31', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$hjjoxLKqJwFuXefxJ/DF3.55fP5yL/mdLgZn2/ji3QlztPXZL2/AW', 'si', '2023-02-09 21:50:35', '2023-02-09 21:50:35', 'usuario', 'activo'),
('642734073b27e7.66765165', '', '', 'Andres', 'Ruelas', 'triad.diseno@gmail.com', '525522656200', '1969-12-31', 'default.jpg', 'fondo_default.jpg', 'primary', '$2y$10$lLPvBUjeAjdXSmJVeikpy.nWZ9rpCza5P//p1HdH0Bc6k2vQakY4K', 'si', '2023-03-31 19:27:03', '2023-03-31 19:27:03', 'usuario', 'activo');

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

--
-- Volcado de datos para la tabla `usuarios_preferencias`
--

INSERT INTO `usuarios_preferencias` (`ID`, `ID_USUARIO`, `CONFIGURACION`, `VALOR`) VALUES
(23, '632b472f497b95.12743913', 'modo_noche', 'no'),
(24, '62a8a43bb67fa6.38495185', 'modo_noche', 'no'),
(25, '636ae6f2b13177.70285172', 'modo_noche', 'si'),
(27, '636ae7e47631d0.53211866', 'modo_noche', 'no'),
(28, '63cb2915916798.85801765', 'modo_noche', 'si'),
(33, '63cb28a0adb2f2.67596660', 'modo_noche', 'no'),
(34, '5c0653d43d92e7.75019474', 'modo_noche', 'no'),
(36, '6345f3d21f53b8.76043717', 'modo_noche', 'no');

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

--
-- Volcado de datos para la tabla `usuarios_seguridad`
--

INSERT INTO `usuarios_seguridad` (`ID`, `ID_USUARIO`, `CLAVE`, `FECHA_REGISTRO`, `ESTADO`) VALUES
(2, '62a8a43bb67fa6.38495185', '7bqT6og7Bd', '2022-12-27 02:34:55', 'inactivo'),
(3, '636ae7e47631d0.53211866', 'cmb6pUcx3c', '2023-02-13 22:51:25', 'inactivo'),
(4, '636ae6f2b13177.70285172', 'LdDWxUaCu5', '2023-03-14 20:18:36', 'inactivo'),
(5, '5c0653d43d92e7.75019474', 'tFj3vguLVT', '2023-03-29 20:36:53', 'activo');

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
('632b45df945454.17181395', '3', 'produccion', '2022-09-21 20:40:36'),
('632b45df945454.17181395', '4', 'produccion', '2022-09-21 20:42:33'),
('632b45df945454.17181395', '5', 'produccion', '2022-09-21 20:44:02'),
('5c0653d43d92e7.75019474', '2', 'produccion', '2022-09-21 20:51:59'),
('5c0653d43d92e7.75019474', '14', 'produccion', '2022-09-21 20:57:51'),
('632b45df945454.17181395', '24', 'produccion', '2022-09-21 22:07:09'),
('632b45df945454.17181395', '25', 'produccion', '2022-09-21 22:07:52'),
('632b45df945454.17181395', '26', 'produccion', '2022-09-21 22:08:45'),
('5c0653d43d92e7.75019474', '35', 'produccion', '2022-09-21 22:15:24'),
('5c0653d43d92e7.75019474', '36', 'produccion', '2022-09-21 22:15:33'),
('5c0653d43d92e7.75019474', '23', 'produccion', '2022-09-21 23:20:35'),
('62a8da0d97a8f6.25904684', '1', 'produccion', '2022-09-21 23:31:43'),
('5c0653d43d92e7.75019474', '21', 'produccion', '2022-09-21 23:32:46'),
('5c0653d43d92e7.75019474', '22', 'produccion', '2022-09-21 23:36:52'),
('5c0653d43d92e7.75019474', '54', 'produccion', '2022-09-22 17:28:05'),
('5c0653d43d92e7.75019474', '55', 'produccion', '2022-09-22 17:31:39'),
('5c0653d43d92e7.75019474', '83', 'produccion', '2022-09-22 19:47:06'),
('5c0653d43d92e7.75019474', '84', 'produccion', '2022-09-22 19:48:55'),
('5c0653d43d92e7.75019474', '85', 'produccion', '2022-09-22 19:50:26'),
('5c0653d43d92e7.75019474', '97', 'produccion', '2022-09-22 20:13:04'),
('5c0653d43d92e7.75019474', '98', 'produccion', '2022-09-22 20:15:34'),
('5c0653d43d92e7.75019474', '99', 'produccion', '2022-09-22 20:27:30'),
('5c0653d43d92e7.75019474', '111', 'produccion', '2022-09-22 23:51:59'),
('5c0653d43d92e7.75019474', '112', 'produccion', '2022-09-22 23:53:22'),
('5c0653d43d92e7.75019474', '113', 'produccion', '2022-09-22 23:54:47'),
('5c0653d43d92e7.75019474', '10', 'produccion', '2022-09-30 23:51:06'),
('62a8a43bb67fa6.38495185', '10', 'produccion', '2022-09-30 23:51:09'),
('633eef17cc43c6.86654620', '38', 'produccion', '2022-10-07 19:48:10'),
('633eef17cc43c6.86654620', '39', 'produccion', '2022-10-07 19:53:33'),
('633eef17cc43c6.86654620', '40', 'produccion', '2022-10-07 19:55:45'),
('633eef17cc43c6.86654620', '52', 'produccion', '2022-10-07 19:58:38'),
('633eef17cc43c6.86654620', '50', 'produccion', '2022-10-07 19:58:57'),
('633eef17cc43c6.86654620', '49', 'produccion', '2022-10-07 19:59:07'),
('633eef17cc43c6.86654620', '51', 'produccion', '2022-10-07 19:59:24'),
('633eef17cc43c6.86654620', '17', 'produccion', '2022-10-18 18:18:25'),
('633eef17cc43c6.86654620', '29', 'produccion', '2022-10-18 18:19:26'),
('633eef17cc43c6.86654620', '31', 'produccion', '2022-10-18 18:19:37'),
('633eef17cc43c6.86654620', '30', 'produccion', '2022-10-18 18:19:47'),
('633eef17cc43c6.86654620', '8', 'produccion', '2022-10-18 18:20:16'),
('633eef17cc43c6.86654620', '11', 'produccion', '2022-10-18 18:20:25'),
('633eef17cc43c6.86654620', '9', 'produccion', '2022-10-18 18:20:33'),
('633eef17cc43c6.86654620', '47', 'produccion', '2022-10-18 20:59:42'),
('633eef17cc43c6.86654620', '44', 'produccion', '2022-10-18 21:00:18'),
('633eef17cc43c6.86654620', '48', 'produccion', '2022-10-18 21:00:35'),
('633eef17cc43c6.86654620', '45', 'produccion', '2022-10-18 21:00:47'),
('633eef17cc43c6.86654620', '43', 'produccion', '2022-11-03 18:15:21'),
('633eef17cc43c6.86654620', '42', 'produccion', '2022-11-03 19:02:03'),
('633eef17cc43c6.86654620', '41', 'produccion', '2022-11-08 00:22:19'),
('5c0653d43d92e7.75019474', '126', 'produccion', '2022-11-09 20:19:27'),
('5c0653d43d92e7.75019474', '140', 'produccion', '2022-11-09 23:17:40'),
('632b45df945454.17181395', '27', 'produccion', '2022-11-18 01:02:11'),
('632b45df945454.17181395', '28', 'produccion', '2022-11-18 01:02:33'),
('5c0653d43d92e7.75019474', '46', 'produccion', '2022-11-18 01:02:52'),
('632b45df945454.17181395', '46', 'produccion', '2022-11-18 01:02:52'),
('5c0653d43d92e7.75019474', '139', 'produccion', '2022-12-07 00:44:56'),
('5c0653d43d92e7.75019474', '141', 'produccion', '2022-12-07 00:45:15'),
('5c0653d43d92e7.75019474', '71', 'produccion', '2022-12-07 01:13:43'),
('5c0653d43d92e7.75019474', '70', 'produccion', '2022-12-07 01:13:57'),
('5c0653d43d92e7.75019474', '69', 'produccion', '2022-12-07 01:14:17'),
('5c0653d43d92e7.75019474', '56', 'produccion', '2022-12-07 01:14:45'),
('5c0653d43d92e7.75019474', '80', 'produccion', '2022-12-29 08:40:12'),
('632b45df945454.17181395', '144', 'produccion', '2023-01-06 20:26:00'),
('633eef17cc43c6.86654620', '15', 'produccion', '2023-01-19 17:25:50'),
('632b45df945454.17181395', '114', 'produccion', '2023-01-19 19:33:20'),
('632b45df945454.17181395', '142', 'produccion', '2023-01-19 23:41:55'),
('632b45df945454.17181395', '128', 'produccion', '2023-01-30 19:06:39'),
('632b45df945454.17181395', '129', 'produccion', '2023-01-30 19:08:00'),
('632b45df945454.17181395', '130', 'produccion', '2023-01-30 19:09:20'),
('632b45df945454.17181395', '116', 'produccion', '2023-01-30 20:10:45'),
('632b45df945454.17181395', '115', 'produccion', '2023-01-30 20:12:14'),
('632b45df945454.17181395', '102', 'produccion', '2023-01-30 20:18:28'),
('632b45df945454.17181395', '101', 'produccion', '2023-01-30 20:29:34'),
('632b45df945454.17181395', '100', 'produccion', '2023-01-30 20:41:40'),
('632b45df945454.17181395', '88', 'produccion', '2023-01-30 20:47:39'),
('632b45df945454.17181395', '87', 'produccion', '2023-01-30 20:50:52'),
('632b45df945454.17181395', '74', 'produccion', '2023-01-30 20:53:16'),
('5c0653d43d92e7.75019474', '153', 'produccion', '2023-01-30 21:20:48'),
('5c0653d43d92e7.75019474', '156', 'produccion', '2023-01-30 21:29:10'),
('5c0653d43d92e7.75019474', '155', 'produccion', '2023-01-30 21:29:48'),
('62a8a43bb67fa6.38495185', '157', 'produccion', '2023-02-01 02:51:41'),
('62a8a43bb67fa6.38495185', '159', 'produccion', '2023-02-03 00:31:44'),
('62a8a43bb67fa6.38495185', '163', 'produccion', '2023-02-03 18:38:27'),
('62a8a43bb67fa6.38495185', '154', 'produccion', '2023-02-07 18:40:56'),
('62a8a43bb67fa6.38495185', '161', 'produccion', '2023-02-09 21:09:38'),
('63cb27f4c588d8.85302337', '176', 'produccion', '2023-02-10 00:22:48'),
('62a8a43bb67fa6.38495185', '162', 'produccion', '2023-02-10 17:35:43'),
('63cb27f4c588d8.85302337', '175', 'produccion', '2023-02-10 19:29:12'),
('63cb27f4c588d8.85302337', '177', 'produccion', '2023-02-14 17:19:55'),
('63cb2915916798.85801765', '179', 'produccion', '2023-02-15 17:56:40'),
('63e55c9b6b2d98.20695336', '179', 'produccion', '2023-02-15 17:56:42'),
('63cb2a6d7f0fb3.85967578', '179', 'produccion', '2023-02-15 17:56:44'),
('63cb27f4c588d8.85302337', '179', 'produccion', '2023-02-15 17:56:45'),
('63cb26f44ff981.59154321', '179', 'produccion', '2023-02-15 17:56:47'),
('63cb27964cb2a3.14800375', '179', 'produccion', '2023-02-15 17:56:48'),
('63cb274b243f88.12842329', '179', 'produccion', '2023-02-15 17:56:49'),
('63cb28a0adb2f2.67596660', '180', 'produccion', '2023-02-15 17:57:17'),
('63cb2915916798.85801765', '180', 'produccion', '2023-02-15 17:57:17'),
('63e55c9b6b2d98.20695336', '180', 'produccion', '2023-02-15 17:57:17'),
('63cb2a6d7f0fb3.85967578', '180', 'produccion', '2023-02-15 17:57:17'),
('63cb27f4c588d8.85302337', '180', 'produccion', '2023-02-15 17:57:17'),
('63cb26f44ff981.59154321', '180', 'produccion', '2023-02-15 17:57:17'),
('63cb27964cb2a3.14800375', '180', 'produccion', '2023-02-15 17:57:18'),
('63cb274b243f88.12842329', '180', 'produccion', '2023-02-15 17:57:18'),
('63cb28a0adb2f2.67596660', '181', 'produccion', '2023-02-15 17:58:47'),
('63cb2915916798.85801765', '181', 'produccion', '2023-02-15 17:58:49'),
('63e55c9b6b2d98.20695336', '181', 'produccion', '2023-02-15 17:58:50'),
('63cb2a6d7f0fb3.85967578', '181', 'produccion', '2023-02-15 17:58:51'),
('63cb27f4c588d8.85302337', '181', 'produccion', '2023-02-15 17:58:52'),
('63cb26f44ff981.59154321', '181', 'produccion', '2023-02-15 17:58:53'),
('63cb27964cb2a3.14800375', '181', 'produccion', '2023-02-15 17:58:54'),
('63cb274b243f88.12842329', '181', 'produccion', '2023-02-15 17:58:54'),
('63cb27964cb2a3.14800375', '185', 'produccion', '2023-02-15 23:32:24'),
('63cb274b243f88.12842329', '185', 'produccion', '2023-02-15 23:32:26'),
('632b45df945454.17181395', '169', 'produccion', '2023-02-20 23:33:54'),
('63cb2915916798.85801765', '186', 'produccion', '2023-02-23 18:10:56'),
('63cb27964cb2a3.14800375', '186', 'produccion', '2023-02-23 18:10:57'),
('63cb274b243f88.12842329', '186', 'produccion', '2023-02-23 18:10:58'),
('63cb274b243f88.12842329', '178', 'produccion', '2023-02-23 19:54:40'),
('62a8a43bb67fa6.38495185', '166', 'produccion', '2023-02-23 22:45:32'),
('62a8a43bb67fa6.38495185', '167', 'produccion', '2023-02-23 23:15:43'),
('62a8a43bb67fa6.38495185', '148', 'produccion', '2023-02-24 19:36:56'),
('62a8a43bb67fa6.38495185', '168', 'produccion', '2023-02-24 21:01:14'),
('62a8a43bb67fa6.38495185', '79', 'produccion', '2023-02-24 22:28:53'),
('62a8a43bb67fa6.38495185', '158', 'produccion', '2023-02-24 22:52:40'),
('62a8a43bb67fa6.38495185', '160', 'produccion', '2023-02-24 23:05:54'),
('62a8a43bb67fa6.38495185', '77', 'produccion', '2023-02-25 00:09:12'),
('62a8a43bb67fa6.38495185', '65', 'produccion', '2023-02-27 17:06:12'),
('62a8a43bb67fa6.38495185', '64', 'produccion', '2023-02-27 17:34:28'),
('62a8a43bb67fa6.38495185', '93', 'produccion', '2023-02-27 17:53:59'),
('62a8a43bb67fa6.38495185', '92', 'produccion', '2023-02-27 18:17:30'),
('62a8a43bb67fa6.38495185', '91', 'produccion', '2023-02-27 18:33:26'),
('62a8a43bb67fa6.38495185', '107', 'produccion', '2023-02-27 18:46:19'),
('62a8a43bb67fa6.38495185', '106', 'produccion', '2023-02-27 18:57:42'),
('62a8a43bb67fa6.38495185', '119', 'produccion', '2023-02-27 19:30:34'),
('62a8a43bb67fa6.38495185', '121', 'produccion', '2023-02-27 19:37:29'),
('62a8a43bb67fa6.38495185', '120', 'produccion', '2023-02-27 19:44:30'),
('62a8a43bb67fa6.38495185', '164', 'produccion', '2023-02-27 20:57:35'),
('62a8a43bb67fa6.38495185', '170', 'produccion', '2023-02-27 21:16:33'),
('62a8a43bb67fa6.38495185', '165', 'produccion', '2023-02-27 21:26:25'),
('62a8da0d97a8f6.25904684', '183', 'produccion', '2023-02-28 16:54:39'),
('62a8da0d97a8f6.25904684', '184', 'produccion', '2023-02-28 16:59:28'),
('62a8da0d97a8f6.25904684', '182', 'produccion', '2023-02-28 16:59:51'),
('62a8a43bb67fa6.38495185', '147', 'produccion', '2023-03-09 18:04:17'),
('62a8a43bb67fa6.38495185', '105', 'produccion', '2023-03-09 18:33:53'),
('63cb2915916798.85801765', '202', 'produccion', '2023-03-13 16:58:31'),
('62a8a43bb67fa6.38495185', '133', 'produccion', '2023-03-13 18:32:33'),
('5c0653d43d92e7.75019474', '125', 'produccion', '2023-03-14 19:49:17'),
('5c0653d43d92e7.75019474', '53', 'produccion', '2023-03-14 21:57:13'),
('632b45df945454.17181395', '73', 'produccion', '2023-03-14 22:30:25'),
('5c0653d43d92e7.75019474', '127', 'produccion', '2023-03-14 23:34:52'),
('636ae6f2b13177.70285172', '203', 'produccion', '2023-03-15 23:46:29'),
('63cb28a0adb2f2.67596660', '203', 'produccion', '2023-03-15 23:46:31'),
('62a8da0d97a8f6.25904684', '203', 'produccion', '2023-03-15 23:46:32'),
('63cb2a6d7f0fb3.85967578', '204', 'produccion', '2023-03-24 01:43:37'),
('62a8a43bb67fa6.38495185', '134', 'produccion', '2023-03-24 18:11:20'),
('62a8a43bb67fa6.38495185', '135', 'produccion', '2023-03-24 18:52:48'),
('642734073b27e7.66765165', '205', 'produccion', '2023-03-31 19:46:35'),
('642734073b27e7.66765165', '206', 'produccion', '2023-03-31 19:50:03'),
('62a8a43bb67fa6.38495185', '187', 'produccion', '2023-04-10 17:19:23'),
('633eefe21f96f3.52854199', '232', 'produccion', '2023-04-10 17:44:25'),
('62a8a43bb67fa6.38495185', '188', 'produccion', '2023-04-10 20:46:44'),
('62a8a43bb67fa6.38495185', '189', 'produccion', '2023-04-10 20:58:33'),
('62a8a43bb67fa6.38495185', '190', 'produccion', '2023-04-10 21:04:13'),
('62a8a43bb67fa6.38495185', '191', 'produccion', '2023-04-10 21:36:24'),
('62a8a43bb67fa6.38495185', '192', 'produccion', '2023-04-10 21:38:33'),
('62a8a43bb67fa6.38495185', '193', 'produccion', '2023-04-11 20:36:12'),
('62a8a43bb67fa6.38495185', '195', 'produccion', '2023-04-11 20:59:42'),
('62a8a43bb67fa6.38495185', '233', 'produccion', '2023-04-11 21:10:40'),
('62a8a43bb67fa6.38495185', '194', 'produccion', '2023-04-12 19:54:12'),
('642734073b27e7.66765165', '63', 'produccion', '2023-05-08 01:51:05'),
('62a8a43bb67fa6.38495185', '63', 'produccion', '2023-05-08 01:51:06'),
('63cb2915916798.85801765', '234', 'produccion', '2023-05-10 15:01:41'),
('5c0653d43d92e7.75019474', '235', 'produccion', '2023-05-12 15:26:07'),
('5c0653d43d92e7.75019474', '236', 'produccion', '2023-05-12 15:30:14'),
('5c0653d43d92e7.75019474', '237', 'produccion', '2023-05-12 15:36:45'),
('5c0653d43d92e7.75019474', '238', 'produccion', '2023-05-12 16:41:21'),
('5c0653d43d92e7.75019474', '239', 'produccion', '2023-05-12 16:41:36'),
('5c0653d43d92e7.75019474', '240', 'produccion', '2023-05-12 16:41:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validacion_dimension`
--

CREATE TABLE `validacion_dimension` (
  `ID_DIMENSION` int(11) UNSIGNED NOT NULL,
  `ID_LISTA` int(11) UNSIGNED NOT NULL,
  `TITULO` varchar(255) NOT NULL,
  `DESCRIPCION` text NOT NULL,
  `ORDEN` int(11) NOT NULL DEFAULT 0,
  `ESTADO` varchar(255) NOT NULL DEFAULT 'activo',
  `CRITERIO_1` varchar(255) DEFAULT NULL,
  `OPCIONES_1` text DEFAULT NULL,
  `CRITERIO_2` varchar(255) DEFAULT NULL,
  `OPCIONES_2` text DEFAULT NULL,
  `CRITERIO_3` varchar(255) DEFAULT NULL,
  `OPCIONES_3` text DEFAULT NULL,
  `CRITERIO_4` varchar(255) DEFAULT NULL,
  `OPCIONES_4` text DEFAULT NULL,
  `CRITERIO_5` varchar(255) DEFAULT NULL,
  `OPCIONES_5` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `validacion_dimension`
--

INSERT INTO `validacion_dimension` (`ID_DIMENSION`, `ID_LISTA`, `TITULO`, `DESCRIPCION`, `ORDEN`, `ESTADO`, `CRITERIO_1`, `OPCIONES_1`, `CRITERIO_2`, `OPCIONES_2`, `CRITERIO_3`, `OPCIONES_3`, `CRITERIO_4`, `OPCIONES_4`, `CRITERIO_5`, `OPCIONES_5`) VALUES
(1, 1, 'Tipografías', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 0, 'Tipografía', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 0, 'Estructura', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 0, 'Estructura', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, 'Estructura', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, 'Color', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, 'Imagen', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 5, 'Ortotipográfica', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 5, 'Producción', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 5, 'Q&A', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 6, 'Texto', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 6, 'Gráficos', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 6, 'Accesibilidad', '', 0, 'activo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 8, 'Prueba de dimensiones', '', 0, 'activo', 'Está cool ?', 'Si, No, mas o menos, no aplica', 'For the LOLs ??', 'Yes, No, Maybe, Dont matter', '', '', '', '', '', ''),
(15, 8, 'Segunda dimensión', '', 0, 'activo', 'Es Vegano', 'Si, No, no sabemos', 'Contiene gluten', 'Si, No, no sabemos', 'Es light', 'Si, No, No nos importa', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validacion_lista`
--

CREATE TABLE `validacion_lista` (
  `ID_LISTA` int(11) UNSIGNED NOT NULL,
  `ID_AREA` int(11) UNSIGNED NOT NULL,
  `TITULO` varchar(255) NOT NULL,
  `DESCRIPCION` text NOT NULL,
  `ESTADO` varchar(255) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `validacion_lista`
--

INSERT INTO `validacion_lista` (`ID_LISTA`, `ID_AREA`, `TITULO`, `DESCRIPCION`, `ESTADO`) VALUES
(1, 1, 'ACCESIBILIDAD AAA', '', 'activo'),
(5, 1, 'Básica', '', 'activo'),
(6, 1, 'Validación de contenido', '', 'activo'),
(8, 1, 'Prueba de criterios', '', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validacion_parametros`
--

CREATE TABLE `validacion_parametros` (
  `ID_PARAMETRO` int(11) UNSIGNED NOT NULL,
  `ID_DIMENSION` int(11) UNSIGNED NOT NULL,
  `TITULO` varchar(255) NOT NULL,
  `DESCRIPCION` text NOT NULL,
  `OBLIGATORIO` varchar(255) NOT NULL DEFAULT 'no',
  `ORDEN` int(11) NOT NULL DEFAULT 0,
  `ESTADO` varchar(255) NOT NULL DEFAULT 'activo',
  `CRITERIO_VALOR_1` varchar(255) DEFAULT NULL,
  `CRITERIO_VALOR_2` varchar(255) DEFAULT NULL,
  `CRITERIO_VALOR_3` varchar(255) DEFAULT NULL,
  `CRITERIO_VALOR_4` varchar(255) DEFAULT NULL,
  `CRITERIO_VALOR_5` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `validacion_parametros`
--

INSERT INTO `validacion_parametros` (`ID_PARAMETRO`, `ID_DIMENSION`, `TITULO`, `DESCRIPCION`, `OBLIGATORIO`, `ORDEN`, `ESTADO`, `CRITERIO_VALOR_1`, `CRITERIO_VALOR_2`, `CRITERIO_VALOR_3`, `CRITERIO_VALOR_4`, `CRITERIO_VALOR_5`) VALUES
(6, 1, 'Estructura', '', 'si', 0, 'activo', NULL, NULL, NULL, NULL, NULL),
(7, 8, 'Ortografía es correcta?', '', 'no', 0, 'activo', NULL, NULL, NULL, NULL, NULL),
(8, 8, 'Gramática es correcta ??', '', 'no', 0, 'activo', NULL, NULL, NULL, NULL, NULL),
(9, 9, 'Los editables están disponibles?', '', 'no', 0, 'activo', NULL, NULL, NULL, NULL, NULL),
(10, 9, 'Las tipografías están disponibles en la carpeta ?', '', 'no', 0, 'activo', NULL, NULL, NULL, NULL, NULL),
(11, 9, 'El archivo final está en el formato correcto?', '', 'no', 0, 'activo', NULL, NULL, NULL, NULL, NULL),
(12, 9, 'La nomenclatura del archivo incluye CADIDO', '', 'no', 0, 'activo', NULL, NULL, NULL, NULL, NULL),
(13, 10, 'El recurso tiene calidad?', '', 'no', 0, 'activo', NULL, NULL, NULL, NULL, NULL),
(14, 10, 'Los archivos son adecuados para entrega?', '', 'no', 0, 'activo', NULL, NULL, NULL, NULL, NULL),
(15, 11, 'Jerarquización de los contenidos', '', 'no', 0, 'activo', NULL, NULL, NULL, NULL, NULL),
(16, 11, 'Comentarios en imágenes completos', '', 'no', 0, 'activo', NULL, NULL, NULL, NULL, NULL),
(17, 12, 'Imágenes en formato jpg', '', 'no', 0, 'activo', NULL, NULL, NULL, NULL, NULL),
(18, 13, 'Buen contraste en imágenes', '', 'no', 0, 'activo', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validacion_respuesta`
--

CREATE TABLE `validacion_respuesta` (
  `ID_RESPUESTA` int(11) UNSIGNED NOT NULL,
  `ID_REVISION` int(11) UNSIGNED NOT NULL,
  `ID_TAREA` int(11) UNSIGNED NOT NULL,
  `ID_ENLACE` int(11) UNSIGNED NOT NULL,
  `ID_PARAMETRO` int(11) UNSIGNED NOT NULL,
  `ID_RESPONSABLE` varchar(255) NOT NULL,
  `VALOR` varchar(255) NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `COMENTARIOS` text DEFAULT NULL,
  `ID_LISTA` varchar(255) DEFAULT NULL,
  `ID_DIMENSION` varchar(255) DEFAULT NULL,
  `TITULO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `validacion_respuesta`
--

INSERT INTO `validacion_respuesta` (`ID_RESPUESTA`, `ID_REVISION`, `ID_TAREA`, `ID_ENLACE`, `ID_PARAMETRO`, `ID_RESPONSABLE`, `VALOR`, `FECHA`, `COMENTARIOS`, `ID_LISTA`, `ID_DIMENSION`, `TITULO`) VALUES
(1, 1, 235, 0, 7, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:46', NULL, NULL, NULL, NULL),
(2, 1, 235, 0, 8, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:47', NULL, NULL, NULL, NULL),
(3, 1, 235, 0, 9, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:49', NULL, NULL, NULL, NULL),
(4, 1, 235, 0, 10, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:50', NULL, NULL, NULL, NULL),
(5, 1, 235, 0, 11, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:50', NULL, NULL, NULL, NULL),
(6, 1, 235, 0, 12, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:51', NULL, NULL, NULL, NULL),
(7, 1, 235, 0, 13, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:53', NULL, NULL, NULL, NULL),
(8, 1, 235, 0, 14, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:54', NULL, NULL, NULL, NULL),
(9, 2, 236, 0, 7, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:57', NULL, NULL, NULL, NULL),
(10, 2, 236, 0, 8, '5c0653d43d92e7.75019474', '', '2023-05-12 15:37:42', NULL, NULL, NULL, NULL),
(11, 2, 236, 0, 9, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:59', NULL, NULL, NULL, NULL),
(12, 2, 236, 0, 10, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:13:01', NULL, NULL, NULL, NULL),
(13, 2, 236, 0, 11, '5c0653d43d92e7.75019474', '', '2023-05-12 15:37:42', NULL, NULL, NULL, NULL),
(14, 2, 236, 0, 12, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:13:00', NULL, NULL, NULL, NULL),
(15, 2, 236, 0, 13, '5c0653d43d92e7.75019474', '', '2023-05-12 16:13:23', 'La verdad no, está bien feo', NULL, NULL, NULL),
(16, 2, 236, 0, 14, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:13:02', NULL, NULL, NULL, NULL),
(17, 3, 237, 0, 7, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:32', NULL, NULL, NULL, NULL),
(18, 3, 237, 0, 8, '5c0653d43d92e7.75019474', '', '2023-05-12 15:37:42', NULL, NULL, NULL, NULL),
(19, 3, 237, 0, 9, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:36', NULL, NULL, NULL, NULL),
(20, 3, 237, 0, 10, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:37', NULL, NULL, NULL, NULL),
(21, 3, 237, 0, 11, '5c0653d43d92e7.75019474', '', '2023-05-12 15:37:42', NULL, NULL, NULL, NULL),
(22, 3, 237, 0, 12, '5c0653d43d92e7.75019474', '', '2023-05-12 15:37:42', NULL, NULL, NULL, NULL),
(23, 3, 237, 0, 13, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:12:40', NULL, NULL, NULL, NULL),
(24, 3, 237, 0, 14, '5c0653d43d92e7.75019474', '', '2023-05-12 15:37:42', NULL, NULL, NULL, NULL),
(25, 4, 235, 0, 7, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:33', NULL, NULL, NULL, NULL),
(26, 4, 235, 0, 8, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:34', NULL, NULL, NULL, NULL),
(27, 4, 235, 0, 9, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:36', NULL, NULL, NULL, NULL),
(28, 4, 235, 0, 10, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:36', NULL, NULL, NULL, NULL),
(29, 4, 235, 0, 11, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:37', NULL, NULL, NULL, NULL),
(30, 4, 235, 0, 12, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:37', NULL, NULL, NULL, NULL),
(31, 4, 235, 0, 13, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:39', NULL, NULL, NULL, NULL),
(32, 4, 235, 0, 14, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:39', NULL, NULL, NULL, NULL),
(33, 5, 236, 0, 7, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:42', NULL, NULL, NULL, NULL),
(34, 5, 236, 0, 8, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:43', NULL, NULL, NULL, NULL),
(35, 5, 236, 0, 9, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:44', NULL, NULL, NULL, NULL),
(36, 5, 236, 0, 10, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:45', NULL, NULL, NULL, NULL),
(37, 5, 236, 0, 11, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:45', NULL, NULL, NULL, NULL),
(38, 5, 236, 0, 12, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:46', NULL, NULL, NULL, NULL),
(39, 5, 236, 0, 13, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:48', NULL, NULL, NULL, NULL),
(40, 5, 236, 0, 14, '5c0653d43d92e7.75019474', '', '2023-05-12 16:14:27', NULL, NULL, NULL, NULL),
(41, 6, 237, 0, 7, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:50', NULL, NULL, NULL, NULL),
(42, 6, 237, 0, 8, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:51', NULL, NULL, NULL, NULL),
(43, 6, 237, 0, 9, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:52', NULL, NULL, NULL, NULL),
(44, 6, 237, 0, 10, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:53', NULL, NULL, NULL, NULL),
(45, 6, 237, 0, 11, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:53', NULL, NULL, NULL, NULL),
(46, 6, 237, 0, 12, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:54', NULL, NULL, NULL, NULL),
(47, 6, 237, 0, 13, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:55', NULL, NULL, NULL, NULL),
(48, 6, 237, 0, 14, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:14:56', NULL, NULL, NULL, NULL),
(49, 7, 235, 0, 6, '5c0653d43d92e7.75019474', '', '2023-05-12 16:21:35', NULL, NULL, NULL, NULL),
(50, 8, 236, 0, 6, '5c0653d43d92e7.75019474', '', '2023-05-12 16:21:35', NULL, NULL, NULL, NULL),
(51, 9, 237, 0, 6, '5c0653d43d92e7.75019474', '', '2023-05-12 16:21:35', NULL, NULL, NULL, NULL),
(52, 10, 238, 0, 15, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:43:24', NULL, NULL, NULL, NULL),
(53, 10, 238, 0, 16, '5c0653d43d92e7.75019474', '', '2023-05-12 16:43:39', 'No nos llegaron completos los comentarios desde académico', NULL, NULL, NULL),
(54, 10, 238, 0, 17, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:43:48', NULL, NULL, NULL, NULL),
(55, 10, 238, 0, 18, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:43:51', NULL, NULL, NULL, NULL),
(56, 11, 239, 0, 15, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:44:13', NULL, NULL, NULL, NULL),
(57, 11, 239, 0, 16, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:44:14', NULL, NULL, NULL, NULL),
(58, 11, 239, 0, 17, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:44:16', NULL, NULL, NULL, NULL),
(59, 11, 239, 0, 18, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:44:17', NULL, NULL, NULL, NULL),
(60, 12, 240, 0, 15, '5c0653d43d92e7.75019474', '', '2023-05-12 16:42:27', NULL, NULL, NULL, NULL),
(61, 12, 240, 0, 16, '5c0653d43d92e7.75019474', '', '2023-05-12 16:42:27', NULL, NULL, NULL, NULL),
(62, 12, 240, 0, 17, '5c0653d43d92e7.75019474', '', '2023-05-12 16:42:27', NULL, NULL, NULL, NULL),
(63, 12, 240, 0, 18, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 16:44:26', NULL, NULL, NULL, NULL),
(64, 13, 238, 0, 15, '63cb28a0adb2f2.67596660', '', '2023-05-12 16:48:07', NULL, NULL, NULL, NULL),
(65, 13, 238, 0, 16, '63cb28a0adb2f2.67596660', '', '2023-05-12 16:48:07', NULL, NULL, NULL, NULL),
(66, 13, 238, 0, 17, '63cb28a0adb2f2.67596660', '', '2023-05-12 16:48:07', NULL, NULL, NULL, NULL),
(67, 13, 238, 0, 18, '63cb28a0adb2f2.67596660', '', '2023-05-12 16:48:07', NULL, NULL, NULL, NULL),
(68, 14, 239, 0, 15, '63cb28a0adb2f2.67596660', '', '2023-05-12 16:48:07', NULL, NULL, NULL, NULL),
(69, 14, 239, 0, 16, '63cb28a0adb2f2.67596660', '', '2023-05-12 16:48:07', NULL, NULL, NULL, NULL),
(70, 14, 239, 0, 17, '63cb28a0adb2f2.67596660', '', '2023-05-12 16:48:07', NULL, NULL, NULL, NULL),
(71, 14, 239, 0, 18, '63cb28a0adb2f2.67596660', 'validada', '2023-05-12 17:05:59', NULL, NULL, NULL, NULL),
(72, 15, 240, 0, 15, '63cb28a0adb2f2.67596660', '', '2023-05-12 16:48:07', NULL, NULL, NULL, NULL),
(73, 15, 240, 0, 16, '63cb28a0adb2f2.67596660', '', '2023-05-12 16:48:07', NULL, NULL, NULL, NULL),
(74, 15, 240, 0, 17, '63cb28a0adb2f2.67596660', '', '2023-05-12 16:48:07', NULL, NULL, NULL, NULL),
(75, 15, 240, 0, 18, '63cb28a0adb2f2.67596660', '', '2023-05-12 16:48:07', NULL, NULL, NULL, NULL),
(76, 16, 238, 0, 7, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(77, 16, 238, 0, 8, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(78, 16, 238, 0, 9, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(79, 16, 238, 0, 10, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(80, 16, 238, 0, 11, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(81, 16, 238, 0, 12, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(82, 16, 238, 0, 13, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(83, 16, 238, 0, 14, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(84, 17, 239, 0, 7, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(85, 17, 239, 0, 8, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(86, 17, 239, 0, 9, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(87, 17, 239, 0, 10, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(88, 17, 239, 0, 11, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(89, 17, 239, 0, 12, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(90, 17, 239, 0, 13, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(91, 17, 239, 0, 14, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(92, 18, 240, 0, 7, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(93, 18, 240, 0, 8, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(94, 18, 240, 0, 9, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(95, 18, 240, 0, 10, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(96, 18, 240, 0, 11, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(97, 18, 240, 0, 12, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(98, 18, 240, 0, 13, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(99, 18, 240, 0, 14, '5c0653d43d92e7.75019474', '', '2023-05-12 16:49:08', NULL, NULL, NULL, NULL),
(100, 19, 235, 0, 7, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 21:02:45', NULL, NULL, NULL, NULL),
(101, 19, 235, 0, 8, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 21:02:46', NULL, NULL, NULL, NULL),
(102, 19, 235, 0, 9, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:53', 'Faltan los PSD', NULL, NULL, NULL),
(103, 19, 235, 0, 10, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 21:02:56', NULL, NULL, NULL, NULL),
(104, 19, 235, 0, 11, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 21:02:56', NULL, NULL, NULL, NULL),
(105, 19, 235, 0, 12, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 21:02:57', NULL, NULL, NULL, NULL),
(106, 19, 235, 0, 13, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 21:02:59', NULL, NULL, NULL, NULL),
(107, 19, 235, 0, 14, '5c0653d43d92e7.75019474', 'validada', '2023-05-12 21:02:59', NULL, NULL, NULL, NULL),
(108, 20, 236, 0, 7, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(109, 20, 236, 0, 8, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(110, 20, 236, 0, 9, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(111, 20, 236, 0, 10, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(112, 20, 236, 0, 11, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(113, 20, 236, 0, 12, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(114, 20, 236, 0, 13, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(115, 20, 236, 0, 14, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(116, 21, 237, 0, 7, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(117, 21, 237, 0, 8, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(118, 21, 237, 0, 9, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(119, 21, 237, 0, 10, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(120, 21, 237, 0, 11, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(121, 21, 237, 0, 12, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(122, 21, 237, 0, 13, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(123, 21, 237, 0, 14, '5c0653d43d92e7.75019474', '', '2023-05-12 21:02:37', NULL, NULL, NULL, NULL),
(124, 22, 238, 0, 15, '5c0653d43d92e7.75019474', '', '2023-05-17 21:11:47', NULL, NULL, NULL, NULL),
(125, 22, 238, 0, 16, '5c0653d43d92e7.75019474', '', '2023-05-17 21:11:47', NULL, NULL, NULL, NULL),
(126, 22, 238, 0, 17, '5c0653d43d92e7.75019474', '', '2023-05-17 21:11:47', NULL, NULL, NULL, NULL),
(127, 22, 238, 0, 18, '5c0653d43d92e7.75019474', '', '2023-05-17 21:11:47', NULL, NULL, NULL, NULL),
(128, 23, 238, 0, 15, '5c0653d43d92e7.75019474', '', '2023-05-17 21:11:53', NULL, NULL, NULL, NULL),
(129, 23, 238, 0, 16, '5c0653d43d92e7.75019474', '', '2023-05-17 21:11:53', NULL, NULL, NULL, NULL),
(130, 23, 238, 0, 17, '5c0653d43d92e7.75019474', '', '2023-05-17 21:11:53', NULL, NULL, NULL, NULL),
(131, 23, 238, 0, 18, '5c0653d43d92e7.75019474', '', '2023-05-17 21:11:53', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validacion_revisiones`
--

CREATE TABLE `validacion_revisiones` (
  `ID_REVISION` int(11) UNSIGNED NOT NULL,
  `ID_PROYECTO` int(11) UNSIGNED NOT NULL,
  `ID_TAREA` int(11) UNSIGNED NOT NULL,
  `ID_ENLACE` int(11) UNSIGNED NOT NULL,
  `ID_LISTA` int(11) UNSIGNED NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ID_RESPONSABLE` varchar(255) NOT NULL,
  `TOTAL_PARAMETROS` int(11) NOT NULL DEFAULT 0,
  `TOTAL_VERIFICADOS` int(11) NOT NULL DEFAULT 0,
  `ESTADO` varchar(255) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `validacion_revisiones`
--

INSERT INTO `validacion_revisiones` (`ID_REVISION`, `ID_PROYECTO`, `ID_TAREA`, `ID_ENLACE`, `ID_LISTA`, `FECHA`, `ID_RESPONSABLE`, `TOTAL_PARAMETROS`, `TOTAL_VERIFICADOS`, `ESTADO`) VALUES
(1, 46, 235, 0, 5, '2023-05-12 15:37:42', '5c0653d43d92e7.75019474', 8, 0, 'activo'),
(2, 46, 236, 0, 5, '2023-05-12 15:37:42', '5c0653d43d92e7.75019474', 8, 0, 'activo'),
(3, 46, 237, 0, 5, '2023-05-12 15:37:42', '5c0653d43d92e7.75019474', 8, 0, 'activo'),
(4, 46, 235, 0, 5, '2023-05-12 16:14:27', '5c0653d43d92e7.75019474', 8, 0, 'activo'),
(5, 46, 236, 0, 5, '2023-05-12 16:14:27', '5c0653d43d92e7.75019474', 8, 0, 'activo'),
(6, 46, 237, 0, 5, '2023-05-12 16:14:27', '5c0653d43d92e7.75019474', 8, 0, 'activo'),
(7, 46, 235, 0, 1, '2023-05-12 16:21:35', '5c0653d43d92e7.75019474', 1, 0, 'activo'),
(8, 46, 236, 0, 1, '2023-05-12 16:21:35', '5c0653d43d92e7.75019474', 1, 0, 'activo'),
(9, 46, 237, 0, 1, '2023-05-12 16:21:35', '5c0653d43d92e7.75019474', 1, 0, 'activo'),
(10, 47, 238, 0, 6, '2023-05-12 16:42:27', '5c0653d43d92e7.75019474', 4, 0, 'activo'),
(11, 47, 239, 0, 6, '2023-05-12 16:42:27', '5c0653d43d92e7.75019474', 4, 0, 'activo'),
(12, 47, 240, 0, 6, '2023-05-12 16:42:27', '5c0653d43d92e7.75019474', 4, 0, 'activo'),
(13, 47, 238, 0, 6, '2023-05-12 16:48:07', '63cb28a0adb2f2.67596660', 4, 0, 'activo'),
(14, 47, 239, 0, 6, '2023-05-12 16:48:07', '63cb28a0adb2f2.67596660', 4, 0, 'activo'),
(15, 47, 240, 0, 6, '2023-05-12 16:48:07', '63cb28a0adb2f2.67596660', 4, 0, 'activo'),
(16, 47, 238, 0, 5, '2023-05-12 16:49:08', '5c0653d43d92e7.75019474', 8, 0, 'activo'),
(17, 47, 239, 0, 5, '2023-05-12 16:49:08', '5c0653d43d92e7.75019474', 8, 0, 'activo'),
(18, 47, 240, 0, 5, '2023-05-12 16:49:08', '5c0653d43d92e7.75019474', 8, 0, 'activo'),
(19, 46, 235, 0, 5, '2023-05-12 21:02:37', '5c0653d43d92e7.75019474', 8, 0, 'activo'),
(20, 46, 236, 0, 5, '2023-05-12 21:02:37', '5c0653d43d92e7.75019474', 8, 0, 'activo'),
(21, 46, 237, 0, 5, '2023-05-12 21:02:37', '5c0653d43d92e7.75019474', 8, 0, 'activo'),
(22, 47, 238, 0, 6, '2023-05-17 21:11:47', '5c0653d43d92e7.75019474', 4, 0, 'activo'),
(23, 47, 238, 0, 6, '2023-05-17 21:11:53', '5c0653d43d92e7.75019474', 4, 0, 'activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`ID_AREA`);

--
-- Indices de la tabla `areas_usuarios`
--
ALTER TABLE `areas_usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_CATEGORIA`);

--
-- Indices de la tabla `enlaces`
--
ALTER TABLE `enlaces`
  ADD PRIMARY KEY (`ID_ENLACE`);

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
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_ROL`);

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
-- Indices de la tabla `validacion_dimension`
--
ALTER TABLE `validacion_dimension`
  ADD PRIMARY KEY (`ID_DIMENSION`);

--
-- Indices de la tabla `validacion_lista`
--
ALTER TABLE `validacion_lista`
  ADD PRIMARY KEY (`ID_LISTA`);

--
-- Indices de la tabla `validacion_parametros`
--
ALTER TABLE `validacion_parametros`
  ADD PRIMARY KEY (`ID_PARAMETRO`);

--
-- Indices de la tabla `validacion_respuesta`
--
ALTER TABLE `validacion_respuesta`
  ADD PRIMARY KEY (`ID_RESPUESTA`);

--
-- Indices de la tabla `validacion_revisiones`
--
ALTER TABLE `validacion_revisiones`
  ADD PRIMARY KEY (`ID_REVISION`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `ID_AREA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `areas_usuarios`
--
ALTER TABLE `areas_usuarios`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID_CATEGORIA` bigint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enlaces`
--
ALTER TABLE `enlaces`
  MODIFY `ID_ENLACE` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1283;

--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `ID_PROYECTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_ROL` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `ID_TAREA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT de la tabla `tareas_mensajes`
--
ALTER TABLE `tareas_mensajes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=900;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `usuarios_preferencias`
--
ALTER TABLE `usuarios_preferencias`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `usuarios_seguridad`
--
ALTER TABLE `usuarios_seguridad`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `validacion_dimension`
--
ALTER TABLE `validacion_dimension`
  MODIFY `ID_DIMENSION` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `validacion_lista`
--
ALTER TABLE `validacion_lista`
  MODIFY `ID_LISTA` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `validacion_parametros`
--
ALTER TABLE `validacion_parametros`
  MODIFY `ID_PARAMETRO` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `validacion_respuesta`
--
ALTER TABLE `validacion_respuesta`
  MODIFY `ID_RESPUESTA` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT de la tabla `validacion_revisiones`
--
ALTER TABLE `validacion_revisiones`
  MODIFY `ID_REVISION` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
