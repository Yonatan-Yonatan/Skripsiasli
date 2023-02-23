-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: Feb 23, 2023 at 07:37 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_stockcosmetic`
--

-- --------------------------------------------------------

--
-- Table structure for table `keluar`
--

CREATE TABLE `keluar` (
  `idkeluar` int(11) NOT NULL,
  `idbarang` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `penerima` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keluar`
--

INSERT INTO `keluar` (`idkeluar`, `idbarang`, `tanggal`, `penerima`, `qty`, `status`) VALUES
(1, 1, '2023-02-13 01:47:43', 'Silvia', 20, 'retur'),
(2, 0, '2023-02-13 01:47:28', '', 0, 'rusak'),
(3, 18, '2023-02-17 06:11:59', 'Novita', 20, ''),
(4, 1, '2023-02-17 06:25:55', 'Malvin', 71, ''),
(5, 1, '2023-02-17 08:31:06', 'Silvia', 9, ''),
(6, 23, '2023-02-21 08:03:32', 'Burma', 50, 'Retur karena sudah kadarluasa'),
(7, 4, '2023-02-22 03:01:35', 'dina', 20, 'Rusak/retur'),
(8, 19, '2023-02-22 07:17:49', 'Novita', 20, ''),
(9, 12, '2023-02-22 15:51:41', 'manager toko', 20, ''),
(10, 13, '2023-02-22 15:13:28', 'manager toko', 90, ''),
(11, 6, '2023-02-22 15:49:29', 'manager toko', 50, ''),
(12, 27, '2023-02-22 15:36:46', 'manager toko', 20, ''),
(13, 12, '2023-02-22 15:51:41', 'manager toko', 20, ''),
(14, 4, '2023-02-22 15:42:51', 'dina', 20, ''),
(15, 12, '2023-02-22 15:51:41', 'manager toko', 20, ''),
(16, 3, '2023-02-22 17:28:57', 'manager toko', 100, '');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `iduser` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`iduser`, `username`, `email`, `password`, `role`) VALUES
(1, 'edric', 'edricsuryady@gmail.com', '123', 'owner'),
(2, 'silvia', 'silvia@gmail.com', '123', 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `masuk`
--

CREATE TABLE `masuk` (
  `idmasuk` int(11) NOT NULL,
  `idbarang` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `penerima` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `masuk`
--

INSERT INTO `masuk` (`idmasuk`, `idbarang`, `tanggal`, `penerima`, `qty`) VALUES
(2, 30, '2023-02-23 05:59:05', 'dinda', 10000),
(4, 6, '2023-02-23 06:02:37', 'Novita', 100),
(5, 12, '2023-02-23 06:11:56', 'manager toko', 90),
(7, 27, '2023-02-23 06:23:00', 'manager toko', 300);

-- --------------------------------------------------------

--
-- Table structure for table `req`
--

CREATE TABLE `req` (
  `idmasuk` int(11) NOT NULL,
  `idbarang` int(11) NOT NULL,
  `namabarang` varchar(100) NOT NULL,
  `jenisbarang` varchar(100) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `penerima` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `idsales` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `perusahaan` varchar(100) NOT NULL,
  `kontak` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`idsales`, `nama`, `perusahaan`, `kontak`) VALUES
(1, 'lina', 'Burma', '0812181'),
(2, 'Steven', 'VO3', '000'),
(3, 'V3', 'PT surabaya', '081218190'),
(4, 'MSI', 'Taiwan', 'Telom');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `idbarang` int(11) NOT NULL,
  `namabarang` varchar(50) NOT NULL,
  `jenisbarang` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `Harga` int(100) NOT NULL,
  `totalharga` varchar(1000) NOT NULL,
  `gambar` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`idbarang`, `namabarang`, `jenisbarang`, `stock`, `Harga`, `totalharga`, `gambar`) VALUES
(1, 'Scarlet whitening', 'Sabun Mandi pria', 110, 200000, '', '54c114f6491eee7e16b4847a449b8a6d1676958038.jpg'),
(2, 'Pixy', 'Sabun Muka', 1300, 30000, '', 'fa533e2ee4a0e8ad9b186d625c897a371676966480.jpg'),
(3, 'gatsby', 'Pomade rambut pria', 140, 40, '', NULL),
(4, 'Clear', 'SHampo ketombe', 400, 60, '', NULL),
(5, 'Garnier', 'Sabun muka', 1000, 80, '', NULL),
(6, 'Casablanka', 'Deodorant', 50, 90, '', NULL),
(7, 'kopi', 'minuman ', 210, 100, '', NULL),
(8, 'nyabun', 'Sabun Muka', 140, 450, '', NULL),
(10, 'iphone', 'IOs', 700, 900, '', NULL),
(12, 'Samsung', 'Smartphone', 150, 40000, '', NULL),
(15, 'Kentang', 'Potato', 0, 200, '', NULL),
(17, 'minuman', 'Kopi', 270, 34, '', NULL),
(18, 'Mcoffe', 'Ice kopi', 190, 20, '', NULL),
(20, 'Oppo', 'Smartphone', 20, 47, '', NULL),
(21, 'Nugget', 'Makanan', 20, 50, '', NULL),
(22, 'Ikea', 'Kursi lipat', 40, 100, '', NULL),
(23, 'Pajero', 'Mobil', 200, 450, '', NULL),
(24, 'MSI', 'Laptop', 20, 567, '', 'bf7d63100af005280d02aa356c7e90351676958068.jpg'),
(26, 'Fortuner', 'Mobil', 100, 700, '', 'b95308221ed81815016ad7f56f1eb1bd1676957529.jpg'),
(27, 'hit', 'obat nyamuk', 300, 0, '', 'b223e7dce2b0b45017b7ff2a1dca779c1677079422.jpg'),
(28, 'puma', 'Sepatu Olahraga', 200, 900000, '', '97730294d5e89e059d85a46a10bb5d931677082265.jpg'),
(29, 'Pepsodent', 'Sikat gigi', 200, 0, '', '9f80013f887ae8bf3985fa694c75fbe31677082627.jpg'),
(30, 'kangkung', 'sayuran', 9100, 0, '', 'a5e697f2efe7c641eb56848af061e57e1677083701.jpg'),
(31, 'KENTANG', 'POTATO', 900, 0, '', '51f83ca8c5988e9d5e8e8a70b8908ced1677129215.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keluar`
--
ALTER TABLE `keluar`
  ADD PRIMARY KEY (`idkeluar`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `masuk`
--
ALTER TABLE `masuk`
  ADD PRIMARY KEY (`idmasuk`);

--
-- Indexes for table `req`
--
ALTER TABLE `req`
  ADD PRIMARY KEY (`idmasuk`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`idsales`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`idbarang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keluar`
--
ALTER TABLE `keluar`
  MODIFY `idkeluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `masuk`
--
ALTER TABLE `masuk`
  MODIFY `idmasuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `req`
--
ALTER TABLE `req`
  MODIFY `idmasuk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `idsales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `idbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
