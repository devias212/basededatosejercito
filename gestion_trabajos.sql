-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2023 a las 04:48:24
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
-- Base de datos: `gestion_trabajos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `NumeroMatricula` int(11) NOT NULL,
  `CI` varchar(20) DEFAULT NULL,
  `Nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`NumeroMatricula`, `CI`, `Nombre`) VALUES
(1, 'CI123', 'Juan Perez'),
(2, 'CI456', 'Maria Rodriguez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaboracionprofesoralumno`
--

CREATE TABLE `colaboracionprofesoralumno` (
  `CIProfesor` varchar(20) NOT NULL,
  `NumeroMatriculaAlumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `colaboracionprofesoralumno`
--

INSERT INTO `colaboracionprofesoralumno` (`CIProfesor`, `NumeroMatriculaAlumno`) VALUES
('CI012', 2),
('CI789', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `defensatfc`
--

CREATE TABLE `defensatfc` (
  `NumeroTribunal` int(11) NOT NULL,
  `NumeroOrdenTFC` int(11) NOT NULL,
  `NumeroMatriculaAlumno` int(11) NOT NULL,
  `FechaDefensa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `defensatfc`
--

INSERT INTO `defensatfc` (`NumeroTribunal`, `NumeroOrdenTFC`, `NumeroMatriculaAlumno`, `FechaDefensa`) VALUES
(301, 201, 1, '2022-03-20'),
(302, 202, 2, '2022-04-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupoinvestigacion`
--

CREATE TABLE `grupoinvestigacion` (
  `NumeroGrupo` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `NumeroComponentes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupoinvestigacion`
--

INSERT INTO `grupoinvestigacion` (`NumeroGrupo`, `Nombre`, `NumeroComponentes`) VALUES
(101, 'Grupo 1', 5),
(102, 'Grupo 2', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perteneceagrupo`
--

CREATE TABLE `perteneceagrupo` (
  `NumeroMatricula` int(11) NOT NULL,
  `NumeroGrupo` int(11) NOT NULL,
  `FechaIncorporacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perteneceagrupo`
--

INSERT INTO `perteneceagrupo` (`NumeroMatricula`, `NumeroGrupo`, `FechaIncorporacion`) VALUES
(1, 101, '2021-06-01'),
(2, 102, '2021-07-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `CI` varchar(20) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Domicilio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`CI`, `Nombre`, `Domicilio`) VALUES
('CI012', 'Ana Gonzalez', 'Calle Principal'),
('CI789', 'Pedro Martinez', 'Direccion 123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tfc`
--

CREATE TABLE `tfc` (
  `NumeroOrden` int(11) NOT NULL,
  `Tema` varchar(255) NOT NULL,
  `FechaComienzo` date DEFAULT NULL,
  `NumeroMatricula` int(11) DEFAULT NULL,
  `NumeroGrupo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tfc`
--

INSERT INTO `tfc` (`NumeroOrden`, `Tema`, `FechaComienzo`, `NumeroMatricula`, `NumeroGrupo`) VALUES
(201, 'Tema 1', '2022-01-10', 1, 101),
(202, 'Tema 2', '2022-02-15', 2, 102);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tribunal`
--

CREATE TABLE `tribunal` (
  `NumeroTribunal` int(11) NOT NULL,
  `LugarExamen` varchar(255) NOT NULL,
  `NumeroComponentes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tribunal`
--

INSERT INTO `tribunal` (`NumeroTribunal`, `LugarExamen`, `NumeroComponentes`) VALUES
(301, 'Salon A', 3),
(302, 'Salon B', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tribunalprofesor`
--

CREATE TABLE `tribunalprofesor` (
  `NumeroTribunal` int(11) NOT NULL,
  `CIProfesor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tribunalprofesor`
--

INSERT INTO `tribunalprofesor` (`NumeroTribunal`, `CIProfesor`) VALUES
(301, 'CI012'),
(301, 'CI789'),
(302, 'CI012');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`NumeroMatricula`),
  ADD UNIQUE KEY `CI` (`CI`);

--
-- Indices de la tabla `colaboracionprofesoralumno`
--
ALTER TABLE `colaboracionprofesoralumno`
  ADD PRIMARY KEY (`CIProfesor`,`NumeroMatriculaAlumno`),
  ADD KEY `NumeroMatriculaAlumno` (`NumeroMatriculaAlumno`);

--
-- Indices de la tabla `defensatfc`
--
ALTER TABLE `defensatfc`
  ADD PRIMARY KEY (`NumeroTribunal`,`NumeroOrdenTFC`,`NumeroMatriculaAlumno`),
  ADD KEY `NumeroOrdenTFC` (`NumeroOrdenTFC`),
  ADD KEY `NumeroMatriculaAlumno` (`NumeroMatriculaAlumno`);

--
-- Indices de la tabla `grupoinvestigacion`
--
ALTER TABLE `grupoinvestigacion`
  ADD PRIMARY KEY (`NumeroGrupo`);

--
-- Indices de la tabla `perteneceagrupo`
--
ALTER TABLE `perteneceagrupo`
  ADD PRIMARY KEY (`NumeroMatricula`,`NumeroGrupo`),
  ADD KEY `NumeroGrupo` (`NumeroGrupo`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`CI`);

--
-- Indices de la tabla `tfc`
--
ALTER TABLE `tfc`
  ADD PRIMARY KEY (`NumeroOrden`),
  ADD UNIQUE KEY `NumeroMatricula` (`NumeroMatricula`),
  ADD KEY `NumeroGrupo` (`NumeroGrupo`);

--
-- Indices de la tabla `tribunal`
--
ALTER TABLE `tribunal`
  ADD PRIMARY KEY (`NumeroTribunal`);

--
-- Indices de la tabla `tribunalprofesor`
--
ALTER TABLE `tribunalprofesor`
  ADD PRIMARY KEY (`NumeroTribunal`,`CIProfesor`),
  ADD KEY `CIProfesor` (`CIProfesor`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `colaboracionprofesoralumno`
--
ALTER TABLE `colaboracionprofesoralumno`
  ADD CONSTRAINT `colaboracionprofesoralumno_ibfk_1` FOREIGN KEY (`CIProfesor`) REFERENCES `profesor` (`CI`),
  ADD CONSTRAINT `colaboracionprofesoralumno_ibfk_2` FOREIGN KEY (`NumeroMatriculaAlumno`) REFERENCES `alumno` (`NumeroMatricula`);

--
-- Filtros para la tabla `defensatfc`
--
ALTER TABLE `defensatfc`
  ADD CONSTRAINT `defensatfc_ibfk_1` FOREIGN KEY (`NumeroTribunal`) REFERENCES `tribunal` (`NumeroTribunal`),
  ADD CONSTRAINT `defensatfc_ibfk_2` FOREIGN KEY (`NumeroOrdenTFC`) REFERENCES `tfc` (`NumeroOrden`),
  ADD CONSTRAINT `defensatfc_ibfk_3` FOREIGN KEY (`NumeroMatriculaAlumno`) REFERENCES `alumno` (`NumeroMatricula`);

--
-- Filtros para la tabla `perteneceagrupo`
--
ALTER TABLE `perteneceagrupo`
  ADD CONSTRAINT `perteneceagrupo_ibfk_1` FOREIGN KEY (`NumeroMatricula`) REFERENCES `alumno` (`NumeroMatricula`),
  ADD CONSTRAINT `perteneceagrupo_ibfk_2` FOREIGN KEY (`NumeroGrupo`) REFERENCES `grupoinvestigacion` (`NumeroGrupo`);

--
-- Filtros para la tabla `tfc`
--
ALTER TABLE `tfc`
  ADD CONSTRAINT `tfc_ibfk_1` FOREIGN KEY (`NumeroMatricula`) REFERENCES `alumno` (`NumeroMatricula`),
  ADD CONSTRAINT `tfc_ibfk_2` FOREIGN KEY (`NumeroGrupo`) REFERENCES `grupoinvestigacion` (`NumeroGrupo`);

--
-- Filtros para la tabla `tribunalprofesor`
--
ALTER TABLE `tribunalprofesor`
  ADD CONSTRAINT `tribunalprofesor_ibfk_1` FOREIGN KEY (`NumeroTribunal`) REFERENCES `tribunal` (`NumeroTribunal`),
  ADD CONSTRAINT `tribunalprofesor_ibfk_2` FOREIGN KEY (`CIProfesor`) REFERENCES `profesor` (`CI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
