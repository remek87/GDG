-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2024 at 02:08 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gudangv1`
--

-- --------------------------------------------------------

--
-- Table structure for table `awalan_id_barang`
--

CREATE TABLE `awalan_id_barang` (
  `id` int(11) NOT NULL,
  `kode_awalan` varchar(50) DEFAULT NULL,
  `deskripsi_awalan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `awalan_id_barang`
--

INSERT INTO `awalan_id_barang` (`id`, `kode_awalan`, `deskripsi_awalan`) VALUES
(1, 'DNON', 'ONT'),
(2, 'DNRTR', 'ROUTER '),
(3, 'DNCVT', 'CONVERTER'),
(4, 'DNSWT', 'SWITCH hub ETC'),
(5, 'DNPTL', 'PIGTAIL'),
(6, 'DNLA', 'LAN'),
(7, 'DNPS', 'PROTECTOR SLEAVE '),
(8, 'DNDC', 'DROP CORE'),
(9, 'DNFIG', 'FIGURE 8'),
(10, 'DNODP', 'ODP'),
(11, 'DN JC ', 'JOINT CLOSURE'),
(12, 'DNRSO', 'RATIO SPLITER'),
(13, 'DNSPLT', 'SPLITER '),
(14, 'DNSPLTB', 'SPLITER BOX '),
(15, 'DNCTR ', 'KONEKTOR ex PAZ,rj45 dll'),
(16, 'DNADPT', 'ADAPTOR 12V'),
(18, 'DNADPT2', 'ADAPTOR 5V'),
(19, 'DNADPT3', 'ADAPTOR 9V'),
(20, 'DNADPT4', 'ADAPTOR 24V'),
(21, 'DNSFP', 'SFP'),
(22, 'DNPTC', 'PATHCORE'),
(23, 'DNCLV', 'CLEAVER'),
(24, 'DNSTRP', 'STRIPER'),
(25, 'DNTRNG', 'STRIPING'),
(26, 'DNTG', 'TANG APA AJA '),
(27, 'DNKU', 'KABEL ARMOR etc'),
(28, 'DNATN', 'ANTENA'),
(29, 'DNACS', 'AKSESORIS SOLASI , DOUBLE TAPE KLEM etc'),
(30, 'DNMKT', 'MKROTIK'),
(31, 'DNOTR', 'OPM&OTDR'),
(32, 'DNKTR', 'CUTTER'),
(34, 'DNTGA', 'TANGGA'),
(35, 'DNPC', 'PERANGKAT KOMPUTER'),
(36, 'DNTNG', 'TIANG'),
(37, 'DNOTB', 'OTB'),
(38, 'DNAK', 'ACCU , BATREY VYRLA etc'),
(39, 'DNROS', 'ROSET'),
(40, 'DNTGC', 'TANG CRIMPING');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `qc_status` enum('Pending','Approved','Rejected') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_keluar` int(11) NOT NULL,
  `id_barang` varchar(255) DEFAULT NULL,
  `nama_teknisi` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `mac_address` varchar(100) DEFAULT NULL,
  `tanggal_keluar` datetime DEFAULT NULL,
  `bulan_keluar` int(11) DEFAULT NULL,
  `tahun_keluar` int(11) DEFAULT NULL,
  `penggunaan` varchar(255) DEFAULT NULL,
  `petugas_admin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_keluar`, `id_barang`, `nama_teknisi`, `keterangan`, `mac_address`, `tanggal_keluar`, `bulan_keluar`, `tahun_keluar`, `penggunaan`, `petugas_admin`) VALUES
(5, 'DNONDNONONU1234', 'COBA', 'GOOD', 'DNONDNONONU1234', '2024-10-18 00:00:00', NULL, NULL, NULL, NULL),
(13, '', 'BAGONG', 'BLA BLA BLA', NULL, '2024-10-19 00:00:00', NULL, NULL, 'UPDATE', 'ANNTAA'),
(16, 'TESTING', 'TESTING', 'TESTING', NULL, '2024-10-20 00:00:00', NULL, NULL, 'TESTING', 'TESTING'),
(19, 'DNON8999908450906', 'COBA', 'ENTAH', NULL, '2024-10-20 03:23:16', NULL, NULL, 'APA AJA', 'ANNTAA');

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk_gudang`
--

CREATE TABLE `barang_masuk_gudang` (
  `id_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `tipe_barang` varchar(50) DEFAULT NULL,
  `mac_address` varchar(50) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `satuan_barang` varchar(20) DEFAULT NULL,
  `nama_toko` varchar(100) DEFAULT NULL,
  `ekspedisi` varchar(100) DEFAULT NULL,
  `belanja_via` varchar(50) DEFAULT NULL,
  `siapa_order` varchar(100) DEFAULT NULL,
  `petugas_qc` varchar(100) DEFAULT NULL,
  `tanggal_order` date DEFAULT NULL,
  `tanggal_datang` date DEFAULT NULL,
  `tanggal_qc` date DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_masuk_gudang`
--

INSERT INTO `barang_masuk_gudang` (`id_barang`, `nama_barang`, `tipe_barang`, `mac_address`, `stok`, `satuan_barang`, `nama_toko`, `ekspedisi`, `belanja_via`, `siapa_order`, `petugas_qc`, `tanggal_order`, `tanggal_datang`, `tanggal_qc`, `keterangan`) VALUES
('DNON8999908450906', 'ONT ZTE V5', 'MODEM', '8999908450906', 0, 'Unit', 'SUGIK', 'SENDIRI', 'Offline', 'DEVIES', 'ANANTA', '2024-10-19', '2024-10-19', '2024-10-19', 'LOLOS');

-- --------------------------------------------------------

--
-- Table structure for table `barang_tidak_jadi_keluar`
--

CREATE TABLE `barang_tidak_jadi_keluar` (
  `id` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `mac_address` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `tanggal_keputusan` date DEFAULT curdate(),
  `alasan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_tidak_jadi_keluar`
--

INSERT INTO `barang_tidak_jadi_keluar` (`id`, `id_barang`, `mac_address`, `keterangan`, `tanggal_keputusan`, `alasan`) VALUES
(1, 'DNONDNONONU1234', 'BLABLBA', 'TEST', '2024-10-18', NULL),
(2, 'DNONCOBALAGI', NULL, NULL, '2024-10-19', 'Tidak Jadi DI pakai');

-- --------------------------------------------------------

--
-- Table structure for table `gudang`
--

CREATE TABLE `gudang` (
  `id_gudang` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `tipe_barang` varchar(255) NOT NULL,
  `total_stok` int(11) NOT NULL,
  `petugas_gudang` varchar(255) DEFAULT NULL,
  `petugas_qc` varchar(255) DEFAULT NULL,
  `petugas_admin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `tipe_barang` varchar(255) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `satuan_barang` varchar(50) DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `nama_toko` varchar(255) DEFAULT NULL,
  `ekspedisi` varchar(255) DEFAULT NULL,
  `belanja_via` varchar(50) DEFAULT NULL,
  `tanggal_order` date DEFAULT NULL,
  `tanggal_datang` date DEFAULT NULL,
  `siapa_order` varchar(255) DEFAULT NULL,
  `petugas_qc` varchar(255) DEFAULT NULL,
  `qc_status` varchar(50) DEFAULT NULL,
  `alasan_undo_qc` varchar(255) DEFAULT NULL,
  `retur_status` varchar(50) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `mac_address` varchar(100) DEFAULT NULL,
  `keterangan_qc` text DEFAULT NULL,
  `petugas_gudang` varchar(255) NOT NULL,
  `tanggal_qc` date DEFAULT NULL,
  `petugas_order` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id_barang`, `nama_barang`, `tipe_barang`, `stok`, `satuan_barang`, `barcode`, `nama_toko`, `ekspedisi`, `belanja_via`, `tanggal_order`, `tanggal_datang`, `siapa_order`, `petugas_qc`, `qc_status`, `alasan_undo_qc`, `retur_status`, `keterangan`, `mac_address`, `keterangan_qc`, `petugas_gudang`, `tanggal_qc`, `petugas_order`) VALUES
('DNON655240306035', 'ONT V46', 'MODEM', 1, 'Unit', NULL, 'SUGIK', 'SENDIRI', 'Offline', '2024-10-19', '2024-10-19', 'ANANTA', 'ANANTA', 'Retur', 'COBA', NULL, 'BAGUSS', 'MAC655240306035', NULL, '', '2024-10-19', NULL),
('DNON8999908450906', 'ONT ZTE V5', 'MODEM', 1, 'Unit', NULL, 'SUGIK', 'SENDIRI', 'Offline', '2024-10-19', '2024-10-19', 'DEVIES', 'ANANTA', 'Selesai QC', NULL, NULL, 'LOLOS', '8999908450906', NULL, '', '2024-10-19', NULL),
('DNON8999909096004', 'ONT MODEM ZTE 78', 'MODEM', 1, 'Unit', NULL, 'SUGIK', 'SENDIRI', 'Offline', '2024-10-19', '2024-10-19', 'DEVIES', 'ANANTA', 'Selesai QC', NULL, NULL, 'LOLOS', '8999909096004', NULL, '', '2024-10-19', NULL),
('DNONCOBALAGI', 'COBALAGI1234', 'MODEM', 1, 'Unit', NULL, 'SUGIK', 'SENDIRI', 'Offline', '2024-10-19', '2024-10-19', 'DEVIES', 'ANANTA', 'Selesai QC', NULL, NULL, 'BAIK', '1', NULL, '', '2024-10-19', NULL),
('DNONDNONDNONONU1234', 'ONT ZTE V5', 'MODEM', 1, 'Unit', NULL, 'SUGIK', 'SENDIRI', 'Online', '2024-10-19', '2024-10-19', 'DEVIES', 'ANANTA', 'Selesai QC', NULL, NULL, 'BAIK', '2', NULL, '', '2024-10-19', NULL),
('DNONONU1234', 'ONU123456', 'MODEM', 1, 'Unit', NULL, 'SUGIK', 'SENDIRI', 'Offline', '2024-10-19', '2024-10-19', 'DEVIES', 'ANANTA', 'Selesai QC', NULL, NULL, 'BAIK', '3', NULL, '', '2024-10-19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_barang`
--

CREATE TABLE `order_barang` (
  `id` int(11) NOT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `jumlah_order` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `qc_lolos`
--

CREATE TABLE `qc_lolos` (
  `id_qc` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `tipe_barang` varchar(255) NOT NULL,
  `total_stok` int(11) NOT NULL,
  `petugas_qc` varchar(255) DEFAULT NULL,
  `tanggal_qc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `qc_tidak_lolos`
--

CREATE TABLE `qc_tidak_lolos` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `mac_address` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `tanggal_qc` date DEFAULT NULL,
  `petugas_qc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `satuan_barang`
--

CREATE TABLE `satuan_barang` (
  `id` int(11) NOT NULL,
  `nama_satuan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `satuan_barang`
--

INSERT INTO `satuan_barang` (`id`, `nama_satuan`) VALUES
(7, 'DUS'),
(11, 'Hasbel'),
(2, 'METER'),
(6, 'PAK'),
(4, 'Pcs'),
(3, 'ROL'),
(5, 'Unit');

-- --------------------------------------------------------

--
-- Table structure for table `stok_gudang`
--

CREATE TABLE `stok_gudang` (
  `id_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `satuan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tipe_barang`
--

CREATE TABLE `tipe_barang` (
  `id` int(11) NOT NULL,
  `nama_tipe` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipe_barang`
--

INSERT INTO `tipe_barang` (`id`, `nama_tipe`) VALUES
(5, 'CONVERTER'),
(2, 'KABEL'),
(3, 'MODEM'),
(1, 'PIGTAIL'),
(4, 'ROUTER');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('administrator','kepala_gudang','petugas_qc','admin_gudang') DEFAULT NULL,
  `izin_akses` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `izin_akses`) VALUES
(2, 'ananta', '$2y$10$TrfaVX7hdHpzdGp0P8HLeutDDpTSjjPH9zth.alabBh0WNud4mwJy', 'administrator', NULL),
(8, 'coba-admin-gudang', '$2y$10$NAbIAU/sBUhlhGWQ/qmc1u42S77SvuzNEOHgpzIJJLyawWy1UWxga', 'admin_gudang', NULL),
(9, 'coba-kepala-gudang', '$2y$10$Nfqa0fH37ehLbGHDAhq5k.P6Ht43cwxye34uOteCXnJsscWYlCrA2', 'kepala_gudang', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `awalan_id_barang`
--
ALTER TABLE `awalan_id_barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_awalan` (`kode_awalan`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_keluar`);

--
-- Indexes for table `barang_masuk_gudang`
--
ALTER TABLE `barang_masuk_gudang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `barang_tidak_jadi_keluar`
--
ALTER TABLE `barang_tidak_jadi_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`id_gudang`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `order_barang`
--
ALTER TABLE `order_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qc_lolos`
--
ALTER TABLE `qc_lolos`
  ADD PRIMARY KEY (`id_qc`);

--
-- Indexes for table `qc_tidak_lolos`
--
ALTER TABLE `qc_tidak_lolos`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `satuan_barang`
--
ALTER TABLE `satuan_barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_satuan` (`nama_satuan`);

--
-- Indexes for table `stok_gudang`
--
ALTER TABLE `stok_gudang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tipe_barang`
--
ALTER TABLE `tipe_barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_tipe` (`nama_tipe`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `awalan_id_barang`
--
ALTER TABLE `awalan_id_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `barang_tidak_jadi_keluar`
--
ALTER TABLE `barang_tidak_jadi_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gudang`
--
ALTER TABLE `gudang`
  MODIFY `id_gudang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_barang`
--
ALTER TABLE `order_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qc_lolos`
--
ALTER TABLE `qc_lolos`
  MODIFY `id_qc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qc_tidak_lolos`
--
ALTER TABLE `qc_tidak_lolos`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `satuan_barang`
--
ALTER TABLE `satuan_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tipe_barang`
--
ALTER TABLE `tipe_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
