-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2023 a las 23:52:42
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kratoshotel`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `genera_nomina` () RETURNS FLOAT(10,2)  BEGIN
	DECLARE nomina float(10,2);
		SELECT SUM(salario) INTO nomina FROM empleado;
	RETURN nomina;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `hab_capacidad` (`nro_hab` VARCHAR(3)) RETURNS INT(11)  BEGIN
	DECLARE total int(11);
	SELECT sum(stock*capacidad) INTO total FROM camas, mobiliario 
	WHERE camas.cama_id=mobiliario.cama_id AND hab_numero=nro_hab GROUP BY hab_numero;
	RETURN total;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camas`
--

CREATE TABLE `camas` (
  `cama_id` varchar(2) NOT NULL,
  `cama_tipo` varchar(50) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `camas`
--

INSERT INTO `camas` (`cama_id`, `cama_tipo`, `capacidad`) VALUES
('01', 'Cama individual', 1),
('02', 'Cama matrimonial', 2),
('03', 'Cama queen', 2),
('04', 'Cama king', 2),
('05', 'Litera', 2),
('06', 'Sofá cama', 1),
('07', 'Cuna', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categ_id` int(2) NOT NULL,
  `categ_nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categ_id`, `categ_nombre`) VALUES
(1, 'Electronicos'),
(2, 'Mobiliario'),
(3, 'Ropa de cama'),
(4, 'Articulos de aseo'),
(5, 'Alimentos y bebidas'),
(6, 'Decoracion'),
(7, 'Utensilios de cocina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `nro_doc` varchar(15) NOT NULL,
  `tipo_doc` varchar(50) DEFAULT NULL,
  `usu_nombres` varchar(100) DEFAULT NULL,
  `usu_apellidos` varchar(100) DEFAULT NULL,
  `usu_direccion` varchar(200) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`nro_doc`, `tipo_doc`, `usu_nombres`, `usu_apellidos`, `usu_direccion`, `fecha_registro`) VALUES
('10101010', 'DNI', 'Carolina', 'Silva', 'Carrera 50', '2022-10-10'),
('11111111', 'DNI', 'Juan', 'Pérez', 'Calle 123', '2022-01-01'),
('12121212', 'Pasaporte', 'Roberto', 'Luna', 'Avenida Sur', '2022-11-11'),
('14141414', 'Carnet de Extranjería', 'Isabel', 'Mendoza', 'Calle Norte', '2022-12-12'),
('16161616', 'DNI', 'Eduardo', 'Paz', 'Plaza 15', '2023-01-01'),
('18181818', 'Pasaporte', 'Valentina', 'Rojas', 'Avenida Este', '2023-02-02'),
('20202020', 'Carnet de Extranjería', 'Gonzalo', 'Castañeda', 'Calle Oeste', '2023-03-03'),
('22222220', 'DNI', 'Natalia', 'Vargas', 'Plaza 25', '2023-04-04'),
('22222222', 'Pasaporte', 'María', 'Gómez', 'Avenida 456', '2022-02-02'),
('24242424', 'Pasaporte', 'Diego', 'Santos', 'Avenida 30', '2023-05-05'),
('26262626', 'Carnet de Extranjería', 'Camila', 'Ortega', 'Carrera 60', '2023-06-06'),
('28282828', 'DNI', 'Roberto', 'Molina', 'Paseo 70', '2023-07-07'),
('30303030', 'Pasaporte', 'Fernanda', 'Rios', 'Avenida 80', '2023-08-08'),
('33333333', 'Carnet de Extranjería', 'Carlos', 'López', 'Plaza 789', '2022-03-03'),
('44444444', 'DNI', 'Laura', 'Fernández', 'Carrera 10', '2022-04-04'),
('55555555', 'Pasaporte', 'Pedro', 'Ramírez', 'Paseo 20', '2022-05-05'),
('66666666', 'Carnet de Extranjería', 'Ana', 'Martínez', 'Avenida Central', '2022-06-06'),
('77777777', 'DNI', 'Luis', 'Hernández', 'Calle 30', '2022-07-07'),
('88888888', 'Pasaporte', 'Sofía', 'García', 'Avenida 40', '2022-08-08'),
('99999999', 'Carnet de Extranjería', 'Andrés', 'Torres', 'Plaza Mayor', '2022-09-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correo_electronico`
--

CREATE TABLE `correo_electronico` (
  `nro_doc` varchar(15) DEFAULT NULL,
  `usu_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `correo_electronico`
--

INSERT INTO `correo_electronico` (`nro_doc`, `usu_email`) VALUES
('11111111', 'usuario1@example.com'),
('22222222', 'usuario2@example.com'),
('33333333', 'usuario3@example.com'),
('44444444', 'usuario4@example.com'),
('55555555', 'usuario5@example.com'),
('66666666', 'usuario6@example.com'),
('77777777', 'usuario7@example.com'),
('88888888', 'usuario8@example.com'),
('99999999', 'usuario9@example.com'),
('10101010', 'usuario10@example.com'),
('12121212', 'usuario11@example.com'),
('13131313', 'usuario12@example.com'),
('14141414', 'usuario13@example.com'),
('15151515', 'usuario14@example.com'),
('16161616', 'usuario15@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `detalle_id` varchar(10) NOT NULL,
  `fact_id` varchar(6) DEFAULT NULL,
  `res_id` varchar(10) DEFAULT NULL,
  `serv_id` varchar(4) DEFAULT NULL,
  `prod_id` varchar(4) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `valor` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`detalle_id`, `fact_id`, `res_id`, `serv_id`, `prod_id`, `cantidad`, `valor`) VALUES
('D0001', 'F0001', 'R001', NULL, NULL, 2, 100.00),
('D0002', 'F0001', NULL, 'S011', NULL, 1, 50.00),
('D0003', 'F0002', NULL, NULL, 'P012', 3, 150.00),
('D0004', 'F0002', NULL, 'S002', NULL, 2, 100.00),
('D0005', 'F0003', 'R003', NULL, NULL, 1, 50.00),
('D0006', 'F0003', NULL, 'S003', NULL, 1, 50.00),
('D0007', 'F0004', NULL, NULL, 'P024', 2, 100.00),
('D0008', 'F0004', NULL, 'S014', NULL, 1, 50.00),
('D0009', 'F0005', NULL, NULL, 'P005', 3, 150.00),
('D0010', 'F0005', 'R002', NULL, NULL, 2, 100.00),
('D0011', 'F0001', NULL, 'S008', NULL, 1, 9.99),
('D0012', 'F0003', NULL, NULL, 'P021', 2, 500.00);

--
-- Disparadores `detalle_factura`
--
DELIMITER $$
CREATE TRIGGER `actualizar_total_factura` AFTER INSERT ON `detalle_factura` FOR EACH ROW BEGIN
  UPDATE factura
  SET fact_total = (
    SELECT SUM(valor * cantidad)
    FROM detalle_factura
    WHERE fact_id = NEW.fact_id
  )
  WHERE fact_id = NEW.fact_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `control_stock` AFTER INSERT ON `detalle_factura` FOR EACH ROW BEGIN
  IF NEW.prod_id IS NOT NULL THEN
    UPDATE inventario
    SET stock = stock - NEW.cantidad
    WHERE hab_numero = (
      SELECT hab_numero
      FROM reserva_habitacion as rh, reserva as r, detalle_factura as df
      WHERE rh.res_id=r.res_id AND r.res_id=df.res_id AND
	df.fact_id=NEW.fact_id
    )
    AND prod_id = NEW.prod_id;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `nro_doc` varchar(15) NOT NULL,
  `tipo_doc` varchar(50) DEFAULT NULL,
  `usu_nombres` varchar(100) DEFAULT NULL,
  `usu_apellidos` varchar(100) DEFAULT NULL,
  `usu_direccion` varchar(200) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `salario` float(10,2) DEFAULT NULL,
  `fecha_contrato` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`nro_doc`, `tipo_doc`, `usu_nombres`, `usu_apellidos`, `usu_direccion`, `cargo`, `salario`, `fecha_contrato`) VALUES
('10101010', 'DNI', 'Carolina', 'Silva', 'Carrera 50', 'Mantenimiento', 1600.00, '2022-10-10'),
('12121210', 'Pasaporte', 'Roberto', 'Luna', 'Avenida Sur', 'Conserje', 1400.00, '2022-11-11'),
('12121212', 'Pasaporte', 'Roberto', 'Luna', 'Avenida Sur', 'Conserje', 1400.00, '2022-11-11'),
('13131313', 'Carnet de Extranjería', 'Isabel', 'Mendoza', 'Calle Norte', 'Recepcionista', 1500.00, '2022-12-12'),
('14141410', 'Pasaporte', 'Eduardo', 'Paz', 'Plaza 15', 'Camarero', 1200.00, '2023-01-01'),
('15151515', 'Carnet de Extranjería', 'Valentina', 'Rojas', 'Avenida Este', 'Cocinero', 1800.00, '2023-02-02'),
('16161610', 'Pasaporte', 'Gonzalo', 'Castañeda', 'Calle Oeste', 'Limpieza', 1000.00, '2023-03-03'),
('66666666', 'Carnet de Extranjería', 'Ana', 'Martínez', 'Avenida Central', 'Recepcionista', 1500.00, '2022-06-06'),
('77777777', 'DNI', 'Luis', 'Hernández', 'Calle 30', 'Camarero', 1200.00, '2022-07-07'),
('88888888', 'Pasaporte', 'Sofía', 'García', 'Avenida 40', 'Cocinero', 1800.00, '2022-08-08'),
('99999999', 'Carnet de Extranjería', 'Andrés', 'Torres', 'Plaza Mayor', 'Limpieza', 1000.00, '2022-09-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `est_id` int(2) NOT NULL,
  `est_nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`est_id`, `est_nombre`) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'Pendiente'),
(4, 'Cancelado'),
(5, 'Completado'),
(6, 'En proceso'),
(7, 'Reservado'),
(8, 'Disponible'),
(9, 'Ocupado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `fact_id` varchar(6) NOT NULL,
  `fact_fecha` date DEFAULT NULL,
  `fact_impuesto` float(5,2) DEFAULT NULL,
  `fact_descuento` float(5,2) DEFAULT NULL,
  `fact_total` float(10,2) DEFAULT NULL,
  `nro_doc` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`fact_id`, `fact_fecha`, `fact_impuesto`, `fact_descuento`, `fact_total`, `nro_doc`) VALUES
('F0001', '2023-05-24', 10.00, 5.00, 259.99, '10101010'),
('F0002', '2023-05-24', 10.00, 5.00, 0.00, '12121212'),
('F0003', '2023-05-24', 10.00, 5.00, 1100.00, '33333333'),
('F0004', '2023-05-24', 10.00, 5.00, 0.00, '14141414'),
('F0005', '2023-05-24', 10.00, 5.00, 0.00, '16161616'),
('F0006', '2023-05-24', 10.00, 5.00, 0.00, '11111111'),
('F0007', '2023-05-24', 10.00, 5.00, 0.00, '18181818'),
('F0008', '2023-05-24', 10.00, 5.00, 0.00, '20202020'),
('F0009', '2023-05-24', 10.00, 5.00, 0.00, '66666666'),
('F0010', '2023-05-24', 10.00, 5.00, 0.00, '24242424'),
('F0011', '2023-05-24', 10.00, 5.00, 0.00, '77777777'),
('F0012', '2023-05-24', 10.00, 5.00, 0.00, '88888888');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `hab_numero` varchar(3) NOT NULL,
  `hab_estado` int(11) DEFAULT NULL,
  `tipo_hab_id` int(11) DEFAULT NULL,
  `hab_tarifa` decimal(10,2) DEFAULT NULL,
  `hab_capacidad` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`hab_numero`, `hab_estado`, `tipo_hab_id`, `hab_tarifa`, `hab_capacidad`, `imagen`) VALUES
('101', 1, 1, '100.00', 3, 'ruta_imagen_101.jpg'),
('102', 1, 1, '100.00', 2, 'ruta_imagen_102.jpg'),
('103', 1, 2, '150.00', 3, 'ruta_imagen_103.jpg'),
('104', 1, 2, '150.00', 3, 'ruta_imagen_104.jpg'),
('105', 1, 3, '200.00', 4, 'ruta_imagen_105.jpg'),
('201', 1, 1, '100.00', 2, 'ruta_imagen_201.jpg'),
('202', 1, 1, '100.00', 2, 'ruta_imagen_202.jpg'),
('203', 1, 2, '150.00', 3, 'ruta_imagen_203.jpg'),
('204', 1, 2, '150.00', 6, 'ruta_imagen_204.jpg'),
('205', 1, 3, '200.00', 4, 'ruta_imagen_205.jpg'),
('301', 1, 1, '100.00', 2, 'ruta_imagen_301.jpg'),
('302', 1, 1, '100.00', 2, 'ruta_imagen_302.jpg'),
('303', 1, 2, '150.00', 3, 'ruta_imagen_303.jpg'),
('304', 1, 2, '150.00', 3, 'ruta_imagen_304.jpg'),
('305', 1, 3, '200.00', 4, 'ruta_imagen_305.jpg'),
('401', 1, 1, '100.00', 2, 'ruta_imagen_401.jpg'),
('402', 1, 1, '100.00', 2, 'ruta_imagen_402.jpg'),
('403', 1, 2, '150.00', 3, 'ruta_imagen_403.jpg'),
('404', 1, 2, '150.00', 3, 'ruta_imagen_404.jpg'),
('405', 1, 3, '200.00', 4, 'ruta_imagen_405.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `hab_numero` varchar(3) DEFAULT NULL,
  `prod_id` varchar(4) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`hab_numero`, `prod_id`, `stock`) VALUES
('101', 'P021', 5),
('102', 'P021', 5),
('103', 'P021', 5),
('104', 'P021', 3),
('105', 'P021', 5),
('201', 'P021', 5),
('202', 'P021', 5),
('203', 'P021', 5),
('204', 'P021', 5),
('205', 'P021', 5),
('301', 'P021', 5),
('302', 'P021', 5),
('303', 'P021', 5),
('304', 'P021', 5),
('305', 'P021', 5),
('401', 'P021', 5),
('402', 'P021', 5),
('403', 'P021', 5),
('404', 'P021', 5),
('405', 'P021', 5),
('101', 'P022', 5),
('102', 'P022', 5),
('103', 'P022', 5),
('104', 'P022', 5),
('105', 'P022', 5),
('201', 'P022', 5),
('202', 'P022', 5),
('203', 'P022', 5),
('204', 'P022', 5),
('205', 'P022', 5),
('301', 'P022', 5),
('302', 'P022', 5),
('303', 'P022', 5),
('304', 'P022', 5),
('305', 'P022', 5),
('401', 'P022', 5),
('402', 'P022', 5),
('403', 'P022', 5),
('404', 'P022', 5),
('405', 'P022', 5),
('101', 'P023', 5),
('102', 'P023', 5),
('103', 'P023', 5),
('104', 'P023', 5),
('105', 'P023', 5),
('201', 'P023', 5),
('202', 'P023', 5),
('203', 'P023', 5),
('204', 'P023', 5),
('205', 'P023', 5),
('301', 'P023', 5),
('302', 'P023', 5),
('303', 'P023', 5),
('304', 'P023', 5),
('305', 'P023', 5),
('401', 'P023', 5),
('402', 'P023', 5),
('403', 'P023', 5),
('404', 'P023', 5),
('405', 'P023', 5),
('101', 'P024', 5),
('102', 'P024', 5),
('103', 'P024', 5),
('104', 'P024', 5),
('105', 'P024', 5),
('201', 'P024', 5),
('202', 'P024', 5),
('203', 'P024', 5),
('204', 'P024', 5),
('205', 'P024', 5),
('301', 'P024', 5),
('302', 'P024', 5),
('303', 'P024', 5),
('304', 'P024', 5),
('305', 'P024', 5),
('401', 'P024', 5),
('402', 'P024', 5),
('403', 'P024', 5),
('404', 'P024', 5),
('405', 'P024', 5),
('101', 'P025', 5),
('102', 'P025', 5),
('103', 'P025', 5),
('104', 'P025', 5),
('105', 'P025', 5),
('201', 'P025', 5),
('202', 'P025', 5),
('203', 'P025', 5),
('204', 'P025', 5),
('205', 'P025', 5),
('301', 'P025', 5),
('302', 'P025', 5),
('303', 'P025', 5),
('304', 'P025', 5),
('305', 'P025', 5),
('401', 'P025', 5),
('402', 'P025', 5),
('403', 'P025', 5),
('404', 'P025', 5),
('405', 'P025', 5),
('101', 'P026', 5),
('102', 'P026', 5),
('103', 'P026', 5),
('104', 'P026', 5),
('105', 'P026', 5),
('201', 'P026', 5),
('202', 'P026', 5),
('203', 'P026', 5),
('204', 'P026', 5),
('205', 'P026', 5),
('301', 'P026', 5),
('302', 'P026', 5),
('303', 'P026', 5),
('304', 'P026', 5),
('305', 'P026', 5),
('401', 'P026', 5),
('402', 'P026', 5),
('403', 'P026', 5),
('404', 'P026', 5),
('405', 'P026', 5),
('101', 'P027', 5),
('102', 'P027', 5),
('103', 'P027', 5),
('104', 'P027', 5),
('105', 'P027', 5),
('201', 'P027', 5),
('202', 'P027', 5),
('203', 'P027', 5),
('204', 'P027', 5),
('205', 'P027', 5),
('301', 'P027', 5),
('302', 'P027', 5),
('303', 'P027', 5),
('304', 'P027', 5),
('305', 'P027', 5),
('401', 'P027', 5),
('402', 'P027', 5),
('403', 'P027', 5),
('404', 'P027', 5),
('405', 'P027', 5),
('101', 'P028', 5),
('102', 'P028', 5),
('103', 'P028', 5),
('104', 'P028', 5),
('105', 'P028', 5),
('201', 'P028', 5),
('202', 'P028', 5),
('203', 'P028', 5),
('204', 'P028', 5),
('205', 'P028', 5),
('301', 'P028', 5),
('302', 'P028', 5),
('303', 'P028', 5),
('304', 'P028', 5),
('305', 'P028', 5),
('401', 'P028', 5),
('402', 'P028', 5),
('403', 'P028', 5),
('404', 'P028', 5),
('405', 'P028', 5),
('101', 'P029', 5),
('102', 'P029', 5),
('103', 'P029', 5),
('104', 'P029', 5),
('105', 'P029', 5),
('201', 'P029', 5),
('202', 'P029', 5),
('203', 'P029', 5),
('204', 'P029', 5),
('205', 'P029', 5),
('301', 'P029', 5),
('302', 'P029', 5),
('303', 'P029', 5),
('304', 'P029', 5),
('305', 'P029', 5),
('401', 'P029', 5),
('402', 'P029', 5),
('403', 'P029', 5),
('404', 'P029', 5),
('405', 'P029', 5),
('101', 'P030', 5),
('102', 'P030', 5),
('103', 'P030', 5),
('104', 'P030', 5),
('105', 'P030', 5),
('201', 'P030', 5),
('202', 'P030', 5),
('203', 'P030', 5),
('204', 'P030', 5),
('205', 'P030', 5),
('301', 'P030', 5),
('302', 'P030', 5),
('303', 'P030', 5),
('304', 'P030', 5),
('305', 'P030', 5),
('401', 'P030', 5),
('402', 'P030', 5),
('403', 'P030', 5),
('404', 'P030', 5),
('405', 'P030', 5),
('101', 'P031', 5),
('102', 'P031', 5),
('103', 'P031', 5),
('104', 'P031', 5),
('105', 'P031', 5),
('201', 'P031', 5),
('202', 'P031', 5),
('203', 'P031', 5),
('204', 'P031', 5),
('205', 'P031', 5),
('301', 'P031', 5),
('302', 'P031', 5),
('303', 'P031', 5),
('304', 'P031', 5),
('305', 'P031', 5),
('401', 'P031', 5),
('402', 'P031', 5),
('403', 'P031', 5),
('404', 'P031', 5),
('405', 'P031', 5),
('101', 'P032', 5),
('102', 'P032', 5),
('103', 'P032', 5),
('104', 'P032', 5),
('105', 'P032', 5),
('201', 'P032', 5),
('202', 'P032', 5),
('203', 'P032', 5),
('204', 'P032', 5),
('205', 'P032', 5),
('301', 'P032', 5),
('302', 'P032', 5),
('303', 'P032', 5),
('304', 'P032', 5),
('305', 'P032', 5),
('401', 'P032', 5),
('402', 'P032', 5),
('403', 'P032', 5),
('404', 'P032', 5),
('405', 'P032', 5),
('101', 'P033', 5),
('102', 'P033', 5),
('103', 'P033', 5),
('104', 'P033', 5),
('105', 'P033', 5),
('201', 'P033', 5),
('202', 'P033', 5),
('203', 'P033', 5),
('204', 'P033', 5),
('205', 'P033', 5),
('301', 'P033', 5),
('302', 'P033', 5),
('303', 'P033', 5),
('304', 'P033', 5),
('305', 'P033', 5),
('401', 'P033', 5),
('402', 'P033', 5),
('403', 'P033', 5),
('404', 'P033', 5),
('405', 'P033', 5),
('101', 'P034', 5),
('102', 'P034', 5),
('103', 'P034', 5),
('104', 'P034', 5),
('105', 'P034', 5),
('201', 'P034', 5),
('202', 'P034', 5),
('203', 'P034', 5),
('204', 'P034', 5),
('205', 'P034', 5),
('301', 'P034', 5),
('302', 'P034', 5),
('303', 'P034', 5),
('304', 'P034', 5),
('305', 'P034', 5),
('401', 'P034', 5),
('402', 'P034', 5),
('403', 'P034', 5),
('404', 'P034', 5),
('405', 'P034', 5),
('101', 'P035', 5),
('102', 'P035', 5),
('103', 'P035', 5),
('104', 'P035', 5),
('105', 'P035', 5),
('201', 'P035', 5),
('202', 'P035', 5),
('203', 'P035', 5),
('204', 'P035', 5),
('205', 'P035', 5),
('301', 'P035', 5),
('302', 'P035', 5),
('303', 'P035', 5),
('304', 'P035', 5),
('305', 'P035', 5),
('401', 'P035', 5),
('402', 'P035', 5),
('403', 'P035', 5),
('404', 'P035', 5),
('405', 'P035', 5),
('101', 'P011', 5),
('102', 'P011', 5),
('103', 'P011', 5),
('104', 'P011', 5),
('105', 'P011', 5),
('201', 'P011', 5),
('202', 'P011', 5),
('203', 'P011', 5),
('204', 'P011', 5),
('205', 'P011', 5),
('301', 'P011', 5),
('302', 'P011', 5),
('303', 'P011', 5),
('304', 'P011', 5),
('305', 'P011', 5),
('401', 'P011', 5),
('402', 'P011', 5),
('403', 'P011', 5),
('404', 'P011', 5),
('405', 'P011', 5),
('101', 'P012', 5),
('102', 'P012', 5),
('103', 'P012', 5),
('104', 'P012', 5),
('105', 'P012', 5),
('201', 'P012', 5),
('202', 'P012', 5),
('203', 'P012', 5),
('204', 'P012', 5),
('205', 'P012', 5),
('301', 'P012', 5),
('302', 'P012', 5),
('303', 'P012', 5),
('304', 'P012', 5),
('305', 'P012', 5),
('401', 'P012', 5),
('402', 'P012', 5),
('403', 'P012', 5),
('404', 'P012', 5),
('405', 'P012', 5),
('101', 'P013', 5),
('102', 'P013', 5),
('103', 'P013', 5),
('104', 'P013', 5),
('105', 'P013', 5),
('201', 'P013', 5),
('202', 'P013', 5),
('203', 'P013', 5),
('204', 'P013', 5),
('205', 'P013', 5),
('301', 'P013', 5),
('302', 'P013', 5),
('303', 'P013', 5),
('304', 'P013', 5),
('305', 'P013', 5),
('401', 'P013', 5),
('402', 'P013', 5),
('403', 'P013', 5),
('404', 'P013', 5),
('405', 'P013', 5),
('101', 'P014', 5),
('102', 'P014', 5),
('103', 'P014', 5),
('104', 'P014', 5),
('105', 'P014', 5),
('201', 'P014', 5),
('202', 'P014', 5),
('203', 'P014', 5),
('204', 'P014', 5),
('205', 'P014', 5),
('301', 'P014', 5),
('302', 'P014', 5),
('303', 'P014', 5),
('304', 'P014', 5),
('305', 'P014', 5),
('401', 'P014', 5),
('402', 'P014', 5),
('403', 'P014', 5),
('404', 'P014', 5),
('405', 'P014', 5),
('101', 'P015', 5),
('102', 'P015', 5),
('103', 'P015', 5),
('104', 'P015', 5),
('105', 'P015', 5),
('201', 'P015', 5),
('202', 'P015', 5),
('203', 'P015', 5),
('204', 'P015', 5),
('205', 'P015', 5),
('301', 'P015', 5),
('302', 'P015', 5),
('303', 'P015', 5),
('304', 'P015', 5),
('305', 'P015', 5),
('401', 'P015', 5),
('402', 'P015', 5),
('403', 'P015', 5),
('404', 'P015', 5),
('405', 'P015', 5),
('101', 'P016', 5),
('102', 'P016', 5),
('103', 'P016', 5),
('104', 'P016', 5),
('105', 'P016', 5),
('201', 'P016', 5),
('202', 'P016', 5),
('203', 'P016', 5),
('204', 'P016', 5),
('205', 'P016', 5),
('301', 'P016', 5),
('302', 'P016', 5),
('303', 'P016', 5),
('304', 'P016', 5),
('305', 'P016', 5),
('401', 'P016', 5),
('402', 'P016', 5),
('403', 'P016', 5),
('404', 'P016', 5),
('405', 'P016', 5),
('101', 'P017', 5),
('102', 'P017', 5),
('103', 'P017', 5),
('104', 'P017', 5),
('105', 'P017', 5),
('201', 'P017', 5),
('202', 'P017', 5),
('203', 'P017', 5),
('204', 'P017', 5),
('205', 'P017', 5),
('301', 'P017', 5),
('302', 'P017', 5),
('303', 'P017', 5),
('304', 'P017', 5),
('305', 'P017', 5),
('401', 'P017', 5),
('402', 'P017', 5),
('403', 'P017', 5),
('404', 'P017', 5),
('405', 'P017', 5),
('101', 'P018', 5),
('102', 'P018', 5),
('103', 'P018', 5),
('104', 'P018', 5),
('105', 'P018', 5),
('201', 'P018', 5),
('202', 'P018', 5),
('203', 'P018', 5),
('204', 'P018', 5),
('205', 'P018', 5),
('301', 'P018', 5),
('302', 'P018', 5),
('303', 'P018', 5),
('304', 'P018', 5),
('305', 'P018', 5),
('401', 'P018', 5),
('402', 'P018', 5),
('403', 'P018', 5),
('404', 'P018', 5),
('405', 'P018', 5),
('101', 'P019', 5),
('102', 'P019', 5),
('103', 'P019', 5),
('104', 'P019', 5),
('105', 'P019', 5),
('201', 'P019', 5),
('202', 'P019', 5),
('203', 'P019', 5),
('204', 'P019', 5),
('205', 'P019', 5),
('301', 'P019', 5),
('302', 'P019', 5),
('303', 'P019', 5),
('304', 'P019', 5),
('305', 'P019', 5),
('401', 'P019', 5),
('402', 'P019', 5),
('403', 'P019', 5),
('404', 'P019', 5),
('405', 'P019', 5),
('101', 'P020', 5),
('102', 'P020', 5),
('103', 'P020', 5),
('104', 'P020', 5),
('105', 'P020', 5),
('201', 'P020', 5),
('202', 'P020', 5),
('203', 'P020', 5),
('204', 'P020', 5),
('205', 'P020', 5),
('301', 'P020', 5),
('302', 'P020', 5),
('303', 'P020', 5),
('304', 'P020', 5),
('305', 'P020', 5),
('401', 'P020', 5),
('402', 'P020', 5),
('403', 'P020', 5),
('404', 'P020', 5),
('405', 'P020', 5),
('101', 'P001', 5),
('102', 'P001', 5),
('103', 'P001', 5),
('104', 'P001', 5),
('105', 'P001', 5),
('201', 'P001', 5),
('202', 'P001', 5),
('203', 'P001', 5),
('204', 'P001', 5),
('205', 'P001', 5),
('301', 'P001', 5),
('302', 'P001', 5),
('303', 'P001', 5),
('304', 'P001', 5),
('305', 'P001', 5),
('401', 'P001', 5),
('402', 'P001', 5),
('403', 'P001', 5),
('404', 'P001', 5),
('405', 'P001', 5),
('101', 'P002', 5),
('102', 'P002', 5),
('103', 'P002', 5),
('104', 'P002', 5),
('105', 'P002', 5),
('201', 'P002', 5),
('202', 'P002', 5),
('203', 'P002', 5),
('204', 'P002', 5),
('205', 'P002', 5),
('301', 'P002', 5),
('302', 'P002', 5),
('303', 'P002', 5),
('304', 'P002', 5),
('305', 'P002', 5),
('401', 'P002', 5),
('402', 'P002', 5),
('403', 'P002', 5),
('404', 'P002', 5),
('405', 'P002', 5),
('101', 'P003', 5),
('102', 'P003', 5),
('103', 'P003', 5),
('104', 'P003', 5),
('105', 'P003', 5),
('201', 'P003', 5),
('202', 'P003', 5),
('203', 'P003', 5),
('204', 'P003', 5),
('205', 'P003', 5),
('301', 'P003', 5),
('302', 'P003', 5),
('303', 'P003', 5),
('304', 'P003', 5),
('305', 'P003', 5),
('401', 'P003', 5),
('402', 'P003', 5),
('403', 'P003', 5),
('404', 'P003', 5),
('405', 'P003', 5),
('101', 'P004', 5),
('102', 'P004', 5),
('103', 'P004', 5),
('104', 'P004', 5),
('105', 'P004', 5),
('201', 'P004', 5),
('202', 'P004', 5),
('203', 'P004', 5),
('204', 'P004', 5),
('205', 'P004', 5),
('301', 'P004', 5),
('302', 'P004', 5),
('303', 'P004', 5),
('304', 'P004', 5),
('305', 'P004', 5),
('401', 'P004', 5),
('402', 'P004', 5),
('403', 'P004', 5),
('404', 'P004', 5),
('405', 'P004', 5),
('101', 'P005', 5),
('102', 'P005', 5),
('103', 'P005', 5),
('104', 'P005', 5),
('105', 'P005', 5),
('201', 'P005', 5),
('202', 'P005', 5),
('203', 'P005', 5),
('204', 'P005', 5),
('205', 'P005', 5),
('301', 'P005', 5),
('302', 'P005', 5),
('303', 'P005', 5),
('304', 'P005', 5),
('305', 'P005', 5),
('401', 'P005', 5),
('402', 'P005', 5),
('403', 'P005', 5),
('404', 'P005', 5),
('405', 'P005', 5),
('101', 'P006', 5),
('102', 'P006', 5),
('103', 'P006', 5),
('104', 'P006', 5),
('105', 'P006', 5),
('201', 'P006', 5),
('202', 'P006', 5),
('203', 'P006', 5),
('204', 'P006', 5),
('205', 'P006', 5),
('301', 'P006', 5),
('302', 'P006', 5),
('303', 'P006', 5),
('304', 'P006', 5),
('305', 'P006', 5),
('401', 'P006', 5),
('402', 'P006', 5),
('403', 'P006', 5),
('404', 'P006', 5),
('405', 'P006', 5),
('101', 'P007', 5),
('102', 'P007', 5),
('103', 'P007', 5),
('104', 'P007', 5),
('105', 'P007', 5),
('201', 'P007', 5),
('202', 'P007', 5),
('203', 'P007', 5),
('204', 'P007', 5),
('205', 'P007', 5),
('301', 'P007', 5),
('302', 'P007', 5),
('303', 'P007', 5),
('304', 'P007', 5),
('305', 'P007', 5),
('401', 'P007', 5),
('402', 'P007', 5),
('403', 'P007', 5),
('404', 'P007', 5),
('405', 'P007', 5),
('101', 'P008', 5),
('102', 'P008', 5),
('103', 'P008', 5),
('104', 'P008', 5),
('105', 'P008', 5),
('201', 'P008', 5),
('202', 'P008', 5),
('203', 'P008', 5),
('204', 'P008', 5),
('205', 'P008', 5),
('301', 'P008', 5),
('302', 'P008', 5),
('303', 'P008', 5),
('304', 'P008', 5),
('305', 'P008', 5),
('401', 'P008', 5),
('402', 'P008', 5),
('403', 'P008', 5),
('404', 'P008', 5),
('405', 'P008', 5),
('101', 'P009', 5),
('102', 'P009', 5),
('103', 'P009', 5),
('104', 'P009', 5),
('105', 'P009', 5),
('201', 'P009', 5),
('202', 'P009', 5),
('203', 'P009', 5),
('204', 'P009', 5),
('205', 'P009', 5),
('301', 'P009', 5),
('302', 'P009', 5),
('303', 'P009', 5),
('304', 'P009', 5),
('305', 'P009', 5),
('401', 'P009', 5),
('402', 'P009', 5),
('403', 'P009', 5),
('404', 'P009', 5),
('405', 'P009', 5),
('101', 'P010', 5),
('102', 'P010', 5),
('103', 'P010', 5),
('104', 'P010', 5),
('105', 'P010', 5),
('201', 'P010', 5),
('202', 'P010', 5),
('203', 'P010', 5),
('204', 'P010', 5),
('205', 'P010', 5),
('301', 'P010', 5),
('302', 'P010', 5),
('303', 'P010', 5),
('304', 'P010', 5),
('305', 'P010', 5),
('401', 'P010', 5),
('402', 'P010', 5),
('403', 'P010', 5),
('404', 'P010', 5),
('405', 'P010', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `met_pago` int(11) NOT NULL,
  `met_nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`met_pago`, `met_nombre`) VALUES
(1, 'Tarjeta de crédito'),
(2, 'Transferencia bancaria'),
(3, 'Pago en efectivo'),
(4, 'Cheque'),
(5, 'Nequi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mobiliario`
--

CREATE TABLE `mobiliario` (
  `hab_numero` varchar(3) DEFAULT NULL,
  `cama_id` varchar(2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mobiliario`
--

INSERT INTO `mobiliario` (`hab_numero`, `cama_id`, `stock`) VALUES
('101', '01', 1),
('101', '02', 1),
('102', '01', 1),
('102', '02', 1),
('103', '03', 2),
('103', '04', 1),
('104', '03', 2),
('104', '04', 1),
('105', '05', 2),
('105', '06', 1),
('105', '07', 1),
('201', '01', 1),
('201', '02', 1),
('202', '01', 1),
('202', '02', 1),
('203', '03', 2),
('203', '04', 1),
('204', '03', 2),
('204', '04', 1),
('205', '05', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ninos`
--

CREATE TABLE `ninos` (
  `res_id` varchar(20) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ninos`
--

INSERT INTO `ninos` (`res_id`, `edad`) VALUES
('R001', 5),
('R001', 7),
('R002', 3),
('R003', 9),
('R004', 10),
('R005', 4),
('R005', 6),
('R005', 8),
('R006', 5),
('R007', 6),
('R008', 3),
('R009', 2),
('R010', 7),
('R010', 9),
('R011', 6),
('R012', 4),
('R013', 8),
('R014', 3),
('R015', 5),
('R016', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_persona`
--

CREATE TABLE `pago_persona` (
  `nro_doc` varchar(15) DEFAULT NULL,
  `med_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago_persona`
--

INSERT INTO `pago_persona` (`nro_doc`, `med_id`) VALUES
('11111111', 1),
('20202020', 2),
('33333333', 3),
('44444444', 1),
('55555555', 2),
('66666666', 5),
('77777777', 1),
('88888888', 2),
('99999999', 3),
('10101010', 4),
('12121212', 3),
('24242424', 1),
('14141414', 2),
('26262626', 3),
('16161616', 4),
('28282828', 2),
('18181818', 5),
('30303030', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `prod_id` varchar(4) NOT NULL,
  `prod_nombre` varchar(255) DEFAULT NULL,
  `prod_tarifa` decimal(10,2) DEFAULT NULL,
  `categ_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`prod_id`, `prod_nombre`, `prod_tarifa`, `categ_id`) VALUES
('P001', 'Agua mineral', '2.50', 5),
('P002', 'Refresco cola', '2.00', 5),
('P003', 'Snack papas fritas', '1.50', 5),
('P004', 'Chocolate', '1.75', 5),
('P005', 'Cerveza nacional', '3.50', 5),
('P006', 'Cerveza importada', '4.50', 5),
('P007', 'Vino tinto', '10.00', 5),
('P008', 'Vino blanco', '9.50', 5),
('P009', 'Café espresso', '2.00', 5),
('P010', 'Té verde', '1.75', 5),
('P011', 'Agua caliente', '0.50', 4),
('P012', 'Toalla de baño', '3.00', 4),
('P013', 'Champú', '2.50', 4),
('P014', 'Gel de ducha', '2.50', 4),
('P015', 'Caja de pañuelos', '1.00', 4),
('P016', 'Pasta de dientes', '2.00', 4),
('P017', 'Loción corporal', '3.50', 4),
('P018', 'Bata de baño', '8.00', 4),
('P019', 'Zapatillas', '5.50', 4),
('P020', 'Kit de costura', '2.50', 4),
('P021', 'Televisor LED 32\"', '250.00', 1),
('P022', 'Reproductor de DVD', '50.00', 1),
('P023', 'Teléfono inalámbrico', '30.00', 1),
('P024', 'Tablet', '200.00', 1),
('P025', 'Altavoz Bluetooth', '80.00', 1),
('P026', 'Auriculares inalámbricos', '100.00', 1),
('P027', 'Cámara digital', '150.00', 1),
('P028', 'Silla de escritorio', '50.00', 2),
('P029', 'Mesa de noche', '30.00', 2),
('P030', 'Armario ropero', '100.00', 2),
('P031', 'Cómoda', '80.00', 2),
('P032', 'Escritorio', '70.00', 2),
('P033', 'Sofá cama', '120.00', 2),
('P034', 'Mesa de centro', '40.00', 2),
('P035', 'Sillón reclinable', '90.00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `res_id` varchar(20) NOT NULL,
  `res_fecha` date DEFAULT NULL,
  `res_cant_hab` int(11) DEFAULT NULL,
  `res_adultos` int(11) DEFAULT NULL,
  `res_ninos` int(11) DEFAULT NULL,
  `res_fe_inicio` date DEFAULT NULL,
  `res_fe_final` date DEFAULT NULL,
  `res_dias` int(11) DEFAULT NULL,
  `res_valor` float(10,2) DEFAULT NULL,
  `nro_doc` varchar(15) DEFAULT NULL,
  `est_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`res_id`, `res_fecha`, `res_cant_hab`, `res_adultos`, `res_ninos`, `res_fe_inicio`, `res_fe_final`, `res_dias`, `res_valor`, `nro_doc`, `est_id`) VALUES
('R001', '2023-05-25', 1, 2, 0, '2023-05-26', '2023-05-28', 2, 200.00, '11111111', 1),
('R002', '2023-06-01', 2, 2, 1, '2023-06-02', '2023-06-05', 3, 500.00, '20202020', 2),
('R003', '2023-06-10', 1, 1, 0, '2023-06-15', '2023-06-20', 5, 750.00, '33333333', 1),
('R004', '2023-06-20', 1, 1, 0, '2023-07-01', '2023-07-05', 4, 400.00, '44444444', 2),
('R005', '2023-07-05', 3, 2, 1, '2023-07-10', '2023-07-15', 5, 900.00, '55555555', 1),
('R006', '2023-07-15', 2, 2, 0, '2023-07-20', '2023-07-22', 2, 300.00, '66666666', 2),
('R007', '2023-07-25', 1, 1, 0, '2023-07-27', '2023-07-29', 2, 200.00, '77777777', 1),
('R008', '2023-08-05', 1, 2, 1, '2023-08-07', '2023-08-10', 3, 450.00, '88888888', 2),
('R009', '2023-08-15', 2, 2, 0, '2023-08-20', '2023-08-25', 5, 600.00, '99999999', 1),
('R010', '2023-08-30', 1, 1, 0, '2023-09-01', '2023-09-03', 2, 250.00, '10101010', 2),
('R011', '2023-09-10', 1, 2, 1, '2023-09-12', '2023-09-15', 3, 550.00, '12121212', 1),
('R012', '2023-09-20', 2, 2, 0, '2023-09-25', '2023-09-28', 3, 700.00, '22222220', 2),
('R013', '2023-10-05', 1, 1, 0, '2023-10-10', '2023-10-15', 5, 350.00, '14141414', 1),
('R014', '2023-10-20', 3, 2, 1, '2023-10-25', '2023-10-31', 6, 1000.00, '26262626', 2),
('R015', '2023-11-05', 1, 2, 0, '2023-11-08', '2023-11-10', 2, 300.00, '16161616', 1),
('R016', '2023-11-15', 1, 1, 0, '2023-11-18', '2023-11-20', 2, 250.00, '24242424', 2),
('R017', '2023-11-25', 2, 2, 1, '2023-11-28', '2023-12-01', 3, 600.00, '18181818', 1),
('R018', '2023-12-05', 1, 1, 0, '2023-12-08', '2023-12-10', 2, 300.00, '28282828', 2),
('R019', '2023-12-15', 1, 2, 1, '2023-12-18', '2023-12-22', 4, 500.00, '20202020', 1),
('R020', '2023-12-30', 2, 2, 0, '2024-01-01', '2024-01-05', 4, 800.00, '30303030', 2);

--
-- Disparadores `reserva`
--
DELIMITER $$
CREATE TRIGGER `estado_habitacion` AFTER UPDATE ON `reserva` FOR EACH ROW BEGIN
DECLARE estado int;
	IF NEW.est_id=3 OR NEW.est_id=6 THEN
    	SET estado = 7;
    ELSEIF NEW.est_id=1 THEN
    	SET estado = 9;
    ELSEIF NEW.est_id=4 OR NEW.est_id=2 THEN
    	SET estado = 8;
    ELSE SET estado =6;
	END IF;
    UPDATE habitacion SET est_id=estado WHERE hab_numero=
    (SELECT hab_numero FROM reserva_habitacion
    WHERE res_id=NEW.res_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_habitacion`
--

CREATE TABLE `reserva_habitacion` (
  `res_id` varchar(20) DEFAULT NULL,
  `hab_numero` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva_habitacion`
--

INSERT INTO `reserva_habitacion` (`res_id`, `hab_numero`) VALUES
('R001', '101'),
('R001', '102'),
('R002', '103'),
('R003', '104'),
('R004', '105'),
('R005', '201'),
('R005', '202'),
('R006', '203'),
('R007', '204'),
('R008', '205'),
('R009', '301'),
('R009', '302'),
('R010', '303'),
('R011', '304'),
('R012', '305'),
('R013', '401'),
('R014', '402'),
('R014', '403'),
('R015', '404'),
('R016', '405');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_adicional`
--

CREATE TABLE `servicio_adicional` (
  `serv_id` varchar(4) NOT NULL,
  `serv_valor` float(8,2) DEFAULT NULL,
  `serv_tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio_adicional`
--

INSERT INTO `servicio_adicional` (`serv_id`, `serv_valor`, `serv_tipo`) VALUES
('S001', 10.99, 'Lavandería'),
('S002', 20.50, 'Servicio a la habitación'),
('S003', 15.00, 'Transporte'),
('S004', 8.99, 'Desayuno buffet'),
('S005', 25.00, 'Masajes'),
('S006', 12.50, 'Acceso al gimnasio'),
('S007', 18.75, 'Wi-Fi premium'),
('S008', 9.99, 'Aparcamiento'),
('S009', 35.00, 'Servicio de conserjería'),
('S010', 5.50, 'Servicio de despertador'),
('S011', 14.99, 'Bar'),
('S012', 30.00, 'Alquiler de bicicletas'),
('S013', 22.75, 'Piscina climatizada'),
('S014', 7.99, 'Servicio de planchado'),
('S015', 19.99, 'Guardería'),
('S016', 16.50, 'Centro de negocios'),
('S017', 11.25, 'Servicio de traducción'),
('S018', 28.00, 'Servicio de cambio de divisas'),
('S019', 6.75, 'Alquiler de coches'),
('S020', 21.50, 'Servicio de tours');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `nro_doc` varchar(15) DEFAULT NULL,
  `usu_telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`nro_doc`, `usu_telefono`) VALUES
('11111111', '123456789'),
('11111111', '987654321'),
('22222222', '555555555'),
('33333333', '999999999'),
('44444444', '777777777'),
('55555555', '111111111'),
('66666666', '222222222'),
('77777777', '333333333'),
('88888888', '444444444'),
('99999999', '555555555'),
('10101010', '666666666'),
('12121212', '777777777'),
('13131313', '888888888'),
('14141414', '999999999'),
('15151515', '000000000'),
('16161616', '111111111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_habitacion`
--

CREATE TABLE `tipo_habitacion` (
  `tipo_hab_id` int(2) NOT NULL,
  `tipo_hab` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_habitacion`
--

INSERT INTO `tipo_habitacion` (`tipo_hab_id`, `tipo_hab`) VALUES
(1, 'Sencilla'),
(2, 'Doble'),
(3, 'Triple'),
(4, 'Suite'),
(5, 'Familiar'),
(6, 'Presidencial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `nro_doc` varchar(15) NOT NULL,
  `contraseña` varchar(50) DEFAULT NULL,
  `usu_estado` varchar(20) DEFAULT NULL,
  `restablecimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`nro_doc`, `contraseña`, `usu_estado`, `restablecimiento`) VALUES
('10101010', 'contraseña10', 'activo', '2022-06-30'),
('11111111', 'contraseña1', 'activo', '2023-05-31'),
('12121210', 'contraseña1', 'inactivo', '2023-05-31'),
('12121212', 'contraseña11', 'activo', '2022-07-15'),
('13131313', 'contraseña2', 'activo', '2023-06-15'),
('14141410', 'contraseña3', 'inactivo', '2023-07-02'),
('14141414', 'contraseña12', 'activo', '2022-07-30'),
('15151515', 'contraseña4', 'activo', '2023-08-09'),
('16161610', 'contraseña5', 'activo', '2023-09-23'),
('16161616', 'contraseña13', 'activo', '2022-08-15'),
('18181818', 'contraseña14', 'activo', '2022-09-01'),
('20202020', 'contraseña15', 'activo', '2022-09-30'),
('22222220', 'contraseña16', 'activo', '2022-10-15'),
('22222222', 'contraseña2', 'activo', '2023-06-15'),
('24242424', 'contraseña17', 'activo', '2022-10-31'),
('26262626', 'contraseña18', 'activo', '2022-11-15'),
('28282828', 'contraseña19', 'activo', '2022-11-30'),
('30303030', 'contraseña20', 'activo', '2022-12-15'),
('33333333', 'contraseña3', 'activo', '2023-07-02'),
('44444444', 'contraseña4', 'activo', '2023-08-09'),
('55555555', 'contraseña5', 'activo', '2023-09-23'),
('66666666', 'contraseña6', 'activo', '2023-10-10'),
('77777777', 'contraseña7', 'activo', '2023-11-25'),
('88888888', 'contraseña8', 'activo', '2023-12-06'),
('99999999', 'contraseña9', 'activo', '2023-12-31');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `camas`
--
ALTER TABLE `camas`
  ADD PRIMARY KEY (`cama_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categ_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`nro_doc`);

--
-- Indices de la tabla `correo_electronico`
--
ALTER TABLE `correo_electronico`
  ADD KEY `nro_doc` (`nro_doc`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `fact_id` (`fact_id`),
  ADD KEY `res_id` (`res_id`),
  ADD KEY `serv_id` (`serv_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`nro_doc`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`est_id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`fact_id`),
  ADD KEY `nro_doc` (`nro_doc`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`hab_numero`),
  ADD KEY `hab_estado` (`hab_estado`),
  ADD KEY `tipo_hab_id` (`tipo_hab_id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD KEY `hab_numero` (`hab_numero`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`met_pago`);

--
-- Indices de la tabla `mobiliario`
--
ALTER TABLE `mobiliario`
  ADD KEY `hab_numero` (`hab_numero`),
  ADD KEY `cama_id` (`cama_id`);

--
-- Indices de la tabla `ninos`
--
ALTER TABLE `ninos`
  ADD KEY `res_id` (`res_id`);

--
-- Indices de la tabla `pago_persona`
--
ALTER TABLE `pago_persona`
  ADD KEY `nro_doc` (`nro_doc`),
  ADD KEY `med_id` (`med_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `categ_id` (`categ_id`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `nro_doc` (`nro_doc`),
  ADD KEY `est_id` (`est_id`);

--
-- Indices de la tabla `reserva_habitacion`
--
ALTER TABLE `reserva_habitacion`
  ADD KEY `res_id` (`res_id`),
  ADD KEY `hab_numero` (`hab_numero`);

--
-- Indices de la tabla `servicio_adicional`
--
ALTER TABLE `servicio_adicional`
  ADD PRIMARY KEY (`serv_id`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD KEY `nro_doc` (`nro_doc`);

--
-- Indices de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  ADD PRIMARY KEY (`tipo_hab_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`nro_doc`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`nro_doc`) REFERENCES `usuario` (`nro_doc`);

--
-- Filtros para la tabla `correo_electronico`
--
ALTER TABLE `correo_electronico`
  ADD CONSTRAINT `correo_electronico_ibfk_1` FOREIGN KEY (`nro_doc`) REFERENCES `usuario` (`nro_doc`);

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`fact_id`) REFERENCES `factura` (`fact_id`),
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `reserva` (`res_id`),
  ADD CONSTRAINT `detalle_factura_ibfk_3` FOREIGN KEY (`serv_id`) REFERENCES `servicio_adicional` (`serv_id`),
  ADD CONSTRAINT `detalle_factura_ibfk_4` FOREIGN KEY (`prod_id`) REFERENCES `producto` (`prod_id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`nro_doc`) REFERENCES `usuario` (`nro_doc`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`nro_doc`) REFERENCES `cliente` (`nro_doc`);

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (`hab_estado`) REFERENCES `estados` (`est_id`),
  ADD CONSTRAINT `habitacion_ibfk_2` FOREIGN KEY (`tipo_hab_id`) REFERENCES `tipo_habitacion` (`tipo_hab_id`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`hab_numero`) REFERENCES `habitacion` (`hab_numero`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `producto` (`prod_id`);

--
-- Filtros para la tabla `mobiliario`
--
ALTER TABLE `mobiliario`
  ADD CONSTRAINT `mobiliario_ibfk_1` FOREIGN KEY (`hab_numero`) REFERENCES `habitacion` (`hab_numero`),
  ADD CONSTRAINT `mobiliario_ibfk_2` FOREIGN KEY (`cama_id`) REFERENCES `camas` (`cama_id`);

--
-- Filtros para la tabla `ninos`
--
ALTER TABLE `ninos`
  ADD CONSTRAINT `ninos_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `reserva` (`res_id`);

--
-- Filtros para la tabla `pago_persona`
--
ALTER TABLE `pago_persona`
  ADD CONSTRAINT `pago_persona_ibfk_1` FOREIGN KEY (`nro_doc`) REFERENCES `cliente` (`nro_doc`),
  ADD CONSTRAINT `pago_persona_ibfk_2` FOREIGN KEY (`med_id`) REFERENCES `metodo_pago` (`met_pago`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categ_id`) REFERENCES `categoria` (`categ_id`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`nro_doc`) REFERENCES `cliente` (`nro_doc`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`est_id`) REFERENCES `estados` (`est_id`);

--
-- Filtros para la tabla `reserva_habitacion`
--
ALTER TABLE `reserva_habitacion`
  ADD CONSTRAINT `reserva_habitacion_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `reserva` (`res_id`),
  ADD CONSTRAINT `reserva_habitacion_ibfk_2` FOREIGN KEY (`hab_numero`) REFERENCES `habitacion` (`hab_numero`);

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`nro_doc`) REFERENCES `usuario` (`nro_doc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
