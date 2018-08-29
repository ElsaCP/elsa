-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2018 at 09:10 PM
-- Server version: 10.3.8-MariaDB-1:10.3.8+maria~stretch-log
-- PHP Version: 7.2.8-1+0~20180725124257.2+stretch~1.gbp571e56

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecp_powerdns`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `modified_at` int(11) NOT NULL,
  `account` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `comment` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cryptokeys`
--

CREATE TABLE `cryptokeys` (
  `id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `flags` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domainmetadata`
--

CREATE TABLE `domainmetadata` (
  `id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `kind` varchar(32) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `master` varchar(128) DEFAULT NULL,
  `last_check` int(11) DEFAULT NULL,
  `type` varchar(6) NOT NULL,
  `notified_serial` int(10) UNSIGNED DEFAULT NULL,
  `account` varchar(40) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `domains`
--

INSERT INTO `domains` (`id`, `name`, `master`, `last_check`, `type`, `notified_serial`, `account`) VALUES
(1, 'aris.web.id', NULL, NULL, 'NATIVE', NULL, NULL),
(2, 'ripandi.id', NULL, NULL, 'NATIVE', NULL, NULL),
(3, 'insomniastory.com', NULL, NULL, 'NATIVE', NULL, NULL),
(4, 'sukabumitoday.com', NULL, NULL, 'NATIVE', NULL, NULL),
(5, 'ujunggenteng.id', NULL, NULL, 'NATIVE', NULL, NULL),
(6, 'pasim.org', NULL, NULL, 'NATIVE', NULL, NULL),
(7, 'stmikpasim.ac.id', NULL, NULL, 'NATIVE', NULL, NULL),
(8, 'pptalfath.ac.id', NULL, NULL, 'NATIVE', NULL, NULL),
(9, 'idaroyani.id', NULL, NULL, 'NATIVE', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `user` int(11) NOT NULL,
  `domain` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` bigint(20) NOT NULL,
  `domain_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `content` varchar(64000) DEFAULT NULL,
  `ttl` int(11) DEFAULT 3600,
  `prio` int(11) DEFAULT NULL,
  `change_date` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT 0,
  `ordername` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `auth` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`id`, `domain_id`, `name`, `type`, `content`, `ttl`, `prio`, `change_date`, `disabled`, `ordername`, `auth`) VALUES
(1, 1, 'aris.web.id', 'SOA', 'ns1.semut.org admin.aris.web.id 1 10380 3600 604800 3600', 3600, NULL, NULL, 0, NULL, 1),
(2, 1, 'aris.web.id', 'NS', 'ns1.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(3, 1, 'aris.web.id', 'NS', 'ns2.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(4, 1, 'aris.web.id', 'A', '185.199.108.153', 3600, NULL, NULL, 0, NULL, 1),
(5, 1, 'aris.web.id', 'A', '185.199.109.153', 3600, NULL, NULL, 0, NULL, 1),
(6, 1, 'aris.web.id', 'A', '185.199.110.153', 3600, NULL, NULL, 0, NULL, 1),
(7, 1, 'aris.web.id', 'A', '185.199.111.153', 3600, NULL, NULL, 0, NULL, 1),
(8, 1, 'www.aris.web.id', 'CNAME', 'aris.web.id', 3600, NULL, NULL, 0, NULL, 1),
(9, 1, 'aris.web.id', 'MX', 'mx1.improvmx.com', 3600, 10, NULL, 0, NULL, 1),
(10, 1, 'aris.web.id', 'MX', 'mx2.improvmx.com', 3600, 20, NULL, 0, NULL, 1),
(11, 1, 'aris.web.id', 'TXT', 'google-site-verification=e7JO3eLMlqcjERrhLFzIWZOMzTPXAgRpuqKycmzZ6WE', 3600, NULL, NULL, 0, NULL, 1),
(12, 1, 'aris.web.id', 'TXT', 'keybase-site-verification=8njD_WJGFLL0WSbxn_xgMHgj5puQjtsyhwz7OWC7aJk', 3600, NULL, NULL, 0, NULL, 1),
(13, 2, 'ripandi.id', 'SOA', 'ns1.semut.org admin.ripandi.id 1 10380 3600 604800 3600', 3600, NULL, NULL, 0, NULL, 1),
(14, 2, 'ripandi.id', 'NS', 'ns1.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(15, 2, 'ripandi.id', 'NS', 'ns2.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(16, 2, 'ripandi.id', 'A', '45.77.251.17', 3600, NULL, NULL, 0, NULL, 1),
(17, 2, 'www.ripandi.id', 'CNAME', 'ripandi.id', 3600, NULL, NULL, 0, NULL, 1),
(18, 2, 'beta.ripandi.id', 'CNAME', 'ripandi.id', 3600, NULL, NULL, 0, NULL, 1),
(19, 2, 'feed.ripandi.id', 'CNAME', 'ripandi.id', 3600, NULL, NULL, 0, NULL, 1),
(20, 2, 'ripandi.id', 'MX', 'mail.semut.org', 3600, 10, NULL, 0, NULL, 1),
(21, 2, 'ripandi.id', 'TXT', 'v=spf1 a:mail.semut.org ?all', 3600, NULL, NULL, 0, NULL, 1),
(22, 2, '_dmarc.ripandi.id', 'TXT', 'v=DMARC1; p=reject;', 3600, NULL, NULL, 0, NULL, 1),
(23, 2, 'ripandi.id', 'TXT', 'google-site-verification=32dZDD7S_u33Cgckt0H-vCbMu-esu6T3Ofau4AznhcA', 3600, NULL, NULL, 0, NULL, 1),
(24, 2, 'ripandi.id', 'TXT', 'keybase-site-verification=y2eSSaNkgJzebSMJHumhRyHXZZoTdocnG7dyQZlYgnA', 3600, NULL, NULL, 0, NULL, 1),
(25, 3, 'insomniastory.com', 'SOA', 'ns1.semut.org admin.insomniastory.com 1 10380 3600 604800 3600', 3600, NULL, NULL, 0, NULL, 1),
(26, 3, 'insomniastory.com', 'NS', 'ns1.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(27, 3, 'insomniastory.com', 'NS', 'ns2.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(28, 3, 'insomniastory.com', 'A', '45.77.251.17', 3600, NULL, NULL, 0, NULL, 1),
(29, 3, 'www.insomniastory.com', 'CNAME', 'insomniastory.com', 3600, NULL, NULL, 0, NULL, 1),
(30, 3, 'insomniastory.com', 'MX', 'mx1.improvmx.com', 3600, 10, NULL, 0, NULL, 1),
(31, 3, 'insomniastory.com', 'MX', 'mx2.improvmx.com', 3600, 20, NULL, 0, NULL, 1),
(32, 3, 'insomniastory.com', 'TXT', 'google-site-verification=j8XGtM95bDjU-5tVUjzxSt3uAqwuvUc7w5tP_7pBPWk', 3600, NULL, NULL, 0, NULL, 1),
(33, 3, 'insomniastory.com', 'TXT', 'keybase-site-verification=rK5sMMBtrRrkp6g-IXirF-DD-PFptjD2K7E7x8dlB04', 3600, NULL, NULL, 0, NULL, 1),
(34, 3, 'www.insomniastory.com', 'TXT', 'google-site-verification=j8XGtM95bDjU-5tVUjzxSt3uAqwuvUc7w5tP_7pBPWk', 3600, NULL, NULL, 0, NULL, 1),
(35, 4, 'sukabumitoday.com', 'SOA', 'ns1.semut.org admin.sukabumitoday.com 1 10380 3600 604800 3600', 3600, NULL, NULL, 0, NULL, 1),
(36, 4, 'sukabumitoday.com', 'NS', 'ns1.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(37, 4, 'sukabumitoday.com', 'NS', 'ns2.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(38, 4, 'sukabumitoday.com', 'A', '178.128.22.6', 3600, NULL, NULL, 0, NULL, 1),
(39, 4, 'www.sukabumitoday.com', 'CNAME', 'sukabumitoday.com', 3600, NULL, NULL, 0, NULL, 1),
(40, 4, 'alpha.sukabumitoday.com', 'CNAME', 'sukabumitoday.com', 3600, NULL, NULL, 0, NULL, 1),
(41, 4, 'beta.sukabumitoday.com', 'CNAME', 'sukabumitoday.com', 3600, NULL, NULL, 0, NULL, 1),
(42, 4, 'login.sukabumitoday.com', 'CNAME', 'sukabumitoday.com', 3600, NULL, NULL, 0, NULL, 1),
(43, 4, 'gapura.sukabumitoday.com', 'CNAME', 'sukabumitoday.com', 3600, NULL, NULL, 0, NULL, 1),
(44, 4, 'alpha.gapura.sukabumitoday.com', 'CNAME', 'sukabumitoday.com', 3600, NULL, NULL, 0, NULL, 1),
(45, 4, 'beta.gapura.sukabumitoday.com', 'CNAME', 'sukabumitoday.com', 3600, NULL, NULL, 0, NULL, 1),
(46, 4, 'drive.sukabumitoday.com', 'CNAME', 'ghs.googlehosted.com', 3600, NULL, NULL, 0, NULL, 1),
(47, 4, 'mail.sukabumitoday.com', 'CNAME', 'ghs.googlehosted.com', 3600, NULL, NULL, 0, NULL, 1),
(48, 4, 'sukabumitoday.com', 'MX', 'aspmx.l.google.com', 3600, 1, NULL, 0, NULL, 1),
(49, 4, 'sukabumitoday.com', 'MX', 'alt1.aspmx.l.google.com', 3600, 5, NULL, 0, NULL, 1),
(50, 4, 'sukabumitoday.com', 'MX', 'alt2.aspmx.l.google.com', 3600, 5, NULL, 0, NULL, 1),
(51, 4, 'sukabumitoday.com', 'MX', 'alt3.aspmx.l.google.com', 3600, 10, NULL, 0, NULL, 1),
(52, 4, 'sukabumitoday.com', 'MX', 'alt4.aspmx.l.google.com', 3600, 10, NULL, 0, NULL, 1),
(53, 4, 'sukabumitoday.com', 'MX', 'wca4jgz6wehqj3pxlt3vfwyw54dxhtjfh5gqjp56v5kfoveqoupa.mx-verification.google.com', 3600, 15, NULL, 0, NULL, 1),
(54, 5, 'ujunggenteng.id', 'SOA', 'ns1.semut.org admin.ujunggenteng.id 1 10380 3600 604800 3600', 3600, NULL, NULL, 0, NULL, 1),
(55, 5, 'ujunggenteng.id', 'NS', 'ns1.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(56, 5, 'ujunggenteng.id', 'NS', 'ns2.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(57, 5, 'ujunggenteng.id', 'A', '178.128.22.6', 3600, NULL, NULL, 0, NULL, 1),
(58, 5, 'www.ujunggenteng.id', 'CNAME', 'ujunggenteng.id', 3600, NULL, NULL, 0, NULL, 1),
(59, 5, 'beta.ujunggenteng.id', 'CNAME', 'ujunggenteng.id', 3600, NULL, NULL, 0, NULL, 1),
(60, 5, 'ujunggenteng.id', 'MX', 'mx1.improvmx.com', 3600, 10, NULL, 0, NULL, 1),
(61, 5, 'ujunggenteng.id', 'MX', 'mx2.improvmx.com', 3600, 20, NULL, 0, NULL, 1),
(62, 5, 'ujunggenteng.id', 'TXT', 'google-site-verification=AF7P6Z8NJDTvpwt-Q1cXjb6yGkt9CnkwLm4P1f8R4t4', 3600, NULL, NULL, 0, NULL, 1),
(63, 6, 'pasim.org', 'SOA', 'ns1.semut.org admin.pasim.org 1 10380 3600 604800 3600', 3600, NULL, NULL, 0, NULL, 1),
(64, 6, 'pasim.org', 'NS', 'ns1.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(65, 6, 'pasim.org', 'NS', 'ns2.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(66, 6, 'pasim.org', 'A', '139.162.50.79', 3600, NULL, NULL, 0, NULL, 1),
(67, 6, 'www.pasim.org', 'CNAME', 'pasim.org', 3600, NULL, NULL, 0, NULL, 1),
(68, 6, 'pasim.org', 'MX', 'ataris.rapidplex.com', 3600, 1, NULL, 0, NULL, 1),
(69, 7, 'stmikpasim.ac.id', 'SOA', 'ns1.semut.org admin.stmikpasim.ac.id 1 10380 3600 604800 3600', 3600, NULL, NULL, 0, NULL, 1),
(70, 7, 'stmikpasim.ac.id', 'NS', 'ns1.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(71, 7, 'stmikpasim.ac.id', 'NS', 'ns2.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(72, 7, 'stmikpasim.ac.id', 'A', '139.162.50.79', 3600, NULL, NULL, 0, NULL, 1),
(73, 7, '*.stmikpasim.ac.id', 'A', '139.162.50.79', 3600, NULL, NULL, 0, NULL, 1),
(74, 7, 'www.stmikpasim.ac.id', 'CNAME', 'stmikpasim.ac.id', 3600, NULL, NULL, 0, NULL, 1),
(75, 7, 'drive.stmikpasim.ac.id', 'CNAME', 'ghs.googlehosted.com', 3600, NULL, NULL, 0, NULL, 1),
(76, 7, 'mail.stmikpasim.ac.id', 'CNAME', 'ghs.googlehosted.com', 3600, NULL, NULL, 0, NULL, 1),
(77, 7, 'zb15178015.stmikpasim.ac.id', 'CNAME', 'zmverify.zoho.com', 3600, NULL, NULL, 0, NULL, 1),
(78, 4, 'stmikpasim.ac.id', 'MX', 'aspmx.l.google.com', 3600, 1, NULL, 0, NULL, 1),
(79, 4, 'stmikpasim.ac.id', 'MX', 'alt1.aspmx.l.google.com', 3600, 5, NULL, 0, NULL, 1),
(80, 4, 'stmikpasim.ac.id', 'MX', 'alt2.aspmx.l.google.com', 3600, 5, NULL, 0, NULL, 1),
(81, 4, 'stmikpasim.ac.id', 'MX', 'alt3.aspmx.l.google.com', 3600, 10, NULL, 0, NULL, 1),
(82, 4, 'stmikpasim.ac.id', 'MX', 'alt4.aspmx.l.google.com', 3600, 10, NULL, 0, NULL, 1),
(83, 7, 'stmikpasim.ac.id', 'TXT', 'google-site-verification=fAFlW9eweutTaJuKYRKRTHKxnS_I9ntsBVD7BO9tUIY', 3600, NULL, NULL, 0, NULL, 1),
(84, 7, 'stmikpasim.ac.id', 'TXT', 'v=spf1 include:_spf.google.com ~all', 3600, NULL, NULL, 0, NULL, 1),
(85, 8, 'pptalfath.ac.id', 'SOA', 'ns1.semut.org admin.pptalfath.ac.id 1 10380 3600 604800 3600', 3600, NULL, NULL, 0, NULL, 1),
(86, 8, 'pptalfath.ac.id', 'NS', 'ns1.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(87, 8, 'pptalfath.ac.id', 'NS', 'ns2.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(88, 8, 'pptalfath.ac.id', 'A', '139.162.50.79', 3600, NULL, NULL, 0, NULL, 1),
(89, 8, 'www.pptalfath.ac.id', 'CNAME', 'pptalfath.ac.id', 3600, NULL, NULL, 0, NULL, 1),
(90, 8, 'pptalfath.ac.id', 'MX', 'ataris.rapidplex.com', 3600, 1, NULL, 0, NULL, 1),
(91, 9, 'idaroyani.id', 'SOA', 'ns1.semut.org admin.idaroyani.id 1 10380 3600 604800 3600', 3600, NULL, NULL, 0, NULL, 1),
(92, 9, 'idaroyani.id', 'NS', 'ns1.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(93, 9, 'idaroyani.id', 'NS', 'ns2.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(94, 9, 'idaroyani.id', 'A', '45.77.251.17', 3600, NULL, NULL, 0, NULL, 1),
(95, 9, 'www.idaroyani.id', 'CNAME', 'idaroyani.id', 3600, NULL, NULL, 0, NULL, 1),
(96, 9, 'idaroyani.id', 'MX', 'mx1.improvmx.com', 3600, 10, NULL, 0, NULL, 1),
(97, 9, 'idaroyani.id', 'MX', 'mx2.improvmx.com', 3600, 20, NULL, 0, NULL, 1),
(98, 4, 'support.sukabumitoday.com', 'CNAME', 'st-gcp.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(99, 4, 'status.sukabumitoday.com', 'CNAME', 'st-gcp.semut.org', 3600, NULL, NULL, 0, NULL, 1),
(101, 4, 'invoice.sukabumitoday.com', 'CNAME', 'sukabumitoday.com', 3600, NULL, NULL, 0, NULL, 1),
(102, 2, 'pi.ripandi.id', 'CNAME', 'piraku.duckdns.org', 3600, NULL, NULL, 0, NULL, 1),
(107, 4, 'event.sukabumitoday.com', 'CNAME', 'st-gcp.semut.org', 3600, NULL, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `remote`
--

CREATE TABLE `remote` (
  `id` int(11) NOT NULL,
  `record` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `security` varchar(2000) NOT NULL,
  `nonce` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supermasters`
--

CREATE TABLE `supermasters` (
  `ip` varchar(64) NOT NULL,
  `nameserver` varchar(255) NOT NULL,
  `account` varchar(40) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tsigkeys`
--

CREATE TABLE `tsigkeys` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `algorithm` varchar(50) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `type`) VALUES
(1, 'admin', '$2y$10$NMLfkBiiBElqwJ/uowaaCuzfMYDNIcTnYUITtkf3hhx5/dQ/UEQWO', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_name_type_idx` (`name`,`type`),
  ADD KEY `comments_order_idx` (`domain_id`,`modified_at`);

--
-- Indexes for table `cryptokeys`
--
ALTER TABLE `cryptokeys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domainidindex` (`domain_id`);

--
-- Indexes for table `domainmetadata`
--
ALTER TABLE `domainmetadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domainmetadata_idx` (`domain_id`,`kind`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_index` (`name`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`user`,`domain`),
  ADD KEY `domain` (`domain`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nametype_index` (`name`,`type`),
  ADD KEY `domain_id` (`domain_id`),
  ADD KEY `ordername` (`ordername`);

--
-- Indexes for table `remote`
--
ALTER TABLE `remote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record` (`record`);

--
-- Indexes for table `supermasters`
--
ALTER TABLE `supermasters`
  ADD PRIMARY KEY (`ip`,`nameserver`);

--
-- Indexes for table `tsigkeys`
--
ALTER TABLE `tsigkeys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namealgoindex` (`name`,`algorithm`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cryptokeys`
--
ALTER TABLE `cryptokeys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domainmetadata`
--
ALTER TABLE `domainmetadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `remote`
--
ALTER TABLE `remote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tsigkeys`
--
ALTER TABLE `tsigkeys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`domain`) REFERENCES `domains` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `records_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE TABLE IF NOT EXISTS `recordtype` (
  `name` varchar(10) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `recordtype` () VALUES
('A',       'The A record contains an IP address'),
('AAAA',    'The AAAA record contains an IPv6 address'),
('AFSDB',   'A specialised record type for the Andrew Filesystem'),
('ALIAS',   'The ALIAS pseudo-record type is supported to provide CNAME-like mechanisms on a zone apex'),
('CAA',     'The Certification Authority Authorization record, specified in RFC 6844, is used to specify Certificate Authorities that may issue certificates for a domain'),
('CERT',    'Specialised record type for storing certificates, defined in RFC 2538'),
('CDNSKEY', 'The CDNSKEY (Child DNSKEY) type is supported'),
('CDS',     'The CDS (Child DS) type is supported'),
('CNAME',   'The CNAME record specifies the canonical name of a record'),
('DNSKEY',  'The DNSKEY DNSSEC record type is fully supported, as described in RFC 4034'),
('DNAME',   'The DNAME record, as specified in RFC 6672 is supported'),
('DS',      'The DS DNSSEC record type is fully supported, as described in RFC 4034'),
('HINFO',   'Hardware Info record, used to specify CPU and operating system'),
('KEY',     'The KEY record is fully supported. For its syntax, see RFC 2535'),
('LOC',     'The LOC record is fully supported. For its syntax, see RFC 1876'),
('MX',      'The MX record specifies a mail exchanger host for a domain'),
('NAPTR',   'Naming Authority Pointer, RFC 2915'),
('NS',      'Nameserver record. Specifies nameservers for a domain'),
('NSEC',    'The NSEC, NSEC3 and NSEC3PARAM DNSSEC record type are fully supported, as described in RFC 4034'),
('NSEC3',   'The NSEC, NSEC3 and NSEC3PARAM DNSSEC record type are fully supported, as described in RFC 4034'),
('NSEC3PARAM', 'The NSEC, NSEC3 and NSEC3PARAM DNSSEC record type are fully supported, as described in RFC 4034'),
('OPENPGPKEY', 'The OPENPGPKEY records, specified in RFC 7929, are used to bind OpenPGP certificates to email addresses'),
('PTR',     'Reverse pointer, used to specify the host name belonging to an IP or IPv6 address'),
('RP',      'Responsible Person record, as described in RFC 1183'),
('RRSIG',   'The RRSIG DNSSEC record type is fully supported, as described in RFC 4034'),
('SOA',     'The Start of Authority record is one of the most complex available'),
('SPF',     'SPF records can be used to store Sender Policy Framework details (RFC 4408)'),
('SSHFP',   'The SSHFP record type, used for storing Secure Shell (SSH) fingerprints, is fully supported'),
('SRV',     'SRV records can be used to encode the location and port of services on a domain name'),
('TKEY',    'The TKEY (RFC 2930) and TSIG records (RFC 2845), used for key-exchange and authenticated AXFRs'),
('TSIG',    'The TKEY (RFC 2930) and TSIG records (RFC 2845), used for key-exchange and authenticated AXFRs'),
('TLSA',    'Since 3.0. The TLSA records, specified in RFC 6698, are used to bind SSL/TLS certificate to named hosts and ports'),
('SMIMEA',  'Since 4.1. The SMIMEA record type, specified in RFC 8162, is used to bind S/MIME certificates to domains'),
('TXT',     'The TXT field can be used to attach textual data to a domain. Text is stored plainly, PowerDNS understands content not enclosed in quotes'),
('URI',     'The URI record, specified in RFC 7553, is used to publish mappings from hostnames to URIs');

ALTER TABLE `recordtype`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name_index` (`name`);

ALTER TABLE `records`
 MODIFY COLUMN `type` varchar(10) NOT NULL,
 ADD CONSTRAINT `records_ibfk_2` FOREIGN KEY (`type`) REFERENCES `recordtype` (`name`) ON DELETE CASCADE;
