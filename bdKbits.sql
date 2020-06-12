-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2020 a las 05:19:02
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `packs`
--

CREATE TABLE `packs` (
  `idpack` int(11) NOT NULL,
  `idtrack` int(11) NOT NULL,
  `idusuarios` int(11) NOT NULL,
  `pack` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `link` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tracks`
--

CREATE TABLE `tracks` (
  `idtrack` int(11) NOT NULL,
  `idusuarios` int(11) NOT NULL,
  `track` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `imagen` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL,
  `NombreC` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `Confirmar` text NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `NombreC`, `Correo`, `company`, `password`, `Confirmar`, `Estado`) VALUES
(15, 'victor', 'espartacopekka@gmail.com', 'kbits', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '491173598037c270f1fe2d1ccbd6b58c7ed459be', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `packs`
--
ALTER TABLE `packs`
  ADD PRIMARY KEY (`idpack`),
  ADD KEY `idtrack` (`idtrack`);

--
-- Indices de la tabla `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`idtrack`),
  ADD KEY `idusuarios` (`idusuarios`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuarios`),
  ADD KEY `company` (`company`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `packs`
--
ALTER TABLE `packs`
  MODIFY `idpack` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `tracks`
--
ALTER TABLE `tracks`
  MODIFY `idtrack` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `packs`
--
ALTER TABLE `packs`
  ADD CONSTRAINT `packs_ibfk_1` FOREIGN KEY (`idtrack`) REFERENCES `tracks` (`idtrack`);

--
-- Filtros para la tabla `tracks`
--
ALTER TABLE `tracks`
  ADD CONSTRAINT `tracks_ibfk_1` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`company`) REFERENCES `rcompany` (`company`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
