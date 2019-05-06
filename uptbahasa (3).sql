-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Bulan Mei 2019 pada 12.20
-- Versi server: 10.1.35-MariaDB
-- Versi PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uptbahasa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog`
--

CREATE TABLE `blog` (
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `created_date` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `blog`
--

INSERT INTO `blog` (`name`, `description`, `created_date`) VALUES
('TechArise Team', 'Demo text', '1524380830');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_images`
--

CREATE TABLE `tbl_images` (
  `id` int(11) NOT NULL,
  `nama_file` varchar(255) NOT NULL,
  `userId` int(4) NOT NULL,
  `status` int(4) NOT NULL,
  `regNum` varchar(15) CHARACTER SET latin1 NOT NULL,
  `dateReg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `filefoto` text NOT NULL,
  `comment` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tbl_images`
--

INSERT INTO `tbl_images` (`id`, `nama_file`, `userId`, `status`, `regNum`, `dateReg`, `filefoto`, `comment`) VALUES
(39, 'Andi', 21, 1, '0605190001', '2019-05-06 08:51:17', '54636f44-df41-44a7-80fa-c32e0ee253677.png', 'Gambar Blur, Mohon re-Upload');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `jurusanId` int(4) NOT NULL,
  `nJurusan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`jurusanId`, `nJurusan`) VALUES
(1, 'Sains'),
(2, 'Teknologi Produksi, Industri, dan Informasi'),
(3, 'Teknologi Infrastruktur dan Kewilayahan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_last_login`
--

CREATE TABLE `tbl_last_login` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `sessionData` varchar(2048) NOT NULL,
  `machineIp` varchar(1024) NOT NULL,
  `userAgent` varchar(128) NOT NULL,
  `agentString` varchar(1024) NOT NULL,
  `platform` varchar(128) NOT NULL,
  `createdDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tbl_last_login`
--

INSERT INTO `tbl_last_login` (`id`, `userId`, `sessionData`, `machineIp`, `userAgent`, `agentString`, `platform`, `createdDtm`) VALUES
(1, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-08 15:20:42'),
(2, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-08 15:25:27'),
(3, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-08 16:00:20'),
(4, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 04:05:31'),
(5, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 05:12:19'),
(6, 10, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi A\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 05:14:43'),
(7, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 06:03:39'),
(8, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 06:10:11'),
(9, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 07:51:17'),
(10, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 08:15:12'),
(11, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 08:22:39'),
(12, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 08:55:32'),
(13, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 09:12:44'),
(14, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 09:13:14'),
(15, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 10:41:36'),
(16, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 10:43:59'),
(17, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 10:45:06'),
(18, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 10:49:24'),
(19, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 11:51:02'),
(20, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 12:01:28'),
(21, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'Windows 10', '2019-04-09 12:03:52'),
(22, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-22 09:25:53'),
(23, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-22 09:36:11'),
(24, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-22 13:21:27'),
(25, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-22 13:29:18'),
(26, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-22 16:09:22'),
(27, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-22 16:10:29'),
(28, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-22 16:10:29'),
(29, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-22 16:12:29'),
(30, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-26 08:02:06'),
(31, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-28 00:56:33'),
(32, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-28 01:49:28'),
(33, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-28 01:55:02'),
(34, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-28 15:37:05'),
(35, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-28 18:07:38'),
(36, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-28 18:25:08'),
(37, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-28 19:05:17'),
(38, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-28 19:13:42'),
(39, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-28 19:13:52'),
(40, 9, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-28 20:54:17'),
(41, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-28 20:54:55'),
(42, 11, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-29 05:54:46'),
(43, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 06:21:33'),
(44, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 06:22:19'),
(45, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 06:29:27'),
(46, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 07:03:52'),
(47, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 07:17:14'),
(48, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 07:20:20'),
(49, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 07:20:30'),
(50, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 07:28:12'),
(51, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 07:32:16'),
(52, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 07:34:57'),
(53, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 07:39:49'),
(54, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 07:40:45'),
(55, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 08:20:42'),
(56, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 08:23:58'),
(57, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 08:24:09'),
(58, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 08:35:46'),
(59, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 09:58:05'),
(60, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:03:54'),
(61, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:05:31'),
(62, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:06:55'),
(63, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:08:11'),
(64, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:28:18'),
(65, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:29:54'),
(66, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:30:22'),
(67, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:31:28'),
(68, 17, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:39:40'),
(69, 17, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:40:53'),
(70, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:44:15'),
(71, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:47:24'),
(72, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:48:56'),
(73, 16, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-04-30 10:53:40'),
(74, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 06:09:39'),
(75, 21, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 07:19:23'),
(76, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 07:23:17'),
(77, 21, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 08:03:01'),
(78, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 09:06:03'),
(79, 21, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 09:18:47'),
(80, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 09:19:08'),
(81, 21, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 10:24:46'),
(82, 21, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 11:05:34'),
(83, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 11:21:53'),
(84, 21, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 11:22:07'),
(85, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 12:25:15'),
(86, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 12:33:11'),
(87, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 12:38:30'),
(88, 21, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 12:54:51'),
(89, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 13:49:45'),
(90, 21, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 13:50:42'),
(91, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 13:58:54'),
(92, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 14:56:00'),
(93, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 14:59:57'),
(94, 21, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 15:00:56'),
(95, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 15:02:29'),
(96, 21, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 15:03:29'),
(97, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 15:45:47'),
(98, 21, '{\"role\":\"3\",\"roleText\":\"Mahasiswa\",\"name\":\"Andi Ariyandi\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 15:50:25'),
(99, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Admin\"}', '::1', 'Chrome 73.0.3683.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'Windows 10', '2019-05-06 15:51:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_prodi`
--

CREATE TABLE `tbl_prodi` (
  `prodiId` int(11) NOT NULL,
  `nProdi` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_prodi`
--

INSERT INTO `tbl_prodi` (`prodiId`, `nProdi`) VALUES
(1, 'Arsitektur Lanskap'),
(2, 'Biologi'),
(3, 'Desain Komunikasi Visual'),
(4, 'Farmasi'),
(5, 'Fisika'),
(6, 'Kimia'),
(7, 'Matematika'),
(8, 'Perencanaan Wilayah Kota'),
(9, 'Sains Atmosfer dan Keplanetan'),
(10, 'Sistem Energi'),
(11, 'Teknik Arsitektur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_reset_password`
--

CREATE TABLE `tbl_reset_password` (
  `id` bigint(20) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(32) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` bigint(20) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_reset_password`
--

INSERT INTO `tbl_reset_password` (`id`, `email`, `activation_id`, `agent`, `client_ip`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES
(1, 'andi@mail.com', 'Wp0QGTloikqsN9g', 'Chrome 73.0.3683.86', '::1', 0, 1, '2019-04-09 03:14:10', NULL, NULL),
(2, 'andi@mail.com', 'xFKkB2tIQ9yTvDp', 'Chrome 73.0.3683.86', '::1', 0, 1, '2019-04-09 03:14:59', NULL, NULL),
(3, 'mail@mail.com', 'boYSj4EXJNvF5y1', 'Chrome 73.0.3683.86', '::1', 0, 1, '2019-04-09 03:17:45', NULL, NULL),
(4, 'andi@mail.com', 'wi1I47pVJDexv80', 'Chrome 73.0.3683.86', '::1', 0, 1, '2019-04-09 03:17:54', NULL, NULL),
(5, 'andi@mail.com', 'nHGjPwDXsAt1Km2', 'Chrome 73.0.3683.103', '::1', 0, 1, '2019-05-06 02:16:32', NULL, NULL),
(6, 'andi@mail.com', 'g1VLKDux9FnGOC8', 'Chrome 73.0.3683.103', '::1', 0, 1, '2019-05-06 02:18:15', NULL, NULL),
(7, 'andi@mail.com', 'SUmjvGg5AKT79Dn', 'Chrome 73.0.3683.103', '::1', 0, 1, '2019-05-06 02:18:19', NULL, NULL),
(8, 'andi@mail.com', 'xyfAvDzVu5EIXor', 'Chrome 73.0.3683.103', '::1', 0, 1, '2019-05-06 02:19:04', NULL, NULL),
(9, 'andi@mail.com', 'pgyf8PMQ9W76kZD', 'Chrome 73.0.3683.103', '::1', 0, 1, '2019-05-06 02:20:20', NULL, NULL),
(10, 'andi@mail.com', '7emMEAojYCgKn36', 'Chrome 73.0.3683.103', '::1', 0, 1, '2019-05-06 02:20:29', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `roleId` tinyint(4) NOT NULL COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tbl_roles`
--

INSERT INTO `tbl_roles` (`roleId`, `role`) VALUES
(1, 'System Administrator'),
(3, 'Mahasiswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_uploads`
--

CREATE TABLE `tbl_uploads` (
  `id` int(11) NOT NULL,
  `userId` int(4) NOT NULL,
  `status` int(4) NOT NULL,
  `regNum` int(11) NOT NULL,
  `tgl_upload` date NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_size` int(20) NOT NULL,
  `file_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userId` int(11) NOT NULL,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `nim` int(15) DEFAULT NULL,
  `prodi` varchar(30) DEFAULT NULL,
  `jurusan` varchar(30) DEFAULT NULL,
  `angkatan` int(15) DEFAULT NULL,
  `tmptLahir` varchar(30) DEFAULT NULL,
  `tglLahir` date DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tbl_users`
--

INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `nim`, `prodi`, `jurusan`, `angkatan`, `tmptLahir`, `tglLahir`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES
(30, 'hamzah@gmail.com', '$2y$10$mykVZK8OsBR4LiNWJCrYfOfniVgKIiELQZ6ERDjPpSTIXTtf/AiSe', 'M.hamzah', 14116124, 'Teknik Informatika', 'Teknologi Produksi, Industri, ', 2016, 'jakarta', '1997-02-22', '1234567891', 3, 0, 0, '2019-05-06 10:38:48', NULL, NULL),
(29, 'ismail@gmail.com', '$2y$10$vVlgPaGt5wYvvuI1hmXkheMkti3wxdR.ozw4.4baJmfhduGKlPnL6', 'Ismail Adhan', 14116113, 'Teknik Informatika', 'Teknologi Produksi, Industri, ', 2016, 'Washington D.C', '1999-09-09', '082122425262', 3, 0, 0, '2019-05-06 10:37:04', NULL, NULL),
(1, 'admin@admin.com', '$2y$10$97SG1aBeQYizUfmmeqPFdOySbv/oDMdiBeJhyprezpmdRM3sE8NmG', 'Admin', 0, '', '', 0, '', '0000-00-00', '1111111111', 1, 0, 1, '2019-04-09 01:10:00', NULL, NULL),
(21, 'andi@mail.com', '$2y$10$9xZNoDO6p5nvuO6tG7LleuFF4tBiJc1dIH0819kdHDByZ0xUga/bq', 'Andi Ariyandi', 14116133, 'Teknik Kimia', 'Sains', 2016, 'Way Galih', '1998-03-15', '09646476788', 3, 0, 0, '2019-05-06 01:51:18', 1, '2019-05-06 03:02:06'),
(28, 'angela@gmail.com', '$2y$10$iQ/USUfmJ4RaTBSl5JNZmuhUdFfdo.6F0HO.fD0THlRLO17.5sUCm', 'Angela Merici', 14116035, 'Teknik Informatika', 'Teknologi Produksi, Industri, ', 2016, 'Lampung', '1999-08-27', '0821222324252', 3, 0, 0, '2019-05-06 10:34:41', NULL, NULL),
(26, 'bela@gmail.com', '$2y$10$zhNHQzARxk8Da.Td8RAt0O5p0yXVD.Y9.VTEfBfm8lSqrFxMho5va', 'Bela Sukama', 14116144, 'Teknik Informatika', 'Teknologi Produksi, Industri, ', 2016, 'Way Galih', '1998-02-10', '0834567890', 3, 0, 0, '2019-05-06 07:38:20', NULL, NULL),
(27, 'mamasbri@gmail.com', '$2y$10$7uI7ns1cxCGagYTkjS6vKe4YkoNgzvCSW36iIRtjksMSWAdpHXSxe', 'Brian Adam', 14116014, 'Teknik Informatika', 'Teknologi Produksi, Industri, ', 2016, 'Medan', '1998-08-28', '08123123123', 3, 0, 0, '2019-05-06 10:31:53', NULL, NULL),
(31, 'wahyudi@gmail.com', '$2y$10$pKz0FXGT1z9hwcCasS18BuNnDWFckO3TLCAaUJKGXlqKYT6MMpamW', 'M.wahyudi', 14116013, 'Teknik Informatika', 'Teknologi Produksi, Industri, ', 2016, 'Way Galih', '1997-07-27', '1234567890', 3, 0, 0, '2019-05-06 10:41:58', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indeks untuk tabel `tbl_images`
--
ALTER TABLE `tbl_images`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`jurusanId`);

--
-- Indeks untuk tabel `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_prodi`
--
ALTER TABLE `tbl_prodi`
  ADD PRIMARY KEY (`prodiId`);

--
-- Indeks untuk tabel `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`roleId`);

--
-- Indeks untuk tabel `tbl_uploads`
--
ALTER TABLE `tbl_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_images`
--
ALTER TABLE `tbl_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  MODIFY `jurusanId` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT untuk tabel `tbl_prodi`
--
ALTER TABLE `tbl_prodi`
  MODIFY `prodiId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
