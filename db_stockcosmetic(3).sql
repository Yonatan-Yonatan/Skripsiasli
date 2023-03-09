-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: Mar 09, 2023 at 10:32 AM
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
-- Table structure for table `faktur`
--

CREATE TABLE `faktur` (
  `idfaktur` int(11) NOT NULL,
  `supplier` varchar(900) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faktur`
--

INSERT INTO `faktur` (`idfaktur`, `supplier`, `tanggal`, `gambar`) VALUES
(1, '2', '2023-03-09 07:09:52', 'c38d79750dd9b4e58bed7736837c6fe21678345792.jpg'),
(2, '1', '2023-03-09 07:50:56', '6f10567d90b67402c5bf1b76ea388f411678348256.jpg'),
(3, '3', '2023-03-09 07:55:32', '050f7eb3c8758861eb90b99b3fd7051d1678348532.jpg'),
(4, '4', '2023-03-09 07:56:47', '10282ba79f2f5d106d09553e614fed8a1678348607.jpg'),
(5, '1', '2023-03-09 08:11:20', '23b1236b4ac3cfd0d2f5f759582183c21678349480.jpg'),
(6, '1', '2023-03-09 08:25:38', ''),
(7, '1', '2023-03-09 08:25:38', '64938eb26fa577b23d8d84f6a26494881678350338.jpg'),
(8, '2', '2023-03-09 08:26:27', '263ac4053168fafeab299a805012cc241678350387.jpg'),
(9, '4', '2023-03-09 08:27:52', '9a4674283bf6019270300218e415a6861678350472.jpg');

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
(3, 18, '2023-02-23 08:16:53', 'Novita', 20, 'Kirim ke pelanggan'),
(4, 1, '2023-02-17 06:25:55', 'Malvin', 71, ''),
(5, 1, '2023-02-17 08:31:06', 'Silvia', 9, ''),
(6, 23, '2023-02-21 08:03:32', 'Burma', 50, 'Retur karena sudah kadarluasa'),
(7, 4, '2023-02-22 03:01:35', 'dina', 20, 'Rusak/retur'),
(8, 19, '2023-02-22 07:17:49', 'Novita', 20, ''),
(9, 12, '2023-02-23 08:31:12', 'manager toko', 20, 'kADARLUASA'),
(10, 13, '2023-02-22 15:13:28', 'manager toko', 90, ''),
(11, 6, '2023-02-22 15:49:29', 'manager toko', 50, ''),
(12, 27, '2023-02-22 15:36:46', 'manager toko', 20, ''),
(13, 12, '2023-02-22 15:51:41', 'manager toko', 20, ''),
(14, 4, '2023-02-22 15:42:51', 'dina', 20, ''),
(15, 12, '2023-02-22 15:51:41', 'manager toko', 20, ''),
(16, 3, '2023-02-22 17:28:57', 'manager toko', 100, ''),
(17, 31, '2023-02-23 07:11:52', 'novita', 800, ''),
(19, 10, '2023-02-23 07:14:33', 'manager', 700, '');

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
(1, 'edric', 'edricsuryady@gmail.com', '202cb962ac59075b964b07152d234b70', 'owner'),
(2, 'silvia', 'silvia@gmail.com', '202cb962ac59075b964b07152d234b70', 'manager'),
(3, 'Agustina', 'agustina@gmail.com', '202cb962ac59075b964b07152d234b70', 'kepalagudang'),
(4, 'Malvin', 'malvin@gmail.com', '202cb962ac59075b964b07152d234b70', 'kepalagudang'),
(5, 'Malvin', 'malvin@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'kepalagudang'),
(6, 'Malvin', 'malvin@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'kepalagudang'),
(7, 'admin', '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(8, 'novita', 'noviana@gmail.com', '123', 'owner'),
(9, 'lina', 'lina@gmail.com', '123', 'kepalagudang');

-- --------------------------------------------------------

--
-- Table structure for table `masuk`
--

CREATE TABLE `masuk` (
  `idmasuk` int(11) NOT NULL,
  `idbarang` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `kadarluasa` datetime DEFAULT NULL,
  `penerima` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `masuk`
--

INSERT INTO `masuk` (`idmasuk`, `idbarang`, `tanggal`, `kadarluasa`, `penerima`, `qty`) VALUES
(2, 30, '2023-02-27 07:40:44', '2024-11-27 00:00:00', 'dinda', 10000),
(4, 6, '2023-02-27 07:41:04', '2025-09-26 00:00:00', 'Novita', 100),
(5, 12, '2023-02-27 07:41:24', '2027-05-29 00:00:00', 'manager toko', 90),
(7, 27, '2023-02-27 07:41:36', '2023-10-28 00:00:00', 'manager toko', 300),
(9, 38, '2023-03-01 08:12:30', '2023-03-01 00:00:00', 'manager toko', 100);

-- --------------------------------------------------------

--
-- Table structure for table `req`
--

CREATE TABLE `req` (
  `idmasuk` int(11) NOT NULL,
  `idbarang` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0,
  `penerima` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `req`
--

INSERT INTO `req` (`idmasuk`, `idbarang`, `tanggal`, `status`, `penerima`, `qty`) VALUES
(1, 1, '2023-03-03 05:15:04', 2, 'manager toko', 200),
(2, 1, '2023-03-01 05:53:37', 1, 'Novita', 300),
(3, 1, '2023-03-01 05:55:13', 2, 'dinda', 400),
(4, 3, '2023-03-01 05:53:42', 1, 'Malvin', 200),
(5, 1, '2023-03-02 06:08:34', 1, 'Silvia', 800);

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
(10, 'iphone', 'IOs', 0, 900, '', NULL),
(12, 'Samsung', 'Smartphone', 150, 40000, '', NULL),
(17, 'minuman', 'Kopi', 270, 34, '', NULL),
(18, 'Mcoffe', 'Ice kopi', 190, 20, '', NULL),
(20, 'Oppo', 'Smartphone', 20, 47, '', NULL),
(21, 'Nugget', 'Makanan', 20, 50, '', NULL),
(22, 'Ikea', 'Kursi lipat', 40, 100, '', NULL),
(23, 'Pajero', 'Mobil', 200, 450, '', NULL),
(24, 'MSI', 'Laptop', 20, 567, '', 'bf7d63100af005280d02aa356c7e90351676958068.jpg'),
(26, 'Fortuner', 'Mobil', 100, 700, '', 'b95308221ed81815016ad7f56f1eb1bd1676957529.jpg'),
(27, 'hit', 'obat nyamuk', 300, 100000, '', 'b223e7dce2b0b45017b7ff2a1dca779c1677079422.jpg'),
(28, 'puma', 'Sepatu Olahraga', 200, 900000, '', '97730294d5e89e059d85a46a10bb5d931677082265.jpg'),
(29, 'Pepsodent', 'Sikat gigi', 200, 0, '', '9f80013f887ae8bf3985fa694c75fbe31677082627.jpg'),
(30, 'kangkung', 'sayuran', 9100, 0, '', 'a5e697f2efe7c641eb56848af061e57e1677083701.jpg'),
(32, 'Nokia n 97', 'Smartphone', 100, 9000, '', '8d431e26934aa5e8e5832f681d0cdd141677505095.jpg'),
(33, 'Daikin', 'AC', 100, 0, '', '45711ab3f9e2171c54bcbbde7e2295c71677589754.jpg'),
(34, 'Ayam', 'hewan', 200, 0, '', '307f180b0b380fab7749d79b1697a2351677651488.jpg'),
(36, 'Hyundai', 'mobil listrik', 100, 0, '', '6735da3d695509e3df79177626240a151677657728.jpg'),
(37, 'tesla', 'mobil ', 20, 0, '', '4b6c4b220f19d116e2f975a506589e551677657910.jpg'),
(38, 'ninja', 'motor', 120, 0, '', 'b96118942720fa29a4ff6fee48c7bd561677658016.jpg'),
(39, 'vario', 'motor bensin', 10, 900000, '', 'fb6e373465127a6de73c8f571f4bbe3e1677658084.jpg'),
(40, 'vario', 'motor bensin', 10, 0, '', 'd4e8002243fb6478dd71038cadc56b3a1677658190.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`idfaktur`);

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
-- AUTO_INCREMENT for table `faktur`
--
ALTER TABLE `faktur`
  MODIFY `idfaktur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `keluar`
--
ALTER TABLE `keluar`
  MODIFY `idkeluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `masuk`
--
ALTER TABLE `masuk`
  MODIFY `idmasuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `req`
--
ALTER TABLE `req`
  MODIFY `idmasuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `idsales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `idbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
