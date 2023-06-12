-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2023 a las 17:50:59
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario-basico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ims_brand`
--

CREATE TABLE `ims_brand` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `bname` varchar(250) NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ims_brand`
--

INSERT INTO `ims_brand` (`id`, `categoryid`, `bname`, `status`) VALUES
(1, 2, 'Brand 1', 'active'),
(2, 2, 'Brand 2', 'active'),
(3, 2, 'Brand 3', 'active'),
(4, 1, 'Brand 201', 'active'),
(5, 1, 'Brand 202', 'active'),
(6, 1, 'Brand 203', 'active'),
(7, 3, 'Brand 301', 'active'),
(8, 3, 'Brand 302', 'active'),
(9, 3, 'Brand 303', 'active'),
(11, 5, 'NIKE', 'active'),
(12, 5, 'ADIDAS', 'active'),
(13, 6, 'ELA', 'active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ims_category`
--

CREATE TABLE `ims_category` (
  `categoryid` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ims_category`
--

INSERT INTO `ims_category` (`categoryid`, `name`, `status`) VALUES
(5, 'Zapatos', 'active'),
(6, 'Blusas', 'active'),
(7, 'Pantalones', 'active'),
(8, 'Shorts', 'active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ims_customer`
--

CREATE TABLE `ims_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `balance` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ims_customer`
--

INSERT INTO `ims_customer` (`id`, `name`, `address`, `mobile`, `balance`) VALUES
(1, 'Diana Cliente', 'Calle 34 N 20 91', 2147483647, '2585000'),
(2, 'Pedro Cliente', 'Calle 90 N 23 19', 2147483647, '3545000'),
(3, 'Juan Cliente', 'Calle 98 15 47', 2147483647, '1200000'),
(10, 'dimi', 'mz 56 casa 9', 3013586958, '200000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ims_order`
--

CREATE TABLE `ims_order` (
  `order_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `total_shipped` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ims_order`
--

INSERT INTO `ims_order` (`order_id`, `product_id`, `total_shipped`, `customer_id`, `order_date`) VALUES
(1, '1', 5, 1, '2022-06-20 08:20:40'),
(2, '2', 3, 2, '2022-06-20 08:20:48'),
(4, '7', 20, 1, '2023-06-07 05:07:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ims_product`
--

CREATE TABLE `ims_product` (
  `pid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `brandid` int(11) NOT NULL,
  `pname` varchar(300) NOT NULL,
  `model` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(150) NOT NULL,
  `base_price` double(10,2) NOT NULL,
  `tax` decimal(4,2) NOT NULL,
  `minimum_order` double(10,2) NOT NULL,
  `supplier` int(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ims_product`
--

INSERT INTO `ims_product` (`pid`, `categoryid`, `brandid`, `pname`, `model`, `description`, `quantity`, `unit`, `base_price`, `tax`, `minimum_order`, `supplier`, `status`, `date`) VALUES
(1, 2, 1, 'Product 101', 'P-1001', 'usce auctor faucibus efficitur.', 10, 'Bottles', 500.00, '12.00', 1.00, 1, 'active', '0000-00-00'),
(2, 1, 4, 'Product 102', 'P-1002', 'Proin vehicula mi pulvinar ipsum ornare tincidunt.', 15, 'Box', 7500.00, '12.00', 1.00, 2, 'active', '0000-00-00'),
(3, 3, 7, 'Product 103', 'P-1003', 'Integer interdum, odio eget mattis venenatis', 20, 'Bags', 350.00, '12.00', 1.00, 3, 'active', '0000-00-00'),
(4, 4, 10, 'Galaxy A32', 'E12 32', 'Mantente siempre conectado con tu Galaxy A32, gracias a su batería de 5000 mAh. Cuenta con una memoria RAM de 4GB y alto almacenamiento de 128GB que te permite disfrutar tus aplicaciones ágilmente y llevar contigo la información que necesites. Su display de 6.4 pulgadas te permite tener una experiencia visual inigualable con el mejor contenido.', 50, 'Packet', 2500000.00, '23.00', 1.00, 4, 'active', '0000-00-00'),
(5, 4, 10, 'tv4', '123', 'producto de 50\'', 4, 'Bags', 0.00, '5.00', 1.00, 1, 'active', '0000-00-00'),
(6, 6, 13, 'Campesina', 'azul', 'campesina estilo 2023', 20, 'Nos', 10000.00, '2.00', 1.00, 1, 'active', '0000-00-00'),
(7, 5, 12, 'TENIS SUPERSTAR', '12', '***UNISEX, HORMA GRANDE***\r\nPara pies delgados recomendamos comprar la talla inferior. Revisa la equivalencia, H: Hombre | M: Mujer.', 30, 'Nos', 20000.00, '1.00', 1.00, 2, 'active', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ims_purchase`
--

CREATE TABLE `ims_purchase` (
  `purchase_id` int(11) NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ims_purchase`
--

INSERT INTO `ims_purchase` (`purchase_id`, `supplier_id`, `product_id`, `quantity`, `purchase_date`) VALUES
(5, '4', '7', '4', '2023-06-07 05:05:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ims_supplier`
--

CREATE TABLE `ims_supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `address` text NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ims_supplier`
--

INSERT INTO `ims_supplier` (`supplier_id`, `supplier_name`, `mobile`, `address`, `status`) VALUES
(1, 'Alkosto', 3052874691, 'Calle 98 N 21 02', 'active'),
(2, 'Almacenes Exito', 3052879417, 'Calle 23 10 09', 'active'),
(3, 'Falabella', 3192102091, 'Calle  87 82 01', 'active'),
(4, 'Katronix', 3025874637, 'Calle 90 46 74', 'active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ims_user`
--

CREATE TABLE `ims_user` (
  `userid` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` enum('admin','member') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ims_user`
--

INSERT INTO `ims_user` (`userid`, `email`, `password`, `name`, `type`, `status`) VALUES
(1, 'hola@configuroweb.com', '4b67deeb9aba04a5b54632ad19934f26', 'ConfiguroWeb', 'admin', 'Active');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ims_brand`
--
ALTER TABLE `ims_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ims_category`
--
ALTER TABLE `ims_category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indices de la tabla `ims_customer`
--
ALTER TABLE `ims_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ims_order`
--
ALTER TABLE `ims_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indices de la tabla `ims_product`
--
ALTER TABLE `ims_product`
  ADD PRIMARY KEY (`pid`);

--
-- Indices de la tabla `ims_purchase`
--
ALTER TABLE `ims_purchase`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indices de la tabla `ims_supplier`
--
ALTER TABLE `ims_supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indices de la tabla `ims_user`
--
ALTER TABLE `ims_user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ims_brand`
--
ALTER TABLE `ims_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ims_category`
--
ALTER TABLE `ims_category`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ims_customer`
--
ALTER TABLE `ims_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ims_order`
--
ALTER TABLE `ims_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ims_product`
--
ALTER TABLE `ims_product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ims_purchase`
--
ALTER TABLE `ims_purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ims_supplier`
--
ALTER TABLE `ims_supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ims_user`
--
ALTER TABLE `ims_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
