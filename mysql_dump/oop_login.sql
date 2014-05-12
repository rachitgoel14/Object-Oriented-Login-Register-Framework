-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2014 at 04:28 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `oop_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `permissions`) VALUES
(1, 'Standard user', ''),
(2, 'Administrator', '{"admin":1}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `joined` datetime NOT NULL,
  `group` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `salt`, `name`, `joined`, `group`) VALUES
(8, 'rachit', 'a9f8722b10dcc06c663b2e687eb5a597afea1861974d03c76cb1f6af56a2bd85', '{e/ø:6t½ÛX¿S`ßóÉÎ¢ÝQ¯‰Æ»ê°oÿ`', 'rachitgoel', '2014-05-10 09:45:57', 1),
(9, 'nikita', '4701c79f50ca81849c3f4a564f30dd333376ab1ef14ce3352cd7e31c3fd6a08a', '«ø©ÍÚ”<„Žäb	Ä‹KFe=uÐ¨ŠôÁ`°ÃMu', 'nikitagoel', '2014-05-10 09:51:40', 1),
(10, 'sunita', '2a9a0bd8dfe1b8b8ffc78e507215427bbf8d096be87028ba2b3b409b29e52f2b', '–LÈáÂCµY§“ôÑ[\nôŠÕiAÊfù;äTïi9', 'sunita goel', '2014-05-10 09:53:05', 1),
(11, 'golu', '33706e4f14eb7372a9a87698a34d184a926bcd86e676610fe11adaf6c8575598', 'LÊÈÚžïx òÏWÙ5"ùf=\nC¬ N„åSÖÌ?4', 'rachit', '2014-05-10 09:55:54', 2),
(12, 'rajeev', 'ae6eaaa0f95b79e97bc1222d9c1e82c8450280b8ebf918a1f06e6644190d5f20', '|=°Zè|£Ú£¥‘5[‚—]Ö;+ç®þÍ¦?¶8m', 'rajeevgoel', '2014-05-10 10:14:41', 1),
(13, 'adsfr', '1782e2ded8c9192c3b137896b93a8c78f8c3a3d47366ff46d6a3c7de0e9305e5', 'Ùd¯ÜìØØû«\\0¥Ã°\\†‹¬ v@ê*â¢d', 'aertyu', '2014-05-10 10:22:09', 1),
(14, 'niki', '9ac49468e3a6bc24e3ccbc4a77c8bc175be8e04ce93f5338f29520cae473ded1', '$TôÀû<‰ã†AÐ¤®Â,Pì:/:Ò¡†ŒH±Ò_', 'nikitagoel', '2014-05-10 10:24:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_session`
--

CREATE TABLE IF NOT EXISTS `users_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `hash` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
