-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2023 a las 19:46:11
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hoteleria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `hab_numero` varchar(3) NOT NULL,
  `estado` int(2) DEFAULT NULL,
  `tipo_hab_id` varchar(2) DEFAULT NULL,
  `hab_tarifa` float(10,2) DEFAULT NULL,
  `hab_capacidad` int(2) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`hab_numero`, `estado`, `tipo_hab_id`, `hab_tarifa`, `hab_capacidad`, `imagen`) VALUES
('205', 1, '1', 200.00, 5, '123.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_hab`
--

CREATE TABLE `tipo_hab` (
  `tipo_hab_id` varchar(2) NOT NULL,
  `tipo_hab` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_hab`
--

INSERT INTO `tipo_hab` (`tipo_hab_id`, `tipo_hab`) VALUES
('1', 'Sencilla');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`hab_numero`),
  ADD KEY `habitacion` (`tipo_hab_id`);

--
-- Indices de la tabla `tipo_hab`
--
ALTER TABLE `tipo_hab`
  ADD PRIMARY KEY (`tipo_hab_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `habitacion` FOREIGN KEY (`tipo_hab_id`) REFERENCES `tipo_hab` (`tipo_hab_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
