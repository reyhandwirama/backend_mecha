-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: sql6.freesqldatabase.com
-- Generation Time: Jan 10, 2024 at 01:28 PM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 8.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql6637648`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Id_Cart` varchar(8) NOT NULL,
  `Id_User` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`Id_Cart`, `Id_User`) VALUES
('', 'aud50638'),
('ctale198', 'ale64910'),
('ctaud567', 'aud50638'),
('ctrey652', 'rey91224');

-- --------------------------------------------------------

--
-- Table structure for table `cartdetail`
--

CREATE TABLE `cartdetail` (
  `Id_Cart` varchar(8) NOT NULL,
  `Qty` int(3) NOT NULL,
  `Id_User` varchar(8) NOT NULL,
  `Id_Product` varchar(8) NOT NULL,
  `weight` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cartdetail`
--

INSERT INTO `cartdetail` (`Id_Cart`, `Qty`, `Id_User`, `Id_Product`, `weight`) VALUES
('ctale198', 1, 'ale64910', 'cidov652', 1),
('', 1, 'aud50638', 'cidov652', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `Id_Order` varchar(12) NOT NULL,
  `Id_Product` varchar(8) NOT NULL,
  `Qty` int(3) NOT NULL,
  `Ttl_Belanja` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`Id_Order`, `Id_Product`, `Qty`, `Ttl_Belanja`) VALUES
('Order-aud111', 'cidov652', 1, 1550000),
('Order-aud149', 'ajk832', 3, 1950000),
('Order-aud174', 'cidov75', 1, 1779000),
('Order-aud179', 'cidov75', 1, 1785000),
('Order-aud179', 'epfs', 1, 1785000),
('Order-aud230', 'cidov75', 1, 1779000),
('Order-aud238', 'cidov652', 1, 1550000),
('Order-aud240', 'cidov75', 1, 1779000),
('Order-aud331', 'cidov75', 1, 1779000),
('Order-aud354', 'ajk832', 1, 2200000),
('Order-aud354', 'cidov652', 1, 2200000),
('Order-aud365', 'cidoms', 1, 6000),
('Order-aud378', 'cidov652', 1, 1550000),
('Order-aud384', 'cidov652', 1, 5279000),
('Order-aud384', 'cidov75', 1, 5279000),
('Order-aud384', 'cidov87', 1, 5279000),
('Order-aud405', 'cidov87', 1, 1950000),
('Order-aud407', 'ajk832', 1, 5929000),
('Order-aud407', 'cidov652', 1, 5929000),
('Order-aud407', 'cidov75', 1, 5929000),
('Order-aud407', 'cidov87', 1, 5929000),
('Order-aud427', 'ajk832', 1, 2600000),
('Order-aud427', 'cidov87', 1, 2600000),
('Order-aud465', 'ajk832', 1, 650000),
('Order-aud471', 'epmrk', 1, 650000),
('Order-aud514', 'epbk', 1, 460000),
('Order-aud530', 'akcrsw', 3, 1423500),
('Order-aud530', 'Emak', 3, 1423500),
('Order-aud542', 'cidov75', 1, 1779000),
('Order-aud546', 'cidov75', 1, 1779000),
('Order-aud566', 'epfs', 1, 6000),
('Order-aud568', 'cidov75', 1, 1779000),
('Order-aud659', 'cidov75', 6, 10674000),
('Order-aud692', 'cidov75', 1, 1779000),
('Order-aud715', 'cidov652', 1, 3329000),
('Order-aud715', 'cidov75', 1, 3329000),
('Order-aud785', 'ajk832', 1, 650000),
('Order-aud788', 'cidov652', 1, 1550000),
('Order-aud802', 'cidov75', 1, 1779000),
('Order-aud813', 'akcrsw', 1, 4500),
('Order-aud828', 'cidov652', 1, 1550000),
('Order-aud839', 'cidov652', 1, 5279000),
('Order-aud839', 'cidov75', 1, 5279000),
('Order-aud839', 'cidov87', 1, 5279000),
('Order-aud840', 'ajk832', 1, 650000),
('Order-aud844', 'cidov75', 1, 1779000),
('Order-aud863', 'cidov87', 1, 1950000),
('Order-aud898', 'cidov75', 1, 1779000),
('Order-aud962', 'ajk832', 3, 5050000),
('Order-aud962', 'cidov652', 2, 5050000),
('Order-aud971', 'cidov75', 1, 1779000),
('Order-aud972', 'epicek', 1, 470000),
('Order-rey886', 'cidov75', 1, 1779000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Id_Order` varchar(20) NOT NULL,
  `Id_User` varchar(8) NOT NULL,
  `status` text NOT NULL,
  `dataImage` text NOT NULL,
  `noresi` varchar(50) NOT NULL,
  `kurir` varchar(20) NOT NULL,
  `ongkir` int(7) DEFAULT NULL,
  `batasorder` datetime DEFAULT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Id_Order`, `Id_User`, `status`, `dataImage`, `noresi`, `kurir`, `ongkir`, `batasorder`, `Alamat`) VALUES
('Order-aud839', 'aud50638', 'Dalam Perjalanan', 'https://firebasestorage.googleapis.com/v0/b/mechanical-keyboard-1bc50.appspot.com/o/images%2Fphoto_1692082552998.jpg?alt=media&token=719ed444-c4d2-4bc9-b224-65ce4c9aeb8d', '12345678', 'Sicepat', 40000, '0000-00-00 00:00:00', 'Jalan jokotole resident no 85 '),
('Order-aud971', 'aud50638', 'Pesanan Telah Sampai', 'https://firebasestorage.googleapis.com/v0/b/mechanical-keyboard-1bc50.appspot.com/o/images%2Fphoto_1692077703428.jpg?alt=media&token=99848500-56fc-4611-abfb-607072acaaff', '123912830127398', 'JNE', 10000, '0000-00-00 00:00:00', 'Jl. Belimbing no 2 Lenteng Agung Jagakarsa jakarta selatan');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `Id_Product` varchar(8) NOT NULL,
  `title` varchar(50) NOT NULL,
  `summary` text NOT NULL,
  `highlight` text NOT NULL,
  `description` text NOT NULL,
  `image` varchar(20) NOT NULL,
  `category` varchar(8) NOT NULL,
  `price` int(8) NOT NULL,
  `qty` int(8) NOT NULL,
  `weight` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`Id_Product`, `title`, `summary`, `highlight`, `description`, `image`, `category`, `price`, `qty`, `weight`) VALUES
('ajk832', 'Ajazz AK832 Pro', 'Low Profile Keyboard', 'Low Profile;RGB;75% Layout', 'Seramping dan Seringkas Portabel\\ Keyboard Ajazz AKC087 hadir dengan switch low-profile yang bisa 20%-30% lebih rendah daripada yang biasa, sebagai hasilnya, keyboard low-profile memiliki fitur yang lebih portabel, pemicu yang lebih cepat, dan penekanan tombol yang lebih ringan daripada keyboard mekanik biasa. Sebagai keyboard 75%, Ajazz AK832 Pro memiliki 81 tombol yang diperlukan dengan tombol panah, tombol fungsi, dan home cluster, serta layar LED yang dapat menampilkan baterai, tanggal, mode penghubung, atau foto khusus yang diunggah oleh driver Ajazz. Tak perlu dikatakan lagi, sangat cocok untuk pengetikan di kantor dan perjalanan; Tiga Mode: Kabel Type-C, Bluetooth 5.1 & 2.4GHz Tersedia\\ Ajazz AK832 mendukung koneksi melalui Bluetooth atau 2.4GHz untuk konektivitas nirkabel, atau dengan kabel USB Type-C yang disertakan. Dengan Bluetooth 5.1, keyboard merespons lebih cepat dan lebih hemat daya daripada versi Bluetooth sebelumnya. Keyboard ini juga mudah dialihkan di antara tiga mode untuk multitasking yang efisien dan kinerja yang cepat. Baterai 2500mAh yang disertakan memastikan penggunaan yang lama dan stabil, tanpa khawatir akan terjadi korsleting; Pemicu Cepat & Dipasang di Gasket & Pemicu Cepat dengan Sakelar Profil Rendah Outemu \\ Perjalanan yang lebih pendek berarti pemicu yang lebih cepat, sehingga Ajazz AK832 mengadopsi sakelar merah / coklat / biru profil rendah Outemu, yang total perjalanannya adalah 3,0 mm. Dengan dudukan gasket, keyboard ini menghasilkan nuansa pengetikan yang fleksibel, kecepatan pengetikan yang lebih cepat, dan aktuasi yang lebih cepat, terutama bagi mereka yang lebih menyukai pengalaman pengetikan yang lebih responsif dan cepat. Catatan: keyboard tidak dapat ditukar dengan hot-swappable; 1.6M RGB Dengan 20 Efek Cahaya & Baterai berkapasitas besar\\Ajazz AK832 Pro hadir dengan lampu latar RGB untuk meningkatkan kesenangan saat menggunakan keyboard. Memiliki 20 efek cahaya seperti Pelangi, Riak, Hujan Meteor, dan ular. Anda bahkan dapat mendesain warna lampu latar Anda sendiri karena keyboard ini memiliki RGB per tombol. Dengan baterai 2500mAh internal, keyboard ini dapat bertahan hingga 80 jam tanpa lampu latar, dan hingga 110 jam dengan lampu latar dan LED mati dalam mode nirkabel. Karena keyboard ini memiliki fitur \"charge upon plugging\" dan peringatan baterai lemah, keyboard ini dapat dengan mudah diisi dayanya kapan saja, sehingga Anda tidak perlu khawatir saat bepergian dengan keyboard ini; PBT Low-profile Keycaps & Kompatibel dengan Mac/Win\\Keycaps pada keyboard ini terbuat dari PBT, bahan yang tahan lama, tahan terhadap warna kuning dan anti selip. Permukaan keycap didesain dengan lekukan cekung yang pas dengan ujung jari, sehingga memberikan pengalaman mengetik yang ergonomis. Selain itu, keyboard ini kompatibel dengan OS pada Windows/Mac. Hal ini tentunya memenuhi kebutuhan setiap pengguna untuk bekerja secara efisien atau bermain game/beralih status.', 'ajk832', 'fullkit', 650000, 100, 0.7),
('akcrsw', 'AKKO CS Crystal Switch', 'Original 45 Pieces of AKKO CS Switch Set for Mechanical Keyboard Replacement', 'Several options of AKKO CS Switches with different features;Suitable for customised keyboards', 'Apa itu AKKO Custom Series (CS) \\ Seri ini adalah sakelar yang baru dirancang untuk pelanggan yang memiliki kebutuhan khusus. Berbeda dari sakelar tradisional, AKKO CS telah melakukan beberapa perbaikan berdasarkan pengalaman pelanggan. Ini berisi fitur-fitur yang berbeda. Tidak seperti sakelar AKKO V2, sakelar CS memiliki desain pegas spiral. Kami telah membuat enam jenis sakelar CS, taktil biru laut dan lavender Ungu / hijau matcha linier / merah mawar linier, putih antik, dan merah bercahaya. Apa pun yang Anda sukai, kami akan membahas semuanya; Tentang Lubes\\Selalu subyektif jika menyangkut tingkat lubes yang perlu diterapkan pada sakelar individual. Sementara itu, melumasi sakelar dengan mesin juga dapat memengaruhi masa pakai sakelar. Mengenai faktor-faktor tersebut, sakelar AKKO CS (kecuali untuk versi berpelumas) tidak akan dilumasi oleh pabrik saat ini. Sakelar AKKO CS memang memiliki lapisan tipis film kering di pecahan peluru untuk tujuan pelumasan, tetapi tidak ada pelumas sama sekali di bagian lain seperti bagian atas, batang atau pegas; Kompatibel dengan Struktur MX Keycaps \\ Sakelar AKKO CS dirancang dengan struktur MX umum sehingga dapat memuat sebagian besar set kunci dengan batang silang (X). Ini sangat meningkatkan kompatibilitas dan Anda dapat dengan bebas mengganti sakelar dan membuat ulang keyboard Anda sendiri; Slot LED Internal & Umur Tahan Lama \\ Sakelar AKKO CS dilengkapi dengan slot LED yang menghadap ke utara untuk modifikasi LED. Ini juga kompatibel dengan LED SMD. Ini memberikan fitur dan opsi yang lebih menyenangkan bagi mereka yang menyukai DIY. Dengan masa pakai sekitar 50 juta kali penekanan tombol berdasarkan uji ketahanan laboratorium, Anda yakinlah dengan masa pakai yang lama; Pilih Jenis Berdasarkan Kebutuhan Anda \\ Tiga jenis sakelar AKKO CS tambahan ini dirancang dengan konfigurasi berbeda untuk memenuhi berbagai kebutuhan. Vintage white hadir dengan kekuatan aktuasi yang sangat ringan 35g dengan pegas ekstensi 22mm, yang membuatnya lebih cocok untuk pengetikan berjam-jam; radiant red hadir dengan kekuatan operasi 53gf, total travel 3.5mm, lebih baik untuk para gamer; mengenai lavender purple, ini taktil dengan pegas ekstensi 18mm, sehingga Anda dapat sepenuhnya merasakan kenikmatan mengetik dan bermain game. Sakelar sakura dilengkapi dengan struktur kedap debu dan casing bawah POM.', 'akcsw', 'switch', 4500, 100, 0.06),
('cidoms', 'CIDOO Mint Switch Set', 'Mint Mechanical Switch Set, Linear, Pre-lubed, 5 Pin Switch, 35 Pieces', 'CIDOO Custom Switch with POM Stem & PA66 Housings;5-Pin Switches, Convenient for PCB Mount;Compatible with MX Structure Keycaps;Built-in LED Slot with PC Housing & Durable Lifespan', 'Sakelar Khusus CIDOO dengan Batang POM & Rumah PA66 \\ Sakelar Mekanis CIDOO Mint memiliki batang POM untuk tujuan yang tahan lama. Switch ini mengadopsi struktur yang telah disempurnakan, yang mengurangi kesan gemerisik dan suara yang umumnya ditimbulkan oleh bahan POM, serta menghadirkan pengalaman mengetik dan suara yang menyenangkan; Kekuatan Pengoperasian Reguler dengan Fitur Linier\\ Switch mekanis CIDOO Mint dirancang dengan kekuatan pengoperasian reguler sebesar 43 gf. Switch ini sangat cocok bagi mereka yang menikmati pengalaman mengetik dengan sentuhan yang berat; Switch 5-Pin, Nyaman untuk Pemasangan PCB\\Switch 5-Pin, Nyaman untuk Pemasangan PCB\r\nSakelar mekanis CIDOO Mint dirancang dengan 5-pin. Switch ini kompatibel dengan keyboard yang mendukung hot-swap 5-pin, menawarkan pengalaman mengetik yang memuaskan selama berjam-jam. Dengan 5 pin, akan sangat membantu untuk memasang pada keyboard yang terpasang di PCB secara langsung dan tetap stabil tanpa masalah; Kompatibel dengan MX Structure Keycaps\\\\.\r\nSwitch mekanis CIDOO Mint dirancang dengan struktur MX umum sehingga dapat digunakan pada sebagian besar set keycaps dengan batang silang (X). Hal ini sangat meningkatkan kompatibilitas dan Anda dapat dengan bebas mengganti sakelar dan membuat ulang keyboard Anda sendiri; Slot LED Built-in dengan Housing PC & Masa Pakai yang Tahan Lama \\ Sakelar mekanis CIDOO Mint dilengkapi dengan slot LED untuk lebih banyak kemungkinan. Dengan slot LED dan housing atas PC, fitur lampu latar akan bersinar. Hal ini memberikan lebih banyak fitur dan pilihan yang menyenangkan bagi mereka yang menyukai DIY. Dengan masa pakai sekitar 50 juta kali penekanan tombol berdasarkan uji ketahanan di laboratorium, Anda dapat merasa tenang dengan masa pakai yang lama.', 'cdms', 'switch', 6000, 100, 0.06),
('cidov652', 'CIDOO V65 V2', '65% Hot Swappable Mechanical Keyboard with VIA', 'Metal Rotary Knob for Mac/Win OS;Hot Swappable Mechanical Switches;Wired/Wireless Modes;Gasket Mount Design;Aluminum CNC Casing;Dye-Sublimation PBT Keycaps;PC Plate;Poron Foam Sound Dampening', '65% Keyboard Mekanis & Dukungan Pemrograman VIA\\Setelah merilis beberapa keyboard dan menerima umpan balik dari komunitas, kami di CIDOO dengan senang hati meluncurkan keyboard mekanis yang sangat kuat yang mendukung pemrograman VIA. Dengan tata letak 65%, keyboard ini mempertahankan semua tombol penting untuk pekerjaan sehari-hari dan bermain game, bersama dengan tombol kursor. Selain itu, dengan pemrograman keyboard VIA, Anda dapat menetapkan tombol dan fungsi tambahan untuk memetakan ulang keyboard sepenuhnya untuk setiap kebutuhan Anda. Setelah merilis beberapa keyboard dan menerima umpan balik dari komunitas, kami di CIDOO dengan senang hati meluncurkan keyboard mekanis yang sangat kuat yang mendukung pemrograman VIA. Dengan tata letak 65%, keyboard ini mempertahankan semua tombol penting untuk pekerjaan sehari-hari dan bermain game, bersama dengan tombol kursor. Selain itu, dengan pemrograman keyboard VIA, Anda dapat menetapkan tombol dan fungsi tambahan untuk memetakan ulang keyboard Anda sepenuhnya untuk setiap kebutuhan Anda; Konektivitas Nirkabel Berkabel atau Bluetooth, Mode Win atau Mac untuk Pilihan Anda\\ Dengan baterai 3000mAh internal, V65 mendukung koneksi nirkabel melalui Bluetooth, serta penggunaan kabel dengan kabel USB Type-C yang disertakan. Keyboard dapat terhubung hingga 3 perangkat, dan Anda dapat dengan mudah beralih di antara perangkat dengan menekan Fn + Z, X, atau C. V65 sangat cocok untuk pengetikan di mana saja atau digunakan dengan pengaturan seluler. V65 kompatibel dengan Windows dan MacOS, dan Anda dapat beralih di antara tata letak OS dengan masuk ke mode Win (Fn + Q) atau mode Mac (Fn + W); Desain dan Konstruksi Struktural Terbaik\\ V65 dirancang sebagai keyboard mekanik yang dipasang dengan gasket dengan busa peredam poron dan PC Plate yang disertakan. Pemasangan gasket adalah jenis desain pemasangan struktural keyboard, di mana tidak ada sekrup yang digunakan pada switch plate. Dengan menempatkan gasket di dalam konstruksi keyboard, pengetikan akan terasa lebih halus dan empuk, dengan integritas struktural yang lebih baik dari waktu ke waktu. pengalaman mengetik dan pendengaran yang lebih diperkaya di V65 dengan penggunaan busa Poron berkualitas tinggi. Busa Poron pada konstruksi kami meredam gema di dalam housing, secara efektif meredam resonansi dan menghasilkan profil suara yang lebih bersih. Terakhir, V65 dilengkapi dengan pelat PC, yang paling sesuai dengan dudukan gasket dibandingkan dengan pelat lain yang lebih fleksibel seperti baja atau FR4. Hal ini menambah stabilitas keyboard selama sesi permainan yang lama; Casing Aluminium & Keycaps PBT Sublimasi Pewarna Retro \\ CIDOO V65 hadir dengan bodi aluminium CNC. Aluminium kami telah diolah secara elektrik untuk memberikan permukaan akhir yang lebih baik pada bodi keyboard dan tekstur yang sangat halus. Tidak hanya warna yang dihasilkan sangat tahan lama, proses ini juga memperkuat aluminium itu sendiri, membuatnya tahan lama dan tahan korosi dan oksidasi. Keycaps PBT dye-sub dalam warna abu-abu-krem didesain secara khusus untuk berintegrasi ke dalam tema retro. Keycap PBT sering dianggap sebagai pilihan utama untuk keycap, bahkan di atas keycap ABS, karena bahan PBT jauh lebih tahan lama, tahan minyak (tidak mengkilap seiring waktu seperti keycap ABS), dan tetap setia pada warna; LED & Diffuser Cahaya yang Menghadap ke Selatan \\ CIDOO V65 memiliki lampu latar RGB yang juga dapat disesuaikan melalui VIA. Dengan LED yang menghadap ke selatan, keyboard menghindari gangguan pada keycaps profil ceri yang populer. Terlebih lagi, keyboard ini dilengkapi dengan penyebar cahaya yang membuat RGB lebih terang dan menghadirkan lebih banyak kesenangan untuk penyesuaian lingkungan pengetikan Anda.', 'cidoov65v2', 'fullkit', 1550000, 100, 1.5),
('cidov75', 'CIDOO V75', '81 Keys Gasket Tri-Mode VIA-Programmable Mechanical Keyboard', 'VIA Programmable Mechanical Keyboard;Gasket-mounted 75% Compact Layout;Triple Modes-Bluetooth/2.4GHz/USB-C;Aluminum CNC Casing;South-facing LED and Dye-sublimation PBT Keycaps\r\n;Sandwiched PORON Foam & IXPE Switch Cushion', 'VIA Programmable Mechanical Keyboard\\Fitur VIA yang dapat diprogram memungkinkan Anda untuk menyesuaikan fungsi tombol, makro, dan pencahayaan sesuai keinginan Anda. Anda dapat memetakan ulang tuts, membuat makro, dan bahkan menyesuaikan efek pencahayaan RGB, semuanya melalui perangkat lunak VIA. Fitur ini menjadikan keyboard mekanik CIDOO V75 pilihan tepat bagi para gamer, programmer, dan siapa pun yang menginginkan pengalaman mengetik yang dipersonalisasi; Tata Letak Ringkas 75% yang Dipasang di Gasket\\ Keyboard mekanik CIDOO V75 adalah keyboard berkualitas tinggi yang menawarkan pengalaman mengetik yang luar biasa dengan struktur yang dipasang di paking. Struktur pemasangan gasket memberikan pengalaman mengetik yang lebih mulus dan nyaman dengan mengurangi dampak tuts pada pelat dasar. Gasket terbuat dari strip busa perekat PORON yang diimpor, yang membantu mengurangi kebisingan dan meningkatkan kenyamanan mengetik secara keseluruhan. Fitur ini menjadikan keyboard mekanik CIDOO V75 pilihan tepat bagi siapa saja yang menghabiskan waktu berjam-jam untuk mengetik atau bermain game; Triple Modes-Bluetooth/2.4GHz/USB-C\\ Keyboard mekanik CIDOO V75 memiliki fitur tiga mode - Bluetooth, 2.4GHz, dan konektivitas USB-C - untuk penggunaan yang serbaguna dan nyaman. Mode Bluetooth dan 2.4GHz memungkinkan Anda untuk terhubung ke beberapa perangkat, sedangkan koneksi USB-C memastikan koneksi yang stabil dan cepat ke komputer Anda. Baik Anda seorang gamer, programmer, atau hanya mencari keyboard andal yang dapat dengan mudah terhubung ke beberapa perangkat, keyboard mekanik CIDOO V75 adalah pilihan yang tepat untuk pengalaman mengetik yang serbaguna dan dipersonalisasi; LED yang menghadap ke selatan dan keycaps PBT sublimasi pewarna\\ Keyboard mekanik CIDOO V75 juga dilengkapi dengan keycaps PBT yang menghadap ke selatan dan keycaps PBT sublimasi pewarna untuk tampilan yang ramping dan bergaya. Desain LED yang menghadap ke selatan memungkinkan cahaya bersinar melalui bagian bawah keycap, menciptakan efek cahaya latar yang cerah dan seragam yang meningkatkan tampilan keseluruhan keyboard. Keycap sangat tahan lama dan memberikan desain tahan lama yang tidak akan pudar atau rusak seiring berjalannya waktu. Selain itu, keycaps dirancang untuk memberikan pengalaman mengetik yang nyaman, dengan permukaan yang halus dan stabil yang memastikan penekanan tombol yang akurat dan responsif; Dukungan Soket Hot-Swap Sakelar 3-pin/5-pin \\ Dengan soket hot-swappable, Kit ini memungkinkan Anda untuk membuat keyboard sendiri. Anda dapat menentukan tampilan, jenis, dan suara keyboard Anda pada berbagai switch yang Anda pilih berdasarkan preferensi Anda. Dengan LED yang menghadap ke utara, cahaya akan menerangi keycaps Anda dengan lebih baik dan efek RGB akan bersinar lebih terang; Sandwiched PORON Foam & IXPE Switch Cushion\\Untuk pengalaman mengetik yang nyaman dan menyenangkan, keyboard V75 dilengkapi dengan sandwiched PORON foam, IXPE switch cushion, dan busa bagian bawah. Lapisan busa PORON memberikan alas yang lembut dan mendukung bagi jari-jari Anda untuk beristirahat saat mengetik, yang membantu mengurangi kelelahan dan meningkatkan akurasi. Selain itu, bantalan switch IXPE membantu meredam suara dari setiap penekanan tombol, sehingga keyboard menjadi lebih senyap dan nyaman digunakan. Kombinasi bahan ini memberikan pengalaman mengetik yang halus dan nyaman yang sempurna untuk sesi mengetik yang lama; Kenop Putar Logam dengan Lampu RGB\\ Kenop putar logam dengan lampu RGB pada keyboard mekanik CIDOO V75 memberikan gaya dan fungsionalitas. Hal ini memungkinkan penyesuaian volume dan kecerahan yang mudah sambil menambahkan tampilan yang unik dan personal pada pengaturan Anda. Lampu RGB dapat disesuaikan dengan keinginan Anda, memungkinkan Anda untuk memilih dari berbagai warna dan efek pencahayaan. Fitur ini menambahkan sentuhan unik dan personal pada keyboard, sehingga membuatnya berbeda dari keyboard mekanik lainnya di pasaran.', 'cidoov75', 'fullkit', 1779000, 100, 1.7),
('cidov87', 'CIDOO V87', 'Gasket TKL Tri-Mode-VIA Programmable Mechanical Keyboard', 'Gasket-mounted TKL Compact Layout;VIA Programmable Mechanical Keyboard;Triple Modes - Bluetooth/2.4GHz/USB-C;Aluminum CNC Casing;South-facing LED and Dye-sublimation PBT Keycaps;PORON PCB Foam & IXPE Switch Sheet;Metal Rotary Knob with RGB Light', 'Tata Letak Ringkas TKL yang Dipasang di Gasket\\ Keyboard mekanik CIDOO V87 adalah keyboard berkualitas tinggi yang menawarkan pengalaman mengetik yang luar biasa dengan struktur yang dipasang di gasket. Struktur pemasangan gasket memberikan pengalaman mengetik yang lebih mulus dan nyaman dengan mengurangi benturan tuts pada alas tombol. Gasket terbuat dari strip busa perekat PORON yang diimpor, yang membantu mengurangi kebisingan dan meningkatkan kenyamanan mengetik secara keseluruhan. Fitur ini menjadikan keyboard mekanik CIDOO V87 pilihan tepat bagi siapa saja yang menghabiskan waktu berjam-jam untuk mengetik atau bermain game; VIA Programmable Mechanical Keyboard \\ Fitur VIA yang dapat diprogram memungkinkan Anda untuk menyesuaikan fungsi tombol, makro, dan pencahayaan sesuai keinginan Anda. Anda dapat memetakan ulang tombol, membuat makro, dan bahkan menyesuaikan efek pencahayaan RGB, semuanya melalui perangkat lunak VIA. Baik Anda seorang gamer yang perlu memetakan ulang tuts, programmer yang membutuhkan makro, atau hanya seseorang yang ingin menyesuaikan efek pencahayaan RGB, perangkat lunak VIA siap membantu Anda; Triple Mode-Bluetooth/2.4GHz/USB-C\\Keyboard mekanik CIDOO V87 memiliki fitur tiga mode - Bluetooth, 2.4GHz, dan konektivitas USB-C - untuk penggunaan yang serbaguna dan nyaman. Mode Bluetooth dan 2.4GHz memungkinkan Anda untuk terhubung ke beberapa perangkat, sedangkan koneksi USB-C memastikan koneksi yang stabil dan cepat ke komputer Anda. Baik Anda seorang gamer, programmer, atau hanya mencari keyboard andal yang dapat dengan mudah terhubung ke beberapa perangkat, keyboard mekanik CIDOO V87 adalah pilihan yang tepat untuk pengalaman mengetik yang serbaguna dan dipersonalisasi; LED yang menghadap ke selatan dan keycaps PBT sublimasi pewarna\\ Keyboard mekanik CIDOO V87 juga dilengkapi dengan keycaps LED yang menghadap ke selatan dan keycaps PBT sublimasi pewarna untuk tampilan yang ramping dan bergaya. Desain LED yang menghadap ke selatan memungkinkan cahaya bersinar melalui bagian bawah keycap, menciptakan efek cahaya latar yang cerah dan seragam yang meningkatkan tampilan keseluruhan keyboard. Keycap sangat tahan lama dan memberikan desain tahan lama yang tidak akan pudar atau rusak seiring berjalannya waktu. Selain itu, keycaps dirancang untuk memberikan pengalaman mengetik yang nyaman, dengan permukaan yang halus dan stabil yang memastikan penekanan tombol yang akurat dan responsif; Sandwiched PORON Foam & IXPE Switch Cushion\\ Untuk pengalaman mengetik yang nyaman dan menyenangkan, keyboard V87 dilengkapi dengan sandwiched PORON foam, IXPE switch cushion, dan busa bagian bawah, yang memberikan pengalaman mengetik yang mulus dan nyaman sehingga mengurangi kelelahan dan meningkatkan akurasi. Selain itu, bantalan sakelar IXPE membantu meredam suara setiap penekanan tombol, sehingga keyboard lebih tenang dan lebih nyaman digunakan; Kenop Putar Logam dengan Lampu RGB Kenop putar logam dengan lampu RGB pada keyboard mekanik CIDOO V87 memberikan gaya dan fungsionalitas. Hal ini memungkinkan penyesuaian volume dan kecerahan yang mudah sambil menambahkan tampilan yang unik dan personal pada pengaturan Anda. Lampu RGB dapat disesuaikan dengan keinginan Anda, memungkinkan Anda untuk memilih dari berbagai warna dan efek pencahayaan. Fitur ini menambahkan sentuhan unik dan personal pada keyboard, sehingga membuatnya berbeda dari keyboard mekanik lainnya di pasaran.', 'cidoov87', 'fullkit', 1950000, 100, 2.5),
('Emak', 'Epomaker Matcha Keycaps', '124 Keys XDA Profile Dye Sublimation PBT Full Keycaps Set', 'XDA Profile Keycaps Full Set;Epomaker Matcha Color Scheme;PBT High-Quality Material;Full Size Set, Suitable for ANSI Layout;Dye Sublimation Technique;Compatible with 60% / 65% / 75% / TKL / 1800 Compact /;Full-size keyboards', 'Skema Warna Matcha Epomaker\\Warna hijau matcha selalu menghadirkan perasaan yang menyegarkan. Sebagai inspirasi dari hidangan penutup yang populer dan asal mula desain yang kreatif, set keycaps ini dipilih oleh Epomaker untuk dibagikan kepada dunia. Set keycaps Epomaker Matcha menghadirkan suasana alam dan liburan dengan tema warna hijau matcha yang dihiasi dengan beberapa legenda makanan penutup; Profil XDA, Kompatibel dengan MX Switches\\ Hadir dengan profil XDA, keycaps ini memiliki tinggi yang sama satu sama lain. Jadi, tidak perlu khawatir akan menimbulkan masalah ketinggian yang berbeda dengan meletakkan beberapa keycap tertentu seperti PgUp dan PgDn pada baris yang berbeda dalam tata letak 75% atau TKL. Ini kompatibel dengan switch struktur MX seperti Cherry, Gateron, Kailh, dll. Satu set keycap yang membuat perjalanan DIY Anda bebas dari rasa khawatir; Keycaps PBT Sublimasi Pewarna \\ Set ini mengadopsi teknik sublimasi pewarna dan bahan PBT untuk mencapai pengalaman terbaik bagi pemain. Teknik ini memungkinkan keycaps diwarnai dengan warna-warna cerah dan memastikan keycaps tahan luntur. Tekstur permukaan yang digosok terasa halus dan tahan minyak serta tidak akan meninggalkan sidik jari Anda bahkan setelah digunakan dalam waktu yang lama; 124 Keys Set\\ Selain keycaps lengkap dasar, set ini juga berisi keycaps pengganti ekstra, memberikan lebih banyak kesenangan untuk mencocokkan dengan bebas untuk keycaps keyboard mekanis Anda. Yang satu ini dapat menjadi set pengganti yang sempurna untuk keyboard yang paling populer di pasaran. Dapat memuat keyboard dengan tata letak yang berbeda; Peningkatan Kompatibilitas\\ Set keycaps Epomaker Matcha berisi tombol SHIFT berukuran khusus dan pengubah lainnya seperti tombol SHIFT 1u/1.75u/2u/2.25u, sehingga memiliki lebih banyak kemungkinan untuk menyesuaikan keyboard epomaker Anda, seperti keyboard 61/64/68/87/87/96/98/104/108. Keyboard ini juga memiliki semua huruf dan tombol fungsi yang Anda butuhkan.', 'Emak', 'keycaps', 470000, 100, 0.6),
('epbk', 'Epomaker Barometer Keycaps Set', '132 Keys XDA Profile Dye-Sub PBT Full Keycaps Set', 'XDA Profile Keycaps Full Set;Barometer Color Scheme;PBT High-Quality Material;Full Size Set, Suitable for ANSI Layout;Dye Sublimation Technique', 'Set Keycaps bertema Barometer EPOMAKER\\Sebuah kreasi yang didasarkan pada cuaca dan barometer yang dapat berubah-ubah, set keycap EPOMAKER Barometer menyatukan kombinasi halus alfa gading, pengubah warna biru bubuk, dan aksen merah muda. Warna-warna ini mengingatkan kita pada langit yang jernih dan cahaya di pantai yang lembap setelah hujan deras. Bentuk awan yang beraneka ragam menyoroti tema barometer dan Anda dapat mengubah awan berdasarkan emosi Anda hari ini, cerah, suram, atau mendung... sesuai keinginan. Selain itu, keycaps PBT dye-sub PBT tahan terhadap kerasnya sesi pengetikan yang lama. Dengan profil XDA, keycap ini memiliki ketinggian yang menonjol untuk perasaan yang memuaskan; Kompatibilitas Luas untuk Sakelar Struktur MX dan Berbagai Tata Letak\\Barometer dirancang dalam struktur MX universal yang dapat bekerja dengan sebagian besar sakelar di pasaran yang memiliki struktur MX dan klonnya, seperti Gateron, Kailh, Cherry, Otemu, dan lain-lain. Banyak keycaps dalam berbagai ukuran akan berfungsi untuk tata letak yang berbeda, seperti 60%/75%/80%, TKL, atau keyboard ukuran penuh. Dapatkan satu set dan buat semuanya berfungsi. Untuk ukuran detail, silakan lihat peta ukuran dan penjelasan; Profil XDA\\ Profil XDA adalah profil keycap seragam pendek yang sedikit lebih tinggi dari DSA. Seperti DSA, keycap XDA memiliki profil yang rendah dan seragam sehingga profil ini disukai oleh para penggemar karena memiliki tampilan yang bagus. Cukup mudah untuk digunakan dan terdengar mirip dengan profil Cherry hanya saja dengan nada yang lebih rendah. Profil ini dianggap sebagai pilihan yang solid untuk bermain game dan mengetik cepat atau biasa; Bahan PBT Berkualitas Tinggi\\Untuk pengalaman mengetik dan daya tahan terbaik, kami menggunakan bahan PBT daripada ABS. Dibandingkan dengan bahan ABS, PBT lebih jarang ditemukan dan teksturnya lebih terasa dan lebih tahan lama. Bahan ini kering dan tidak mudah berminyak. Bahan ini tidak akan rusak seiring waktu, seperti halnya ABS; Teknik Sublimasi Pewarna\\Sublimasi pewarna adalah proses pencetakan yang sangat efektif yang menciptakan grafik tingkat ahli. Dengan menggunakan metode ini, gambar tidak akan retak atau aus setelah beberapa kali penggunaan dan visualnya akan bertahan selama yang dibutuhkan. Dengan teknik ini, set keycaps EPOMAKER Barometer mampu menghadirkan warna yang hidup dan desain yang jelas.', 'epbk', 'keycaps', 460000, 100, 0.6),
('epfs', 'Epomaker Flamingo Switch Set', 'Original 30 Pieces of Epomaker Flamingo Switch Set for Mechanical Keyboard Replacement', 'Factory Lubed & Intact Housings;5-Pin,;Compatible with MX Structure Keycaps & PCBs;Built-in LED Slot & Durable Lifespan;Linear Type with 35gf Initial Force;Suitable for Customised Keyboards', 'Sakelar Linear EPOMAKER Flamingo \\ Sifat yang paling jelas dan menarik dari Flamingo adalah warnanya yang cerah yang mengilhami para desainer EPOMAKER untuk membuat kursi sakelar linear yang merangkul alam sambil tetap mempertahankan fungsionalitas. Dengan pemikiran tersebut, maka terciptalah perangkat sakelar Flamingo! Setiap sakelar memiliki housing berwarna merah muda terang untuk menggambarkan asal-usulnya dengan baik; POM Stem, PC Housing\\POM, atau Polyoxymethylene, adalah polimer serbaguna yang dikenal dengan ketahanan ekstrim dan koefisien gesekan yang rendah. Switch EPOMAKER Flamingo mengadopsi batang POM karena sifatnya yang rendah gesekan untuk menciptakan pengalaman penekanan tombol yang mulus dan tanpa goresan tanpa pelumas tambahan. Lebih dari itu, housing transparan PC dan pegas ganda membuat switch ini cukup menarik di antara switch lainnya; Set Switch Pelumas Pabrik \\ Hadir dengan pelumas pabrik dan terstruktur khusus, switch EPOMAKER Flamingo dapat dilumasi sendiri saat diketik, yang sangat membantu untuk mempertahankan rasa yang mulus. Batang yang tahan lama dikreditkan untuk pengalaman mengetik yang lebih lancar dan menyenangkan; Kompatibel dengan Keycaps Struktur MX \\ Sakelar EPOMAKER Flamingo dirancang dengan struktur MX umum sehingga dapat digunakan pada sebagian besar set keycaps dengan batang silang (X). Hal ini sangat meningkatkan kompatibilitas dan Anda dapat dengan bebas mengganti sakelar dan membuat ulang keyboard Anda sendiri; Slot LED Built-in & Masa Pakai yang Tahan Lama \\ Dilengkapi dengan slot LED untuk modifikasi, lampu latar dapat bersinar bahkan dengan rumah PBT di sakelar EPOMAKER Flamingo. Hal ini memberikan lebih banyak fitur dan pilihan yang menyenangkan bagi para DIYer. Dengan pegas ganda yang kuat, masa pakai dapat mencapai 100 juta kali penekanan tombol berdasarkan uji ketahanan di laboratorium. Dapatkan keyboard Anda sesuatu yang baru dan bersenang-senanglah dengan mereka!; Inspirasi dari EPOMAKER Flamingo\\Switch Set\r\nEPOMAKER selalu tertarik dan terinspirasi dari alam. Selama bertahun-tahun, pikiran kreatif kami telah mulai melihat ke alam untuk menemukan solusi desain yang fungsional dan indah. Kami bahkan telah menciptakan filosofi desain, Bio-mimikri, berdasarkan konsep bahwa alamlah yang paling tahu. Hal ini dapat dilihat pada rangkaian tombol yang baru saja kami luncurkan dan beberapa tombol sebelumnya, seperti kucing, panda, susu madu, gunung es, dan macaw.', 'epfs', 'switch', 6000, 100, 0.06),
('epicek', 'EPOMAKER Iceberg Keycaps Set', '126 Keys XDA Profile PBT Keycaps Set', 'PBT XDA profile keycaps;126 keys with Large Fonts;Wide Compatibility for MX Structure Switch;Compatible with 60%/65%/75%/TKL/96% or full size keyboard', 'EPOMAKER Iceberg Keycaps Set dengan Hiragana Jepang\\ EPOMAKER Iceberg Keycaps set mengambil inspirasi dari Hiragana untuk menghadirkan cara baru untuk mempelajari Alfabet Jepang, dan merupakan cara yang tepat untuk menambahkan beberapa karakter ke dalam keyboard kesayangan Anda. Menampilkan 126 tuts PBT, masing-masing dibuat melalui proses sublimasi pewarna, set ini tahan lama, awet, dan tahan terhadap minyak yang menumpuk dari waktu ke waktu dari kulit; Kompatibilitas Luas untuk Sakelar Struktur MX dan Berbagai Tata Letak\\EPOMAKER Iceberg Set dirancang dalam struktur MX universal yang dapat digunakan dengan sebagian besar sakelar di pasaran yang memiliki struktur MX dan klonnya, seperti Gateron, Kailh, Cherry, Otemu, dll. Banyak keycaps dalam berbagai ukuran akan berfungsi untuk tata letak yang berbeda, seperti 60%/75%/80%, TKL, atau keyboard ukuran penuh. Dapatkan satu set dan buat semuanya berfungsi. Untuk ukuran detail, silakan lihat peta ukuran dan penjelasan; Profil XDA yang disukai\\ Profil XDA adalah profil keycap seragam pendek yang sedikit lebih tinggi daripada DSA. Seperti DSA, keycap XDA memiliki profil yang rendah dan seragam sehingga profil ini disukai oleh para penggemar karena memiliki tampilan yang bagus. Cukup mudah untuk digunakan dan terdengar mirip dengan profil Cherry hanya saja dengan nada yang lebih rendah. Profil ini dianggap sebagai pilihan yang solid untuk bermain game dan mengetik cepat atau biasa; Bahan PBT Berkualitas Tinggi\\Untuk pengalaman mengetik dan daya tahan terbaik, kami menggunakan bahan PBT daripada ABS. Dibandingkan dengan bahan ABS, PBT memiliki tekstur yang lebih jarang dan terasa lebih tahan lama. Bahan ini tetap kering dan tidak mudah berminyak. Bahan ini tidak cepat rusak seiring waktu seperti ABS; Teknik Sublimasi Pewarna\\Sublimasi pewarna adalah proses pencetakan yang sangat efektif yang menciptakan grafik tingkat ahli. Dengan menggunakan metode ini, gambar tidak akan retak atau aus setelah beberapa kali penggunaan dan visualnya akan bertahan selama yang dibutuhkan. Dengan teknik ini, set keycaps EPOMAKER Iceberg mampu menghadirkan warna yang hidup dan desain yang jelas', 'epicek', 'keycaps', 470000, 100, 0.6),
('epmrk', 'Epomaker Marrs Keycap Set', '134 Keys Cherry Profile PBT Full Keycaps Set', 'Cherry Profile Keycaps Full Set;Double Shot;Techniques with High-Quality PBT Material;Full Size Set, Suitable for ANSI Layout', 'Skema Warna Epomaker Marrs\\ Terinspirasi dari \'Marrs Green\' klasik, kami telah menciptakan versi gelap dari Marrs. Set keycaps ini terdiri dari warna gelap dengan warna hitam dan hijau marrs, menginterpretasikan kesan serius dengan minimalis, sementara dilengkapi dengan legenda warna krem dan tuts ekstra. Baik untuk suasana serius maupun santai, keycaps set Marrs ini memadukan kedua elemen kontras tersebut menjadi satu dengan sempurna; Cherry Profile, Kompatibel dengan MX Switches\\ Keycap set ini didesain dengan profil ceri untuk mereka yang menginginkan pengalaman mengetik yang ergonomis, dengan ketinggian yang berbeda pada baris yang berbeda. Kompatibel dengan sakelar struktur MX seperti Cherry, Gateron, Kailh, dll. Akan lebih mudah bagi para DIYer untuk tidak perlu repot-repot mengotak-atik keycaps dan switch; Double Shot Keycaps dengan Material PBT Berkualitas Tinggi \\ Set ini mengadopsi teknik double shot dan material PBT untuk mendapatkan pengalaman terbaik bagi para pemain. Teknik ini merupakan proses manufaktur yang lebih rumit di mana dua plastik terpisah dicetak secara injeksi untuk melengkapi keycaps. Tekstur permukaan yang digosok terasa halus dan tahan minyak serta tidak akan meninggalkan sidik jari Anda bahkan setelah digunakan dalam waktu yang lama. Detail dan teknik memungkinkan set ini menjadi pilihan yang ideal dan terbaik ketika Anda mencari set pengganti; 134 Keys Set\\ Selain keycaps lengkap dasar, set ini juga berisi keycaps pengganti ekstra. Set ini memberikan lebih banyak kesenangan untuk mencocokkan keycaps keyboard mekanis Anda dengan bebas. Set Keycaps Epomaker Marrs Keycaps dapat menjadi set pengganti yang sempurna untuk keyboard yang paling populer di pasaran. Set keycaps Epomaker Marrs ini dapat digunakan untuk keyboard dengan tata letak yang berbeda; Peningkatan Kompatibilitas\\ Set keycaps Epomaker Marrs berisi ukuran shift khusus dan pengubah seperti tombol SHIFT 1.75u, sehingga memiliki lebih banyak kemungkinan untuk mengkustomisasi keyboard epomaker Anda, seperti keyboard 60% / 65% / 75% / TKL / 96% / 1800-kompak / 100%. Keyboard ini juga memiliki semua huruf dan tombol fungsi yang Anda butuhkan. Satu set keycap yang membuat perjalanan DIY Anda bebas dari rasa khawatir.', 'epmrk', 'keycaps', 650000, 100, 0.6),
('estk', 'EPOMAKER Space Travel Keycaps', '147 Keys MDA Profile ANSI/ISO PBT Dye Sublimation Keycaps Set', 'Epomaker Space Travel Theme Keycaps;MDA profile, Compatible with MX Switches;147 keys with Large Fonts;ANSI/ISO Layout Compatible;Compatible with 60%/65%/75%/TKL/96%/1800-compact or full size keyboard', 'Set Kunci Perjalanan Luar Angkasa EPOMAKERS\\Selama bertahun-tahun, menjelajahi ruang angkasa telah menjadi topik yang tak pernah habis dibahas. Kami tidak pernah menghentikan langkah kami di alam semesta yang belum terjamah. Sebagai sekelompok orang yang tak kenal takut, tim EPOMAKER membawa keberanian itu ke dalam produk kami. Keycaps perjalanan luar angkasa ini menyandingkan alfa putih dengan pengubah ungu tua dalam warna yang memukau yang hampir bersinar. Tampilan menawan ini dilengkapi dengan bentuk profil MDA yang memuaskan dan bentuk miring yang memuaskan; 145 Set Tombol, Kompatibel dengan Tata Letak ANSI / ISO \\ Selain keycaps lengkap dasar, set tombol Space Travel juga berisi tombol pengganti tambahan, termasuk pengubah Mac dan tombol khusus ISO, seperti tombol Enter besar, 1.25U Shift... Apakah Anda menggunakan tata letak standar ANSI atau Anda lebih terbiasa dengan tata letak ISO, kami menyediakan semuanya untuk Anda. Cukup dapatkan satu set dan penuhi semua kebutuhan; Kompatibilitas Luas untuk Sakelar Struktur MX dan Berbagai Tata Letak \\ Set Keycaps Space Travel dirancang dalam struktur MX universal yang dapat bekerja dengan sebagian besar sakelar di pasar yang memiliki struktur MX dan klonnya, seperti Gateron, Kailh, Cherry, Otemu, dll. Banyak keycaps dalam berbagai ukuran akan berfungsi untuk tata letak yang berbeda, seperti 60%/75%/80%, TKL, atau keyboard ukuran penuh. Dapatkan satu set dan buat semuanya berfungsi. Untuk ukuran detail, silakan lihat peta ukuran dan penjelasannya; Profil MDA yang unik \\ Profil MDA sama dengan profil SA tetapi sedikit berbeda dalam beberapa hal. Profil SA lebih tinggi dari profil MDA tetapi ini juga membuat MDA menarik bagi mereka yang tidak menyukai ketinggian SA tetapi ingin mencoba beberapa keycaps yang dipahat. Profil ini juga memberikan pengalaman unik yang tidak seperti profil lainnya. Profil ini dianggap sebagai pilihan yang solid untuk bermain game dan mengetik cepat atau biasa; Bahan PBT Sublimasi Pewarna 5-Sisi\\Untuk pengalaman mengetik dan daya tahan terbaik, kami menggunakan bahan PBT, bukan ABS. Dibandingkan dengan bahan ABS, PBT memiliki tekstur yang lebih jarang dan terasa lebih tahan lama. Bahan ini kering dan tidak mudah berminyak. Bahan ini tidak akan rusak seiring waktu seperti halnya ABS. Sublimasi pewarna 5 sisi adalah proses pencetakan yang sangat efektif yang menciptakan grafik tingkat ahli. Dengan menggunakan metode ini, gambar tidak akan retak atau aus setelah beberapa kali penggunaan dan visualnya akan bertahan selama yang dibutuhkan. Dengan teknik ini, set keycaps EPOMAKER Space Travel mampu menghadirkan warna yang hidup dan desain yang jelas.', 'estk', 'keycaps', 650000, 100, 0.6),
('kbs', 'Kailh Box Switch Set', 'Original 15 Pieces Kailh Box Switch Set for Mechanical Keyboard Replacement', 'Suitable for customised keyboards', 'Kailh Box\\Dirancang oleh Kaihua, switch ini pertama kali diproduksi pada tahun 2017. Secara eksternal, switch ini sebagian besar kompatibel dengan switch mekanis lainnya, hanya saja bentuknya sedikit berbeda dengan kloningannya. Para gamer sangat menyukai switch mekanik ini yang responsif, halus, dan ramah anggaran. Ini mencakup semua kebutuhan Anda dan jangan ragu untuk memilihnya; EPOMAKER Switch Set\\ Keyboard mekanik memiliki begitu banyak potensi dan kesenangan. EPOMAKER sangat memahami pasar sehingga kami memiliki set kotak Kailh yang unik ini bagi mereka yang menyukai DIY keyboard-nya. Atau Anda dapat mengganti yang rusak dengan set ini. Ini adalah pengganti yang baik untuk kebutuhan apa pun; Teknologi Mutakhir Untuk Profesional Esport \\\\Keterampilan yang dibuat dengan baik dan peralatan yang dapat diandalkan adalah faktor penting bagi para profesional esport. Kotak Kailh mendefinisikan persyaratan standar untuk presisi, konstruksi, dan manufaktur, menjadikannya salah satu sakelar tombol terbaik di seluruh dunia.; Kualitas Bangun\\Kontak logam terbungkus dalam kotak, yang merupakan asal mula sakelar ini mendapatkan namanya. Kotak ini ada untuk mencegah kotoran dan debu mengganggu pengoperasian sakelar. Menurut Kaihua, sakelar ini tahan air/tahan debu IP56. Sakelar tersedia dalam versi linear, taktil, dan clicky; Mengapa Kami Membuat Set Ini? Sebagai pembuat profesional keyboard mekanik, EPOMAKER selalu terikat dengan komunitas sehingga kami mengetahui kebutuhan Anda dan mendengar suara dan saran Anda. Switch set ini dibuat untuk Anda yang menyukai DIY atau perlu mengganti switch yang rusak. Jangan ragu untuk mendapatkannya dan memulai perjalanan Anda untuk membuat ulang keyboard Anda. EPOMAKER akan menjadi salah satu pilihan terbaik Anda.', 'kbs', 'switch', 9500, 100, 0.06),
('ktrs', 'KTT Rose Switch Set', 'Original KTT Rose Switch Set for Mechanical Keyboard Replacement', 'POM Stem, PC & Nylon Housing, Pre-lubed;3-Pin, Compatible with MX Structure Keycaps;Built-in LED Slot & Durable Lifespan;Regular Operating Force with Linear Feature;Suitable for Customised Keyboards', 'Set Sakelar Pra-pelumasan Pabrik \\ Hadir dengan pelumas pabrik dan terstruktur khusus, sakelar KTT Rose juga dapat dilumasi sendiri pada setiap penekanan tombol, yang sangat membantu untuk mempertahankan rasa yang mulus. Batang yang tahan lama dikreditkan untuk pengalaman mengetik yang lebih lancar dan menyenangkan; Sakelar Linear Kustom KTT \\ Sakelar KTT Rose dibuat dengan rumah bagian atas transparan PC, rumah bagian bawah Nilon, dan batang POM, yang bertujuan untuk merespons dengan cepat dan mengetik dengan lancar. Dibentuk dengan housing slot LED dan 3 pin, switch ini cocok bagi mereka yang menyukai keyboard RGB. Switch KTT Rose dibuat dengan kekuatan operasi 43g. Switch ini sangat cocok untuk para juru ketik yang harus bekerja dengan keyboard dalam waktu yang lama; Kompatibel dengan MX Structure Keycaps\\Switches mekanis KTT Rose didesain dengan struktur MX secara umum sehingga dapat digunakan pada sebagian besar set keycaps dengan batang silang (X). Hal ini sangat meningkatkan kompatibilitas dan Anda dapat dengan bebas mengganti sakelar dan membuat ulang keyboard Anda sendiri; Batang POM, Housing Atas PC & Housing Bawah Nilon \\ Sakelar KTT Rose dilengkapi dengan batang POM, housing atas PC, dan housing bawah Nilon yang sangat tahan lama. Housing PC membuat switch menjadi transparan dan benar-benar bersinar. Ini benar-benar sempurna bagi mereka yang menyukai lampu RGB. Dengan struktur yang telah disempurnakan yang mengurangi kesan gemerisik dan suara, yang umumnya ditimbulkan oleh bahan POM, switch ini menghadirkan pengalaman mengetik dan suara yang menyenangkan; Slot LED Internal dengan Housing Transparan & Umur Tahan Lama \\ Sakelar mekanis KTT Rose dilengkapi dengan slot LED untuk modifikasi. Hal ini memberikan lebih banyak fitur dan opsi yang menyenangkan bagi mereka yang menyukai DIY. Memiliki masa pakai sekitar 80 juta kali penekanan tombol berdasarkan uji daya tahan di laboratorium; Anda dapat merasa tenang dengan masa pakai yang lama.', 'ktrws', 'switch', 3500, 100, 0.06);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id_User` varchar(8) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `notelp` varchar(13) NOT NULL,
  `alamat` text NOT NULL,
  `tipe` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id_User`, `username`, `password`, `email`, `notelp`, `alamat`, `tipe`) VALUES
('21q26544', '21q321q', '123123', 'qweqwe', '123123', '', ''),
('21q44437', '21q321qasdasdas', '123123', 'qweqwesadas', '123123', '', ''),
('21q88619', '21q321qasdasdasasdas', '123123', 'qweqwesadas', '123123', '', ''),
('ale64910', 'alex', '12345', 'alex@gmail.com', '082313143441', '', 'user'),
('asd77284', 'asdas', '232', 'asdasd', '2323', '', ''),
('asd16877', 'asdasdsa', '1as', 'asdsad', '231213', '', ''),
('asd99622', 'asdsad', 'asdasd', 'asdasda', '213213', '', ''),
('asd63333', 'asdsadsa', '21q3123', 'wqewqeew', '2323232', '', ''),
('aud50638', 'audryastridia', 'samuray123', 'audryastridia@gmail.com', '081263035236', 'Jl. Belimbing no 2 Lenteng Agung Jagakarsa jakarta selatan', 'user'),
('muf30151', 'mufli', '12345', 'mufli.ahmad14@gmail.com', '082292620164', '', 'user'),
('OR 75154', 'OR \'a\'=\'a\'', '', '', '', '', 'user'),
('rey17352', 'reydwir', 'tasikmalaya123', 'reyhandwirama123@gmail.com', '081263035236', '', ''),
('rey99347', 'reyhandwirama', 'samuray123', 'reyhandwirama@gmail.com', '081263035236', 'Jl.Gelatik no 85 Kota Tangerang Selatan Kecamatan ciputat kelurahan sawah Provinsi banten negara indonesia', 'admin'),
('rey19544', 'reyhandwirama1', 'samuray123', 'welkrjewlkjrew', '320948092384', '', 'user'),
('rey91224', 'reyhandwirama10', 'samuray123', 'reyhandwirama123@gmail.com', '081263035236', 'testing', 'user'),
('rey16288', 'reyhandwirama2', 'samuray123', 'welkrjewlkjrew', '320948092384', '', 'user'),
('rey64769', 'reyhandwirama20', 'samuray123', 'reyhandwirama123@gmail.com', '081263035236', '', 'user'),
('rey68120', 'reyhandwirama3', 'samuray123', 'welkrjewlkjrew', '320948092384', '', 'user'),
('rey11196', 'reyhandwirama4', 'samuray123', 'welkrjewlkjrew', '320948092384', '', 'user'),
('rey67994', 'reyhandwirama5', 'samuray123', 'elwkrhwelkrh', '2398473984', 'Jalan Gelatik no 85 kecamatan ciputat kelurahan sawah kota tangerang selatan', 'user'),
('San76038', 'San', 'San', 'traxhantsan@gmail.com', '00000000', 'Gunadarma Kampus ', 'user'),
('sdf97482', 'sdfdsf', 'asd', 'sdfsdf', '43', '', ''),
('sdf55955', 'sdfsd', 'sdfsdfds', 'fdsfds', '324324324', '', ''),
('sdf18666', 'sdfsdfsdf', 'sdfdsfds', 'sdfdsfsd', 'fsdfsdfsd', '', ''),
('sdw71072', 'sdwerwe', '32523532', '324324', '325325325', '', ''),
('spa84691', 'spartancoy', 'Test123', 'hanswidi@gmail.com', '081211113214', '', 'user'),
('tes31572', 'test123', '123123', 'teste123', '123545', '', ''),
('wqe45648', 'wqewq', '21321321', 'qweqweqw', '2313213', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Id_Cart`);

--
-- Indexes for table `cartdetail`
--
ALTER TABLE `cartdetail`
  ADD UNIQUE KEY `Id_User` (`Id_User`,`Id_Product`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD UNIQUE KEY `Id_Order` (`Id_Order`,`Id_Product`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id_Order`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`Id_Product`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `Id_User` (`Id_User`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
