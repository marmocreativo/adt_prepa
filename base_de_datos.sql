-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-08-2020 a las 16:10:57
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.31

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

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`ID_CATEGORIA`, `CATEGORIA_NOMBRE`, `URL`, `CATEGORIA_DESCRIPCION`, `IMAGEN`, `IMAGEN_FONDO`, `CATEGORIA_PADRE`, `CATEGORIA_NIVEL`, `VISIBLE`, `TIPO_OBJETO`, `TIPO`, `ESTADO`, `ORDEN`) VALUES
(1, 'Información', 'informacion', 'Páginas de información y legales', 'default.jpg', 'fondo_default.jpg', 0, 1, 'visible', 'publicaciones', 'pagina', 'activo', 0),
(2, 'Destacadas', 'destacadas', 'Páginas destacadas, se muestran en la página de inicio', 'default.jpg', 'fondo_default.jpg', 0, 1, 'invisible', 'publicaciones', 'pagina', 'activo', 0);

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

--
-- Volcado de datos para la tabla `categorias_objetos`
--

INSERT INTO `categorias_objetos` (`ID_CATEGORIA`, `ID_OBJETO`, `TIPO`, `TIPO_OBJETO`) VALUES
(3, '4', 'personaje', 'publicacion'),
(1, '6', 'pagina', 'publicacion'),
(2, '6', 'pagina', 'publicacion'),
(1, '3', 'pagina', 'publicacion'),
(2, '3', 'pagina', 'publicacion'),
(1, '2', 'pagina', 'publicacion'),
(2, '2', 'pagina', 'publicacion'),
(1, '1', 'pagina', 'publicacion'),
(2, '1', 'pagina', 'publicacion');

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

--
-- Volcado de datos para la tabla `galerias`
--

INSERT INTO `galerias` (`ID_GALERIA`, `ID_OBJETO`, `ID_MULTIMEDIA`, `TIPO_OBJETO`, `TIPO_ARCHIVO`, `ORDEN`) VALUES
(1, 4, 1, 'pagina', 'imagen', 0),
(2, 4, 2, 'pagina', 'imagen', 0),
(4, 4, 4, 'pagina', 'documento', 0),
(5, 4, 5, 'pagina', 'enlace', 0),
(6, 4, 6, 'pagina', 'youtube', 0),
(7, 1, 7, 'pagina', 'imagen', 0),
(8, 1, 8, 'pagina', 'imagen', 0),
(9, 1, 9, 'pagina', 'imagen', 0),
(10, 1, 10, 'pagina', 'imagen', 0),
(11, 1, 11, 'pagina', 'imagen', 0),
(12, 1, 12, 'pagina', 'imagen', 0),
(13, 1, 13, 'pagina', 'imagen', 0),
(14, 1, 14, 'pagina', 'imagen', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `ID_MENSAJE` int(11) NOT NULL,
  `MENSAJE_PADRE` int(11) NOT NULL,
  `ID_USUARIO` varchar(255) NOT NULL,
  `USUARIO_CORREO` varchar(255) NOT NULL,
  `MENSAJE_DESTINATARIO` varchar(255) NOT NULL,
  `MENSAJE_CC` varchar(255) NOT NULL,
  `MENSAJE_CCO` varchar(255) NOT NULL,
  `MENSAJE_ASUNTO` varchar(255) NOT NULL,
  `MENSAJE_CONTENIDO` text NOT NULL,
  `TIPO` int(11) NOT NULL,
  `FECHA_REGISTRO` timestamp NOT NULL DEFAULT current_timestamp()
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
('5c0653d43d92e7.75019474', 'secreto', 'PMRJG7', 'usuario'),
('1', 'ordenar_por', 'ORDEN ASC', 'categoria'),
('1', 'columnas', 'col-sm-3', 'categoria'),
('2', 'ordenar_por', 'ORDEN ASC', 'categoria'),
('2', 'columnas', 'col-sm-3', 'categoria'),
('3', 'meta_autor', 'Manuel Marmolejo Martínez', 'publicacion'),
('2', 'meta_autor', 'Manuel Marmolejo Martínez', 'publicacion'),
('4', 'meta_autor', 'Manuel Marmolejo Martínez', 'publicacion'),
('1', 'meta_autor', 'Manuel Marmolejo Martínez', 'publicacion');

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

--
-- Volcado de datos para la tabla `multimedia`
--

INSERT INTO `multimedia` (`ID_MULTIMEDIA`, `ARCHIVO`, `TIPO_ARCHIVO`, `TITULO`, `RESUMEN`, `DESTINO`, `ESTADO`) VALUES
(1, 'galeria-5e8120506a63f.jpg', 'imagen', '', '', '', 'activo'),
(2, 'galeria-5e812051294f6.jpg', 'imagen', '', '', '', 'activo'),
(4, 'adjunto-5e812123a1ae3.docx', 'documento', 'Talleres Faltantes .docx', '', '', 'activo'),
(5, 'https://www.facebook.com/', 'enlace', 'Facebook', '', '_blank', 'activo'),
(6, 'y0cHHia9uig', 'youtube', 'Broly', '', '', 'activo'),
(7, 'galeria-5e94b38aa39d2.jpg', 'imagen', '', '', '', 'activo'),
(8, 'galeria-5e94b38bc5301.jpg', 'imagen', '', '', '', 'activo'),
(9, 'galeria-5e94b38cbfc1d.jpg', 'imagen', '', '', '', 'activo'),
(10, 'galeria-5e94b38e10f66.jpg', 'imagen', '', '', '', 'activo'),
(11, 'galeria-5e94b38e7a831.jpg', 'imagen', '', '', '', 'activo'),
(12, 'galeria-5e94b38f4212a.jpg', 'imagen', '', '', '', 'activo'),
(13, 'galeria-5e94b39045b94.jpg', 'imagen', '', '', '', 'activo'),
(14, 'galeria-5e94b390b2b2d.jpg', 'imagen', '', '', '', 'activo');

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
(4, 'lenguaje_predeterminado', 'es', 'varchar', 'sistema', 3),
(5, 'telefono_sitio', '-', 'varchar', 'contacto', 1),
(6, 'correo_sitio', 'produccionmultimedia@prepaenlinea.sep.gob.mx', 'varchar', 'contacto', 2),
(7, 'mailer_host', 'mail.quarkservers.com', 'varchar', 'sistema', 4),
(8, 'mailer_port', '2525', 'varchar', 'sistema', 5),
(9, 'mailer_user', 'servidor@quarkservers.com', 'varchar', 'sistema', 6),
(10, 'mailer_pass', '123Servidor', 'varchar', 'sistema', 7),
(11, 'ruta_imagenes', 'contenido/img/', 'varchar', 'apariencia', 3),
(12, 'ancho_imagenes_publicaciones', '800', 'varchar', 'apariencia', 1),
(13, 'alto_imagenes_publicaciones', '800', 'varchar', 'apariencia', 2),
(14, 'tiempo_inactividad_sesion', '45', 'varchar', 'sistema', 8),
(15, 'acerca_sitio', 'Sistema de administración de tareas y calendario', 'text', 'contacto', 0),
(16, 'direccion_sitio', '-', 'varchar', 'contacto', 3),
(17, 'id_categoria_legales', '3', 'varchar', 'sistema', 9),
(18, 'id_terminos_y_condiciones', '3', 'varchar', 'sistema', 10),
(19, 'plantilla', 'default', 'varchar', 'apariencia', 0),
(20, 'recaptcha', 'no', 'boolean', 'seguridad', 0),
(21, 'recaptcha_public', '-', 'varchar', 'seguridad ', 1),
(22, 'recaptcha_secret', '-', 'varchar', 'seguridad', 2),
(23, 'google_analytics_tag', '-', 'varchar', 'plugins', 0),
(24, 'tawkto_tag', '-', 'text', 'plugins ', 1),
(26, 'mapa_google', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.2893931556537!2d-99.16611795459968!3d19.41260212218458!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85d1ff3ee6e11e13%3A0x95fee6314892b148!2sint+101%2C+Medell%C3%ADn+190%2C+C.+U.+Benito+Ju%C3%A1rez%2C+06700+Ciudad+de+M%C3%A9xico%2C+CDMX!5e0!3m2!1ses-419!2smx!4v1562745787532!5m2!1ses-419!2smx\" width=\"100%\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'text', 'contacto', 4),
(27, 'cantidad_publicaciones_por_pagina', '10', 'varchar', 'apariencia', 7),
(28, 'niveles_categorias', '2', 'varchar', 'apariencia', 6),
(29, 'ancho_imagenes_fondo_publicaciones', '1920', 'varchar', 'apariencia', 4),
(30, 'alto_imagenes_fondo_publicaciones', '600', 'varchar', 'apariencia', 5);

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

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`ID_PUBLICACION`, `PUBLICACION_TITULO`, `URL`, `PUBLICACION_RESUMEN`, `PUBLICACION_CONTENIDO`, `PUBLICACION_KEYWORDS`, `IMAGEN`, `IMAGEN_FONDO`, `FECHA_REGISTRO`, `FECHA_ACTUALIZACION`, `FECHA_PUBLICACION`, `FECHA_VIGENCIA`, `TIPO`, `ESTADO`, `ORDEN`) VALUES
(1, 'Acerca de nosotros', 'acerca-de-nosotros', '', '', '', 'default.jpg', 'fondo_default.jpg', '2020-01-06 06:00:00', '2020-01-06 04:31:33', '2020-01-01 06:00:00', NULL, 'pagina', 'activo', 0),
(2, 'Aviso de privacidad', 'aviso-de-privacidad', '', '<p>%_NOMBRE_DE_SITIO_%, es el responsable del tratamiento de los datos personales que nos proporcione.</p><p>Sus datos personales serán utilizados para mantener el control de las entradas y salidas de quienes ingresan al sitio y tienen acceso a las funciones y servicios del mismo, este tratamiento forma parte de las medidas de seguridad estándar.</p><p>Se informa que no realizarán transferencias que requieran su consentimiento, salvo aquellas que sean necesarias para atender requerimientos de información de una autoridad competente, debidamente fundados y motivados.</p>', '', 'default.jpg', 'fondo_default.jpg', '2020-01-06 06:00:00', '2020-01-06 05:12:59', '2020-01-01 06:00:00', NULL, 'pagina', 'activo', 0),
(3, 'Términos y condiciones', 'terminos-y-condiciones', '', '<p>TÉRMINOS DE SERVICIO</p><p><br></p><p>----</p><p><br></p><p>INFORMACIÓN GENERAL</p><p><br></p><p>Este sitio web es operado por Espejo Negro. En todo el sitio, los términos “nosotros”, “nos” y “nuestro” se refieren a Espejo Negro. Espejo Negro ofrece este sitio web, incluyendo toda la información, herramientas y servicios disponibles para ti en este sitio, el usuario, está condicionado a la aceptación de todos los términos, condiciones, políticas y notificaciones aquí establecidos.</p><p><br></p><p>Al visitar nuestro sitio y/o comprar algo de nosotros, paticipas en nuestro “Servicio” y aceptas los siguientes términos y condiciones (“Términos de Servicio”, “Términos”), incluídos todos los términos y condiciones adicionales y las polítias a las que se hace referencia en el presente documento y/o disponible a través de hipervínculos. Estas Condiciones de Servicio se aplican a todos los usuarios del sitio, incluyendo si limitación a usuarios que sean navegadores, proveedores, clientes, comerciantes, y/o colaboradores de contenido.</p><p><br></p><p>Por favor, lee estos Términos de Servicio cuidadosamente antes de acceder o utilizar nuestro sitio web. Al acceder o utilizar cualquier parte del sitio, estás aceptando los Términos de Servicio. Si no estás de acuerdo con todos los términos y condiciones de este acuerdo, entonces no deberías acceder a la página web o usar cualquiera de los servicios. Si las Términos de Servicio son considerados una oferta, la aceptación está expresamente limitada a estos Términos de Servicio.</p><p><br></p><p><br></p><p>Cualquier función nueva o herramienta que se añadan a la tienda actual, tambien estarán sujetas a los Términos de Servicio. Puedes revisar la versión actualizada de los Términos de Servicio, en cualquier momento en esta página. Nos reservamos el derecho de actualizar, cambiar o reemplazar cualquier parte de los Términos de Servicio mediante la publicación de actualizaciones y/o cambios en nuestro sitio web. Es tu responsabilidad chequear esta página periódicamente para verificar cambios. Tu uso contínuo o el acceso al sitio web después de la publicación de cualquier cambio constituye la aceptación de dichos cambios.</p><p><br></p><p>Nuestra tienda se encuentra alojada en Shopify Inc. Ellos nos proporcionan la plataforma de comercio electrónico en línea, que nos permite venderte nuestros productos y servicios.</p><p><br></p><p><br></p><p>SECCIÓN 1 - TÉRMINOS DE LA TIENDA EN LÍNEA</p><p><br></p><p>Al utilizar este sitio, declaras que tienes al menos la mayoría de edad en tu estado o provincia de residencia, o que tienes la mayoría de edad en tu estado o provincia de residencia y que nos has dado tu consentimiento para permitir que cualquiera de tus dependientes menores use este sitio.</p><p><br></p><p>No puedes usar nuestros productos con ningún propósito ilegal o no autorizado tampoco puedes, en el uso del Servicio, violar cualquier ley en tu jurisdicción (incluyendo pero no limitado a las leyes de derecho de autor).</p><p><br></p><p>No debes transmitir gusanos, virus o cualquier código de naturaleza destructiva.</p><p><br></p><p>El incumplimiento o violación de cualquiera de estos Términos darán lugar al cese inmediato de tus Servicios.</p><p><br></p><p><br></p><p>SECCIÓN 2 - CONDICIONES GENERALES</p><p><br></p><p>Nos reservamos el derecho de rechazar la prestación de servicio a cualquier persona, por cualquier motivo y en cualquier momento.</p><p><br></p><p>Entiendes que tu contenido (sin incluir la información de tu tarjeta de crédito), puede ser transferida sin encriptar e involucrar (a) transmisiones a través de varias redes; y (b) cambios para ajustarse o adaptarse a los requisitos técnicosde conexión de redes o dispositivos. La información de tarjetas de crédito está siempre encriptada durante la transferencia a través de las redes.</p><p><br></p><p>Estás de acuerdo con no reproducir, duplicar, copiar, vender, revender o explotar cualquier parte del Servicio, usp del Servicio, o acceso al Servicio o cualquier contacto en el sitio web a través del cual se presta el servicio, sin el expreso permiso por escrito de nuestra parte.</p><p><br></p><p>Los títulos utilizados en este acuerdo se icluyen solo por conveniencia y no limita o afecta a estos Términos.</p><p><br></p><p><br></p><p>SECCIÓN 3 - EXACTITUD, EXHAUSTVIDAD Y ACTUALIDAD DE LA INFORMACIÓN</p><p><br></p><p>No nos hacemos responsables si la información disponible en este sitio no es exacta, completa o actual.  El material en este sitio es provisto solo para información general y no debe confiarse en ella o utilizarse como la única base para la toma de decisiones sin consultar primeramente, información más precisa, completa u oportuna.  Cualquier dependencia em el materia de este sitio es bajo su propio riesgo.</p><p><br></p><p>Este sitio puede contener cierta información histórica.  La información histórica, no es necesriamente actual y es provista únicamente para tu referencia.  Nos reservamos el derecho de modificar los contenidos de este sitio en cualquier momento, pero no tenemos obligación de actualizar cualquier información en nuestro sitio.  Aceptas que es tu responsabilidad de monitorear los cambios en nuestro sitio.</p><p><br></p><p>SECTION 4 - MODIFICACIONES AL SERVICIO Y PRECIOS</p><p><br></p><p>Los precios de nuestros productos están sujetos a cambio sin aviso.</p><p><br></p><p>Nos reservamos el derecho de modificar o discontinuar el Servicio (o cualquier parte del contenido) en cualquier momento sin aviso previo.</p><p><br></p><p>No seremos responsables ante ti o alguna tercera parte por cualquier modificación, cambio de precio, suspensión o discontinuidad del Servicio.</p><p><br></p><p><br></p><p>SECCIÓN 5 - PRODUCTOS O SERVICIOS (si aplicable)</p><p><br></p><p>Ciertos productos o servicios puedene star disponibles exclusivamente en línea a través del sitio web. Estos productos o servicios pueden tener cantidades limitadas y estar sujetas a devolución o cambio de acuerdo a nuestra política de devolución solamente.</p><p><br></p><p>Hemos hecho el esfuerzo de mostrar los colores y las imágenes de nuestros productos, en la tienda, con la mayor precisión de colores posible.  No podemos garantizar que el monitor de tu computadora muestre los colores de manera exacta.</p><p><br></p><p>Nos reservamos el derecho, pero no estamos obligados, para limitar las ventas de nuestros productos o servicios a cualquier persona, región geográfica o jurisdicción.  Podemos ejercer este derecho basados en cada caso.  Nos reservamos el derecho de limitar las cantidades de los productos o servicios que ofrecemos.  Todas las descripciones de productos o precios de los productos están sujetos a cambios en cualquier momento sin previo aviso, a nuestra sola discreción.  Nos reservamos el derecho de discontinuar cualquier producto en cualquier momento.  Cualquier oferta de producto o servicio hecho en este sitio es nulo donde esté prohibido.</p><p><br></p><p>No garantizamos que la calidad de los productos, servicios, información u otro material comprado u obtenido por ti  cumpla con tus expectativas, o que cualquier error en el Servicio será corregido.</p><p><br></p><p><br></p><p>SECCIÓN 6 - EXACTITUD DE FACTURACIÓN E INFORMACIÓN DE CUENTA</p><p><br></p><p>Nos reservamos el derecho de rechazar cualquier pedido que realice con nosotros. Podemos, a nuestra discreción, limitar o cancelar las cantidades compradas por persona, por hogar o por pedido. Estas restricciones pueden incluir pedidos realizados por o bajo la misma cuenta de cliente, la misma tarjeta de crédito, y/o pedidos que utilizan la misma facturación y/o dirección de envío.</p><p><br></p><p>En el caso de que hagamos un cambio o cancelemos una orden, podemos intentar notificarte poniéndonos en contacto vía correo electrónico y/o dirección de facturación / número de teléfono proporcionado en el momento que se hizo pedido. Nos reservamos el derecho de limitar o prohibir las órdenes que, a nuestro juicio, parecen ser colocado por los concesionarios, revendedores o distribuidores.</p><p><br></p><p>Te comprometes a proporcionar información actual, completa y precisa de la compra y cuenta utilizada para todas las compras realizadasen nuestra tienda.  Te comprometes a ctualizar rápidamente tu cuenta y otra información, incluyendo tu dirección de correo electrónico y números de tarjetas de crédito y fechas de vencimiento, para que podamos completar tus transacciones y contactarte cuando sea necesario.</p><p><br></p><p>Para más detalles, por favor revisa nuestra Política de Devoluciones.</p><p><br></p><p>SECCIÓN 7 - HERRAMIENTAS OPCIONALES</p><p><br></p><p>Es posible que te proporcionemos aceso a herramientas de terceros a los cuales no monitoreamos y sobre los que no tenemos control ni entrada.</p><p><br></p><p>Reconoces y aceptas que proporcionamos acceso a este tipo de herramientas \"tal cual\" y \"según disponibilidad\" sin garantías, representaciones o condiciones de ningún tipo y sin ningún respaldo.  No tendremos responsabilidad alguna derivada de o relacionada con tu uso de herramientas proporcionadas por terceras partes.</p><p><br></p><p>Cualquier uso que hagas de las herramientas opcionales que se ofrecen a través del sitio bajo tu propio riesgo y discreción y debes asegurarte de estar familiarizado y aprobar los términos bajo los cuales estas herramientas son proporcionadas por el o los proveedores de terceros.</p><p><br></p><p>Tambien es posible que, en el futuro, te ofrezcamos nuevos servicios y/o características a través del sitio web (incluyendo el lanzamiento de nuevas herramientas y recursos).  Estas nuevas caraterísticas y/o servicios tambien estarán sujetos a estos Términos de Servicio.</p><p><br></p><p>SECCIÓN 8 - ENLACES DE TERCERAS PARTES</p><p><br></p><p>Cierto contenido, productos y servicios disponibles vía nuestro Servicio puede incluír material de terceras partes.</p><p><br></p><p>Enlaces de terceras partes en este sitio pueden direccionarte a sitios web de terceras partes que no están afiliadas con nosotros.  No nos responsabilizamos  de examinar o evaluar el contenido o exactitud y no garantizamos ni tendremos ninguna obligación o responsabilidad por cualquier material de terceros o siitos web, o de cualquier material, productos o servicios de terceros.</p><p><br></p><p>No nos hacemos responsables de cualquier daño o daños relacionados con la adquisición o utilización de bienes, servicios, recursos, contenidos, o cualquier otra transacción realizadas en conexión con sitios web de terceros.  Por favor revisa cuidadosamente las políticas y prácticas de terceros y asegúrate de entenderlas antes de participar en cualquier transacción.  Quejas, reclamos, inquietudes o pregutas con respecto a productos de terceros deben ser dirigidas a la tercera parte.</p><p><br></p><p>SECCIÓN 9 - COMENTARIOS DE USUARIO, CAPTACIÓN Y OTROS ENVÍOS</p><p><br></p><p>Si, a pedido nuestro, envías ciertas presentaciones específicas (por ejemplo la participación en concursos) o sin un pedido de nuestra parte envías ideas creativas, sugerencias, proposiciones, planes, u otros materiales, ya sea en línea, por email, por correo postal, o de otra manera (colectivamente, \'comentarios\'), aceptas que podamos, en cualquier momento, sin restricción, editar, copiar, publicar, distribuír, traducir o utilizar por cualquier medio comentarios que nos hayas enviado. No tenemos ni tendremos ninguna obligación (1) de mantener ningún comentario confidencialmente; (2) de pagar compensación por comentarios; o (3) de responder a comentarios.</p><p><br></p><p>Nosotros podemos, pero no tenemos obligación de, monitorear, editar o remover contenido que consideremos sea ilegítimo, ofensivo, amenazante, calumnioso, difamatorio, pornográfico, obsceno u objetable o viole la propiedad intelectual de cualquiera de las partes o los Términos de Servicio.</p><p><br></p><p>Aceptas que tus comentarios no violarán los derechos de terceras partes, incluyendo derechos de autor, marca, privacidad, personalidad u otro derechos personal o de propiedad. Asimismo, aceptas que tus comentarios no contienen material difamatorio o ilegal, abusivo u obsceno, o contienen virus informáticos u otro malware que pudiera, de alguna manera, afectar el funcionamiento del Srvicio o de cualquier sitio web relacionado.  No puedes utilizar una dirección de correo electrónico falsa, usar otra identidad que no sea legítima, o engañar a terceras partes o a nosotros en cuanto al origen de tus comentarios.  Tu eres el único responsable por los comentarios que haces y su precisión.  No nos hacemos responsables y no asumimos ninguna obligación con respecto a los comentarios publicados por ti o cualquier tercer parte.</p><p><br></p><p><br></p><p>SECCIÓN 10 - INFORMACIÓN PERSONAL</p><p><br></p><p>Tu presentación de información personal a través del sitio se rige por nuestra Política de Privacidad. Para ver nuestra Política de Privacidad.</p><p><br></p><p><br></p><p>SECCIÓN 11 - ERRORES, INEXACTITUDES Y OMISIONES</p><p><br></p><p>De vez en cuando puede haber información en nuestro sitio o en el Servicio que contiene errores tipográficos, inexactitudes u omisiones que puedan estar relacionadas con las descripciones de productos, precios, promociones, ofertas, gastos de envío del producto, el tiempo de tránsito y la disponibilidad. Nos reservamos el derecho de corregir los errores, inexactitudes u omisiones y de cambiar o actualizar la información o cancelar pedidos si alguna información en el Servicio o en cualquier sitio web relacionado es inexacta en cualquier momento sin previo aviso (incluso después de que hayas enviado tu orden) .</p><p><br></p><p>No asumimos ninguna obligación de actualizar, corregir o aclarar la información en el Servicio o en cualquier sitio web relacionado, incluyendo, sin limitación, la información de precios, excepto cuando sea requerido por la ley. Ninguna especificación actualizada o fecha de actualización aplicada en el Servicio o en cualquier sitio web relacionado, debe ser tomada para indicar que toda la información en el Servicio o en cualquier sitio web relacionado ha sido modificado o actualizado.</p><p><br></p><p><br></p><p>SECCIÓN 12 - USOS PROHIBIDOS</p><p><br></p><p>En adición a otras prohibiciones como se establece en los Términos de Servicio, se prohibe el uso del sitio o su contenido: (a) para ningún propósito ilegal; (b) para pedirle a otros que realicen o partiicpen en actos ilícitos; (c) para violar cualquier regulación, reglas, leyes internacionales, federales, provinciales o estatales, u ordenanzas locales; (d) para infringir o violar el derecho de propiedad intelectual nuestro o de terceras partes; (e) para acosar, abusar, insultar, dañar, difamar, calumniar, desprestigiar, intimidar o discriminar por razones de género, orientación sexual, religión, tnia, raza, edad, nacionalidad o discapacidad; (f) para presentar información falsa o engañosa; (g) para cargar o transmitir virus o cualquier otro tipo de código malicioso que sea o pueda ser utilizado en cualquier forma que pueda comprometer la funcionalidad o el funcionamientodel Servicio o de cualquier sitio web relacionado, otros sitios o Internet; (h) para recopilar o rastrear información personal de otros; (i) para generar spam, phish, pharm, pretext, spider, crawl, or scrape; (j) para cualquier propósito obsceno o inmoral; o (k) para interferir con o burlar los elementos de seguridad del Servicio o cualquier sitio web relacionado¿ otros sitios o Internet. Nos reservamos el derecho de suspender el uso del Servicio o de cualquier sitio web relacionado por violar cualquiera de los ítems de los usos prohibidos.</p><p><br></p><p><br></p><p>SECCIÓN 13 - EXCLUSIÓN DE GARANTÍAS; LIMITACIÓN DE RESPONSABILIDAD</p><p><br></p><p>No garantizamos ni aseguramos que el uso de nuestro servicio será ininterrumpido, puntual, seguro o libre de errores.</p><p><br></p><p>No garantizamos que los resultados que se puedan obtener del uso del servicio serán exactos o confiables.</p><p><br></p><p>Aceptas que de vez en cuando podemos quitar el servicio por períodos de tiempo indefinidos o cancelar el servicio en cualquier momento sin previo aviso.</p><p><br></p><p>Aceptas expresamenteque el uso de, o la posibilidad de utilizar, el servicio es bajo tu propio riesgo.  El servicio y todos los productos y servicios proporcionados a través del servicio son (salvo lo expresamente manifestado por nosotros) proporcionados \"tal cual\" y \"según esté disponible\" para su uso, sin ningún tipo de representación, garantías o condiciones de ningún tipo, ya sea expresa o implícita, incluídas todas las garantías o condiciones implícitas de comercialización, calidad comercializable, la aptitud para un propósito particular, durabilidad, título y no infracción.</p><p><br></p><p>En ningún caso Espejo Negro, nuestros directores, funcionarios, empleados, afiliados, agentes, contratistas, internos, proveedores, prestadores de servicios o licenciantes serán responsables por cualquier daño, pérdida, reclamo, o daños directos, indirectos, incidentales, punitivos, especiales o consecuentes de cualquier tipo, incluyendo, sin limitación, pérdida de beneficios, pérdida de igresos, pérdida de ahorros, pérdida de datos, costos de reemplazo, o cualquier daño similar, ya sea basado en contrato, agravio (incluyendo negligencia), responsabilidad estricta o de otra manera, como consecuencia del uso de cualquiera de los servicios o productos adquiridos mediante el servicio, o por cualquier otro reclamo relacionado de alguna manera con el uso del servicio o cualquier producto, incluyendo pero no limitado, a cualquier error u omisión en cualquier contenido, o cualquier pérdida o daño de cualquier tipo incurridos como resultados de la utilización del servicio o cualquier contenido (o producto) publicado, transmitido, o que se pongan a disposición a través del servicio, incluso si se avisa de su posibilidad.  Debido a que algunos estados o jurisdicciones no permiten la exclusión o la limitación de responsabilidad por daños consecuenciales o incidentales, en tales estados o jurisdicciones, nuestra responsabilidad se limitará en la medida máxima permitida por la ley.</p><p><br></p><p><br></p><p>SECCIÓN 14 - INDEMNIZACIÓN</p><p><br></p><p>Aceptas indemnizar, defender y mantener indemne Espejo Negro y nuestras matrices, subsidiarias, afiliados, socios, funcionarios, directores, agentes, contratistas, concesionarios, proveedores de servicios, subcontratistas, proveedores, internos y empleados, de cualquier reclamo o demanda, incluyendo honorarios razonables de abogados, hechos por cualquier tercero a causa o como resultado de tu incumplimiento de las Condiciones de Servicio o de los documentos que incorporan como referencia, o la violación de cualquier ley o de los derechos de u tercero.</p><p><br></p><p>SECCIÓN 15 - DIVISIBILIDAD</p><p><br></p><p>En el caso de que se determine que cualquier disposición de estas Condiciones de Servicio sea ilegal, nula o inejecutable, dicha disposición será, no obstante, efectiva a obtener la máxima medida permitida por la ley aplicable, y la parte no exigible se considerará separada de estos Términos de Servicio, dicha determinación no afectará la validez de aplicabilidad de las demás disposiciones restantes.</p><p><br></p><p><br></p><p>SECCIÓN 16 - RESCISIÓN</p><p><br></p><p>Las obligaciones y responsabilidades de las partes que hayan incurrido con anterioridad a la fecha de terminación sobrevivirán a la terminación de este acuerdo a todos los efectos.</p><p><br></p><p>Estas Condiciones de servicio son efectivos a menos que y hasta que sea terminado por ti o nosotros. Puedes terminar estos Términos de Servicio en cualquier momento por avisarnos que ya no deseas utilizar nuestros servicios, o cuando dejes de usar nuestro sitio.</p><p><br></p><p>Si a nuestro juicio, fallas, o se sospecha que haz fallado, en el cumplimiento de cualquier término o disposición de estas Condiciones de Servicio, tambien podemos terminar este acuerdo en cualquier momento sin previo aviso, y seguirás siendo responsable de todos los montos adeudados hasta incluída la fecha de terminación; y/o en consecuencia podemos negarte el acceso a nuestros servicios (o cualquier parte del mismo).</p><p><br></p><p>SECCIÓN 17 - ACUERDO COMPLETO</p><p><br></p><p>Nuestra falla para ejercer o hacer valer cualquier derecho o disposiciôn de estas Condiciones de Servicio no constituirá una renucia a tal derecho o disposición.</p><p><br></p><p>Estas Condiciones del servicio y las políticas o reglas de operación publicadas por nosotros en este sitio o con respecto al servicio constituyen el acuerdo completo y el entendimiento entre tu y nosotros y rigen el uso del Servicio y reemplaza cualquier acuerdo, comunicaciones y propuestas anteriores o contemporáneas, ya sea oral o escrita, entre tu y nosotros (incluyendo, pero no limitado a, cualquier versión previa de los Términos de Servicio).</p><p><br></p><p>Cualquier ambigüedad en la interpretación de estas Condiciones del servicio no se interpretarán en contra del grupo de redacción.</p><p><br></p><p><br></p><p>SECCIÓN 18 - LEY</p><p><br></p><p>Estas Condiciones del servicio y cualquier acuerdos aparte en el que te proporcionemos servicios se regirán e interpretarán en conformidad con las leyes de Avenida 561 No. 148, Ciudad de México, DIF, 07969, Mexico.</p><p><br></p><p><br></p><p>SECCIÓN 19 - CAMBIOS EN LOS TÉRMINOS DE SERVICIO</p><p><br></p><p>Puedes revisar la versión más actualizada de los Términos de Servicio en cualquier momento en esta página.</p><p><br></p><p>Nos reservamos el derecho, a nuestra sola discreción, de actualizar, modificar o reemplazar cualquier parte de estas Condiciones del servicio mediante la publicación de las actualizaciones y los cambios en nuestro sitio web. Es tu responsabilidad revisar nuestro sitio web periódicamente para verificar los cambios. El uso contínuo de o el acceso a nuestro sitio Web o el Servicio después de la publicación de cualquier cambio en estas Condiciones de servicio implica la aceptación de dichos cambios.</p><p><br></p><p><br></p><p>SECCIÓN 20 - INFORMACIÓN DE CONTACTO</p><p><br></p><p>Preguntas acerca de los Términos de Servicio deben ser enviadas a marmocreativo@gmail.com.</p>', '', 'default.jpg', 'fondo_default.jpg', '2020-01-06 06:00:00', '2020-01-22 05:34:38', '2020-01-01 06:00:00', NULL, 'pagina', 'activo', 0),
(4, 'Borrador ZBGH', 'borrador-ZBGH', '', '', '', 'default.jpg', 'fondo_default.jpg', '2020-03-30 06:00:00', '2020-03-29 22:30:22', '2020-03-30 06:00:00', NULL, 'pagina', 'activo', 0);

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
(24, 'matriz', 'Matriz', 'Matrices', 'proyectos');

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

INSERT INTO `usuarios` (`ID_USUARIO`, `ID_SOCIAL`, `SOCIAL_LOGIN`, `USUARIO_NOMBRE`, `USUARIO_APELLIDOS`, `USUARIO_CORREO`, `USUARIO_TELEFONO`, `USUARIO_FECHA_NACIMIENTO`, `IMAGEN`, `USUARIO_PASSWORD`, `USUARIO_LISTA_DE_CORREO`, `FECHA_REGISTRO`, `FECHA_ACTUALIZACION`, `TIPO`, `ESTADO`) VALUES
('5c0653d43d92e7.75019474', '', '', 'Manuel', 'Marmolejo Martínez', 'marmocreativo@gmail.com', '5523995604 ', '1989-04-18', 'default.jpg', '$2y$10$DbFvC2gsgQG3aODXsp0a4OUN1ERS.XFFE1pe/RTDkncia0ynhuBHy', 'si', '2019-01-01 06:00:00', '2020-01-30 10:09:20', 'administrador', 'activo');

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
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_CATEGORIA`);

--
-- Indices de la tabla `galerias`
--
ALTER TABLE `galerias`
  ADD PRIMARY KEY (`ID_GALERIA`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`ID_MENSAJE`);

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
  MODIFY `ID_CATEGORIA` bigint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `galerias`
--
ALTER TABLE `galerias`
  MODIFY `ID_GALERIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `ID_MENSAJE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `multimedia`
--
ALTER TABLE `multimedia`
  MODIFY `ID_MULTIMEDIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `ID_PUBLICACION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reacciones`
--
ALTER TABLE `reacciones`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `usuarios_seguridad`
--
ALTER TABLE `usuarios_seguridad`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
