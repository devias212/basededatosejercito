-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2023 a las 04:38:56
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compania`
--

CREATE TABLE `compania` (
  `NumeroCompania` int(11) NOT NULL,
  `ActividadPrincipal` varchar(255) NOT NULL,
  `CodigoCuerpo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compania`
--

INSERT INTO `compania` (`NumeroCompania`, `ActividadPrincipal`, `CodigoCuerpo`) VALUES
(101, 'Operaciones tácticas', 1),
(201, 'Artillería pesada', 2),
(301, 'Operaciones navales', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuartel`
--

CREATE TABLE `cuartel` (
  `CodigoCuartel` int(11) NOT NULL,
  `NombreCuartel` varchar(255) NOT NULL,
  `Ubicacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuartel`
--

INSERT INTO `cuartel` (`CodigoCuartel`, `NombreCuartel`, `Ubicacion`) VALUES
(501, 'Cuartel General', 'Ciudad A'),
(502, 'Base Naval', 'Puerto B'),
(503, 'Campamento de Artillería', 'Ciudad C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpo`
--

CREATE TABLE `cuerpo` (
  `CodigoCuerpo` int(11) NOT NULL,
  `DenominacionCuerpo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuerpo`
--

INSERT INTO `cuerpo` (`CodigoCuerpo`, `DenominacionCuerpo`) VALUES
(1, 'Infantería'),
(2, 'Artillería'),
(3, 'Armada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realizaservicio`
--

CREATE TABLE `realizaservicio` (
  `CodigoSoldado` int(11) NOT NULL,
  `CodigoServicio` int(11) NOT NULL,
  `FechaRealizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `realizaservicio`
--

INSERT INTO `realizaservicio` (`CodigoSoldado`, `CodigoServicio`, `FechaRealizacion`) VALUES
(10001, 1001, '2023-01-15'),
(10002, 1002, '2023-02-20'),
(10003, 1003, '2023-03-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `CodigoServicio` int(11) NOT NULL,
  `DescripcionServicio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`CodigoServicio`, `DescripcionServicio`) VALUES
(1001, 'Guardia de seguridad'),
(1002, 'Instructor de entrenamiento físico'),
(1003, 'Cuartelero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado`
--

CREATE TABLE `soldado` (
  `CodigoSoldado` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellidos` varchar(255) NOT NULL,
  `Graduacion` varchar(255) NOT NULL,
  `CodigoCuerpo` int(11) DEFAULT NULL,
  `NumeroCompania` int(11) DEFAULT NULL,
  `CodigoCuartel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `soldado`
--

INSERT INTO `soldado` (`CodigoSoldado`, `Nombre`, `Apellidos`, `Graduacion`, `CodigoCuerpo`, `NumeroCompania`, `CodigoCuartel`) VALUES
(10001, 'Juan', 'Pérez', 'Cabo', 1, 101, 501),
(10002, 'María', 'González', 'Sargento', 2, 201, 502),
(10003, 'Carlos', 'Rodríguez', 'Soldado', 3, 301, 503);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compania`
--
ALTER TABLE `compania`
  ADD PRIMARY KEY (`NumeroCompania`),
  ADD KEY `CodigoCuerpo` (`CodigoCuerpo`);

--
-- Indices de la tabla `cuartel`
--
ALTER TABLE `cuartel`
  ADD PRIMARY KEY (`CodigoCuartel`);

--
-- Indices de la tabla `cuerpo`
--
ALTER TABLE `cuerpo`
  ADD PRIMARY KEY (`CodigoCuerpo`);

--
-- Indices de la tabla `realizaservicio`
--
ALTER TABLE `realizaservicio`
  ADD PRIMARY KEY (`CodigoSoldado`,`CodigoServicio`),
  ADD KEY `CodigoServicio` (`CodigoServicio`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`CodigoServicio`);

--
-- Indices de la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD PRIMARY KEY (`CodigoSoldado`),
  ADD KEY `CodigoCuerpo` (`CodigoCuerpo`),
  ADD KEY `NumeroCompania` (`NumeroCompania`),
  ADD KEY `CodigoCuartel` (`CodigoCuartel`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compania`
--
ALTER TABLE `compania`
  ADD CONSTRAINT `compania_ibfk_1` FOREIGN KEY (`CodigoCuerpo`) REFERENCES `cuerpo` (`CodigoCuerpo`);

--
-- Filtros para la tabla `realizaservicio`
--
ALTER TABLE `realizaservicio`
  ADD CONSTRAINT `realizaservicio_ibfk_1` FOREIGN KEY (`CodigoSoldado`) REFERENCES `soldado` (`CodigoSoldado`),
  ADD CONSTRAINT `realizaservicio_ibfk_2` FOREIGN KEY (`CodigoServicio`) REFERENCES `servicio` (`CodigoServicio`);

--
-- Filtros para la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD CONSTRAINT `soldado_ibfk_1` FOREIGN KEY (`CodigoCuerpo`) REFERENCES `cuerpo` (`CodigoCuerpo`),
  ADD CONSTRAINT `soldado_ibfk_2` FOREIGN KEY (`NumeroCompania`) REFERENCES `compania` (`NumeroCompania`),
  ADD CONSTRAINT `soldado_ibfk_3` FOREIGN KEY (`CodigoCuartel`) REFERENCES `cuartel` (`CodigoCuartel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
