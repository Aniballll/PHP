-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2023 a las 15:20:53
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido1` varchar(50) DEFAULT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `edad` int(2) DEFAULT NULL,
  `dni` varchar(9) DEFAULT NULL,
  `telefono` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellido1`, `apellido2`, `email`, `edad`, `dni`, `telefono`) VALUES
(1, 'IRINA', 'MEDINA', 'SIERRA', 'irime@hotmail.com', 50, '06338214N', 698732145);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pass` varchar(250) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `pass`, `nombre`) VALUES
(1, 'blopez@hotmail.com', '$2y$10$dlblqgbKcIfCJlKYD5O5X.RewcDpscb1CVj9GR4SstviWzYJ3fBmW', 'Beatriz Lopez'),
(2, 'ana@ceatformacion.com', '$2y$10$WVZ4Xufwm2AUtpH7FZrdEe9IkwVwf4K1A1uprPldCdXi5Ldifw5JO', 'Ana Romero'),
(3, 'irina@ceatformacion.com', '$2y$10$Sl8HxEWJV.m8XFvMqesMku5CzajuJFoQVsfM2K47k5kch5/S9Q0E.', 'Irina Medina Sierra'),
(4, 'anibalggm@gmail.com', '$2y$10$lYMT7SZhY1E.8Xn8rWEkKulv0D/buyEbP6JFR1M1.EGiZKFqxy2nm', 'Anibal García'),
(5, 'anibalggm@gmail.com', '$2y$10$lYMT7SZhY1E.8Xn8rWEkKulv0D/buyEbP6JFR1M1.EGiZKFqxy2nm', 'Anibal García'),
(6, 'anibalggm@gmail.com', '$2y$10$lYMT7SZhY1E.8Xn8rWEkKulv0D/buyEbP6JFR1M1.EGiZKFqxy2nm', 'Anibal'),
(7, 'luciaflb@hotmail.com', '$2y$10$NZv3HiIx/R7ksg7ET7TYQuCwKrLYsqDCvjXYOPwQOFRfT41hYoO0G', 'Lucia Fariñas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
