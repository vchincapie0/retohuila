-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2023 at 06:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `retohuila`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `cedulaCliente` char(10) NOT NULL,
  `nombre` char(50) NOT NULL,
  `telefono` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_clientes`
--

INSERT INTO `tbl_clientes` (`cedulaCliente`, `nombre`, `telefono`) VALUES
('1019132790', 'andrea', '3194091311');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cuentas`
--

CREATE TABLE `tbl_cuentas` (
  `numeroCuenta` char(10) NOT NULL,
  `titular` char(50) NOT NULL,
  `saldo` float NOT NULL DEFAULT 0,
  `fechaApertura` date NOT NULL,
  `estado` enum('Abierto','Cerrado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_cuentas`
--

INSERT INTO `tbl_cuentas` (`numeroCuenta`, `titular`, `saldo`, `fechaApertura`, `estado`) VALUES
('6324635729', 'heidy', 160000, '2023-09-12', 'Abierto'),
('7684795629', 'vivian', 12000, '2023-09-18', 'Abierto');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pruebacuenta`
--

CREATE TABLE `tbl_pruebacuenta` (
  `numeroCta` varchar(10) NOT NULL,
  `cedulaCliente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`cedulaCliente`);

--
-- Indexes for table `tbl_cuentas`
--
ALTER TABLE `tbl_cuentas`
  ADD PRIMARY KEY (`numeroCuenta`);

--
-- Indexes for table `tbl_pruebacuenta`
--
ALTER TABLE `tbl_pruebacuenta`
  ADD KEY `numeroCta` (`numeroCta`),
  ADD KEY `cedulaCliente` (`cedulaCliente`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_pruebacuenta`
--
ALTER TABLE `tbl_pruebacuenta`
  ADD CONSTRAINT `tbl_pruebacuenta_ibfk_1` FOREIGN KEY (`numeroCta`) REFERENCES `tbl_cuentas` (`numeroCuenta`),
  ADD CONSTRAINT `tbl_pruebacuenta_ibfk_2` FOREIGN KEY (`cedulaCliente`) REFERENCES `tbl_clientes` (`cedulaCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
