-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2023 a las 12:21:38
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
-- Base de datos: `facturacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombreCategoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombreCategoria`) VALUES
(1, 'Gran Electrodomésticos'),
(2, 'Pequeño Electrodoméstico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nif_cif` char(9) NOT NULL,
  `telefono` int(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `cp` int(5) NOT NULL,
  `poblacion` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `nif_cif`, `telefono`, `email`, `direccion`, `cp`, `poblacion`, `provincia`) VALUES
(1, 'IRINA MEDINA', '06255555M', 926501178, 'IRIME@HOTMAIL.COM', 'CAMPO 81', 13700, 'TOMELLOSO', 'CIUDAD REAL'),
(2, 'MARIA PEREZ', '06587458F', 926502555, 'MARIA@GMAIL.COM', 'NUEVA 26', 13700, 'TOMELLOSO', 'CIUDAD REAL'),
(3, 'MANUEL LUGO', '06585200P', 926548740, 'JMARQUEZ@GMAIL.COM', 'CALLE JOSEFA 25', 28001, 'MADRID', 'MADRID'),
(4, 'GABRIELA HURTADO', '06987512D', 917654987, 'GABY@YAHOO.ES', 'MONCLOA 7', 13600, 'ALCAZAR DE SAN JUAN', 'CIUDAD REAL'),
(5, 'KARINA FINOL', '06852456M', 658987123, NULL, 'CALLE FRANCIA 85', 28500, 'GETAFE', 'MADRID');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `id_fpago` int(10) UNSIGNED NOT NULL,
  `dto` float(4,2) DEFAULT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fpago`
--

CREATE TABLE `fpago` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom_formaP` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `fpago`
--

INSERT INTO `fpago` (`id`, `nom_formaP`) VALUES
(1, 'Contado'),
(2, 'TARJETA DE CREDITO'),
(3, 'Domiciliación SEPA'),
(4, 'Transferencia Bancaria'),
(5, 'Bizum');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iva`
--

CREATE TABLE `iva` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombreIva` varchar(20) NOT NULL,
  `porcentajeIva` float(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `iva`
--

INSERT INTO `iva` (`id`, `nombreIva`, `porcentajeIva`) VALUES
(1, 'Excento', 0.00),
(2, 'Estandar', 21.00),
(3, 'Supereducido', 4.00),
(4, 'Reducido', 10.00),
(5, 'Supereducido', 5.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineafactura`
--

CREATE TABLE `lineafactura` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_factura` int(10) UNSIGNED NOT NULL,
  `id_producto` int(10) UNSIGNED NOT NULL,
  `cantidad` int(6) NOT NULL,
  `precio` float(8,2) NOT NULL,
  `descuento` float(4,2) NOT NULL,
  `id_iva` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(10) NOT NULL,
  `nombreMarca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombreMarca`) VALUES
(1, 'LG'),
(2, 'Bosh'),
(3, 'Cecotec'),
(4, 'Fagor'),
(5, 'AEG'),
(6, 'Taurus'),
(7, 'Balay'),
(8, 'Siemens'),
(9, 'Braun'),
(10, 'Panasonic');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(10) UNSIGNED NOT NULL,
  `nombre_pro` varchar(100) NOT NULL,
  `id_marca` int(10) NOT NULL,
  `detalle` varchar(255) DEFAULT NULL,
  `peso` float(6,2) DEFAULT NULL,
  `dimensiones` varchar(50) DEFAULT NULL,
  `id_categoria` int(10) UNSIGNED NOT NULL,
  `precio` float(8,2) NOT NULL,
  `coste` float(8,2) NOT NULL,
  `stock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productoxproveedor`
--

CREATE TABLE `productoxproveedor` (
  `id_producto` int(10) UNSIGNED NOT NULL,
  `id_proveedor` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(10) UNSIGNED NOT NULL,
  `nombre_proveedor` varchar(100) NOT NULL,
  `cif` char(9) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `cp` int(5) NOT NULL,
  `telefono` int(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `persona_ctto` varchar(100) NOT NULL,
  `id_fpago` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nif_cif` (`nif_cif`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_cliente_2` (`id_cliente`,`id_fpago`),
  ADD KEY `id_fpago` (`id_fpago`);

--
-- Indices de la tabla `fpago`
--
ALTER TABLE `fpago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `iva`
--
ALTER TABLE `iva`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lineafactura`
--
ALTER TABLE `lineafactura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_factura` (`id_factura`,`id_producto`,`id_iva`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_iva` (`id_iva`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `productoxproveedor`
--
ALTER TABLE `productoxproveedor`
  ADD KEY `id_producto` (`id_producto`,`id_proveedor`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `id_fpago` (`id_fpago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fpago`
--
ALTER TABLE `fpago`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `iva`
--
ALTER TABLE `iva`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `lineafactura`
--
ALTER TABLE `lineafactura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`id_fpago`) REFERENCES `fpago` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `lineafactura`
--
ALTER TABLE `lineafactura`
  ADD CONSTRAINT `lineafactura_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lineafactura_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lineafactura_ibfk_3` FOREIGN KEY (`id_iva`) REFERENCES `iva` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productoxproveedor`
--
ALTER TABLE `productoxproveedor`
  ADD CONSTRAINT `productoxproveedor_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productoxproveedor_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`id_fpago`) REFERENCES `fpago` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
