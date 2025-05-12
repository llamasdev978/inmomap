-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2025 at 01:25 PM
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
(9, 'admin', 'admin', 'admin', 'admin@admin.es', 'admin'),
(10, 'user', 'user', 'user', 'user@user.es', 'user'),
(11, 'manager', 'manager', 'manager', 'manager@manager.es', 'manager'),
(12, 'kljgheklghevkl', 'hkjechgkjerg', 'admin', 'mail@mail.es', 'lg ehvgkseg');

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
(2, 'sur', 'Zona con buena conexión al centro, precios más asequibles.', 2100.00, 65000, 'Getafe, Leganés, Fuenlabrada', 'img/2.png'),
(3, 'este', 'Área en expansión, buena oferta educativa y comercial.', 2400.75, 420000, 'Alcalá de Henares, Torrejón de Ardoz', 'img/3.png'),
(4, 'oeste', 'Zona tranquila con urbanizaciones y zonas verdes.', 2800.20, 390000, 'Móstoles, Alcorcón, Boadilla', 'img/4.png'),
(5, 'centro', 'Corazón de Madrid, precios elevados y mucha actividad.', 4850.90, 750000, 'Centro, Chamberí, Salamanca', 'img/5.png');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `zonas`
--
ALTER TABLE `zonas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
