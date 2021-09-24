-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 30 Nov 2020 pada 04.08
-- Versi Server: 5.7.17-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jeniskulit`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`username`, `password`, `nama_lengkap`) VALUES
('admin1', '202cb962ac59075b964b07152d234b70', 'Administrator Satu'),
('admin2', 'c84258e9c39059a89ab77d846ddab909', 'Admin Dua'),
('satu', 'f97c5d29941bfb1b2fdab0874906ab82', 'satu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_basispengetahuan`
--

CREATE TABLE `tb_basispengetahuan` (
  `kd_pengetahuan` int(11) NOT NULL,
  `kd_jeniskulit` int(11) NOT NULL,
  `kd_gejala` int(11) NOT NULL,
  `nilai_mb` double(11,1) NOT NULL,
  `nilai_md` double(11,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_basispengetahuan`
--

INSERT INTO `tb_basispengetahuan` (`kd_pengetahuan`, `kd_jeniskulit`, `kd_gejala`, `nilai_mb`, `nilai_md`) VALUES
(1, 2, 2, 0.8, 0.2),
(2, 2, 1, 0.8, 0.2),
(3, 2, 3, 0.8, 0.2),
(4, 3, 4, 0.8, 0.2),
(5, 3, 5, 0.8, 0.2),
(6, 3, 6, 0.8, 0.2),
(7, 2, 6, 0.8, 0.2),
(8, 3, 7, 0.8, 0.2),
(9, 3, 8, 0.8, 0.2),
(10, 4, 9, 0.8, 0.2),
(11, 4, 10, 0.8, 0.2),
(12, 7, 10, 0.8, 0.2),
(13, 4, 11, 0.8, 0.2),
(14, 4, 12, 0.8, 0.2),
(15, 4, 13, 0.8, 0.2),
(16, 4, 14, 0.8, 0.2),
(17, 5, 15, 0.8, 0.2),
(18, 5, 16, 0.8, 0.2),
(19, 6, 17, 0.8, 0.2),
(20, 6, 18, 0.8, 0.2),
(21, 6, 19, 0.8, 0.2),
(22, 6, 20, 0.8, 0.4),
(23, 7, 21, 0.8, 0.2),
(24, 7, 22, 0.8, 0.2),
(25, 7, 23, 0.8, 0.2),
(26, 7, 24, 0.8, 0.2),
(29, 3, 20, 0.8, 0.4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_diagnosa`
--

CREATE TABLE `tb_diagnosa` (
  `id_diagnosa` int(11) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `jenis_kulit` text NOT NULL,
  `nama_gejala` text NOT NULL,
  `hasil_id` int(11) NOT NULL,
  `hasil_nilai` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_diagnosa`
--

INSERT INTO `tb_diagnosa` (`id_diagnosa`, `tanggal`, `jenis_kulit`, `nama_gejala`, `hasil_id`, `hasil_nilai`) VALUES
(1, '2020-07-20 23:10:28', '', 'a:0:{}', 0, ''),
(2, '2020-07-20 23:10:51', '', 'a:0:{}', 0, ''),
(3, '2020-07-20 23:14:26', '', 'a:0:{}', 0, ''),
(4, '2020-07-20 23:20:12', '', 'a:0:{}', 0, ''),
(5, '2020-07-20 23:35:01', 'a:0:{}', 'a:0:{}', 0, ''),
(6, '2020-07-20 23:39:20', 'a:0:{}', 'a:0:{}', 0, ''),
(7, '2020-07-21 11:05:55', 'a:0:{}', 'a:0:{}', 0, ''),
(8, '2020-07-21 22:18:57', 'a:1:{i:2;s:6:\"0.7737\";}', 'a:0:{}', 2, '0.7737'),
(9, '2020-07-21 22:21:35', 'a:1:{i:2;s:6:\"0.7737\";}', 'a:0:{}', 2, '0.7737'),
(10, '2020-07-21 22:22:40', 'a:2:{i:2;s:6:\"0.8642\";i:3;s:6:\"0.3200\";}', 'a:4:{i:1;s:1:\"1\";i:2;s:1:\"2\";i:3;s:1:\"3\";i:6;s:1:\"2\";}', 2, '0.8642'),
(11, '2020-07-21 22:23:54', 'a:1:{i:2;s:6:\"0.8099\";}', 'a:8:{i:1;s:1:\"4\";i:2;s:1:\"2\";i:3;s:1:\"3\";i:4;s:1:\"7\";i:5;s:1:\"8\";i:6;s:1:\"2\";i:7;s:1:\"5\";i:8;s:1:\"8\";}', 2, '0.8099'),
(12, '2020-07-21 22:26:08', 'a:2:{i:2;s:6:\"0.7120\";i:3;s:6:\"0.3600\";}', 'a:4:{i:1;s:1:\"5\";i:3;s:1:\"1\";i:6;s:1:\"1\";i:7;s:1:\"5\";}', 2, '0.7120'),
(13, '2020-07-21 22:26:40', 'a:2:{i:7;s:6:\"0.2400\";i:4;s:6:\"0.2400\";}', 'a:1:{i:10;s:1:\"3\";}', 7, '0.2400'),
(14, '2020-07-21 22:27:19', 'a:0:{}', 'a:1:{i:6;s:1:\"6\";}', 0, ''),
(15, '2020-07-21 22:27:38', 'a:2:{i:3;s:6:\"0.1600\";i:2;s:6:\"0.1600\";}', 'a:1:{i:6;s:1:\"4\";}', 3, '0.1600'),
(16, '2020-07-21 22:28:07', 'a:2:{i:7;s:6:\"0.4000\";i:4;s:6:\"0.4000\";}', 'a:1:{i:10;s:1:\"1\";}', 7, '0.4000'),
(17, '2020-07-21 22:29:21', 'a:2:{i:3;s:6:\"0.2400\";i:2;s:6:\"0.2400\";}', 'a:1:{i:6;s:1:\"3\";}', 3, '0.2400'),
(18, '2020-07-21 22:29:37', 'a:2:{i:3;s:6:\"0.3200\";i:2;s:6:\"0.3200\";}', 'a:1:{i:6;s:1:\"2\";}', 3, '0.3200'),
(19, '2020-07-21 22:29:47', 'a:2:{i:3;s:6:\"0.4000\";i:2;s:6:\"0.4000\";}', 'a:1:{i:6;s:1:\"1\";}', 3, '0.4000'),
(20, '2020-07-21 22:30:10', 'a:0:{}', 'a:1:{i:6;s:1:\"5\";}', 0, ''),
(21, '2020-07-21 22:31:36', 'a:2:{i:7;s:6:\"0.8264\";i:4;s:6:\"0.1600\";}', 'a:4:{i:10;s:1:\"4\";i:22;s:1:\"2\";i:23;s:1:\"3\";i:24;s:1:\"1\";}', 7, '0.8264'),
(22, '2020-07-21 22:44:13', 'a:1:{i:5;s:6:\"0.7264\";}', 'a:2:{i:15;s:1:\"2\";i:16;s:1:\"3\";}', 5, '0.7264'),
(23, '2020-07-21 22:52:08', 'a:1:{i:5;s:6:\"0.8800\";}', 'a:2:{i:15;s:1:\"1\";i:16;s:1:\"1\";}', 5, '0.8800'),
(24, '2020-07-21 23:21:48', 'a:3:{i:3;s:6:\"0.4288\";i:6;s:6:\"0.3200\";i:2;s:6:\"0.1600\";}', 'a:2:{i:6;s:1:\"4\";i:20;s:1:\"2\";}', 3, '0.4288'),
(25, '2020-07-21 23:23:31', 'a:2:{i:2;s:6:\"0.4288\";i:3;s:6:\"0.3200\";}', 'a:2:{i:1;s:1:\"4\";i:6;s:1:\"2\";}', 2, '0.4288'),
(26, '2020-07-21 23:24:10', 'a:2:{i:2;s:6:\"0.2944\";i:3;s:6:\"0.1600\";}', 'a:2:{i:1;s:1:\"4\";i:6;s:1:\"4\";}', 2, '0.2944'),
(27, '2020-07-21 23:24:32', 'a:2:{i:3;s:6:\"0.4000\";i:2;s:6:\"0.2400\";}', 'a:2:{i:1;s:1:\"6\";i:6;s:1:\"1\";}', 3, '0.4000'),
(28, '2020-07-21 23:25:49', 'a:2:{i:7;s:6:\"0.5632\";i:4;s:6:\"0.1600\";}', 'a:2:{i:10;s:1:\"4\";i:24;s:1:\"2\";}', 7, '0.5632'),
(29, '2020-07-23 21:59:06', 'a:2:{i:7;s:6:\"0.7280\";i:4;s:6:\"0.3200\";}', 'a:2:{i:10;s:1:\"2\";i:24;s:1:\"1\";}', 7, '0.7280'),
(30, '2020-07-23 22:10:29', 'a:2:{i:3;s:6:\"0.4288\";i:2;s:6:\"0.3200\";}', 'a:2:{i:5;s:1:\"4\";i:6;s:1:\"2\";}', 3, '0.4288'),
(31, '2020-09-27 18:28:27', 'a:1:{i:8;s:6:\"0.4000\";}', 'a:1:{i:26;s:1:\"1\";}', 8, '0.4000'),
(32, '2020-09-27 21:14:53', 'a:2:{i:5;s:6:\"0.6000\";i:3;s:6:\"0.5920\";}', 'a:2:{i:4;s:1:\"2\";i:25;s:1:\"1\";}', 5, '0.6000'),
(33, '2020-09-27 21:26:45', 'a:2:{i:5;s:6:\"0.6000\";i:3;s:6:\"0.5920\";}', 'a:2:{i:4;s:1:\"2\";i:25;s:1:\"1\";}', 5, '0.6000'),
(34, '2020-09-27 21:27:32', 'a:2:{i:5;s:6:\"0.6000\";i:3;s:6:\"0.5920\";}', 'a:2:{i:4;s:1:\"2\";i:25;s:1:\"1\";}', 5, '0.6000'),
(35, '2020-09-27 21:28:32', 'a:2:{i:6;s:6:\"0.9052\";i:3;s:6:\"0.4000\";}', 'a:4:{i:17;s:1:\"1\";i:18;s:1:\"3\";i:19;s:1:\"2\";i:20;s:1:\"1\";}', 6, '0.9052'),
(36, '2020-09-27 21:30:57', 'a:2:{i:6;s:6:\"0.9052\";i:3;s:6:\"0.4000\";}', 'a:4:{i:17;s:1:\"1\";i:18;s:1:\"3\";i:19;s:1:\"2\";i:20;s:1:\"1\";}', 6, '0.9052'),
(37, '2020-09-27 21:32:05', 'a:2:{i:6;s:6:\"0.9052\";i:3;s:6:\"0.4000\";}', 'a:4:{i:17;s:1:\"1\";i:18;s:1:\"3\";i:19;s:1:\"2\";i:20;s:1:\"1\";}', 6, '0.9052'),
(38, '2020-09-27 22:26:48', 'a:2:{i:6;s:6:\"0.9052\";i:3;s:6:\"0.4000\";}', 'a:4:{i:17;s:1:\"1\";i:18;s:1:\"3\";i:19;s:1:\"2\";i:20;s:1:\"1\";}', 6, '0.9052'),
(39, '2020-09-30 13:42:43', 'a:1:{i:2;s:6:\"0.5648\";}', 'a:2:{i:1;s:1:\"2\";i:2;s:1:\"3\";}', 2, '0.5648'),
(40, '2020-09-30 23:18:38', 'a:3:{i:7;s:6:\"0.3600\";i:6;s:6:\"0.3200\";i:3;s:6:\"0.3200\";}', 'a:2:{i:20;s:1:\"2\";i:21;s:1:\"3\";}', 7, '0.3600'),
(41, '2020-09-30 23:22:21', 'a:5:{i:3;s:6:\"0.6072\";i:7;s:6:\"0.4800\";i:5;s:6:\"0.3600\";i:2;s:6:\"0.3200\";i:6;s:6:\"0.2400\";}', 'a:4:{i:6;s:1:\"2\";i:20;s:1:\"3\";i:21;s:1:\"2\";i:25;s:1:\"3\";}', 3, '0.6072'),
(42, '2020-10-01 10:26:20', 'a:0:{}', 'a:0:{}', 0, ''),
(43, '2020-10-08 22:29:07', 'a:3:{i:3;s:6:\"0.8918\";i:5;s:6:\"0.7440\";i:6;s:6:\"0.4800\";}', 'a:4:{i:4;s:1:\"2\";i:16;s:1:\"3\";i:20;s:1:\"2\";i:25;s:1:\"1\";}', 3, '0.8918'),
(44, '2020-10-08 22:36:39', 'a:4:{i:2;s:6:\"0.7920\";i:3;s:6:\"0.6000\";i:6;s:6:\"0.4800\";i:4;s:6:\"0.3600\";}', 'a:4:{i:2;s:1:\"2\";i:6;s:1:\"1\";i:14;s:1:\"3\";i:17;s:1:\"2\";}', 2, '0.7920'),
(45, '2020-10-20 13:12:20', 'a:4:{i:3;s:6:\"0.7920\";i:2;s:6:\"0.6000\";i:6;s:6:\"0.4800\";i:4;s:6:\"0.3600\";}', 'a:4:{i:4;s:1:\"2\";i:6;s:1:\"1\";i:14;s:1:\"3\";i:17;s:1:\"2\";}', 3, '0.7920'),
(46, '2020-10-26 23:27:00', 'a:1:{i:4;s:6:\"0.8988\";}', 'a:4:{i:11;s:1:\"2\";i:12;s:1:\"4\";i:13;s:1:\"1\";i:14;s:1:\"3\";}', 4, '0.8988'),
(47, '2020-10-27 00:15:40', 'a:4:{i:2;s:6:\"0.7920\";i:3;s:6:\"0.6000\";i:6;s:6:\"0.4800\";i:4;s:6:\"0.3600\";}', 'a:4:{i:2;s:1:\"2\";i:6;s:1:\"1\";i:14;s:1:\"3\";i:17;s:1:\"2\";}', 2, '0.7920'),
(48, '2020-10-27 00:17:37', 'a:4:{i:2;s:6:\"0.7920\";i:3;s:6:\"0.6000\";i:6;s:6:\"0.4800\";i:4;s:6:\"0.3600\";}', 'a:4:{i:2;s:1:\"2\";i:6;s:1:\"1\";i:14;s:1:\"3\";i:17;s:1:\"2\";}', 2, '0.7920'),
(49, '2020-10-27 00:18:15', 'a:4:{i:2;s:6:\"0.7920\";i:3;s:6:\"0.6000\";i:6;s:6:\"0.4800\";i:4;s:6:\"0.3600\";}', 'a:4:{i:2;s:1:\"2\";i:6;s:1:\"1\";i:14;s:1:\"3\";i:17;s:1:\"2\";}', 2, '0.7920'),
(50, '2020-11-30 10:51:14', 'a:1:{i:7;s:6:\"0.7296\";}', 'a:2:{i:23;s:1:\"2\";i:24;s:1:\"2\";}', 7, '0.7296');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_gejala`
--

CREATE TABLE `tb_gejala` (
  `kd_gejala` int(11) NOT NULL,
  `nama_gejala` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_gejala`
--

INSERT INTO `tb_gejala` (`kd_gejala`, `nama_gejala`) VALUES
(16, 'Bagian pipi dan sekitar mata baik-baik saja atau terlihat kering, bagian lainnya berminyak'),
(22, 'Banyak komedo (blackhead) atau whitehead'),
(15, 'Berminyak di bagian T-Zone'),
(8, 'Garis atau kerutan sekitar pipi'),
(19, 'Kadang terasa perih dan terbakar'),
(7, 'Kulit cenderung terlihat berkeriput'),
(5, 'Kulit kadang sampai mengelupas'),
(3, 'Kulit kenyal dan lembab'),
(9, 'Kulit mengeluarkan minyak pada semua bagian wajah'),
(4, 'Kulit tampak kasar dan gersang'),
(20, 'Kulit terasa gatal di bagian yang kemerahan'),
(2, 'Kulit terasa lembut dan halus'),
(1, 'Kulit terlihat bercahaya'),
(13, 'Make-up susah melekat dan cepat luntur'),
(24, 'Muncul benjolan berisi cairan atau nanah'),
(10, 'Pori-pori cenderung besar'),
(23, 'Pori-pori tersumbat'),
(6, 'Pori-pori tidak kelihatan (kecil)'),
(17, 'Ruam muncul saat berada pada kondisi cuaca atau suhu tertentu'),
(18, 'Sangat rentan kemerahan akibat reaksi dari bahan kimia yang tidak cocok'),
(12, 'Tekstur kulit terlihat tebal'),
(21, 'Tekstur wajah tidak rata akibat peradangan kecil atau besar'),
(14, 'Tidak mudah timbul kerutan'),
(11, 'Wajah tampak mengkilap');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jeniskulit`
--

CREATE TABLE `tb_jeniskulit` (
  `kd_jeniskulit` int(11) NOT NULL,
  `jenis_kulit` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `solusi` text NOT NULL,
  `gambar` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_jeniskulit`
--

INSERT INTO `tb_jeniskulit` (`kd_jeniskulit`, `jenis_kulit`, `deskripsi`, `solusi`, `gambar`) VALUES
(2, 'Kulit Normal', '<p>Warna kulit normal umumnya merata; teksturnya lembut dan halus. Tidak ada pori-pori yang terlihat jelas, cacat, noda merah, komedo, jerawat, kukul, atau masalah kulit lainnya yang terlihat. Permukaan kulit tidak terlalu berminyak atau kering karena air dan minyaknya seimbang, dan suplai darahnya baik.</p>\r\n\r\n<p>Ini adalah jenis kulit yang paling sempurna yang tidak membutuhkan terlalu banyak perawatan kulit. Anda hanya harus menggunakan pembersih, pelembab, dan tabir surya.</p>\r\n', '<p>Memakai produk perawatan yang mengandung :</p>\r\n\r\n<ol>\r\n	<li>Panthenol</li>\r\n	<li>Alga ekstrak</li>\r\n	<li>Dimethicone</li>\r\n	<li>Hyaluronic acid</li>\r\n</ol>\r\n', 'kulit normal.jpg'),
(3, 'Kulit Kering', '<p>Jenis kulit wajah kering hanya memiliki sedikit kelembapan di lapisan kulit terluar. Kulit kering disebabkan karena kelenjar minyak tidak bisa memproduksi minyak yang cukup sehingga kulit kehilangan kelembapannya. Pada tipe kulit wajah kering, pori-pori dan garis-garis kulit wajah akan terlihat dengan jelas. Selain itu, kulit kering cenderung kasar, bersisik, kemerahan, dan terasa gatal. Kurangnya asupan vitamin A dan B juga menyebabkan kulit kering.</p>\r\n\r\n<p>Penyebab :</p>\r\n\r\n<ol>\r\n	<li>Kurangnya kadar air pada tubuh</li>\r\n	<li>Mandi air panas terlalu lama</li>\r\n	<li>Efek obat-obatan</li>\r\n	<li>Radiasi ultraviolet dari sinar matahari</li>\r\n</ol>\r\n', '<p>Memakai produk perawatan yang mengandung :</p>\r\n\r\n<ol>\r\n	<li>Glycolic Acid</li>\r\n	<li>Lactic Acid</li>\r\n	<li>Ceramides</li>\r\n	<li>Hyaluronic acid</li>\r\n</ol>\r\n\r\n<p>Yang harus dihindari :</p>\r\n\r\n<ol>\r\n	<li>Hindari produk yang mengandung alkohol atau pewangi.</li>\r\n	<li>Hindari terlalu lama mandi dan mencuci muka dengan air hangat.</li>\r\n</ol>\r\n', 'dry_skin_1.jpeg'),
(4, 'Kulit Berminyak', '<p>Jenis kulit wajah berminyak umumnya disebabkan oleh produksi sebum dari kelenjar minyak yang berlebih. Anda mungkin akan mengenali kulit Anda berminyak melalui produksi kelenjar minyak berlebih pada area <em>T-zone</em> (dahi, hidung, dan dahi).</p>\r\n\r\n<p>Penyebab :</p>\r\n\r\n<ol>\r\n	<li>Kelenjar minyak berlebih</li>\r\n	<li>Udara panas dan lembab</li>\r\n	<li>Stres</li>\r\n	<li>Genetik</li>\r\n	<li>Perubahan hormon</li>\r\n</ol>\r\n', '<p>Memakai produk perawatan yang mengandung :</p>\r\n\r\n<ol>\r\n	<li>Glycolic Acid</li>\r\n	<li>Dimethicone</li>\r\n	<li>Hyaluronic Acid</li>\r\n	<li>Niacinamide</li>\r\n	<li>Salycilc Acid</li>\r\n</ol>\r\n\r\n<p>Perawatan :</p>\r\n\r\n<ol>\r\n	<li>Membersihkan kulit wajah menggunakan sabun pembersih dengan kandungan benzoil peroksida, asam salisilat, asam glikolat, atau asam beta hidroksi.</li>\r\n	<li>Gunakan pelembap dengan kandungan bebas minyak.</li>\r\n	<li>Gunakan <em>sunscreen </em>atau tabir surya dengan kandungan bebas minyak. Mengoleskan <em>sunscreen </em>dengan tekstur gel atau berbahan dasar air dapat mengurangi kadar minyak di wajah Anda.</li>\r\n</ol>\r\n', 'oily_skin_x.jpg'),
(5, 'Kulit Kombinasi', '<p>Jenis kulit wajah ini merupakan kombinasi antara tipe kulit wajah kering atau normal di beberapa daerah, termasuk pipi. Sementara, area wajah lainnya akan berminyak, terutama di <em>T-zone</em>. Hal ini disebabkan karena kelenjar minyak tidak merata dalam memproduksi minyak pada wajah</p>\r\n\r\n<p>Penyebab :</p>\r\n\r\n<ol>\r\n	<li>Genetik dan pubertas</li>\r\n	<li>Memakai produk dengan kandungan alcohol dan asam sulfat</li>\r\n	<li>Pori-pori tersumbat dibagian T-Zone</li>\r\n</ol>\r\n', '<p>Memakai produk perawatan yang mengandung :</p>\r\n\r\n<ol>\r\n	<li>Glycolic Acid</li>\r\n	<li>Dimethicone</li>\r\n	<li>Hyaluronic Acid</li>\r\n	<li>BHA</li>\r\n</ol>\r\n\r\n<p>Perawatan :</p>\r\n\r\n<p>Perawatan pada kulit wajah kombinasi memerlukan penanganan yang berbeda. Untuk daerah sekitar pipi maupun mata yang kering, pakailah produk yang mengandung pelembap. Sedangkan untuk area berminyak pada dahi dan hidung, lakukanlah pembersihan secara rutin dan hindari produk yang memiliki banyak kandungan minyak.</p>\r\n', 'oily-and-dry-skin.jpg'),
(6, 'Kulit Sensitif', '<p>Jenis kulit sensitif umumnya sangat peka dan mudah sekali mengalami alergi atau iritasi dan ruam sebagai reaksi terhadap faktor tertentu, seperti lingkungan, makanan, atau penggunaan produk kosmetik. Kulit wajah sensitif mudah terkelupas, gatal, kering, kemerahan, dan terasa perih ketika terjadi kontak dengan berbagai hal yang dapat memicu munculnya gejala kulit sensitif. Beberapa kandungan dalam produk perawatan kulit yang tidak cocok dengan jenis kulit sensitif adalah Oxychloride Bismuth, Sodium Lauryl Sulphate, dan bahan kimia iritan lainnya.</p>\r\n', '<ol>\r\n	<li>Perhatikan kandungan bahan dalam skincare. Produk yang aman untuk kulit wajah sensitif adalah yang kaya akan bahan-bahan antioksidan. Antioksidan dapat membantu meningkatkan perbaikan kulit wajahmu sekaligus menghidrasinya agar tidak mudah kering. Selain antioksidan, skincare dengan kandungan berbahan dasar tanaman juga sangat baik untuk kulit wajah sensitif. Beberapa bahan tanaman yang dapat memberikan efek penenang pada kulit wajah antara lain teh hijau, chamomile, lidah buaya, minyak argan, dan lain-lain. Bahan-bahan tersebut dapat sangat membantu melembabkan kulit sensitif kamu. Ketahui pula beberapa kandungan skincare yang wajib kamu hindari. Beberapa kandungan yang cukup berbahaya untuk kulit sensitif kamu adalah parfum, alcohol, dan essential oil. Parfum dapat memberikan efek sensitif pada kulit, alcohol mampu merusak lapisan pelindung kulit, sementara essential oil berpotensi mengandung alergen.</li>\r\n	<li>Pastikan Kulit Terhidrasi dan Bersihkan Wajah dengan Tepat. Karena kulit wajah sensitif juga cenderung bisa sangat mudah kering, maka kamu harus memastikan untuk menjaga kelembabannya. Salah satu cara yang dapat kamu lakukan adalah menggunakan hydrating cream dengan kandungan ceramides dan niacinamide. Gunakan pelembab dua kali dalam sehari serta manfaatkan hydrating mask untuk kamu pakai seminggu sekali. Saat membersihkan wajah dari makeup yang menempel seharian, kamu juga perlu berhati-hati nih. Kamu pasti akan butuh banyak gerakan menggosok dan mengusap ketika menghapus makeup dan inilah yang berpotensi membuat kulit wajah kamu teriritasi akibat gesekan tersebut. Membersihkan kulit wajah sensitif ada triknya tersendiri, yaitu dengan memilih pembersih wajah dengan bahan dasar balm atau cream. Kalau belakangan ini membersihkan wajah dengan micellar water sedang jadi tren, kamu harus memastikan kapas yang kamu pakai sudah dibasahi dengan cukup agar tidak terlalu keset di wajah.</li>\r\n	<li>Rutin Menggunakan Sun Protection Saat Beraktivitas di Luar. Bagi pemilik kulit wajah sensitif, menggunakan sun protection itu sangat wajib dilakukan. Jadi, pastikan kamu selalu rutin menggunakan sunscreen ketika beraktivitas di luar. Terutama buat kamu para wanita yang menghabiskan banyak waktu di lapangan. Sunscreen untuk kulit wajah sensitif tentu tidak bisa sembarangan ya. Prioritaskan sunscreen yang aman dan tidak menimbulkan breakout di wajah kamu. Catat ya, kamu wajib hindari sunscreen dengan bahan-bahan seperti fragrances, dyes, alcohol, dimethicone, oxybenzone, dan Para-Aminobenzoic Acid (PABA). Tinggalkan chemical sunscreen dan fokuslah untuk menggunakan mineral sunscreen. Biasanya mineral sunscreen punya kandungan zinc oxide dan titanium dioxide. Dua kandungan bahan ini sangat aman dan dijamin tidak akan membuat kulit wajah sensitif kamu teriritasi saat memakainya.</li>\r\n</ol>\r\n', 'WhatsApp Image 2020-06-18 at 00.07.01(2).jpeg'),
(7, 'Kulit Berjerawat', '<p>Jerawat (acne) adalah gangguan pada kulit yang berhubungan dengan produksi minyak (sebum) berlebih. Jerawat terjadi ketika folikel rambut atau tempat tumbuhnya rambut tersumbat oleh minyak dan sel kulit mati. Hal tersebut menyebabkan peradangan serta penyumbatan pada pori-pori kulit. Peradangan ini ditandai dengan munculnya benjolan kecil (yang terkadang berisi nanah) di atas kulit. Gangguan kulit ini dapat terjadi di bagian tubuh dengan kelenjar minyak terbanyak, salah satunya di wajah.</p>\r\n\r\n<p>Penyebab :</p>\r\n\r\n<ol>\r\n	<li>Produksi sebum berlebih, yaitu zat yang diproduksi oleh kelenjar minyak untuk mencegah kulit kering.</li>\r\n	<li>Sumbatan pada folikel rambut oleh campuran sel kulit mati dan sebum.</li>\r\n	<li>Bakteri jenis <em>Propionibacterium acnes</em> yang berkembang, menyumbat folikel rambut, serta menyebabkan peradangan.</li>\r\n	<li>Faktor genetik atau keturunan, jika salah satu orangtua memiliki masalah jerawat,</li>\r\n	<li>Folikel yang tersumbat bisa membengkak dan membentuk komedo putih atau komedo hitam bila terpapar dengan dunia luar. Kondisi tersebut sebaiknya jangan dianggap remeh, karena bisa berkembang menjadi pustula, papula, nodul, atau bahkan kista, apabila terkontaminasi oleh bakteri kulit.</li>\r\n	<li>Hormon, yaitu saat aktivitas hormon androgen berlebih atau saat terjadi perubahan hormon saat masa menstruasi.</li>\r\n	<li>Penggunaan kosmetik yang tidak selalu dapat ditoleransi oleh kulit setiap orang.</li>\r\n	<li>Stres yang dapat memengaruhi gaya hidup seseorang, termasuk dalam pola makan yang dapat memicu jerawat.</li>\r\n</ol>\r\n', '<p>Memakai produk perawatan yang mengandung :</p>\r\n\r\n<ol>\r\n	<li>Retinol, bahan ini digunakan untuk membersihkan pori kulit yang tersumbat. Bahan ini mampu mengeksfoliasi pori kulit yang tertutup dan menimbulkan komedo maupun jerawat. &nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li><em>Benzoyl peroxyde</em>, bahan aktif ini sangat efektif untuk melawan seluruh bentuk jerawat yang ada di kulit. &nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>AHA, bahan ini berguna untuk membersihkan pori kulit yang tersumbat sehingga jerawat akan menghilang dari kulitmu. Namun, seringkali bahan ini menyebabkan purging untuk mengeluarkan seluruh kotoran dalam pori. &nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>BHA, fungsinya kurang lebih sama dengan AHA.Bedanya BHA mampu mempenetrasi pori lebih dalam sehingga efektif untuk komedo <em>white head.</em></li>\r\n</ol>\r\n', 'jerawat.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kondisi`
--

CREATE TABLE `tb_kondisi` (
  `kd_kondisi` int(11) NOT NULL,
  `nama_kondisi` varchar(64) NOT NULL,
  `ket` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_kondisi`
--

INSERT INTO `tb_kondisi` (`kd_kondisi`, `nama_kondisi`, `ket`) VALUES
(1, 'Pasti ya', ''),
(2, 'Hampir pasti ya', ''),
(3, 'Kemungkinan besar ya', ''),
(4, 'Mungkin ya', ''),
(5, 'Tidak tahu', ''),
(6, 'Mungkin tidak', ''),
(7, 'Kemungkinan besar tidak', ''),
(8, 'Hampir pasti tidak', ''),
(9, 'Pasti tidak', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_posting`
--

CREATE TABLE `tb_posting` (
  `kd_posting` int(11) NOT NULL,
  `nama_post` varchar(50) NOT NULL,
  `des_post` text NOT NULL,
  `saran_post` text NOT NULL,
  `gambar` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_posting`
--

INSERT INTO `tb_posting` (`kd_posting`, `nama_post`, `des_post`, `saran_post`, `gambar`) VALUES
(3, 'Kulit Normal', '<p>Warna kulit normal umumnya merata; teksturnya lembut dan halus. Tidak ada pori-pori yang terlihat jelas, cacat, noda merah, komedo, jerawat, kukul, atau masalah kulit lainnya yang terlihat. Permukaan kulit tidak terlalu berminyak atau kering karena air dan minyaknya seimbang, dan suplai darahnya baik.</p>\r\n\r\n<p>Ini adalah jenis kulit yang paling sempurna yang tidak membutuhkan terlalu banyak perawatan kulit. Anda hanya harus menggunakan pembersih, pelembab, dan tabir surya.</p>\r\n', '<p><strong>Memakai produk perawatan yang mengandung :</strong></p>\r\n\r\n<ol>\r\n	<li>Panthenol</li>\r\n	<li>Alga ekstrak</li>\r\n	<li>Dimethicone</li>\r\n	<li>Hyaluronic acid</li>\r\n</ol>\r\n', 'Kulit Normal.JPG'),
(4, 'Kulit Kering', '<p>Jenis kulit wajah kering hanya memiliki sedikit kelembapan di lapisan kulit terluar. Kulit kering disebabkan karena kelenjar minyak tidak bisa memproduksi minyak yang cukup sehingga kulit kehilangan kelembapannya. Pada tipe kulit wajah kering, pori-pori dan garis-garis kulit wajah akan terlihat dengan jelas. Selain itu, kulit kering cenderung kasar, bersisik, kemerahan, dan terasa gatal. Kurangnya asupan vitamin A dan B juga menyebabkan kulit kering.</p>\r\n\r\n<p><strong>Penyebab :</strong></p>\r\n\r\n<ol>\r\n	<li>Kurangnya kadar air pada tubuh</li>\r\n	<li>Mandi air panas terlalu lama</li>\r\n	<li>Efek obat-obatan</li>\r\n	<li>Radiasi ultraviolet dari sinar matahari</li>\r\n</ol>\r\n', '<p><strong>Memakai produk perawatan yang mengandung :</strong></p>\r\n\r\n<ol>\r\n	<li>Glycolic Acid</li>\r\n	<li>Lactic Acid</li>\r\n	<li>Ceramides</li>\r\n	<li>Hyaluronic acid</li>\r\n</ol>\r\n\r\n<p><strong>Yang harus dihindari :</strong></p>\r\n\r\n<ol>\r\n	<li>Hindari produk yang mengandung alkohol atau pewangi.</li>\r\n	<li>Hindari terlalu lama mandi dan mencuci muka dengan air hangat.</li>\r\n</ol>\r\n', 'Kulit Kering.JPG'),
(5, 'Kulit Berminyak', '<p>Jenis kulit wajah berminyak umumnya disebabkan oleh produksi sebum dari kelenjar minyak yang berlebih. Anda mungkin akan mengenali kulit Anda berminyak melalui produksi kelenjar minyak berlebih pada area <em>T-zone</em> (dahi, hidung, dan dahi).</p>\r\n\r\n<p><strong>Penyebab :</strong></p>\r\n\r\n<ol>\r\n	<li>Kelenjar minyak berlebih</li>\r\n	<li>Udara panas dan lembab</li>\r\n	<li>Stres</li>\r\n	<li>Genetik</li>\r\n	<li>Perubahan hormon</li>\r\n</ol>\r\n', '<p><strong>Memakai produk perawatan yang mengandung :</strong></p>\r\n\r\n<ol>\r\n	<li>Glycolic Acid</li>\r\n	<li>Dimethicone</li>\r\n	<li>Hyaluronic Acid</li>\r\n	<li>Niacinamide</li>\r\n	<li>Salycilc Acid</li>\r\n</ol>\r\n\r\n<p><strong>Perawatan :</strong></p>\r\n\r\n<ol>\r\n	<li>Membersihkan kulit wajah menggunakan sabun pembersih dengan kandungan benzoil peroksida, asam salisilat, asam glikolat, atau asam beta hidroksi.</li>\r\n	<li>Gunakan pelembap dengan kandungan bebas minyak.</li>\r\n	<li>Gunakan <em>sunscreen </em>atau tabir surya dengan kandungan bebas minyak. Mengoleskan <em>sunscreen </em>dengan tekstur gel atau berbahan dasar air dapat mengurangi kadar minyak di wajah Anda.</li>\r\n</ol>\r\n', 'Kulit Berminyak.JPG'),
(6, 'Kulit Kombinasi', '<p>Jenis kulit wajah ini merupakan kombinasi antara tipe kulit wajah kering atau normal di beberapa daerah, termasuk pipi. Sementara, area wajah lainnya akan berminyak, terutama di <em>T-zone</em>. Hal ini disebabkan karena kelenjar minyak tidak merata dalam memproduksi minyak pada wajah</p>\r\n\r\n<p><strong>Penyebab :</strong></p>\r\n\r\n<ol>\r\n	<li>Genetik dan pubertas</li>\r\n	<li>Memakai produk dengan kandungan alcohol dan asam sulfat</li>\r\n	<li>Pori-pori tersumbat dibagian T-Zone</li>\r\n</ol>\r\n', '<p><strong>Memakai produk perawatan yang mengandung :</strong></p>\r\n\r\n<ol>\r\n	<li>Glycolic Acid</li>\r\n	<li>Dimethicone</li>\r\n	<li>Hyaluronic Acid</li>\r\n	<li>BHA</li>\r\n</ol>\r\n\r\n<p><strong>Perawatan :</strong></p>\r\n\r\n<p>Perawatan pada kulit wajah kombinasi memerlukan penanganan yang berbeda. Untuk daerah sekitar pipi maupun mata yang kering, pakailah produk yang mengandung pelembap. Sedangkan untuk area berminyak pada dahi dan hidung, lakukanlah pembersihan secara rutin dan hindari produk yang memiliki banyak kandungan minyak.</p>\r\n', 'Kulit Kombinasi.JPG'),
(7, 'Kulit Sensitif', '<p>Jenis kulit sensitif umumnya sangat peka dan mudah sekali mengalami alergi atau iritasi dan ruam sebagai reaksi terhadap faktor tertentu, seperti lingkungan, makanan, atau penggunaan produk kosmetik. Kulit wajah sensitif mudah terkelupas, gatal, kering, kemerahan, dan terasa perih ketika terjadi kontak dengan berbagai hal yang dapat memicu munculnya gejala kulit sensitif. Beberapa kandungan dalam produk perawatan kulit yang tidak cocok dengan jenis kulit sensitif adalah Oxychloride Bismuth, Sodium Lauryl Sulphate, dan bahan kimia iritan lainnya.</p>\r\n', '<ol>\r\n	<li><strong>Perhatikan kandungan bahan dalam skincare.</strong> Produk yang aman untuk kulit wajah sensitif adalah yang kaya akan bahan-bahan antioksidan. Antioksidan dapat membantu meningkatkan perbaikan kulit wajahmu sekaligus menghidrasinya agar tidak mudah kering. Selain antioksidan, skincare dengan kandungan berbahan dasar tanaman juga sangat baik untuk kulit wajah sensitif. Beberapa bahan tanaman yang dapat memberikan efek penenang pada kulit wajah antara lain teh hijau, chamomile, lidah buaya, minyak argan, dan lain-lain. Bahan-bahan tersebut dapat sangat membantu melembabkan kulit sensitif kamu. Ketahui pula beberapa kandungan skincare yang wajib kamu hindari. Beberapa kandungan yang cukup berbahaya untuk kulit sensitif kamu adalah parfum, alcohol, dan essential oil. Parfum dapat memberikan efek sensitif pada kulit, alcohol mampu merusak lapisan pelindung kulit, sementara essential oil berpotensi mengandung alergen.</li>\r\n	<li><strong>Pastikan kulit terhidrasi dan bersihkan wajah dengan tepat.</strong> Karena kulit wajah sensitif juga cenderung bisa sangat mudah kering, maka kamu harus memastikan untuk menjaga kelembabannya. Salah satu cara yang dapat kamu lakukan adalah menggunakan hydrating cream dengan kandungan ceramides dan niacinamide. Gunakan pelembab dua kali dalam sehari serta manfaatkan hydrating mask untuk kamu pakai seminggu sekali. Saat membersihkan wajah dari makeup yang menempel seharian, kamu juga perlu berhati-hati nih. Kamu pasti akan butuh banyak gerakan menggosok dan mengusap ketika menghapus makeup dan inilah yang berpotensi membuat kulit wajah kamu teriritasi akibat gesekan tersebut. Membersihkan kulit wajah sensitif ada triknya tersendiri, yaitu dengan memilih pembersih wajah dengan bahan dasar balm atau cream. Kalau belakangan ini membersihkan wajah dengan micellar water sedang jadi tren, kamu harus memastikan kapas yang kamu pakai sudah dibasahi dengan cukup agar tidak terlalu keset di wajah.</li>\r\n	<li><strong>Rutin menggunakan sun protection saat beraktivitas di luar.</strong> Bagi pemilik kulit wajah sensitif, menggunakan sun protection itu sangat wajib dilakukan. Jadi, pastikan kamu selalu rutin menggunakan sunscreen ketika beraktivitas di luar. Terutama buat kamu para wanita yang menghabiskan banyak waktu di lapangan. Sunscreen untuk kulit wajah sensitif tentu tidak bisa sembarangan ya. Prioritaskan sunscreen yang aman dan tidak menimbulkan breakout di wajah kamu. Catat ya, kamu wajib hindari sunscreen dengan bahan-bahan seperti fragrances, dyes, alcohol, dimethicone, oxybenzone, dan Para-Aminobenzoic Acid (PABA). Tinggalkan chemical sunscreen dan fokuslah untuk menggunakan mineral sunscreen. Biasanya mineral sunscreen punya kandungan zinc oxide dan titanium dioxide. Dua kandungan bahan ini sangat aman dan dijamin tidak akan membuat kulit wajah sensitif kamu teriritasi saat memakainya.</li>\r\n</ol>\r\n', 'Kulit Sensitif.JPG'),
(8, 'Kulit Berjerawat', '<p>Jerawat (acne) adalah gangguan pada kulit yang berhubungan dengan produksi minyak (sebum) berlebih. Jerawat terjadi ketika folikel rambut atau tempat tumbuhnya rambut tersumbat oleh minyak dan sel kulit mati. Hal tersebut menyebabkan peradangan serta penyumbatan pada pori-pori kulit. Peradangan ini ditandai dengan munculnya benjolan kecil (yang terkadang berisi nanah) di atas kulit. Gangguan kulit ini dapat terjadi di bagian tubuh dengan kelenjar minyak terbanyak, salah satunya di wajah.</p>\r\n\r\n<p><strong>Penyebab :</strong></p>\r\n\r\n<ol>\r\n	<li>Produksi sebum berlebih, yaitu zat yang diproduksi oleh kelenjar minyak untuk mencegah kulit kering.</li>\r\n	<li>Sumbatan pada folikel rambut oleh campuran sel kulit mati dan sebum.</li>\r\n	<li>Bakteri jenis <em>Propionibacterium acnes</em> yang berkembang, menyumbat folikel rambut, serta menyebabkan peradangan.</li>\r\n	<li>Faktor genetik atau keturunan, jika salah satu orangtua memiliki masalah jerawat,</li>\r\n	<li>Folikel yang tersumbat bisa membengkak dan membentuk komedo putih atau komedo hitam bila terpapar dengan dunia luar. Kondisi tersebut sebaiknya jangan dianggap remeh, karena bisa berkembang menjadi pustula, papula, nodul, atau bahkan kista, apabila terkontaminasi oleh bakteri kulit.</li>\r\n	<li>Hormon, yaitu saat aktivitas hormon androgen berlebih atau saat terjadi perubahan hormon saat masa menstruasi.</li>\r\n	<li>Penggunaan kosmetik yang tidak selalu dapat ditoleransi oleh kulit setiap orang.</li>\r\n	<li>Stres yang dapat memengaruhi gaya hidup seseorang, termasuk dalam pola makan yang dapat memicu jerawat.</li>\r\n</ol>\r\n', '<p><strong>Memakai produk perawatan yang mengandung :</strong></p>\r\n\r\n<ol>\r\n	<li>Retinol, bahan ini digunakan untuk membersihkan pori kulit yang tersumbat. Bahan ini mampu mengeksfoliasi pori kulit yang tertutup dan menimbulkan komedo maupun jerawat. &nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li><em>Benzoyl peroxyde</em>, bahan aktif ini sangat efektif untuk melawan seluruh bentuk jerawat yang ada di kulit. &nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>AHA, bahan ini berguna untuk membersihkan pori kulit yang tersumbat sehingga jerawat akan menghilang dari kulitmu. Namun, seringkali bahan ini menyebabkan purging untuk mengeluarkan seluruh kotoran dalam pori. &nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>BHA, fungsinya kurang lebih sama dengan AHA.Bedanya BHA mampu mempenetrasi pori lebih dalam sehingga efektif untuk komedo <em>white head.</em></li>\r\n</ol>\r\n', 'Kulit Berjerawat.JPG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tb_basispengetahuan`
--
ALTER TABLE `tb_basispengetahuan`
  ADD PRIMARY KEY (`kd_pengetahuan`),
  ADD KEY `kd_gejala` (`kd_gejala`),
  ADD KEY `kd_jeniskulit` (`kd_jeniskulit`);

--
-- Indexes for table `tb_diagnosa`
--
ALTER TABLE `tb_diagnosa`
  ADD PRIMARY KEY (`id_diagnosa`);

--
-- Indexes for table `tb_gejala`
--
ALTER TABLE `tb_gejala`
  ADD PRIMARY KEY (`kd_gejala`),
  ADD UNIQUE KEY `nama_gejala` (`nama_gejala`);

--
-- Indexes for table `tb_jeniskulit`
--
ALTER TABLE `tb_jeniskulit`
  ADD PRIMARY KEY (`kd_jeniskulit`),
  ADD UNIQUE KEY `jenis_kulit` (`jenis_kulit`);

--
-- Indexes for table `tb_kondisi`
--
ALTER TABLE `tb_kondisi`
  ADD PRIMARY KEY (`kd_kondisi`);

--
-- Indexes for table `tb_posting`
--
ALTER TABLE `tb_posting`
  ADD PRIMARY KEY (`kd_posting`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_basispengetahuan`
--
ALTER TABLE `tb_basispengetahuan`
  MODIFY `kd_pengetahuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `tb_diagnosa`
--
ALTER TABLE `tb_diagnosa`
  MODIFY `id_diagnosa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `tb_gejala`
--
ALTER TABLE `tb_gejala`
  MODIFY `kd_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `tb_jeniskulit`
--
ALTER TABLE `tb_jeniskulit`
  MODIFY `kd_jeniskulit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tb_kondisi`
--
ALTER TABLE `tb_kondisi`
  MODIFY `kd_kondisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tb_posting`
--
ALTER TABLE `tb_posting`
  MODIFY `kd_posting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_basispengetahuan`
--
ALTER TABLE `tb_basispengetahuan`
  ADD CONSTRAINT `tb_basispengetahuan_ibfk_1` FOREIGN KEY (`kd_gejala`) REFERENCES `tb_gejala` (`kd_gejala`),
  ADD CONSTRAINT `tb_basispengetahuan_ibfk_2` FOREIGN KEY (`kd_jeniskulit`) REFERENCES `tb_jeniskulit` (`kd_jeniskulit`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
