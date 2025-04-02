-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2024 a las 03:10:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proygaes6`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendiz`
--

CREATE TABLE `aprendiz` (
  `id_aprendiz` int(11) NOT NULL,
  `fkid_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aprendiz`
--

INSERT INTO `aprendiz` (`id_aprendiz`, `fkid_usuario`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo_multimedia`
--

CREATE TABLE `archivo_multimedia` (
  `id_archivo_multi` int(11) NOT NULL,
  `nom_archivo` varchar(50) DEFAULT NULL,
  `tamano_archivo` float DEFAULT NULL,
  `fecha_archivo` date DEFAULT NULL,
  `fkid_contenido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `archivo_multimedia`
--

INSERT INTO `archivo_multimedia` (`id_archivo_multi`, `nom_archivo`, `tamano_archivo`, `fecha_archivo`, `fkid_contenido`) VALUES
(1, 'intro_html.pdf', 1.2, '2024-01-11', 1),
(2, 'data_preprocessing.mp4', 25.5, '2024-02-17', 2),
(3, 'seo_basics.pptx', 5.6, '2024-03-06', 3),
(4, 'cybersecurity_basics.zip', 15.3, '2024-04-21', 4),
(5, 'scrum_kanban_guide.pdf', 2.4, '2024-05-12', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `texto_comentario` varchar(1000) DEFAULT NULL,
  `fecha_comentario` datetime DEFAULT NULL,
  `fkid_aprendiz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `texto_comentario`, `fecha_comentario`, `fkid_aprendiz`) VALUES
(1, 'El curso es excelente, muy claro y ?til', '2024-01-15 10:00:00', 1),
(2, 'Muy interesante, me gustar?a m?s pr?ctica', '2024-02-18 14:30:00', 2),
(3, 'Buen contenido, pero algunas lecciones fueron muy r?pidas', '2024-03-08 16:45:00', 3),
(4, 'Me ayud? mucho en mi carrera profesional', '2024-04-25 09:20:00', 1),
(5, 'Las explicaciones son muy detalladas y f?ciles de entender', '2024-05-18 11:10:00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario_has_contenido`
--

CREATE TABLE `comentario_has_contenido` (
  `fkid_comentario` int(11) DEFAULT NULL,
  `fkid_contenido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentario_has_contenido`
--

INSERT INTO `comentario_has_contenido` (`fkid_comentario`, `fkid_contenido`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido`
--

CREATE TABLE `contenido` (
  `id_contenido` int(11) NOT NULL,
  `titulo_contenido` varchar(50) DEFAULT NULL,
  `fecha_contenido` date DEFAULT NULL,
  `fkid_curso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contenido`
--

INSERT INTO `contenido` (`id_contenido`, `titulo_contenido`, `fecha_contenido`, `fkid_curso`) VALUES
(1, 'Introducci?n a HTML', '2024-01-11', 1),
(2, 'Data Preprocessing en Python', '2024-02-17', 2),
(3, 'SEO para Principiantes', '2024-03-06', 3),
(4, 'Fundamentos de Ciberseguridad', '2024-04-21', 4),
(5, 'Scrum y Kanban en Proyectos ?giles', '2024-05-12', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `fecha_curso` date DEFAULT NULL,
  `nombre_curso` varchar(50) DEFAULT NULL,
  `descripcion_curso` varchar(100) DEFAULT NULL,
  `fkid_instructor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curso`, `fecha_curso`, `nombre_curso`, `descripcion_curso`, `fkid_instructor`) VALUES
(1, '2024-01-10', 'Introducci?n a la Programaci?n Web', 'Curso b?sico para iniciarse en desarrollo web', 1),
(2, '2024-02-15', 'An?lisis de Datos con Python', 'Aprende a analizar datos con herramientas de Python', 2),
(3, '2024-03-05', 'Estrategias de Marketing Digital', 'Curso sobre estrategias efectivas en marketing online', 3),
(4, '2024-04-20', 'Seguridad en Redes', 'Curso para entender los fundamentos de la ciberseguridad', 4),
(5, '2024-05-10', 'Gesti?n ?gil de Proyectos', 'Curso sobre metodolog?as ?giles en proyectos', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_has_quejas`
--

CREATE TABLE `curso_has_quejas` (
  `fkid_curso` int(11) DEFAULT NULL,
  `fkid_queja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso_has_quejas`
--

INSERT INTO `curso_has_quejas` (`fkid_curso`, `fkid_queja`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int(11) NOT NULL,
  `especialidad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_especialidad`, `especialidad`) VALUES
(1, 'Desarrollo Web'),
(2, 'Data Science'),
(3, 'Marketing Digital'),
(4, 'Ciberseguridad'),
(5, 'Idiomas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE `instructor` (
  `id_instructor` int(11) NOT NULL,
  `fkid_usuario` int(11) DEFAULT NULL,
  `descripcion_profesional` text DEFAULT NULL,
  `fkid_especialidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`id_instructor`, `fkid_usuario`, `descripcion_profesional`, `fkid_especialidad`) VALUES
(1, 4, 'Experto en desarrollo de software y gesti?n de equipos', 1),
(2, 5, 'Especialista en an?lisis de datos y algoritmos de machine learning', 2),
(3, 6, 'Consultor de marketing y publicidad en plataformas digitales', 3),
(4, 7, 'Experto en redes y seguridad inform?tica', 4),
(5, 8, 'Coach en gesti?n de proyectos y liderazgo', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quejas`
--

CREATE TABLE `quejas` (
  `id_queja` int(11) NOT NULL,
  `texto_queja` varchar(1000) DEFAULT NULL,
  `fecha_queja` datetime DEFAULT NULL,
  `fkid_aprendiz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `quejas`
--

INSERT INTO `quejas` (`id_queja`, `texto_queja`, `fecha_queja`, `fkid_aprendiz`) VALUES
(1, 'El curso fue demasiado te?rico y no se mostr? pr?ctica suficiente', '2024-01-18 08:30:00', 1),
(2, 'Algunas lecciones eran demasiado r?pidas, no pude seguir', '2024-02-20 13:00:00', 2),
(3, 'No se resolvieron dudas en tiempo real', '2024-03-09 17:00:00', 3),
(4, 'El material no estaba actualizado', '2024-04-23 10:30:00', 1),
(5, 'Hubo problemas con el acceso a los materiales del curso', '2024-05-17 12:45:00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rol`) VALUES
(1, 'aprendiz'),
(2, 'instructor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripcion`
--

CREATE TABLE `suscripcion` (
  `id_suscripcion` int(11) NOT NULL,
  `fecha_suscripcion` date DEFAULT NULL,
  `precio_suscripcion` float DEFAULT NULL,
  `fkid_curso` int(11) DEFAULT NULL,
  `estado_sub` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suscripcion`
--

INSERT INTO `suscripcion` (`id_suscripcion`, `fecha_suscripcion`, `precio_suscripcion`, `fkid_curso`, `estado_sub`) VALUES
(1, '2024-01-12', 50000, 1, 1),
(2, '2024-02-16', 60000, 2, 1),
(3, '2024-03-07', 45000, 3, 1),
(4, '2024-04-22', 70000, 4, 1),
(5, '2024-05-15', 55000, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripcion_has_aprendiz`
--

CREATE TABLE `suscripcion_has_aprendiz` (
  `fkid_suscripcion` int(11) DEFAULT NULL,
  `fkid_aprendiz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suscripcion_has_aprendiz`
--

INSERT INTO `suscripcion_has_aprendiz` (`fkid_suscripcion`, `fkid_aprendiz`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `primer_nombre` varchar(20) DEFAULT NULL,
  `segundo_nombre` varchar(20) DEFAULT NULL,
  `primer_apellido` varchar(20) DEFAULT NULL,
  `segundo_apellido` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `fkid_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `fecha_nacimiento`, `correo`, `fkid_rol`) VALUES
(1, 'Juan', 'Carlos', 'P?rez', 'G?mez', '1990-05-15', 'juanperez@example.com', 1),
(2, 'Ana', 'Luc?a', 'Ram?rez', 'V?zquez', '1992-11-20', 'anarodriguez@example.com', 1),
(3, 'Pedro', 'Jos?', 'Mart?nez', 'S?nchez', '1989-08-10', 'pedromartinez@example.com', 1),
(4, 'Laura', 'Isabel', 'Garc?a', 'Torres', '1994-02-28', 'lauragarcia@example.com', 2),
(5, 'Carlos', 'Eduardo', 'L?pez', 'Mu?oz', '1985-07-14', 'carloslopez@example.com', 2),
(6, 'Maria', 'Fernanda', 'D?az', 'Gonz?lez', '1995-03-10', 'mariadiaz@example.com', 2),
(7, 'David', 'Antonio', 'P?rez', 'Mart?nez', '1991-06-23', 'davidperez@example.com', 2),
(8, 'Sof?a', 'Carolina', 'Morales', 'Castro', '1993-09-11', 'sofia.morales@example.com', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`id_aprendiz`),
  ADD KEY `fkid_usuario` (`fkid_usuario`);

--
-- Indices de la tabla `archivo_multimedia`
--
ALTER TABLE `archivo_multimedia`
  ADD PRIMARY KEY (`id_archivo_multi`),
  ADD KEY `fkid_contenido` (`fkid_contenido`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `fkid_aprendiz` (`fkid_aprendiz`);

--
-- Indices de la tabla `comentario_has_contenido`
--
ALTER TABLE `comentario_has_contenido`
  ADD KEY `fkid_comentario` (`fkid_comentario`),
  ADD KEY `fkid_contenido` (`fkid_contenido`);

--
-- Indices de la tabla `contenido`
--
ALTER TABLE `contenido`
  ADD PRIMARY KEY (`id_contenido`),
  ADD KEY `fkid_curso` (`fkid_curso`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `fkid_instructor` (`fkid_instructor`);

--
-- Indices de la tabla `curso_has_quejas`
--
ALTER TABLE `curso_has_quejas`
  ADD KEY `fkid_curso` (`fkid_curso`),
  ADD KEY `fkid_queja` (`fkid_queja`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id_instructor`),
  ADD KEY `fkid_usuario` (`fkid_usuario`),
  ADD KEY `fkid_especialidad` (`fkid_especialidad`);

--
-- Indices de la tabla `quejas`
--
ALTER TABLE `quejas`
  ADD PRIMARY KEY (`id_queja`),
  ADD KEY `fkid_aprendiz` (`fkid_aprendiz`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `rol` (`rol`);

--
-- Indices de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD PRIMARY KEY (`id_suscripcion`),
  ADD KEY `fkid_curso` (`fkid_curso`);

--
-- Indices de la tabla `suscripcion_has_aprendiz`
--
ALTER TABLE `suscripcion_has_aprendiz`
  ADD KEY `fkid_suscripcion` (`fkid_suscripcion`),
  ADD KEY `fkid_aprendiz` (`fkid_aprendiz`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `fkid_rol` (`fkid_rol`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD CONSTRAINT `aprendiz_ibfk_1` FOREIGN KEY (`fkid_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `archivo_multimedia`
--
ALTER TABLE `archivo_multimedia`
  ADD CONSTRAINT `archivo_multimedia_ibfk_1` FOREIGN KEY (`fkid_contenido`) REFERENCES `contenido` (`id_contenido`);

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`fkid_aprendiz`) REFERENCES `aprendiz` (`id_aprendiz`);

--
-- Filtros para la tabla `comentario_has_contenido`
--
ALTER TABLE `comentario_has_contenido`
  ADD CONSTRAINT `comentario_has_contenido_ibfk_1` FOREIGN KEY (`fkid_comentario`) REFERENCES `comentario` (`id_comentario`),
  ADD CONSTRAINT `comentario_has_contenido_ibfk_2` FOREIGN KEY (`fkid_contenido`) REFERENCES `contenido` (`id_contenido`);

--
-- Filtros para la tabla `contenido`
--
ALTER TABLE `contenido`
  ADD CONSTRAINT `contenido_ibfk_1` FOREIGN KEY (`fkid_curso`) REFERENCES `curso` (`id_curso`);

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`fkid_instructor`) REFERENCES `instructor` (`id_instructor`);

--
-- Filtros para la tabla `curso_has_quejas`
--
ALTER TABLE `curso_has_quejas`
  ADD CONSTRAINT `curso_has_quejas_ibfk_1` FOREIGN KEY (`fkid_curso`) REFERENCES `curso` (`id_curso`),
  ADD CONSTRAINT `curso_has_quejas_ibfk_2` FOREIGN KEY (`fkid_queja`) REFERENCES `quejas` (`id_queja`);

--
-- Filtros para la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`fkid_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `instructor_ibfk_2` FOREIGN KEY (`fkid_especialidad`) REFERENCES `especialidades` (`id_especialidad`);

--
-- Filtros para la tabla `quejas`
--
ALTER TABLE `quejas`
  ADD CONSTRAINT `quejas_ibfk_1` FOREIGN KEY (`fkid_aprendiz`) REFERENCES `aprendiz` (`id_aprendiz`);

--
-- Filtros para la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD CONSTRAINT `suscripcion_ibfk_1` FOREIGN KEY (`fkid_curso`) REFERENCES `curso` (`id_curso`);

--
-- Filtros para la tabla `suscripcion_has_aprendiz`
--
ALTER TABLE `suscripcion_has_aprendiz`
  ADD CONSTRAINT `suscripcion_has_aprendiz_ibfk_1` FOREIGN KEY (`fkid_suscripcion`) REFERENCES `suscripcion` (`id_suscripcion`),
  ADD CONSTRAINT `suscripcion_has_aprendiz_ibfk_2` FOREIGN KEY (`fkid_aprendiz`) REFERENCES `aprendiz` (`id_aprendiz`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`fkid_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
