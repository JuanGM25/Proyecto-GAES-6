-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2025 a las 06:29:48
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
-- Base de datos: `proyecto6`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendiz`
--

CREATE TABLE `aprendiz` (
  `id_aprendiz` int(11) NOT NULL,
  `fkid_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario_has_contenido`
--

CREATE TABLE `comentario_has_contenido` (
  `fkid_comentario` int(11) DEFAULT NULL,
  `fkid_contenido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `fecha_curso` date DEFAULT NULL,
  `nombre_curso` varchar(50) DEFAULT NULL,
  `descripcion_curso` varchar(100) DEFAULT NULL,
  `fkid_instructor` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curso`, `fecha_curso`, `nombre_curso`, `descripcion_curso`, `fkid_instructor`, `created_at`, `updated_at`) VALUES
(2, NULL, 'Curso Inglés', 'Hi :D', NULL, '2025-04-08 08:34:08', '2025-04-08 08:34:08'),
(3, NULL, 'esooooooooooo', 'ash', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_has_quejas`
--

CREATE TABLE `curso_has_quejas` (
  `fkid_curso` int(11) DEFAULT NULL,
  `fkid_queja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int(11) NOT NULL,
  `especialidad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'administrador'),
(2, 'aprendiz'),
(3, 'instructor');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripcion_has_aprendiz`
--

CREATE TABLE `suscripcion_has_aprendiz` (
  `fkid_suscripcion` int(11) DEFAULT NULL,
  `fkid_aprendiz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `fkid_rol` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `fecha_nacimiento`, `correo`, `fkid_rol`, `password`) VALUES
(3, 'tim', 'burton', NULL, NULL, NULL, 'burton@gmail.com', 1, '$2y$12$eXJ2UDwjC3U9NSebFN0juev/k7reR2Aolp9/RjyIzjQymjELm4.CO'),
(4, 'Monica', 'Galindo', NULL, NULL, NULL, 'xd@gmail.com', 2, '$2y$12$unUUzMhh0BaOFt1GCsiuWu08ypYQUOhjnVw.za3YDQfq9ujppWBWG');

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
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
