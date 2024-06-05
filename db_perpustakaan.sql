-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2024 at 05:45 AM
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
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE `tb_buku` (
  `BukuID` int(11) NOT NULL,
  `Judul` varchar(255) NOT NULL,
  `Penulis` varchar(255) NOT NULL,
  `Penerbit` varchar(255) NOT NULL,
  `TahunTerbit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_buku`
--

INSERT INTO `tb_buku` (`BukuID`, `Judul`, `Penulis`, `Penerbit`, `TahunTerbit`) VALUES
(23, 'app', 'app', 'awdaw', 123),
(24, 'app', 'app', 'awdaw', 123),
(27, 'Coding For Dummies', 'Chad Mc Chadsky', 'ProPrint', 2001),
(28, 'How To Bag Your Girl', 'Chad Mc Chadsky', 'ProPrint', 2011),
(29, 'Coding For Dummies 2', 'Chad Mc Chadsky', 'ProPrint', 2002),
(30, 'The Monkey and The Monk', 'Greg Luton', 'AhaPrint', 2001),
(32, '', '', '', 0),
(33, 'HowToBook', 'Howto', 'aNormalGuy', 1969);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `KategoriID` int(11) NOT NULL,
  `NamaKategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`KategoriID`, `NamaKategori`) VALUES
(1, 'Comedy'),
(2, 'Academic');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategoribuku_relasi`
--

CREATE TABLE `tb_kategoribuku_relasi` (
  `KategoriBukuID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `KatergoriID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_kategoribuku_relasi`
--

INSERT INTO `tb_kategoribuku_relasi` (`KategoriBukuID`, `BukuID`, `KatergoriID`) VALUES
(6, 27, 2),
(7, 28, 2),
(8, 29, 2),
(9, 30, 1),
(12, 33, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_koleksipribadi`
--

CREATE TABLE `tb_koleksipribadi` (
  `KoleksiID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_koleksipribadi`
--

INSERT INTO `tb_koleksipribadi` (`KoleksiID`, `UserID`, `BukuID`) VALUES
(1, 1, 27),
(2, 1, 28),
(3, 1, 27),
(4, 1, 28);

-- --------------------------------------------------------

--
-- Table structure for table `tb_peminjaman`
--

CREATE TABLE `tb_peminjaman` (
  `PeminjamanID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `TanggalPeminjaman` date NOT NULL,
  `TanggalPengembalian` date NOT NULL,
  `StatusPeminjaman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_peminjaman`
--

INSERT INTO `tb_peminjaman` (`PeminjamanID`, `UserID`, `BukuID`, `TanggalPeminjaman`, `TanggalPengembalian`, `StatusPeminjaman`) VALUES
(5, 1, 27, '2024-04-30', '2024-05-05', 'Dipinjam'),
(6, 1, 28, '2024-05-03', '2024-05-13', 'Dipinjam'),
(7, 1, 27, '2024-05-04', '2024-05-14', 'Dipinjam'),
(8, 1, 28, '2024-05-11', '2024-05-26', 'Dipinjam');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ulasanbuku`
--

CREATE TABLE `tb_ulasanbuku` (
  `UlasanID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `Ulasan` text NOT NULL,
  `Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_ulasanbuku`
--

INSERT INTO `tb_ulasanbuku` (`UlasanID`, `UserID`, `BukuID`, `Ulasan`, `Rating`) VALUES
(8, 1, 27, 'buku ini gini', 4),
(9, 1, 27, 'buku ini gini', 5),
(10, 1, 27, 'buku ini gini', 5),
(11, 1, 27, 'buku ini gini', 5),
(12, 1, 27, 'buku yang paling penting nagi para pemula', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NamaLengkap` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `Status` enum('Admin','Petugas','Peminjam','') DEFAULT 'Petugas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`UserID`, `Username`, `Password`, `Email`, `NamaLengkap`, `Alamat`, `Status`) VALUES
(1, 'admin', '$2y$10$Y8q4y3Qnzm7pdwvWpo0aTOuwVtz3ifeXou/Ln8.61qLAsBjoUDJTW', 'admin@gmail.com', 'fsesf', 'sefse', 'Admin'),
(2, 'WayanAri13', '$2y$10$ZuI.XLk74U01u29qMHBJ6ek4KsacgAL3JPqwq/8xfy2bEgCJ77OSS', 'wayan@gmail.com', 'wayan Ari', 'Jln.Jembawan', 'Peminjam'),
(3, 'Fabian', '$2y$10$fTomZdHL2CZbniO7XmNNluBqwizMrDyXx00elwdcni1Cu3sTVE9P.', 'fabian@yahoo.com', 'fsesf', 'Jln.Jembawan', 'Peminjam'),
(4, 'Ata', '$2y$10$aVWDv1sZzFRvl.5T3NJx8.DZ2uHugnp2.w44ur0P6CYU3/AwwvS3C', 'ata@gmail.com', 'ata', 'ataatatat', 'Peminjam'),
(5, 'Petugas1', '$2y$10$naOGV82El/cLrS/EAZaWCu7J07L17lZxNWsdFChFq45S2cfOb5LMq', 'petuga12@gmail.com', 'Petugas', 'Jln. Petugas', 'Petugas'),
(6, 'wayan', '$2y$10$prI.c1HbGKO9Gi.aNhbtcuZeyEj5cdy0m9qRnwWGMGo9gTcHAJ.0a', 'wayan12@gmail.com', 'wayan', 'Jln. Wayan', 'Peminjam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`BukuID`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`KategoriID`);

--
-- Indexes for table `tb_kategoribuku_relasi`
--
ALTER TABLE `tb_kategoribuku_relasi`
  ADD PRIMARY KEY (`KategoriBukuID`),
  ADD KEY `tb_kategoribuku_relasi_ibfk_1` (`KatergoriID`),
  ADD KEY `tb_kategoribuku_relasi_ibfk_2` (`BukuID`);

--
-- Indexes for table `tb_koleksipribadi`
--
ALTER TABLE `tb_koleksipribadi`
  ADD PRIMARY KEY (`KoleksiID`),
  ADD KEY `BukuID` (`BukuID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD PRIMARY KEY (`PeminjamanID`),
  ADD KEY `BukuID` (`BukuID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `tb_ulasanbuku`
--
ALTER TABLE `tb_ulasanbuku`
  ADD PRIMARY KEY (`UlasanID`),
  ADD KEY `BukuID` (`BukuID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_buku`
--
ALTER TABLE `tb_buku`
  MODIFY `BukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `KategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_kategoribuku_relasi`
--
ALTER TABLE `tb_kategoribuku_relasi`
  MODIFY `KategoriBukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_koleksipribadi`
--
ALTER TABLE `tb_koleksipribadi`
  MODIFY `KoleksiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  MODIFY `PeminjamanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_ulasanbuku`
--
ALTER TABLE `tb_ulasanbuku`
  MODIFY `UlasanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_kategoribuku_relasi`
--
ALTER TABLE `tb_kategoribuku_relasi`
  ADD CONSTRAINT `tb_kategoribuku_relasi_ibfk_1` FOREIGN KEY (`KatergoriID`) REFERENCES `tb_kategori` (`KategoriID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_kategoribuku_relasi_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `tb_buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_koleksipribadi`
--
ALTER TABLE `tb_koleksipribadi`
  ADD CONSTRAINT `tb_koleksipribadi_ibfk_1` FOREIGN KEY (`BukuID`) REFERENCES `tb_buku` (`BukuID`),
  ADD CONSTRAINT `tb_koleksipribadi_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `tb_user` (`UserID`);

--
-- Constraints for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD CONSTRAINT `tb_peminjaman_ibfk_1` FOREIGN KEY (`BukuID`) REFERENCES `tb_buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_peminjaman_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `tb_user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_ulasanbuku`
--
ALTER TABLE `tb_ulasanbuku`
  ADD CONSTRAINT `tb_ulasanbuku_ibfk_1` FOREIGN KEY (`BukuID`) REFERENCES `tb_buku` (`BukuID`),
  ADD CONSTRAINT `tb_ulasanbuku_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `tb_user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
