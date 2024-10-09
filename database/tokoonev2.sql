-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Okt 2024 pada 13.37
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoonev2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `foto_admin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`, `foto_admin`) VALUES
(1, 'admin', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'Andi', 'l.jpg'),
(4, 'admin2', '8cb2237d0679ca88db6464eac60da96345513964', 'ardi', 'l.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Eiger'),
(2, 'Expedition'),
(3, 'Lanccelot'),
(7, 'NAM'),
(10, 'Seiko');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `email_pelanggan` varchar(50) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `telepon_pelanggan` varchar(20) NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  `foto_pelanggan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `email_pelanggan`, `password_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`, `foto_pelanggan`) VALUES
(2, 'teguh', 'teguh@gmail.com', 'f4fe1d827308e4e52d4d49e62f33d7d08ffb4a75', '08123243242', 'Aceh', 'foto.jpg'),
(6, 'coba', 'coba@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '0876421311', 'coba', 'buku6.jpg'),
(7, 'rendi', 'rendi@gmail.com', '9ae30da0aae20c0563db53bfce73ed3f035e1166', '08156784521', 'Bumi', 'images.png'),
(8, 'bayu', 'bayu@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '089988776', 'bulan', 'f.jpg'),
(9, 'jack', 'jack@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '081213242342', 'jupiter', 'images (1).png'),
(10, 'senn', 'sen@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '8443332211', 'adadada', 'ep2.2.webp');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(1, 6, 'bayu', 'bri', 1066000, '2024-10-04', '20241004165212coklat.jpeg'),
(2, 8, 'jack', 'mandiri', 736000, '2024-10-05', '20241005074434images.png'),
(3, 7, 'bayu', 'mandiri', 616000, '2024-10-06', '20241006162807buku5.jpg'),
(4, 10, 'sen', 'mandiri', 486000, '2024-10-06', '20241006170528car1.jpg'),
(5, 9, 'bayu', 'mandiri', 1070000, '2024-10-07', '20241007083936pembayaran.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(20) NOT NULL,
  `alamat` text NOT NULL,
  `total_berat` int(11) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `distrik` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `kode_pos` varchar(255) NOT NULL,
  `ekspedisi` varchar(255) NOT NULL,
  `paket` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `estimasi` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `tanggal_pembelian`, `total_pembelian`, `alamat`, `total_berat`, `provinsi`, `distrik`, `type`, `kode_pos`, `ekspedisi`, `paket`, `ongkir`, `estimasi`, `status`, `resi_pengiriman`) VALUES
(1, 1, '2024-09-05', 50000, '', 0, '', '', '', '', '', '', 0, '', 'pending', ''),
(2, 2, '2024-09-26', 500000, '', 0, '', '', '', '', '', '', 0, '', 'pending', ''),
(3, 7, '2024-10-02', 936000, 'Desa koba', 2, 'Bangka Belitung', 'Bangka Tengah', 'Kabupaten', '33613', 'jne', 'REG', 36000, '4-6', 'pending', ''),
(4, 7, '2024-10-03', 2774000, 'Desa Mars', 1, 'Bangka Belitung', 'Bangka', 'Kabupaten', '33212', '', '', 0, '', 'pending', ''),
(5, 7, '2024-10-03', 710000, 'Desa Mars', 1, 'Bangka Belitung', 'Bangka', 'Kabupaten', '33212', 'jne', 'REG', 36000, '4-6', 'pending', ''),
(6, 8, '2024-10-03', 1066000, 'Desa Koba', 1, 'Bangka Belitung', 'Bangka Tengah', 'Kabupaten', '33613', 'jne', 'REG', 36000, '4-6', 'pembayaran dikonfirmasi', 'ABC123'),
(7, 8, '2024-10-04', 616000, 'Desa Padang Mulia', 1, 'Bangka Belitung', 'Bangka Tengah', 'Kabupaten', '33613', 'jne', 'REG', 36000, '4-6', 'barang dikirim', 'ADGF1234'),
(8, 9, '2024-10-05', 736000, 'Desa Mars', 1, 'Bangka Belitung', 'Bangka Tengah', 'Kabupaten', '33613', 'jne', 'REG', 36000, '4-6', 'sedang diproses', ''),
(9, 8, '2024-10-06', 1070000, 'Desa Mars', 1, 'Bangka Belitung', 'Bangka Tengah', 'Kabupaten', '33613', 'jne', 'REG', 36000, '4-6', 'sedang diproses', ''),
(10, 10, '2024-10-06', 486000, 'Desa Mars', 1, 'Bangka Belitung', 'Bangka Selatan', 'Kabupaten', '33719', 'jne', 'REG', 36000, '4-6', 'barang dikirim', 'ADGF1234'),
(11, 10, '2024-10-06', 710000, 'adadada', 1, 'Bangka Belitung', 'Bangka Tengah', 'Kabupaten', '33613', 'jne', 'REG', 36000, '4-6', 'pending', ''),
(12, 8, '2024-10-07', 669000, 'Desa Mars', 1, 'Bangka Belitung', 'Belitung', 'Kabupaten', '33419', 'jne', 'REG', 69000, '3-4', 'pending', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(30) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 1, 3, '', 0, 0, 0, 0),
(2, 2, 2, 3, '', 0, 0, 0, 0),
(3, 3, 16, 2, 'WS LUCILE STRIPE ', 450000, 1, 2, 900000),
(4, 4, 19, 1, ' E 6782 MC', 2100000, 1, 1, 2100000),
(5, 4, 19, 1, ' E 6782 MC', 2100000, 1, 1, 2100000),
(6, 5, 13, 1, 'BREGAGLIA', 674000, 1, 1, 674000),
(7, 6, 16, 1, 'WS LUCILE STRIPE ', 450000, 1, 1, 450000),
(8, 6, 16, 1, 'WS LUCILE STRIPE ', 450000, 1, 1, 450000),
(9, 7, 17, 1, 'COPPER 2.0', 580000, 1, 1, 580000),
(10, 8, 29, 1, 'Solitaire of Obsidian', 700000, 1, 1, 700000),
(11, 9, 15, 1, 'ODOSPEED ANACHRONO', 1034000, 1, 1, 1034000),
(12, 10, 16, 1, 'WS LUCILE STRIPE ', 450000, 1, 1, 450000),
(13, 11, 13, 1, 'BREGAGLIA', 674000, 1, 1, 674000),
(14, 12, 17, 1, 'COPPER 2.1', 600000, 1, 1, 600000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telepon` varchar(25) NOT NULL,
  `isi_pesan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `nama`, `email`, `telepon`, `isi_pesan`) VALUES
(1, 'rendi', 'rendi@gmail.com', '08156784521', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. At, corporis! Praesentium facilis rem quia veniam.'),
(2, 'bayu', 'bayu@gmail.com', '89988776', 'Rasta Sewakottama, Satya Wira Wicaksana, Jalesveva Jayamahe, Swa Bhuwana Paksa, Tribuana Chandraca Satya Dharma');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(255) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(13, 1, 'BREGAGLIA', 674000, 1, 'e2.webp', 'Minimalis, sederhana, dan trendi adalah kata-kata terbaik untuk menggambarkan Bregaglia Watch. Fitur ketahanan air mencapai 5 ATM pada jam tangan analog ini menjadi pelengkap untuk aktivitas harian Anda. Disclaimer: Tidak cocok digunakan untuk kegiatan snorkeling dan diving.', 7),
(15, 1, 'ODOSPEED ANACHRONO', 1034000, 1, 'e1.jpg', 'Perpaduan sempurna antara style dan fungsi, jam tangan Odospeed Anachrono selalu dapat kamu andalkan untuk dipakai saat berkendara. Jam tangan analog pria dari EIGER Riding ini dilengkapi dengan fitur kronograf dan ketahanan air 10 ATM, yang memungkinkanmu untuk tetap memakainya bahkan dalam kondisi hujan ringan. Kombinasi case aluminium alloy dengan kesan maskulin dan dua pilihan strap yang fleksibel menghasilkan tampilan yang tangguh dan penuh percaya diri untuk menyempurnakan gayamu.', 8),
(16, 1, 'WS LUCILE STRIPE ', 450000, 1, 'e3.jpg', '                            Lucile Stripe Watch adalah jam tangan ideal untukmu yang ingin tetap stylish saat bepergian. Strap dengan desain bergaris dan pilihan kombinasi warna yang cerah dan lembut membuat jam tangan ini semakin menarik. Dilengkapi dengan fitur ketahanan air 3ATM yang cocok untuk pemakaian harian dan baterai cadangan, jam tangan analog ini menjadi pelengkap yang sempurna untuk tampilan kasual harianmu.                        ', 8),
(17, 1, 'COPPER 2.1', 600000, 1, 'e4.jpg', 'Saat beraktivitas sehari-hari, jam analog Copper 2.0 pas dipakai untuk menjadi pelengkap yang bisa diandalkan. Jam dari EIGER 1989 ini tampil dengan desain klasik yang menarik, berwarna, dan minimalis. Semakin sempurna, karena Copper 2.0 memiliki  fiitur Japanese Movement Miyota 2035 three-hands movement dan ketahanan air 3 ATM yang bisa mendukung aktivitas harian kamu.', 6),
(18, 1, 'PRINCETON TACTICAL', 1300000, 1, 'e5.jpg', 'Princeton Tactical adalah jam tangan analog yang hadir dalam balutan desain yang kokoh serta strap paracord yang mampu meningkatkan performa tangguh Anda selama kegiatan taktikal Anda. Jam tangan ini memiliki fitur tahan air hingga kedalaman 50 meter, juga dengan fitur penunjuk hari dan tanggal untuk menunjang kebutuhan aktivitas taktikal Anda.', 5),
(19, 2, ' E 6782 MC', 2100000, 1, 'ep1.webp', '                            Expedition watches adalah perlengkapan para profesional yang dibuat untuk menghadapi kondisi lingkungan (outdoor) yang paling buruk sekalipun. Semua produk expedition telah diuji oleh tim penjelajah resmi seperti yacht racers, deep-divers (penyelam), pembalap rally, dan pendaki gunung untuk memastikan fungsi dan ketahanan produk jam tangan yang dirilis.\r\n                        ', 5),
(23, 2, 'E 302 MA BIPBU ', 2000000, 1, 'ep2.webp', 'Expedition dikenal akan desainnya yang mutakhir dengan ketangguhan yang begitu bersaing di kelasnya. Salah satu koleksi terbarunya yang di rilis di tahun 2020 adalah Expedition Automatic E 302 MA BIPBU yang dirancang memiliki desain unik sekaligus tangguh.', 5),
(24, 2, 'E 3007 MC RIPBA ', 2500000, 1, 'ep3.webp', 'Expedition watches adalah perlengkapan para profesional yang dibuat untuk menghadapi kondisi lingkungan (outdoor) yang paling buruk sekalipun. Semua produk expedition telah diuji oleh tim penjelajah resmi seperti yacht racers, deep-divers (penyelam), pembalap rally, dan pendaki gunung untuk memastikan fungsi dan ketahanan produk jam tangan yang dirilis.', 8),
(25, 2, 'E 6845 MC BTBBU', 2000000, 1, 'ep4.webp', 'Expedition watches adalah perlengkapan para profesional yang dibuat untuk menghadapi kondisi lingkungan (outdoor) yang paling buruk sekalipun. Semua produk expedition telah diuji oleh tim penjelajah resmi seperti yacht racers, deep-divers (penyelam), pembalap rally, dan pendaki gunung untuk memastikan fungsi dan ketahanan produk jam tangan yang dirilis.', 8),
(26, 2, 'E 6855 MF BSSGR', 800000, 1, 'ep5.webp', 'Expedition dikenal akan desainnya yang mutakhir dengan ketangguhan yang begitu bersaing di kelasnya. Salah satu koleksi yang wajib dimiliki oleh para pria adalah Expedition E 6855 MF BSSGR. Koleksi ini menghadirkan desain simple-fungsional dengan kesan elegan dan mewah. ', 8),
(28, 0, 'Solitaire of Obsidian', 800000, 1, 'lc1.jpg', 'Obsidian sebenarnya merupakan kategori kaca vulkanik yang berupa batuan beku ekstrusif. Obsidian itu terbentuk dari ekstrusi lava felsik yang sudah mendingin secara alami dengan cepat tanpa pertumbuhan kristal. Lanccelot membuat jam tangan seri Solitaire of Obsidian yang dilapisi kaca safir anti gores, dan juga bentuk yang sangat unik dan kecil sehingga sangat cocok untuk melengkapi segala aktivitas dan gaya Anda.', 9),
(29, 3, 'Solitaire of Obsidian', 700000, 1, 'lc1.jpg', 'Obsidian sebenarnya merupakan kategori kaca vulkanik yang berupa batuan beku ekstrusif. Obsidian itu terbentuk dari ekstrusi lava felsik yang sudah mendingin secara alami dengan cepat tanpa pertumbuhan kristal. Lanccelot membuat jam tangan seri Solitaire of Obsidian yang dilapisi kaca safir anti gores, dan juga bentuk yang sangat unik dan kecil sehingga sangat cocok untuk melengkapi segala aktivitas dan gaya Anda.', 6),
(30, 3, 'Time Travel Guardian Of White Trickster', 800000, 1, 'lc2.jpg', 'Time Travel merupakan sebuah konsep perjalanan maju atau mundur ke titik yang berbeda dalam waktu, sangat mirip seperti kita melakukan pergerakan di dalam ruangan. Pada kenyataannya, manusia selalu berjalan dalam waktu, dalam cara segaris, dari waktu yang sekarang ke masa depan per satuan waktu sampai pada kematiannya. Dari kata Time Travel, Lanccelot membuat koleksi jam tangan yang sangat elegan dan mewah dengan berbagai tipe, salah satunya adalah Time Travel Guardian Of White Trickster.\r\n\r\n', 9),
(31, 3, 'Romans King of Pompilius', 800000, 1, 'lc3.jpg', 'Terinspirasi oleh Roma dari Kekaisaran Romawi dan dengan moto kami “Non Desitas, Non Exieris”. Ini adalah ide awal kami dalam membuat dan mendesain seri Romans. Desain bentuknya yang minimalis dan klasik dari zaman Romawi menjadikannya penunjuk waktu yang cocok untuk menemani setiap petualangan Anda. Terbuat dari kulit anak sapi Italia dengan 5 variasi warna dan hadir dengan 2 variasi ukuran dial untuk dipilih, Romans King dan Romans Queen. Gaya fesyen Anda akan sempurna dengan rangkaian koleksi jam tangan klasik ini.', 7),
(32, 3, 'Seahorse Queen of Pollux', 700000, 1, 'lc4.jpg', 'Castor dan Pollux adalah saudara kembar yang terkenal dalam mitologi Yunani dan Romawi. Bersama-sama mereka disebut Dioscuri. Mereka adalah putra Leda. Castor dan Pollux diubah menjadi konstelasi yang disebut Gemini. Tyndareus, raja Sparta dan suami Leda, adalah ayah dari Castor (seorang manusia), sedangkan Zeus adalah ayah dari Pollux (seorang setengah dewa). Salah satu mitos paling terkenal dari mitologi Romawi adalah dengan Castor dan Pollux adalah bagaimana mereka menjadi konstelasi “Gemini”. Selama pertempuran Castor, makhluk fana terbunuh. Bersedih karena kematian saudaranya, Pollux berdoa kepada Zeus untuk menjadikan Castor abadi yang berarti Pollux harus menyerahkan setengah dari keabadiannya.', 9),
(34, 3, 'Solitaire of Aragonite', 680000, 1, 'lc5.jpg', 'Aragonite sebenarnya merupakan salah satu dari dua bentuk kristal yang paling umum terdapat di alam. Aragonite yang merupakan mineral karbonat ini dibentuk oleh proses biologis dan fisika, termasuk presipitasi dari lingkungan laut dan air tawar. Lanccelot membuat jam tangan seri Solitaire of Aragonite yang dilapisi kaca safir anti gores, dan juga bentuk yang sangat unik dan kecil sehingga sangat cocok untuk melengkapi segala aktivitas dan gaya Anda.', 5),
(39, 10, 'Seiko 5 Sport Automatic ', 3720000, 1, 's1.webp', 'Show your style. Make your move. For over 50 years, Seiko 5 Sports has delivered consistently high levels of reliability, durability, and performance. For dependable timekeeping in your everyday life, this exceptional watch is powered by an automatic movement with a power reserve of approximately 41 hours and features a day/date calendar, LumiBrite hands and markers, and a see-through caseback. With a durable stainless steel case and bracelet and a black sunray dial, this versatile watch is 100 meter water resistant- perfect for your style no matter what your day has in store.', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_foto`
--

CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk_foto`
--

INSERT INTO `produk_foto` (`id_produk_foto`, `id_produk`, `nama_produk_foto`) VALUES
(4, 2, 'ep1.jpg'),
(38, 13, 'e2.webp'),
(46, 15, 'e1.jpg'),
(47, 15, 'e1.3.jpeg'),
(48, 15, 'e1.2.jpeg'),
(49, 16, 'e3.jpg'),
(50, 16, 'e3.2.jpeg'),
(51, 16, 'e3.1.jpeg'),
(52, 17, 'e4.jpg'),
(53, 17, 'e4.1.jpg'),
(54, 17, 'e4.2.jpg'),
(55, 18, 'e5.jpg'),
(56, 18, 'e5.2.jpg'),
(57, 18, 'e5.1.jpg'),
(58, 19, 'ep1.webp'),
(67, 22, 'ep2.webp'),
(71, 23, 'ep2.webp'),
(72, 23, 'ep2.1.webp'),
(73, 23, 'ep2.2.webp'),
(74, 24, 'ep3.webp'),
(75, 24, 'ep3.1.webp'),
(76, 24, 'ep3.2.webp'),
(77, 25, 'ep4.webp'),
(78, 25, 'ep4.1.webp'),
(79, 25, 'ep4.2.webp'),
(80, 25, ''),
(81, 26, 'ep5.webp'),
(82, 26, 'ep5.1.webp'),
(83, 27, 'lc1.jpg'),
(84, 27, 'lc1.2.jpg'),
(85, 28, 'lc1.jpg'),
(86, 28, 'lc1.2.jpg'),
(87, 29, 'lc1.jpg'),
(88, 29, 'lc1.2.jpg'),
(89, 30, 'lc2.jpg'),
(90, 30, 'lc2.1.jpg'),
(91, 31, 'lc3.jpg'),
(92, 31, 'lc3.1.jpg'),
(93, 31, 'lc3.2.jpg'),
(94, 32, 'lc4.jpg'),
(95, 32, 'lc4.2.jpg'),
(96, 32, 'lc4.1.jpg'),
(97, 33, 'lc5.jpg'),
(98, 33, 'lc5.1.jpg'),
(99, 33, 'lc5.2.jpg'),
(100, 34, 'lc5.jpg'),
(101, 34, 'lc5.1.jpg'),
(102, 34, 'lc5.2.jpg'),
(109, 39, 's1.webp');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  ADD PRIMARY KEY (`id_produk_foto`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  MODIFY `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
