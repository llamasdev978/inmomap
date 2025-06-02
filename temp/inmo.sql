-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2025 at 09:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inmo`
--

-- --------------------------------------------------------

--
-- Table structure for table `presupuestos`
--

CREATE TABLE `presupuestos` (
  `id` int(11) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `coste_m2` decimal(10,2) NOT NULL,
  `superficie` decimal(10,2) NOT NULL,
  `precio_estimado` decimal(10,2) GENERATED ALWAYS AS (`coste_m2` * `superficie`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `presupuestos`
--

INSERT INTO `presupuestos` (`id`, `municipio`, `coste_m2`, `superficie`) VALUES
(1, 'La Acebeda', 1706.54, 62.92),
(2, 'Ajalvir', 1892.31, 61.89),
(3, 'Alameda del Valle', 1951.69, 74.39),
(4, 'El Álamo', 1969.77, 73.93),
(5, 'Alcalá de Henares', 2935.72, 106.67),
(6, 'Alcobendas', 3024.92, 98.57),
(7, 'Alcorcón', 3473.37, 95.22),
(8, 'Aldea del Fresno', 1610.64, 75.08),
(9, 'Algete', 1584.73, 79.81),
(10, 'Alpedrete', 1651.06, 70.04),
(11, 'Ambite', 1744.04, 83.91),
(12, 'Anchuelo', 1765.28, 67.07),
(13, 'Aranjuez', 1968.20, 81.21),
(14, 'Arganda del Rey', 2432.45, 85.54),
(15, 'Arroyomolinos', 1886.04, 62.62),
(16, 'El Atazar', 1802.28, 64.97),
(17, 'Batres', 1533.11, 75.05),
(18, 'Becerril de la Sierra', 1421.16, 84.49),
(19, 'Belmonte de Tajo', 1805.67, 79.17),
(20, 'El Berrueco', 1609.86, 71.53),
(21, 'Berzosa del Lozoya', 1445.87, 76.96),
(22, 'Boadilla del Monte', 3008.61, 93.55),
(23, 'El Boalo', 2042.18, 73.45),
(24, 'Braojos', 2094.36, 60.41),
(25, 'Brea de Tajo', 1982.85, 74.15),
(26, 'Brunete', 1648.78, 80.84),
(27, 'Buitrago del Lozoya', 1801.45, 62.85),
(28, 'Bustarviejo', 1436.93, 84.37),
(29, 'Cabanillas de la Sierra', 2004.73, 66.93),
(30, 'La Cabrera', 2079.96, 82.98),
(31, 'Cadalso de los Vidrios', 1931.17, 84.12),
(32, 'Camarma de Esteruelas', 1623.85, 68.15),
(33, 'Campo Real', 1776.08, 72.83),
(34, 'Canencia', 1901.81, 79.16),
(35, 'Carabaña', 1788.66, 80.97),
(36, 'Casarrubuelos', 1736.68, 80.87),
(37, 'Cenicientos', 1533.61, 78.75),
(38, 'Cercedilla', 1502.43, 71.41),
(39, 'Cervera de Buitrago', 1804.88, 64.48),
(40, 'Chapinería', 1676.39, 75.51),
(41, 'Chinchón', 1784.46, 82.41),
(42, 'Ciempozuelos', 1709.31, 75.08),
(43, 'Cobeña', 1453.19, 63.23),
(44, 'Collado Mediano', 1529.39, 68.26),
(45, 'Collado Villalba', 2201.62, 92.87),
(46, 'Colmenar de Oreja', 1488.23, 68.69),
(47, 'Colmenar del Arroyo', 1691.13, 84.03),
(48, 'Colmenar Viejo', 2690.12, 92.81),
(49, 'Colmenarejo', 1610.74, 78.06),
(50, 'Corpa', 1948.02, 71.89),
(51, 'Coslada', 2570.63, 94.60),
(52, 'Cubas de la Sagra', 2092.06, 66.14),
(53, 'Daganzo de Arriba', 1791.10, 77.67),
(54, 'El Escorial', 1673.72, 83.75),
(55, 'Estremera', 1972.31, 76.52),
(56, 'Fresnedillas de la Oliva', 1706.06, 77.78),
(57, 'Fresno de Torote', 2077.30, 70.35),
(58, 'Fuenlabrada', 3065.20, 97.32),
(59, 'Fuente el Saz de Jarama', 1518.82, 82.73),
(60, 'Fuentidueña de Tajo', 1921.60, 75.99),
(61, 'Galapagar', 2238.33, 93.67),
(62, 'Garganta de los Montes', 1907.49, 77.77),
(63, 'Gargantilla del Lozoya y Pinilla de Buitrago', 1863.16, 63.85),
(64, 'Gascones', 1751.18, 65.14),
(65, 'Getafe', 3193.36, 105.24),
(66, 'Griñón', 1595.10, 82.90),
(67, 'Guadalix de la Sierra', 1597.41, 62.39),
(68, 'Guadarrama', 2055.42, 62.56),
(69, 'La Hiruela', 1486.53, 73.20),
(70, 'Horcajo de la Sierra-Aoslos', 1715.48, 63.10),
(71, 'Horcajuelo de la Sierra', 1446.55, 62.50),
(72, 'Hoyo de Manzanares', 1797.69, 74.73),
(73, 'Humanes de Madrid', 1980.85, 67.41),
(74, 'Leganés', 3231.61, 94.67),
(75, 'Loeches', 1440.82, 81.06),
(76, 'Lozoya', 1629.29, 62.97),
(77, 'Lozoyuela-Navas-Sieteiglesias', 2010.80, 74.82),
(78, 'Madarcos', 1593.92, 84.14),
(79, 'Madrid', 3377.43, 109.81),
(80, 'Majadahonda', 3280.20, 95.43),
(81, 'Manzanares el Real', 1426.25, 76.66),
(82, 'Meco', 1448.44, 81.39),
(83, 'Mejorada del Campo', 1809.15, 67.43),
(84, 'Miraflores de la Sierra', 1452.40, 69.42),
(85, 'El Molar', 2029.61, 80.25),
(86, 'Los Molinos', 1953.97, 84.03),
(87, 'Montejo de la Sierra', 1750.15, 66.66),
(88, 'Moraleja de Enmedio', 1711.22, 68.50),
(89, 'Moralzarzal', 1720.04, 81.09),
(90, 'Morata de Tajuña', 1830.57, 75.11),
(91, 'Móstoles', 2991.48, 97.42),
(92, 'Navacerrada', 1483.50, 80.01),
(93, 'Navalafuente', 1977.64, 67.54),
(94, 'Navalagamella', 1868.50, 70.14),
(95, 'Navalcarnero', 1638.60, 74.01),
(96, 'Navarredonda y San Mamés', 2056.26, 68.09),
(97, 'Navas del Rey', 2043.85, 78.57),
(98, 'Nuevo Baztán', 1980.94, 72.85),
(99, 'Olmeda de las Fuentes', 1624.90, 62.55),
(100, 'Orusco de Tajuña', 2039.34, 71.43),
(101, 'Paracuellos de Jarama', 1586.05, 80.83),
(102, 'Parla', 3594.54, 100.79),
(103, 'Patones', 1927.86, 80.75),
(104, 'Pedrezuela', 1815.18, 75.73),
(105, 'Pelayos de la Presa', 1918.25, 73.54),
(106, 'Perales de Tajuña', 1618.15, 61.50),
(107, 'Pezuela de las Torres', 1592.60, 71.50),
(108, 'Pinilla del Valle', 1442.84, 77.43),
(109, 'Pinto', 2642.81, 83.36),
(110, 'Piñuécar-Gandullas', 2091.00, 60.49),
(111, 'Pozuelo de Alarcón', 3029.90, 94.06),
(112, 'Pozuelo del Rey', 1777.44, 72.28),
(113, 'Prádena del Rincón', 1945.91, 61.58),
(114, 'Puebla de la Sierra', 1813.79, 75.97),
(115, 'Puentes Viejas', 1454.16, 66.59),
(116, 'Quijorna', 1625.89, 61.00),
(117, 'Rascafría', 1593.32, 82.99),
(118, 'Redueña', 2062.09, 64.21),
(119, 'Ribatejada', 2063.48, 67.95),
(120, 'Rivas-Vaciamadrid', 2385.74, 92.83),
(121, 'Robledillo de la Jara', 1788.15, 64.27),
(122, 'Robledo de Chavela', 1827.18, 73.48),
(123, 'Robregordo', 1937.34, 67.19),
(124, 'Las Rozas de Madrid', 3085.88, 99.32),
(125, 'Rozas de Puerto Real', 1997.55, 84.05),
(126, 'San Agustín del Guadalix', 1491.22, 73.34),
(127, 'San Fernando de Henares', 2542.23, 92.70),
(128, 'San Lorenzo de El Escorial', 1549.15, 60.50),
(129, 'San Martín de la Vega', 1626.84, 65.83),
(130, 'San Martín de Valdeiglesias', 1705.81, 71.71),
(131, 'San Sebastián de los Reyes', 3084.56, 94.17),
(132, 'Santa María de la Alameda', 1637.43, 76.95),
(133, 'Santorcaz', 1743.15, 71.80),
(134, 'Los Santos de la Humosa', 1505.59, 79.77),
(135, 'La Serna del Monte', 1966.67, 60.31),
(136, 'Serranillos del Valle', 1606.71, 70.82),
(137, 'Sevilla la Nueva', 1954.45, 80.31),
(138, 'Somosierra', 1954.74, 73.59),
(139, 'Soto del Real', 1610.49, 72.75),
(140, 'Talamanca de Jarama', 1414.28, 78.29),
(141, 'Tielmes', 1609.49, 68.88),
(142, 'Titulcia', 1821.12, 63.88),
(143, 'Torrejón de Ardoz', 3349.64, 108.42),
(144, 'Torrejón de la Calzada', 1505.80, 71.75),
(145, 'Torrejón de Velasco', 1886.00, 81.78),
(146, 'Torrelaguna', 1412.60, 71.32),
(147, 'Torrelodones', 2224.03, 83.27),
(148, 'Torremocha de Jarama', 2058.71, 73.04),
(149, 'Torres de la Alameda', 1953.69, 80.08),
(150, 'Tres Cantos', 2783.53, 80.49),
(151, 'Valdaracete', 1621.97, 60.66),
(152, 'Valdeavero', 1635.28, 69.81),
(153, 'Valdelaguna', 1613.33, 66.07),
(154, 'Valdemanco', 1896.07, 74.91),
(155, 'Valdemaqueda', 1696.76, 72.19),
(156, 'Valdemorillo', 1753.37, 83.25),
(157, 'Valdemoro', 2660.18, 85.72),
(158, 'Valdeolmos-Alalpardo', 1678.05, 72.21),
(159, 'Valdepiélagos', 2040.44, 77.47),
(160, 'Valdetorres de Jarama', 1421.10, 68.38),
(161, 'Valdilecha', 2032.77, 67.24),
(162, 'Valverde de Alcalá', 1625.91, 74.81),
(163, 'Velilla de San Antonio', 1699.87, 76.16),
(164, 'El Vellón', 1675.46, 65.12),
(165, 'Venturada', 1802.94, 71.10),
(166, 'Villa del Prado', 1487.42, 63.02),
(167, 'Villaconejos', 1857.02, 81.42),
(168, 'Villalbilla', 1651.22, 84.36),
(169, 'Villamanrique de Tajo', 1566.07, 74.51),
(170, 'Villamanta', 2026.61, 76.63),
(171, 'Villamantilla', 1569.66, 65.04),
(172, 'Villanueva de la Cañada', 2611.49, 80.94),
(173, 'Villanueva de Perales', 1970.24, 69.94),
(174, 'Villanueva del Pardillo', 2629.94, 92.03),
(175, 'Villar del Olmo', 1439.29, 60.78),
(176, 'Villarejo de Salvanés', 1434.32, 65.97),
(177, 'Villaviciosa de Odón', 2446.18, 83.53),
(178, 'Villavieja del Lozoya', 1570.63, 75.17),
(179, 'Zarzalejo', 1728.37, 69.73);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rol` enum('admin','manager','user') NOT NULL,
  `email` varchar(55) NOT NULL,
  `nombre` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `rol`, `email`, `nombre`) VALUES
(1, 'aaa', '123', 'admin', '', ''),
(2, 'bbb', '123', 'manager', '', ''),
(3, 'ccc', '123', 'user', '', ''),
(4, 'ddd', '123', 'admin', '', ''),
(5, 'eee', '123', 'manager', '', ''),
(6, 'fff', '123', 'user', '', ''),
(7, 'Mario', '123', 'admin', '', ''),
(8, 'ttttt', 'ttttt', 'admin', 'tttt@gmail.com', 'ttttt'),
(9, '123', '123', 'user', '123@123.es', '123');

-- --------------------------------------------------------

--
-- Table structure for table `zonas`
--

CREATE TABLE `zonas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `precio_m2` decimal(10,2) NOT NULL,
  `poblacion_total` int(11) DEFAULT NULL,
  `municipios` text DEFAULT NULL,
  `imagen_destacada` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zonas`
--

INSERT INTO `zonas` (`id`, `nombre`, `descripcion`, `precio_m2`, `poblacion_total`, `municipios`, `imagen_destacada`) VALUES
(1, 'norte', 'Zona residencial con buen acceso a la sierra, alta calidad de vida.', 3250.50, 500000, 'Alcobendas, San Sebastián de los Reyes, Tres Cantos', 'img/1.png'),
(2, 'sur', 'Zona con buena conexión al centro, precios más asequibles.', 2100.00, 650000, 'Getafe, Leganés, Fuenlabrada', 'img/2.png'),
(3, 'este', 'Área en expansión, buena oferta educativa y comercial.', 2400.75, 420000, 'Alcalá de Henares, Torrejón de Ardoz', 'img/3.png'),
(4, 'oeste', 'Zona tranquila con urbanizaciones y zonas verdes.', 2800.20, 390000, 'Móstoles, Alcorcón, Boadilla', 'img/4.png'),
(5, 'centro', 'Corazón de Madrid, precios elevados y mucha actividad.', 4850.90, 750000, 'Centro, Chamberí, Salamanca', 'img/5.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `presupuestos`
--
ALTER TABLE `presupuestos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `presupuestos`
--
ALTER TABLE `presupuestos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `zonas`
--
ALTER TABLE `zonas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
