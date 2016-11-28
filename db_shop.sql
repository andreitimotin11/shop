-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2016 at 12:48 PM
-- Server version: 5.5.25
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `buy_products`
--

CREATE TABLE IF NOT EXISTS `buy_products` (
  `buy_id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_id_order` int(11) NOT NULL,
  `buy_id_product` int(11) NOT NULL,
  `buy_count_product` int(11) NOT NULL,
  PRIMARY KEY (`buy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id_products` int(11) NOT NULL,
  `cart_price` int(11) NOT NULL,
  `cart_count` int(11) NOT NULL,
  `cart_datetime` datetime NOT NULL,
  `cart_ip` varchar(100) NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `brand` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf16 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `type`, `brand`) VALUES
(1, 'mobile', 'Apple'),
(2, 'mobile', 'Explay'),
(3, 'mobile', 'Fly'),
(4, 'mobile', 'HTC'),
(5, 'mobile', 'LG'),
(6, 'mobile', 'Motorola'),
(7, 'mobile', 'Nokia'),
(8, 'mobile', 'Philips'),
(9, 'mobile', 'Samsung'),
(10, 'mobile', 'Sony'),
(12, 'notebook', 'Acer'),
(15, 'notebook', 'HP'),
(16, 'notebook', 'Lenovo'),
(17, 'notebook', 'MSI'),
(18, 'notebook', 'Packard Bell'),
(20, 'notebook', 'Samsung Apple'),
(21, 'notebook', 'Apple'),
(22, 'notepad', 'Samsung'),
(24, 'notepad', 'Sony');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `text`, `date`) VALUES
(1, 'Бонус на счет при покупке смартфонов Nokia', 'Купите акционный смартфон Nokia и получите на свой счет до 1000 рублей!', '2013-08-23'),
(2, 'Бонус на счет при покупке планшета с 3G-модулем', 'Получите до 1000 бонусных рублей на счет при покупке планшета в МТС!', '2013-08-23');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_datetime` datetime NOT NULL,
  `order_confirmed` varchar(10) NOT NULL,
  `order_dostavka` varchar(255) NOT NULL,
  `order_pay` varchar(50) NOT NULL,
  `order_type_pay` varchar(100) NOT NULL,
  `order_fio` text NOT NULL,
  `order_address` text NOT NULL,
  `order_phone` varchar(50) NOT NULL,
  `order_note` text NOT NULL,
  `order_email` varchar(50) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reg_admin`
--

CREATE TABLE IF NOT EXISTS `reg_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `fio` text NOT NULL,
  `role` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `view_orders` int(11) NOT NULL DEFAULT '0',
  `accept_orders` int(11) NOT NULL DEFAULT '0',
  `delete_orders` int(11) NOT NULL DEFAULT '0',
  `add_tovar` int(11) NOT NULL DEFAULT '0',
  `edit_tovar` int(11) NOT NULL DEFAULT '0',
  `delete_tovar` int(11) NOT NULL DEFAULT '0',
  `accept_reviews` int(11) NOT NULL DEFAULT '0',
  `delete_reviews` int(11) NOT NULL DEFAULT '0',
  `view_clients` int(11) NOT NULL DEFAULT '0',
  `delete_clients` int(11) NOT NULL DEFAULT '0',
  `add_news` int(11) NOT NULL DEFAULT '0',
  `delete_news` int(11) NOT NULL DEFAULT '0',
  `add_category` int(11) NOT NULL DEFAULT '0',
  `delete_category` int(11) NOT NULL DEFAULT '0',
  `view_admin` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `reg_admin`
--

INSERT INTO `reg_admin` (`id`, `login`, `pass`, `fio`, `role`, `email`, `phone`, `view_orders`, `accept_orders`, `delete_orders`, `add_tovar`, `edit_tovar`, `delete_tovar`, `accept_reviews`, `delete_reviews`, `view_clients`, `delete_clients`, `add_news`, `delete_news`, `add_category`, `delete_category`, `view_admin`) VALUES
(2, 'admin', 'mb03foo5139a7d9937942b54253255931b44f7924qj2jjdp9', 'Жур Артур Владимирович', 'Администратор', 'test@mail.ru', '5678453', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reg_user`
--

CREATE TABLE IF NOT EXISTS `reg_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `patronymic` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `datetime` datetime NOT NULL,
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `reg_user`
--

INSERT INTO `reg_user` (`id`, `login`, `pass`, `surname`, `name`, `patronymic`, `email`, `phone`, `address`, `datetime`, `ip`) VALUES
(5, 'admin', '9nm2rv8q0cc4856e4fbbab44b76c641ed8c0bb5f2yo6z', 'Жур', 'Артур', 'Владимирович', 'test@mail.ru', '1232', 'г Литва', '2013-09-10 08:52:08', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `table_products`
--

CREATE TABLE IF NOT EXISTS `table_products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `seo_words` text NOT NULL,
  `seo_description` text NOT NULL,
  `mini_description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `mini_features` text NOT NULL,
  `features` text NOT NULL,
  `datetime` datetime NOT NULL,
  `new` int(11) NOT NULL DEFAULT '0',
  `leader` int(11) NOT NULL DEFAULT '0',
  `sale` int(11) NOT NULL DEFAULT '0',
  `visible` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `type_tovara` varchar(255) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  `votes` float NOT NULL,
  PRIMARY KEY (`products_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `table_products`
--

INSERT INTO `table_products` (`products_id`, `title`, `price`, `brand`, `seo_words`, `seo_description`, `mini_description`, `image`, `description`, `mini_features`, `features`, `datetime`, `new`, `leader`, `sale`, `visible`, `count`, `type_tovara`, `brand_id`, `vote`, `votes`) VALUES
(2, 'Samsung I9190 Galaxy S4 mini', 4749, 'Samsung ', '', '', 'Released 2013, July\n107g, 8.9mm thickness\nAndroid OS, v4.2.2\n8GB storage, microSD card slot', 'img1.jpg', '', 'Released 2013, July 107g, 8.9mm thickness Android OS, v4.2.2 8GB storage, microSD card slot', '', '2016-06-01 00:00:00', 0, 0, 0, 1, 0, 'mobile', 9, 1, 1),
(3, 'Samsung I9500 Galaxy S4', 3756, 'Samsung ', '', '', 'Released 2013, April\n130g, 7.9mm thickness\nAndroid OS, v4.2.2\n16/32/64GB storage, microSD card slot', 'img2.jpg', '', 'Released 2013, April\r\n130g, 7.9mm thickness\r\nAndroid OS, v4.2.2\r\n16/32/64GB storage, microSD card slot', '', '2016-06-22 00:00:00', 0, 0, 0, 1, 0, 'mobile', 9, 1, 0),
(4, 'HTC Desire 600 dual sim', 4620, 'HTC', '', '', 'Released 2013, June\r\n130g, 9.3mm thickness\r\nAndroid OS, v4.1.2\r\n8GB storage, microSD card slot', 'img3.jpg', '', 'NETWORK	Technology	\nGSM / HSPA\nWeight	130 g (4.59 oz)\nSIM	Dual SIM (Micro-SIM, dual stand-by, dual active)\nDISPLAY	Type	Super LCD2 capacitive touchscreen, 16M colors\nSize	4.5 inches (~61.8% screen-to-body ratio)\nResolution	540 x 960 pixels (~245 ppi pixel density)\nMultitouch	Yes\nPLATFORM	OS	Android OS, v4.1.2 (Jelly Bean)\n', 'NETWORK	Technology	\nGSM / HSPA\nLAUNCH	Announced	2013, May\nStatus	Available. Released 2013, June\nBODY	Dimensions	134.8 x 67 x 9.3 mm (5.31 x 2.64 x 0.37 in)\nWeight	130 g (4.59 oz)\nSIM	Dual SIM (Micro-SIM, dual stand-by, dual active)\nDISPLAY	Type', '2016-05-18 09:14:12', 0, 0, 0, 1, 0, 'mobile', 4, 1, 1),
(6, 'Samsung Galaxy S6 Edge', 17799, 'Samsung', '', '', 'Samsung Galaxy S6 Edge+ este un smartphone revolutionar, oferind un design interesant si specificatii tehnice de ultima ora.', 'Samsung1.jpg', 'Samsung Galaxy S6 Edge+ este un smartphone revolutionar, oferind un design interesant si specificatii tehnice de ultima ora.\r\n\r\nVei iubi modul de vizualizare\r\nEcranul mare de 5.7 inch cu doua margini este mai mult decat estetic. Confera profunzime filmelor si insufla viata jocurilor tale. Profita din plin de minunatul ecran dual Quad HD Super Amoled (518 ppi) pentru jocuri incomparabil de realiste si care nu se intrerup, gratie unei memorii 4 GB RAM.\r\n\r\nO experienta sonora incredibila\r\nCand vine vorba de muzica ta preferata, calitatea sunetului conteaza. Bucura-te de o functie audio bogata, echilibrata, cu accesoriile audio Bluetooth care sustin functia audio UHQ.\r\n\r\nImagini filmate stabile\r\nSpune stop imaginilor miscate filmate cu mana. Functia de stabilizare a imaginilor video digitale (Video Digital Imaging Stabilization) combinata cu stabilizarea optica a imaginii (Optical Image Stabilization) asigura filmari clare si stabile de fiecare data.\r\n\r\nSurprinde momente memorabile\r\nEste evident ca nicio petrecere nu ar fi completa fara selfie-urile cu cei mai buni prieteni ai tai. Fiecare cadru este mai bun decat cel anterior cu ajutorul tehnologiei avansate pentru selfie a camerei video (Advanced Selfie Technology) si a unei serii incredibile de filtre care iti accentueaza cele mai frumoase trasaturi.\r\n\r\nCautari similare pentru Samsung Galaxy S 6 Edge G 928 64GB: Samsung Galaxy S 6 Edge G 928 64GB, Samsung Galaxy S 6 Edge G 928 64 GB, Samsung Galaxy S6 Edge G928 64 GB, Samsung Galaxy S6 Edge G928 64GB\r\n\r\nCaracteristici Samsung Galaxy S6 Edge+ G928 64GB\r\n\r\nIndiferent ca este vorba despre vizualizarea de imagini sau videoclipuri, folosirea retelelor de socializare si diverse alte aplicatii, editarea de documente sau imagini sau chiar lectura unei carti, diagonala de 5,7" a ecranului iti ofera o experienta de utilizare exceptionala. Memoria de 4 GB a telefonului iti permite sa utilizezi mai multe aplicatii in acelasi timp, avand un timp de raspuns mai bun. Cu o camera foto de 16 MP, acest telefon face fotografii si filmeaza video la o calitate asemanatoare cu cea a unui aparat foto digital, claritatea imaginii pastrandu-se si in cazul transferului pe un dispozitiv cu ecran mai mare. Atunci cand folosesti telefonul la exterior te vei bucura de ecranul cu tehnologie Super AMOLED al Samsung Galaxy S6 Edge+ G928 64GB care integreaza un digitizer si reflecta mai putin razele soarelui.', 'Telefon Samsung, Ecran Super AMOLED, Diagonala 5,7", 16.7M culori, Sistem de operare Android 5.1, Memorie interna 64 GB, Memorie RAM 4 GB, Procesor Samsung Exynos 7 Octa, Tip Octa-Core, Frecventa procesor 2,10 GHz, Camera 16 MP', 'Dual Sim:	Nu\r\nRetea (MHz):	GSM 850 / 900 / 1800 / 1900\r\nHSDPA\r\nLTE\r\nGPS:	GPS\r\nAltele:	Nano-SIM\r\nFingerprint sensor (PayPal certified)\r\nSamsung Pay (Visa, MasterCard certified)\r\nSmartphone:	Da\r\nCuloare:	Negru\r\nDimensiuni	Dimensiuni (W x D x H mm):	154.4 x 75.8 x 6.9 mm\r\nGreutate (g):	153 g\r\nDisplay	Dimensiune Display (inches):	5.7\r\nRezolutie (pixeli):	1440 x 2560 pixels (~518 ppi pixel density)\r\nCulori:	16 milioane\r\nTip display:	Touchscreen Capacitiv\r\nTehnologie display:	Super AMOLED\r\nCaracteristici:	Corning Gorilla Glass 4\r\nTouchWiz UI \r\nCurved edge screen\r\nConectivitate	3G:	Cu 3G\r\n4G:	Cu 4G\r\nTehnologie 3G:	HSPA 42.2/5.76 Mbps, LTE Cat6 300/50 Mbps/ LTE Cat9 450/50 Mbps\r\nTehnologie wireless:	Wi Fi\r\nBluetooth:	4.2, A2DP, LE, apt-X\r\nWLAN:	802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot\r\nGPRS:	Da\r\nEDGE:	Da\r\nNFC:	Cu NFC\r\nPorturi:	microUSB v2.0, USB Host\r\n3.5 mm Jack\r\nMemorie	Memorie:	32 GB\r\nMemorie RAM:	4 GB\r\nSlot memorie:	Fara card\r\nProcesor	Numar nuclee procesor:	Octa Core\r\nChipset:	Exynos 7420\r\nCPU:	Quad-core 1.5 GHz Cortex-A53 & Quad-core 2.1 GHz Cortex-A57\r\nGPU:	Mali-T760MP8\r\nFunctii	Sistem de operare:	Android OS\r\nVersiune sistem de operare:	5.1.1 (Lollipop)\r\nCamera:	Principala: 16 MP, 2988 x 5312 pixels, optical image stabilization, autofocus, LED flash, Geo-tagging, touch focus, face detection, Auto HDR, panorama\r\nSecundara: 5 MP, 1440p@30fps, dual video call, Auto HDR\r\nSenzor:	Accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2\r\nAudio:	Difuzor\r\nBaterie	Tip baterie:	Li-Ion 3000 mAh, fixa', '2016-06-02 08:11:35', 0, 0, 0, 1, 0, 'mobile', 9, 1, 1),
(7, 'Samsung Galaxy Note 5', 15560, 'Samsung', '', '', 'Display-ul de 5.7 inci iti permite sa vizualizezi fotografiile intr-o maniera eleganta si performanta. In interiorul telefonului Samsung Galaxy Note 5 se gaseste un procesor Quad-core 1.5 GHz Cortex-A53 & Quad-core 2.1 GHz Cortex-A57 care iti permite sa descarci si sa rulezi fluid majoritatea aplicatiilor si jocurilor disponibile pentru mobil, sa te uiti la video-uri online sau pur si simplu sa vezi ce mai fac prietenii tai de pe Facebook.', 'Samsung2.jpg', 'Display-ul de 5.7 inci iti permite sa vizualizezi fotografiile intr-o maniera eleganta si performanta. In interiorul telefonului Samsung Galaxy Note 5 se gaseste un procesor Quad-core 1.5 GHz Cortex-A53 & Quad-core 2.1 GHz Cortex-A57 care iti permite sa descarci si sa rulezi fluid majoritatea aplicatiilor si jocurilor disponibile pentru mobil, sa te uiti la video-uri online sau pur si simplu sa vezi ce mai fac prietenii tai de pe Facebook. ', 'Display resolution: 2560x1440\nDisplay Size (inches): 5.7\nPlatform (OS): Android 5.1\nCPU: Samsung Exynos 7 Octa 7420\nCPU Frequency: ARM Cortex-A53 (4-core), 1,5 ГГц + Cortex-A57 (4-core)\nSmartphone RAM (MB): 4096\nFont Camera: Да\nFront Camera (MP): 5.0\nBack Camera: Да\nBack Camera (MP): 16.0\nSmartphone Standards: GSM 3G/4G | HSPA+(850/900/1 900/2 100 MГц)/GSM/GPRS/EDGE (850/900/1800/1900 MHz', 'CARACTERISTICI\nTip Telefon	Smartphone\nSloturi Sim	Single Sim\nGENERAL\nTouchscreen	Da\nTastatura QWERTY	Nu\nTip tastatura	Standard\nModel Procesor	Exynos 7420; Quad-core Cortex-A53 & Quad-core Cortex-A57\nFrecventa procesor	1.5 GHZ & 2.1 GHZ\nCuloare	Negru\nGPS	DA, cu A-GPS, GLONASS, BDS\nGreutate (g)	171\nSistem de operare	Android OS, v5.1.1 (Lollipop)\nTip SIM	Nano-SIM\nMEMORIE\nSlot memorie (tip)	Nu\nMemorie RAM	4 GB\nMemorie interna	32 GB\nAFISAJ\nTip display	Super AMOLED\nRezolutie (pixeli)	1440 x 2560\nNumar culori	16 M\nDiagonala display (inch)	5.7\nCONECTIVITATE\nGPRS	Da\nTehnologie Bluetooth	v4.2, A2DP, EDR, LE\nTehnologie wireless	Wi-Fi 802.11 a/b/g/n/ac\nNFC	Da\nUSB	MicroUSB v2.0\nFOTO VIDEO\nRezolutie camera (Mp)	16\nRezolutie video	2160p@30fps, 1080p@60fps\nCamera secundara	5 MP\nCaracteristici foto/video	1/2.6" sensor size, 1.12 µm pixel size, geo-tagging, touch focus, face/smile detection, panorama, HDR\nALIMENTARE\nDurata convorbire	pana la 22 h (3G)\nDurata in regim de asteptare	pana la 64 h\nCapacitate (mAh)	3000\nTip baterie	Li-Po\nCOMUNICARE\nMesagerie	SMS(threaded view), MMS, Email, Push Mail, IM\nBrowsing	HTML5\nALTELE\nSenzori	Fingerprint, accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2', '2016-06-02 13:26:14', 0, 0, 0, 1, 0, 'mobile', 9, 1, 1),
(8, 'Apple iPhone 6', 14999, '', '', '', 'iPhone 6 nu este doar mai mare, ci si mai bun din toate punctele de vedere. Mai mare, dar mult mai subtire. Mai puternic, dar remarcabil de eficient energetic. Cu o suprafata neteda de metal care face lin trecerea catre noul ecran Retina HD. Un design uniform in care componentele hardware si software functioneaza in perfecta armonie, creand o noua generatie de iPhone, mai buna din toate punctele de vedere.', 'Apple1.jpg', 'iPhone 6 nu este doar mai mare, ci si mai bun din toate punctele de vedere. Mai mare, dar mult mai subtire. Mai puternic, dar remarcabil de eficient energetic. Cu o suprafata neteda de metal care face lin trecerea catre noul ecran Retina HD. Un design uniform in care componentele hardware si software functioneaza in perfecta armonie, creand o noua generatie de iPhone, mai buna din toate punctele de vedere.', 'iPhone 6 nu este doar mai mare, ci si mai bun din toate punctele de vedere. Mai mare, dar mult mai subtire. Mai puternic, dar remarcabil de eficient energetic. Cu o suprafata neteda de metal care face lin trecerea catre noul ecran Retina HD. Un design uniform in care componentele hardware si software functioneaza in perfecta armonie, creand o noua generatie de iPhone, mai buna din toate punctele de vedere.', 'iPhone	iPhone 6\r\nTip Telefon	Smartphone\r\nSloturi Sim	Single Sim\r\nGENERAL\r\nTouchscreen	Da\r\nTastatura QWERTY	Nu\r\nTip tastatura	Standard\r\nRetea	2G: 850 / 900 / 1800 / 1900\r\n3G: 850 / 900 / 1700 / 1900 / 2100\r\n4G: 700 / 800 / 850 / 900 / 1700 / 1800 / 1900 / 2100 / 2600\r\nModel Procesor	Dual Core Cyclone (ARM v8)\r\nFrecventa procesor	1400\r\nCuloare	Auriu\r\nDimensiuni (W x H x D mm)	67 x 138.1 x 6.9\r\nGPS	Da, cu A-GPS si GLONASS\r\nGreutate (g)	129\r\nSistem de operare	iOS 8\r\nTip SIM	nanoSIM\r\nMEMORIE\r\nSlot memorie (tip)	Nu\r\nMemorie RAM	1 GB\r\nMemorie interna	64 GB\r\nAFISAJ\r\nTip display	IPS LCD\r\nRezolutie (pixeli)	750 x 1334\r\nNumar culori	16M\r\nDiagonala display (inch)	4.7\r\nFunctii	Retina display\r\nMulti-touch\r\nShatter proof\r\nCONECTIVITATE\r\nGPRS	Da\r\nTehnologie Bluetooth	4.0 (A2DP, LE)\r\nTehnologie wireless	802.11 a/b/g/n/ac\r\nWi-fi hotspot\r\nNFC	Da\r\nPorturi	1 x Jack 3.5 mm\r\nConector lightning\r\nFOTO VIDEO\r\nRezolutie camera (Mp)	8.0\r\nRezolutii foto	3264 x 2448\r\nBlitz integrat	Dual LED\r\nCamera secundara	1.2 Mp\r\nCaracteristici foto/video	Detectarea fetei\r\nGeotagging\r\nAuto Focus\r\nSapphire Crystal Lens\r\nAuto HDR\r\nPanorama\r\nBurst Mode\r\nTimer mode\r\n5 elemente, lentile F2.2\r\nExpunere automata\r\nALIMENTARE\r\nDurata convorbire	3G: 14 ore\r\nDurata in regim de asteptare	3G: 250 ore\r\nTip baterie	Lithium Ion\r\nCOMUNICARE\r\nMesagerie	iMessage / SMS / MMS / Email / Push Email\r\nBrowsing	HTML5\r\nE-mail	Da\r\nMULTIMEDIA\r\nFM radio	Nu\r\nRedare video	Da\r\nRedare audio	AAC (8 - 320 Kbps), Protected AAC (iTunes Store), HE-AAC, MP3 (8 - 320 Kbps), MP3 VBR, Audible, Apple Lossless, AIFF, WAV\r\nALTELE\r\nSAR (W/kg ) :	0.98\r\nSenzori	Barometru\r\nAccelerometru\r\nSenzor de proximitate\r\nSenzor de lumina ambientala\r\nGyroscope\r\nBusola digitala\r\nAltele	Fingerprint sensor\r\nApple Pay (Visa, MasterCard, Amex)\r\nSiri\r\nAirPlay\r\nCarPlay\r\nAirDrop\r\niTunes Radio\r\nAdaptor de priza EU', '2016-05-12 07:27:18', 0, 0, 0, 1, 1, 'mobile', 1, 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
