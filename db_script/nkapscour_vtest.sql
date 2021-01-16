-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           10.4.10-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour nkap-scour
DROP DATABASE IF EXISTS `nkap-scour`;
CREATE DATABASE IF NOT EXISTS `nkap-scour` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `nkap-scour`;

-- Listage de la structure de la table nkap-scour. abonnement_activite
DROP TABLE IF EXISTS `abonnement_activite`;
CREATE TABLE IF NOT EXISTS `abonnement_activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inscription_activite_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `date_paiement` date DEFAULT NULL,
  `mois` int(11) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_inscription_activite` (`inscription_activite_id`),
  CONSTRAINT `fk_inscription_activite` FOREIGN KEY (`inscription_activite_id`) REFERENCES `inscription_activite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.abonnement_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement_activite` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. abonnement_consomme
DROP TABLE IF EXISTS `abonnement_consomme`;
CREATE TABLE IF NOT EXISTS `abonnement_consomme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repas_id` int(11) NOT NULL,
  `jour_ouvrable_id` int(11) NOT NULL,
  `abonnement_resto_id` int(11) DEFAULT NULL,
  `code` varchar(254) DEFAULT NULL,
  `date_effective` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_Recense` (`jour_ouvrable_id`),
  KEY `fk_abonnement_restoCheckListResto` (`abonnement_resto_id`),
  KEY `fk_est_liste` (`repas_id`),
  CONSTRAINT `fk_Recense` FOREIGN KEY (`jour_ouvrable_id`) REFERENCES `jour_ouvrable` (`id`),
  CONSTRAINT `fk_abonnement_restoCheckListResto` FOREIGN KEY (`abonnement_resto_id`) REFERENCES `abonnement_resto` (`id`),
  CONSTRAINT `fk_est_liste` FOREIGN KEY (`repas_id`) REFERENCES `repas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.abonnement_consomme : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_consomme` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement_consomme` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. abonnement_resto
DROP TABLE IF EXISTS `abonnement_resto`;
CREATE TABLE IF NOT EXISTS `abonnement_resto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eleve_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `entendu` varchar(254) DEFAULT NULL,
  `multiplicateur` int(11) DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_eleveabonnement_resto` (`eleve_id`),
  CONSTRAINT `fk_eleveabonnement_resto` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.abonnement_resto : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_resto` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement_resto` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. activite
DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_activite_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_type_activite` (`type_activite_id`),
  CONSTRAINT `fk_type_activite` FOREIGN KEY (`type_activite_id`) REFERENCES `type_activite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.activite : ~0 rows (environ)
/*!40000 ALTER TABLE `activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `activite` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. annee_scolaire
DROP TABLE IF EXISTS `annee_scolaire`;
CREATE TABLE IF NOT EXISTS `annee_scolaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `slogan` varchar(254) DEFAULT NULL,
  `libelle` varchar(10) DEFAULT NULL,
  `mission` varchar(254) DEFAULT NULL,
  `debut_annee` datetime DEFAULT NULL,
  `fin_annee` datetime DEFAULT NULL,
  `statut` enum('1','0') DEFAULT '1',
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.annee_scolaire : ~2 rows (environ)
/*!40000 ALTER TABLE `annee_scolaire` DISABLE KEYS */;
INSERT IGNORE INTO `annee_scolaire` (`id`, `code`, `slogan`, `libelle`, `mission`, `debut_annee`, `fin_annee`, `statut`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'ANSCO-01', 'Annee des lumieres', '2019-2020', 'Produire les meilleurs eleves du monde', '2019-09-15 00:00:00', '2020-05-15 00:00:00', '0', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'CORE_1598613732', '', '2020-2021', '', '2020-08-28 00:00:00', '2021-08-28 00:00:00', '1', 0, '2020-08-28 12:22:12', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `annee_scolaire` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. antecedent_scolaire
DROP TABLE IF EXISTS `antecedent_scolaire`;
CREATE TABLE IF NOT EXISTS `antecedent_scolaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ecole` varchar(254) DEFAULT NULL,
  `classe` varchar(254) DEFAULT NULL,
  `telephone` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  `code` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.antecedent_scolaire : ~93 rows (environ)
/*!40000 ALTER TABLE `antecedent_scolaire` DISABLE KEYS */;
INSERT IGNORE INTO `antecedent_scolaire` (`id`, `ecole`, `classe`, `telephone`, `email`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`, `code`) VALUES
	(1, '', '', '', '', 0, '2020-08-28 07:38:15', NULL, NULL, NULL, NULL, '1', NULL),
	(2, '', '', '', '', 0, '2020-08-28 07:38:29', NULL, NULL, NULL, NULL, '1', NULL),
	(3, '', '', '', '', 0, '2020-08-28 07:45:16', NULL, NULL, NULL, NULL, '1', NULL),
	(4, '', '', '', '', 0, '2020-08-28 07:45:49', NULL, NULL, NULL, NULL, '1', NULL),
	(5, '', '', '', '', 0, '2020-08-28 07:46:28', NULL, NULL, NULL, NULL, '1', NULL),
	(6, '', '', '', '', 0, '2020-08-28 07:49:01', NULL, NULL, NULL, NULL, '1', 'ANTE_1598597341'),
	(7, '', '', '', '', 0, '2020-08-28 07:51:42', NULL, NULL, NULL, NULL, '1', 'ANTE_1598597502'),
	(8, '', '', '', '', 0, '2020-08-28 07:53:06', NULL, NULL, NULL, NULL, '1', 'ANTE_1598597586'),
	(9, '', '', '', '', 0, '2020-08-28 10:02:29', NULL, NULL, NULL, NULL, '1', 'ANTE_1598605349'),
	(10, '', '', '', '', 0, '2020-08-28 10:04:35', NULL, NULL, NULL, NULL, '1', 'ANTE_1598605475'),
	(11, '', '', '', '', 0, '2020-08-28 10:08:18', NULL, NULL, NULL, NULL, '1', 'ANTE_1598605697'),
	(12, '', '', '', '', 0, '2020-08-28 10:10:37', NULL, NULL, NULL, NULL, '1', 'ANTE_1598605837'),
	(13, '', '', '', '', 0, '2020-08-28 10:10:43', NULL, NULL, NULL, NULL, '1', 'ANTE_1598605843'),
	(14, '', '', '', '', 0, '2020-08-28 10:11:40', NULL, NULL, NULL, NULL, '1', 'ANTE_1598605900'),
	(15, '', '', '', '', 0, '2020-08-28 10:12:58', NULL, NULL, NULL, NULL, '1', 'ANTE_1598605978'),
	(16, '', '', '', '', 0, '2020-08-28 10:15:30', NULL, NULL, NULL, NULL, '1', 'ANTE_1598606125'),
	(17, '', '', '', '', 0, '2020-08-28 10:17:18', NULL, NULL, NULL, NULL, '1', 'ANTE_1598606238'),
	(18, '', '', '', '', 0, '2020-08-28 10:19:32', NULL, NULL, NULL, NULL, '1', 'ANTE_1598606372'),
	(19, '', '', '', '', 0, '2020-08-28 10:19:38', NULL, NULL, NULL, NULL, '1', 'ANTE_1598606378'),
	(20, '', '', '', '', 0, '2020-08-28 10:20:49', NULL, NULL, NULL, NULL, '1', 'ANTE_1598606449'),
	(21, '', '', '', '', 0, '2020-08-28 10:21:40', NULL, NULL, NULL, NULL, '1', 'ANTE_1598606500'),
	(22, '', '', '', '', 0, '2020-08-28 10:28:42', NULL, NULL, NULL, NULL, '1', 'ANTE_1598606922'),
	(23, '', '', '', '', 0, '2020-08-28 10:30:20', NULL, NULL, NULL, NULL, '1', 'ANTE_1598607020'),
	(24, '', '', '', '', 0, '2020-08-28 10:31:33', NULL, NULL, NULL, NULL, '1', 'ANTE_1598607093'),
	(25, '', '', '', '', 0, '2020-08-28 10:32:06', NULL, NULL, NULL, NULL, '1', 'ANTE_1598607126'),
	(26, '', '', '', '', 0, '2020-08-28 10:33:18', NULL, NULL, NULL, NULL, '1', 'ANTE_1598607198'),
	(27, '', '', '', '', 0, '2020-08-28 10:34:12', NULL, NULL, NULL, NULL, '1', 'ANTE_1598607252'),
	(28, '', '', '', '', 0, '2020-08-28 10:36:16', NULL, NULL, NULL, NULL, '1', 'ANTE_1598607376'),
	(29, '', '', '', '', 0, '2020-08-28 10:37:16', NULL, NULL, NULL, NULL, '1', 'ANTE_1598607436'),
	(30, '', '', '', '', 0, '2020-08-28 10:40:41', NULL, NULL, NULL, NULL, '1', 'ANTE_1598607641'),
	(31, '', '', '', '', 0, '2020-08-28 10:42:40', NULL, NULL, NULL, NULL, '1', 'ANTE_1598607760'),
	(32, '', '', '', '', 0, '2020-08-28 10:43:32', NULL, NULL, NULL, NULL, '1', 'ANTE_1598607812'),
	(33, '', '', '', '', 0, '2020-08-28 10:45:09', NULL, NULL, NULL, NULL, '1', 'ANTE_1598607909'),
	(34, '', '', '', '', 0, '2020-08-28 10:46:51', NULL, NULL, NULL, NULL, '1', 'ANTE_1598608011'),
	(35, '', '', '', '', 0, '2020-08-28 10:47:20', NULL, NULL, NULL, NULL, '1', 'ANTE_1598608040'),
	(36, '', '', '', '', 0, '2020-08-28 10:47:35', NULL, NULL, NULL, NULL, '1', 'ANTE_1598608055'),
	(37, '', '', '', '', 0, '2020-08-28 10:52:59', NULL, NULL, NULL, NULL, '1', 'ANTE_1598608379'),
	(38, '', '', '', '', 0, '2020-08-28 10:58:41', NULL, NULL, NULL, NULL, '1', 'ANTE_1598608721'),
	(39, '', '', '', '', 0, '2020-08-28 11:05:38', NULL, NULL, NULL, NULL, '1', 'ANTE_1598609138'),
	(40, '', '', '', '', 0, '2020-08-28 11:06:39', NULL, NULL, NULL, NULL, '1', 'ANTE_1598609199'),
	(41, '', '', '', '', 0, '2020-08-28 11:14:07', NULL, NULL, NULL, NULL, '1', 'ANTE_1598609647'),
	(42, '', '', '', '', 0, '2020-08-28 11:15:49', NULL, NULL, NULL, NULL, '1', 'ANTE_1598609749'),
	(43, '', '', '', '', 0, '2020-08-28 11:16:44', NULL, NULL, NULL, NULL, '1', 'ANTE_1598609804'),
	(44, '', '', '', '', 0, '2020-08-28 11:17:31', NULL, NULL, NULL, NULL, '1', 'ANTE_1598609851'),
	(45, '', '', '', '', 0, '2020-08-28 11:18:29', NULL, NULL, NULL, NULL, '1', 'ANTE_1598609909'),
	(46, '', '', '', '', 0, '2020-08-28 11:19:27', NULL, NULL, NULL, NULL, '1', 'ANTE_1598609967'),
	(47, '', '', '', '', 0, '2020-08-28 11:19:46', NULL, NULL, NULL, NULL, '1', 'ANTE_1598609986'),
	(48, '', '', '', '', 0, '2020-08-28 11:20:48', NULL, NULL, NULL, NULL, '1', 'ANTE_1598610048'),
	(49, '', '', '', '', 0, '2020-08-28 11:21:31', NULL, NULL, NULL, NULL, '1', 'ANTE_1598610091'),
	(50, '', '', '', '', 0, '2020-08-28 11:28:06', NULL, NULL, NULL, NULL, '1', 'ANTE_1598610486'),
	(51, '', '', '', '', 0, '2020-08-28 11:28:43', NULL, NULL, NULL, NULL, '1', 'ANTE_1598610523'),
	(52, '', '', '', '', 0, '2020-08-28 11:30:21', NULL, NULL, NULL, NULL, '1', 'ANTE_1598610621'),
	(53, '', '', '', '', 0, '2020-08-28 11:31:28', NULL, NULL, NULL, NULL, '1', 'ANTE_1598610688'),
	(54, '', '', '', '', 0, '2020-08-28 11:31:57', NULL, NULL, NULL, NULL, '1', 'ANTE_1598610717'),
	(55, '', '', '', '', 0, '2020-08-28 11:33:23', NULL, NULL, NULL, NULL, '1', 'ANTE_1598610803'),
	(56, '', '', '', '', 0, '2020-08-28 11:34:41', NULL, NULL, NULL, NULL, '1', 'ANTE_1598610881'),
	(57, '', '', '', '', 0, '2020-08-28 11:35:22', NULL, NULL, NULL, NULL, '1', 'ANTE_1598610922'),
	(58, '', '', '', '', 0, '2020-08-28 11:36:47', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611007'),
	(59, '', '', '', '', 0, '2020-08-28 11:41:59', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611319'),
	(60, '', '', '', '', 0, '2020-08-28 11:42:32', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611352'),
	(61, '', '', '', '', 0, '2020-08-28 11:42:49', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611369'),
	(62, '', '', '', '', 0, '2020-08-28 11:43:26', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611406'),
	(63, '', '', '', '', 0, '2020-08-28 11:43:43', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611423'),
	(64, '', '', '', '', 0, '2020-08-28 11:44:14', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611454'),
	(65, '', '', '', '', 0, '2020-08-28 11:45:06', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611506'),
	(66, '', '', '', '', 0, '2020-08-28 11:45:53', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611553'),
	(67, '', '', '', '', 0, '2020-08-28 11:47:55', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611675'),
	(68, '', '', '', '', 0, '2020-08-28 11:48:34', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611714'),
	(69, '', '', '', '', 0, '2020-08-28 11:48:41', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611721'),
	(70, '', '', '', '', 0, '2020-08-28 11:48:46', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611726'),
	(71, '', '', '', '', 0, '2020-08-28 11:50:20', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611820'),
	(72, '', '', '', '', 0, '2020-08-28 11:52:11', NULL, NULL, NULL, NULL, '1', 'ANTE_1598611931'),
	(73, '', '', '', '', 0, '2020-08-28 11:53:24', NULL, NULL, NULL, NULL, '1', 'ANTE_1598612004'),
	(74, '', '', '', '', 0, '2020-08-28 11:55:04', NULL, NULL, NULL, NULL, '1', 'ANTE_1598612104'),
	(75, '', '', '', '', 0, '2020-08-28 11:55:37', NULL, NULL, NULL, NULL, '1', 'ANTE_1598612137'),
	(76, '', '', '', '', 0, '2020-08-28 12:13:27', NULL, NULL, NULL, NULL, '1', 'ANTE_1598613207'),
	(77, '', '', '', '', 0, '2020-08-28 12:15:04', NULL, NULL, NULL, NULL, '1', 'ANTE_1598613304'),
	(78, '', '', '', '', 0, '2020-08-28 12:16:07', NULL, NULL, NULL, NULL, '1', 'ANTE_1598613367'),
	(79, '', '', '', '', 0, '2020-08-28 12:16:23', NULL, NULL, NULL, NULL, '1', 'ANTE_1598613383'),
	(80, '', '', '', '', 0, '2020-08-28 12:20:57', NULL, NULL, NULL, NULL, '1', 'ANTE_1598613657'),
	(81, '', '', '', '', 0, '2020-08-28 12:21:48', NULL, NULL, NULL, NULL, '1', 'ANTE_1598613708'),
	(82, '', '', '', '', 0, '2020-08-28 12:22:12', NULL, NULL, NULL, NULL, '1', 'ANTE_1598613732'),
	(83, '', '', '', '', 0, '2020-08-28 12:22:46', NULL, NULL, NULL, NULL, '1', 'ANTE_1598613766'),
	(84, '', '', '', '', 0, '2020-08-28 12:24:10', NULL, NULL, NULL, NULL, '1', 'ANTE_1598613850'),
	(85, '', '', '', '', 0, '2020-08-28 15:17:30', NULL, NULL, NULL, NULL, '1', 'ANTE_1598624250'),
	(86, '', '', '', '', 0, '2020-09-01 18:18:09', NULL, NULL, NULL, NULL, '1', 'ANTE_1599002221'),
	(87, '', '', '', '', 0, '2020-09-01 18:19:58', NULL, NULL, NULL, NULL, '1', 'ANTE_1599002330'),
	(88, '', '', '', '', 0, '2020-09-01 18:27:29', NULL, NULL, NULL, NULL, '1', 'ANTE_1599002782'),
	(89, '', '', '', '', 0, '2020-09-01 18:33:03', NULL, NULL, NULL, NULL, '1', 'ANTE_1599003115'),
	(90, '', '', '', '', 0, '2020-09-01 18:34:21', NULL, NULL, NULL, NULL, '1', 'ANTE_1599003194'),
	(91, '', '', '', '', 0, '2020-09-01 18:36:51', NULL, NULL, NULL, NULL, '1', 'ANTE_1599003343'),
	(92, '', '', '', '', 0, '2020-09-01 18:39:14', NULL, NULL, NULL, NULL, '1', 'ANTE_1599003486'),
	(93, '', '', '', '', 0, '2020-09-01 18:42:31', NULL, NULL, NULL, NULL, '1', 'ANTE_1599003684');
/*!40000 ALTER TABLE `antecedent_scolaire` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. classe
DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `scolarite_min` float DEFAULT NULL,
  `scolarite_max` float DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_cycle_classe` (`cycle_id`),
  CONSTRAINT `fk_cycle_classe` FOREIGN KEY (`cycle_id`) REFERENCES `cycle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.classe : ~7 rows (environ)
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
INSERT IGNORE INTO `classe` (`id`, `cycle_id`, `code`, `libelle`, `description`, `scolarite_min`, `scolarite_max`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 3, 'SECTION_1', 'Petite-section', '', 200456, 435000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 2, 'SECTION_2', 'Moyenne-section', '', 300400, 470000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 1, 'SECTION_3', 'Grande-section', '', 200456, 435000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(4, 2, 'SIL', 'SIL', '', 600456, 735000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(5, 2, 'CP', 'Cours-Preparatoire', '', 500456, 735000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(6, 2, 'CE1', 'Cours-Elementaire', '', 500456, 735000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(9, 2, 'CM2', 'Cours-Moyen', '', 500456, 735000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. composer
DROP TABLE IF EXISTS `composer`;
CREATE TABLE IF NOT EXISTS `composer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classe_id` int(11) NOT NULL,
  `matiere_id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `eleve_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note` float DEFAULT NULL,
  `mention` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_classe_compose` (`classe_id`),
  KEY `fk_matiere_compose` (`matiere_id`),
  KEY `fk_eleve_compose` (`eleve_id`),
  KEY `fk_est_compose` (`cours_id`),
  KEY `fk_periode_compose` (`periode_id`),
  KEY `fk_enseignant_compose` (`personnel_id`),
  CONSTRAINT `fk_classe_compose` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`),
  CONSTRAINT `fk_eleve_compose` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`),
  CONSTRAINT `fk_enseignant_compose` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`),
  CONSTRAINT `fk_est_compose` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`),
  CONSTRAINT `fk_matiere_compose` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`id`),
  CONSTRAINT `fk_periode_compose` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.composer : ~0 rows (environ)
/*!40000 ALTER TABLE `composer` DISABLE KEYS */;
/*!40000 ALTER TABLE `composer` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. cours
DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classe_id` int(11) NOT NULL,
  `salle_classe_id` int(11) NOT NULL,
  `matiere_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `volume_horaire` int(11) DEFAULT NULL,
  `coefficient` int(11) DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_est_enseignee_classe` (`classe_id`),
  KEY `fk_est_enseignee_salle_classe` (`salle_classe_id`),
  KEY `fk_est_dispensee` (`matiere_id`),
  KEY `fk_professeur_cours` (`personnel_id`),
  CONSTRAINT `fk_est_dispensee` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`id`),
  CONSTRAINT `fk_est_enseignee_classe` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`),
  CONSTRAINT `fk_est_enseignee_salle_classe` FOREIGN KEY (`salle_classe_id`) REFERENCES `salle_classe` (`id`),
  CONSTRAINT `fk_professeur_cours` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.cours : ~0 rows (environ)
/*!40000 ALTER TABLE `cours` DISABLE KEYS */;
/*!40000 ALTER TABLE `cours` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. cycle
DROP TABLE IF EXISTS `cycle`;
CREATE TABLE IF NOT EXISTS `cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.cycle : ~3 rows (environ)
/*!40000 ALTER TABLE `cycle` DISABLE KEYS */;
INSERT IGNORE INTO `cycle` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'CYCL-01', 'Maternel', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'CYCL-02', 'Primaire', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 'CYCL-03', 'Secondaire', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `cycle` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. depense
DROP TABLE IF EXISTS `depense`;
CREATE TABLE IF NOT EXISTS `depense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `motif` varchar(254) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `piece_jointes` text DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `date_achat` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_personnelAchat` (`personnel_id`),
  CONSTRAINT `fk_personnel_achat` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.depense : ~0 rows (environ)
/*!40000 ALTER TABLE `depense` DISABLE KEYS */;
/*!40000 ALTER TABLE `depense` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. dette
DROP TABLE IF EXISTS `dette`;
CREATE TABLE IF NOT EXISTS `dette` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `motif` varchar(254) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `date_emprunt` datetime DEFAULT NULL,
  `montant_interet` float DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.dette : ~0 rows (environ)
/*!40000 ALTER TABLE `dette` DISABLE KEYS */;
/*!40000 ALTER TABLE `dette` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. discipline
DROP TABLE IF EXISTS `discipline`;
CREATE TABLE IF NOT EXISTS `discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.discipline : ~0 rows (environ)
/*!40000 ALTER TABLE `discipline` DISABLE KEYS */;
/*!40000 ALTER TABLE `discipline` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. document
DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domaine_id` int(11) NOT NULL,
  `numero_enregistrement` int(11) DEFAULT NULL,
  `code_isbn` int(11) DEFAULT NULL,
  `titre` varchar(254) DEFAULT NULL,
  `couverture` varchar(254) DEFAULT NULL,
  `auteur` varchar(254) DEFAULT NULL,
  `nombre_page` int(11) DEFAULT NULL,
  `date_publication` datetime DEFAULT NULL,
  `maison_edition` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_domaine_document` (`domaine_id`),
  CONSTRAINT `fk_domaine_document` FOREIGN KEY (`domaine_id`) REFERENCES `domaine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.document : ~0 rows (environ)
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. domaine
DROP TABLE IF EXISTS `domaine`;
CREATE TABLE IF NOT EXISTS `domaine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.domaine : ~0 rows (environ)
/*!40000 ALTER TABLE `domaine` DISABLE KEYS */;
/*!40000 ALTER TABLE `domaine` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. dossier_medical
DROP TABLE IF EXISTS `dossier_medical`;
CREATE TABLE IF NOT EXISTS `dossier_medical` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `allergie` text DEFAULT NULL,
  `groupe_sanguin` varchar(254) DEFAULT NULL,
  `probleme_particulier` text DEFAULT NULL,
  `maladie_recurrente` text DEFAULT NULL,
  `nom_medecin` varchar(254) DEFAULT NULL,
  `telephone_medecin` varchar(254) DEFAULT NULL,
  `email_medecin` varchar(254) DEFAULT NULL,
  `autres` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.dossier_medical : ~84 rows (environ)
/*!40000 ALTER TABLE `dossier_medical` DISABLE KEYS */;
INSERT IGNORE INTO `dossier_medical` (`id`, `code`, `allergie`, `groupe_sanguin`, `probleme_particulier`, `maladie_recurrente`, `nom_medecin`, `telephone_medecin`, `email_medecin`, `autres`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'DOSS_1598605475', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:04:35', NULL, NULL, NULL, NULL, '1'),
	(2, 'DOSS_1598605698', '', '', '', '', '', '', '', '', 0, '2020-08-28 10:08:20', NULL, NULL, NULL, NULL, '1'),
	(3, 'DOSS_1598605837', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:10:37', NULL, NULL, NULL, NULL, '1'),
	(4, 'DOSS_1598605843', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:10:43', NULL, NULL, NULL, NULL, '1'),
	(5, 'DOSS_1598605900', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:11:40', NULL, NULL, NULL, NULL, '1'),
	(6, 'DOSS_1598605978', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:12:58', NULL, NULL, NULL, NULL, '1'),
	(7, 'DOSS_1598606130', '', '', '', '', '', '', '', '', 0, '2020-08-28 10:15:41', NULL, NULL, NULL, NULL, '1'),
	(8, 'DOSS_1598606238', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:17:18', NULL, NULL, NULL, NULL, '1'),
	(9, 'DOSS_1598606372', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:19:32', NULL, NULL, NULL, NULL, '1'),
	(10, 'DOSS_1598606378', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:19:38', NULL, NULL, NULL, NULL, '1'),
	(11, 'DOSS_1598606449', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:20:49', NULL, NULL, NULL, NULL, '1'),
	(12, 'DOSS_1598606500', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:21:40', NULL, NULL, NULL, NULL, '1'),
	(13, 'DOSS_1598606922', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:28:42', NULL, NULL, NULL, NULL, '1'),
	(14, 'DOSS_1598607020', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:30:20', NULL, NULL, NULL, NULL, '1'),
	(15, 'DOSS_1598607093', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:31:33', NULL, NULL, NULL, NULL, '1'),
	(16, 'DOSS_1598607126', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:32:06', NULL, NULL, NULL, NULL, '1'),
	(17, 'DOSS_1598607198', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:33:18', NULL, NULL, NULL, NULL, '1'),
	(18, 'DOSS_1598607252', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:34:12', NULL, NULL, NULL, NULL, '1'),
	(19, 'DOSS_1598607376', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:36:16', NULL, NULL, NULL, NULL, '1'),
	(20, 'DOSS_1598607436', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:37:16', NULL, NULL, NULL, NULL, '1'),
	(21, 'DOSS_1598607641', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:40:41', NULL, NULL, NULL, NULL, '1'),
	(22, 'DOSS_1598607760', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:42:40', NULL, NULL, NULL, NULL, '1'),
	(23, 'DOSS_1598607812', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:43:32', NULL, NULL, NULL, NULL, '1'),
	(24, 'DOSS_1598607909', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:45:09', NULL, NULL, NULL, NULL, '1'),
	(25, 'DOSS_1598608011', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:46:51', NULL, NULL, NULL, NULL, '1'),
	(26, 'DOSS_1598608040', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:47:20', NULL, NULL, NULL, NULL, '1'),
	(27, 'DOSS_1598608055', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:47:35', NULL, NULL, NULL, NULL, '1'),
	(28, 'DOSS_1598608379', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:52:59', NULL, NULL, NULL, NULL, '1'),
	(29, 'DOSS_1598608721', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 10:58:41', NULL, NULL, NULL, NULL, '1'),
	(30, 'DOSS_1598609138', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:05:38', NULL, NULL, NULL, NULL, '1'),
	(31, 'DOSS_1598609199', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:06:39', NULL, NULL, NULL, NULL, '1'),
	(32, 'DOSS_1598609647', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:14:07', NULL, NULL, NULL, NULL, '1'),
	(33, 'DOSS_1598609749', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:15:49', NULL, NULL, NULL, NULL, '1'),
	(34, 'DOSS_1598609804', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:16:44', NULL, NULL, NULL, NULL, '1'),
	(35, 'DOSS_1598609851', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:17:31', NULL, NULL, NULL, NULL, '1'),
	(36, 'DOSS_1598609909', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:18:29', NULL, NULL, NULL, NULL, '1'),
	(37, 'DOSS_1598609967', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:19:27', NULL, NULL, NULL, NULL, '1'),
	(38, 'DOSS_1598609986', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:19:46', NULL, NULL, NULL, NULL, '1'),
	(39, 'DOSS_1598610048', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:20:48', NULL, NULL, NULL, NULL, '1'),
	(40, 'DOSS_1598610091', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:21:31', NULL, NULL, NULL, NULL, '1'),
	(41, 'DOSS_1598610486', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:28:06', NULL, NULL, NULL, NULL, '1'),
	(42, 'DOSS_1598610523', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:28:43', NULL, NULL, NULL, NULL, '1'),
	(43, 'DOSS_1598610621', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:30:21', NULL, NULL, NULL, NULL, '1'),
	(44, 'DOSS_1598610688', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:31:28', NULL, NULL, NULL, NULL, '1'),
	(45, 'DOSS_1598610717', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:31:57', NULL, NULL, NULL, NULL, '1'),
	(46, 'DOSS_1598610803', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:33:23', NULL, NULL, NULL, NULL, '1'),
	(47, 'DOSS_1598610881', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:34:41', NULL, NULL, NULL, NULL, '1'),
	(48, 'DOSS_1598610922', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:35:22', NULL, NULL, NULL, NULL, '1'),
	(49, 'DOSS_1598611007', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:36:47', NULL, NULL, NULL, NULL, '1'),
	(50, 'DOSS_1598611319', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:41:59', NULL, NULL, NULL, NULL, '1'),
	(51, 'DOSS_1598611352', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:42:32', NULL, NULL, NULL, NULL, '1'),
	(52, 'DOSS_1598611369', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:42:49', NULL, NULL, NULL, NULL, '1'),
	(53, 'DOSS_1598611406', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:43:26', NULL, NULL, NULL, NULL, '1'),
	(54, 'DOSS_1598611423', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:43:43', NULL, NULL, NULL, NULL, '1'),
	(55, 'DOSS_1598611454', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:44:14', NULL, NULL, NULL, NULL, '1'),
	(56, 'DOSS_1598611506', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:45:06', NULL, NULL, NULL, NULL, '1'),
	(57, 'DOSS_1598611553', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:45:53', NULL, NULL, NULL, NULL, '1'),
	(58, 'DOSS_1598611675', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:47:55', NULL, NULL, NULL, NULL, '1'),
	(59, 'DOSS_1598611714', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:48:34', NULL, NULL, NULL, NULL, '1'),
	(60, 'DOSS_1598611721', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:48:41', NULL, NULL, NULL, NULL, '1'),
	(61, 'DOSS_1598611726', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:48:46', NULL, NULL, NULL, NULL, '1'),
	(62, 'DOSS_1598611820', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:50:20', NULL, NULL, NULL, NULL, '1'),
	(63, 'DOSS_1598611931', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:52:11', NULL, NULL, NULL, NULL, '1'),
	(64, 'DOSS_1598612004', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:53:24', NULL, NULL, NULL, NULL, '1'),
	(65, 'DOSS_1598612104', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:55:04', NULL, NULL, NULL, NULL, '1'),
	(66, 'DOSS_1598612137', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 11:55:37', NULL, NULL, NULL, NULL, '1'),
	(67, 'DOSS_1598613207', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 12:13:27', NULL, NULL, NULL, NULL, '1'),
	(68, 'DOSS_1598613304', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 12:15:04', NULL, NULL, NULL, NULL, '1'),
	(69, 'DOSS_1598613367', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 12:16:07', NULL, NULL, NULL, NULL, '1'),
	(70, 'DOSS_1598613383', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 12:16:23', NULL, NULL, NULL, NULL, '1'),
	(71, 'DOSS_1598613657', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 12:20:57', NULL, NULL, NULL, NULL, '1'),
	(72, 'DOSS_1598613708', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 12:21:48', NULL, NULL, NULL, NULL, '1'),
	(73, 'DOSS_1598613732', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 12:22:12', NULL, NULL, NULL, NULL, '1'),
	(74, 'DOSS_1598613766', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 12:22:46', NULL, NULL, NULL, NULL, '1'),
	(75, 'DOSS_1598613850', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 12:24:10', NULL, NULL, NULL, NULL, '1'),
	(76, 'DOSS_1598624250', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-08-28 15:17:30', NULL, NULL, NULL, NULL, '1'),
	(77, 'DOSS_1599002222', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-09-01 18:18:09', NULL, NULL, NULL, NULL, '1'),
	(78, 'DOSS_1599002331', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-09-01 18:19:58', NULL, NULL, NULL, NULL, '1'),
	(79, 'DOSS_1599002783', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-09-01 18:27:30', NULL, NULL, NULL, NULL, '1'),
	(80, 'DOSS_1599003117', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-09-01 18:33:04', NULL, NULL, NULL, NULL, '1'),
	(81, 'DOSS_1599003195', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-09-01 18:34:22', NULL, NULL, NULL, NULL, '1'),
	(82, 'DOSS_1599003344', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-09-01 18:36:51', NULL, NULL, NULL, NULL, '1'),
	(83, 'DOSS_1599003487', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-09-01 18:39:14', NULL, NULL, NULL, NULL, '1'),
	(84, 'DOSS_1599003685', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-09-01 18:42:32', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `dossier_medical` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. dossier_parental
DROP TABLE IF EXISTS `dossier_parental`;
CREATE TABLE IF NOT EXISTS `dossier_parental` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) NOT NULL DEFAULT '',
  `pays_mere_id` int(11) DEFAULT NULL,
  `pays_pere_id` int(11) DEFAULT NULL,
  `nom_pere` varchar(254) DEFAULT NULL,
  `prenom_pere` varchar(254) DEFAULT NULL,
  `profession_pere` varchar(254) DEFAULT NULL,
  `employeur_pere` varchar(254) DEFAULT NULL,
  `lieu_travail_pere` varchar(254) DEFAULT NULL,
  `quartier_pere` varchar(254) DEFAULT NULL,
  `telephone_pere` varchar(254) DEFAULT NULL,
  `ville_pere` varchar(254) DEFAULT NULL,
  `est_tuteur` tinyint(1) DEFAULT NULL,
  `email_pere` varchar(254) DEFAULT NULL,
  `signature_pere` varchar(254) DEFAULT NULL,
  `nom_mere` varchar(254) DEFAULT NULL,
  `prenom_mere` varchar(254) DEFAULT NULL,
  `profession_mere` varchar(254) DEFAULT NULL,
  `employeur_mere` varchar(254) DEFAULT NULL,
  `lieu_travail_mere` varchar(254) DEFAULT NULL,
  `quartier_mere` varchar(254) DEFAULT NULL,
  `telephone_mere` varchar(254) DEFAULT NULL,
  `ville_mere` varchar(254) DEFAULT NULL,
  `est_tutrice` tinyint(1) DEFAULT NULL,
  `email_mere` varchar(254) DEFAULT NULL,
  `signature_mere` varchar(254) DEFAULT NULL,
  `nom_personne_urgence` varchar(254) DEFAULT NULL,
  `prenom_personne_urgence` varchar(254) DEFAULT NULL,
  `telephone_personne_urgence` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_pays_eleve_mere` (`pays_mere_id`),
  KEY `fk_pays_eleve_pere` (`pays_pere_id`),
  CONSTRAINT `fk_pays_eleve_mere` FOREIGN KEY (`pays_mere_id`) REFERENCES `pays` (`id`),
  CONSTRAINT `fk_pays_eleve_pere` FOREIGN KEY (`pays_pere_id`) REFERENCES `pays` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.dossier_parental : ~67 rows (environ)
/*!40000 ALTER TABLE `dossier_parental` DISABLE KEYS */;
INSERT IGNORE INTO `dossier_parental` (`id`, `code`, `pays_mere_id`, `pays_pere_id`, `nom_pere`, `prenom_pere`, `profession_pere`, `employeur_pere`, `lieu_travail_pere`, `quartier_pere`, `telephone_pere`, `ville_pere`, `est_tuteur`, `email_pere`, `signature_pere`, `nom_mere`, `prenom_mere`, `profession_mere`, `employeur_mere`, `lieu_travail_mere`, `quartier_mere`, `telephone_mere`, `ville_mere`, `est_tutrice`, `email_mere`, `signature_mere`, `nom_personne_urgence`, `prenom_personne_urgence`, `telephone_personne_urgence`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(7, 'DOSS_1598606922', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 10:28:42', NULL, NULL, NULL, NULL, '1'),
	(9, 'DOSS_1598607252', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 10:34:12', NULL, NULL, NULL, NULL, '1'),
	(10, 'DOSS_1598607436', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 10:37:16', NULL, NULL, NULL, NULL, '1'),
	(11, 'DOSS_1598607641', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 10:40:41', NULL, NULL, NULL, NULL, '1'),
	(12, 'DOSS_1598607760', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 10:42:40', NULL, NULL, NULL, NULL, '1'),
	(13, 'DOSS_1598607812', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 10:43:32', NULL, NULL, NULL, NULL, '1'),
	(14, 'DOSS_1598607909', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 10:45:09', NULL, NULL, NULL, NULL, '1'),
	(15, 'DOSS_1598608011', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 10:46:51', NULL, NULL, NULL, NULL, '1'),
	(16, 'DOSS_1598608040', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 10:47:20', NULL, NULL, NULL, NULL, '1'),
	(17, 'DOSS_1598608055', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 10:47:35', NULL, NULL, NULL, NULL, '1'),
	(18, 'DOSS_1598608379', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 10:52:59', NULL, NULL, NULL, NULL, '1'),
	(19, 'DOSS_1598608721', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 10:58:41', NULL, NULL, NULL, NULL, '1'),
	(20, 'DOSS_1598609138', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:05:38', NULL, NULL, NULL, NULL, '1'),
	(21, 'DOSS_1598609199', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:06:39', NULL, NULL, NULL, NULL, '1'),
	(22, 'DOSS_1598609647', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:14:07', NULL, NULL, NULL, NULL, '1'),
	(23, 'DOSS_1598609749', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:15:49', NULL, NULL, NULL, NULL, '1'),
	(24, 'DOSS_1598609804', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:16:45', NULL, NULL, NULL, NULL, '1'),
	(25, 'DOSS_1598609851', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:17:31', NULL, NULL, NULL, NULL, '1'),
	(26, 'DOSS_1598609909', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:18:29', NULL, NULL, NULL, NULL, '1'),
	(27, 'DOSS_1598609967', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:19:27', NULL, NULL, NULL, NULL, '1'),
	(28, 'DOSS_1598609986', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:19:46', NULL, NULL, NULL, NULL, '1'),
	(29, 'DOSS_1598610048', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:20:48', NULL, NULL, NULL, NULL, '1'),
	(30, 'DOSS_1598610091', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:21:31', NULL, NULL, NULL, NULL, '1'),
	(31, 'DOSS_1598610486', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:28:06', NULL, NULL, NULL, NULL, '1'),
	(32, 'DOSS_1598610524', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:28:44', NULL, NULL, NULL, NULL, '1'),
	(33, 'DOSS_1598610621', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:30:21', NULL, NULL, NULL, NULL, '1'),
	(34, 'DOSS_1598610688', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:31:28', NULL, NULL, NULL, NULL, '1'),
	(35, 'DOSS_1598610717', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:31:57', NULL, NULL, NULL, NULL, '1'),
	(36, 'DOSS_1598610803', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:33:23', NULL, NULL, NULL, NULL, '1'),
	(37, 'DOSS_1598610881', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:34:41', NULL, NULL, NULL, NULL, '1'),
	(38, 'DOSS_1598610922', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:35:22', NULL, NULL, NULL, NULL, '1'),
	(39, 'DOSS_1598611007', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:36:47', NULL, NULL, NULL, NULL, '1'),
	(40, 'DOSS_1598611319', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:41:59', NULL, NULL, NULL, NULL, '1'),
	(41, 'DOSS_1598611352', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:42:32', NULL, NULL, NULL, NULL, '1'),
	(42, 'DOSS_1598611369', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:42:49', NULL, NULL, NULL, NULL, '1'),
	(43, 'DOSS_1598611406', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:43:26', NULL, NULL, NULL, NULL, '1'),
	(44, 'DOSS_1598611423', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:43:43', NULL, NULL, NULL, NULL, '1'),
	(45, 'DOSS_1598611454', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:44:14', NULL, NULL, NULL, NULL, '1'),
	(46, 'DOSS_1598611506', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:45:06', NULL, NULL, NULL, NULL, '1'),
	(47, 'DOSS_1598611553', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:45:53', NULL, NULL, NULL, NULL, '1'),
	(48, 'DOSS_1598611675', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:47:55', NULL, NULL, NULL, NULL, '1'),
	(49, 'DOSS_1598611714', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:48:34', NULL, NULL, NULL, NULL, '1'),
	(50, 'DOSS_1598611721', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:48:41', NULL, NULL, NULL, NULL, '1'),
	(51, 'DOSS_1598611726', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:48:46', NULL, NULL, NULL, NULL, '1'),
	(52, 'DOSS_1598611820', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:50:20', NULL, NULL, NULL, NULL, '1'),
	(53, 'DOSS_1598611931', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:52:11', NULL, NULL, NULL, NULL, '1'),
	(54, 'DOSS_1598612004', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:53:24', NULL, NULL, NULL, NULL, '1'),
	(55, 'DOSS_1598612104', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:55:04', NULL, NULL, NULL, NULL, '1'),
	(56, 'DOSS_1598612137', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 11:55:37', NULL, NULL, NULL, NULL, '1'),
	(57, 'DOSS_1598613207', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 12:13:27', NULL, NULL, NULL, NULL, '1'),
	(58, 'DOSS_1598613304', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 12:15:04', NULL, NULL, NULL, NULL, '1'),
	(59, 'DOSS_1598613367', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 12:16:07', NULL, NULL, NULL, NULL, '1'),
	(60, 'DOSS_1598613383', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 12:16:23', NULL, NULL, NULL, NULL, '1'),
	(61, 'DOSS_1598613657', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 12:20:57', NULL, NULL, NULL, NULL, '1'),
	(62, 'DOSS_1598613708', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 12:21:48', NULL, NULL, NULL, NULL, '1'),
	(63, 'DOSS_1598613732', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 12:22:12', NULL, NULL, NULL, NULL, '1'),
	(64, 'DOSS_1598613766', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 12:22:46', NULL, NULL, NULL, NULL, '1'),
	(65, 'DOSS_1598613850', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 12:24:10', NULL, NULL, NULL, NULL, '1'),
	(66, 'DOSS_1598624250', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-08-28 15:17:30', NULL, NULL, NULL, NULL, '1'),
	(67, 'DOSS_1599002223', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-09-01 18:18:10', NULL, NULL, NULL, NULL, '1'),
	(68, 'DOSS_1599002332', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-09-01 18:19:59', NULL, NULL, NULL, NULL, '1'),
	(69, 'DOSS_1599002784', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-09-01 18:27:30', NULL, NULL, NULL, NULL, '1'),
	(70, 'DOSS_1599003119', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-09-01 18:33:06', NULL, NULL, NULL, NULL, '1'),
	(71, 'DOSS_1599003196', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-09-01 18:34:22', NULL, NULL, NULL, NULL, '1'),
	(72, 'DOSS_1599003345', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-09-01 18:36:52', NULL, NULL, NULL, NULL, '1'),
	(73, 'DOSS_1599003489', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-09-01 18:39:16', NULL, NULL, NULL, NULL, '1'),
	(74, 'DOSS_1599003686', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', 0, '2020-09-01 18:42:32', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `dossier_parental` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. eleve
DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) NOT NULL DEFAULT '',
  `dossier_medical_id` int(11) NOT NULL,
  `pays_id` int(11) NOT NULL,
  `dossier_parental_id` int(11) NOT NULL,
  `antecedent_scolaire_id` int(11) NOT NULL,
  `matricule` varchar(254) DEFAULT NULL,
  `nom` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `sexe` enum('H','F') DEFAULT 'H',
  `date_naissance` datetime DEFAULT NULL,
  `lieu_naissance` varchar(254) DEFAULT NULL,
  `photo` varchar(254) DEFAULT NULL,
  `anciennete` int(11) DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_eleve_antecedent_scolaire` (`antecedent_scolaire_id`),
  KEY `fk_eleve_dossier_medical` (`dossier_medical_id`),
  KEY `fk_eleve_dossier_parental` (`dossier_parental_id`),
  KEY `fk_pays_eleve` (`pays_id`),
  CONSTRAINT `fk_eleve_antecedent_scolaire` FOREIGN KEY (`antecedent_scolaire_id`) REFERENCES `antecedent_scolaire` (`id`),
  CONSTRAINT `fk_eleve_dossier_medical` FOREIGN KEY (`dossier_medical_id`) REFERENCES `dossier_medical` (`id`),
  CONSTRAINT `fk_eleve_dossier_parental` FOREIGN KEY (`dossier_parental_id`) REFERENCES `dossier_parental` (`id`),
  CONSTRAINT `fk_pays_eleve` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.eleve : ~34 rows (environ)
/*!40000 ALTER TABLE `eleve` DISABLE KEYS */;
INSERT IGNORE INTO `eleve` (`id`, `code`, `dossier_medical_id`, `pays_id`, `dossier_parental_id`, `antecedent_scolaire_id`, `matricule`, `nom`, `prenom`, `sexe`, `date_naissance`, `lieu_naissance`, `photo`, `anciennete`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'ELEV_1598610091', 40, 1, 30, 49, '2019-09-15 08:00:00A000', 'TSUALA', 'Florian', 'H', '2000-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:21:31', NULL, NULL, NULL, NULL, '1'),
	(2, 'ELEV_1598610486', 41, 1, 31, 50, '2019-09-15 08:00:0019-0', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:28:06', NULL, NULL, NULL, NULL, '1'),
	(3, 'ELEV_1598610688', 44, 1, 34, 53, '2019-09-15 08:00:0019-0', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:31:28', NULL, NULL, NULL, NULL, '1'),
	(4, 'ELEV_1598610803', 46, 1, 36, 55, '1919-0', 'pro', 'di', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:33:23', NULL, NULL, NULL, NULL, '1'),
	(5, 'ELEV_1598610881', 47, 1, 37, 56, '20A001', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:34:41', NULL, NULL, NULL, NULL, '1'),
	(6, 'ELEV_1598611007', 49, 1, 39, 58, '19A001', 'pro', 'digit', 'H', '2000-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:36:47', NULL, NULL, NULL, NULL, '1'),
	(7, 'ELEV_1598611506', 56, 1, 46, 65, '19A002', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:45:06', NULL, NULL, NULL, NULL, '1'),
	(8, 'ELEV_1598611553', 57, 1, 47, 66, '19A003', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:45:54', NULL, NULL, NULL, NULL, '1'),
	(9, 'ELEV_1598611714', 59, 1, 49, 68, '19A004', 'Mulanda ISTIEMUGA', 'priscile jeane', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:48:34', NULL, NULL, NULL, NULL, '1'),
	(10, 'ELEV_1598611721', 60, 1, 50, 69, '19A005', 'kamga Nitedem', 'stephane', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:48:41', NULL, NULL, NULL, NULL, '1'),
	(11, 'ELEV_1598611726', 61, 1, 51, 70, '19A006', 'franck', 'ikamba', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:48:46', NULL, NULL, NULL, NULL, '1'),
	(12, 'ELEV_1598611820', 62, 1, 52, 71, '19A007', 'tadjou', 'Stephane', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:50:20', NULL, NULL, NULL, NULL, '1'),
	(13, 'ELEV_1598611931', 63, 1, 53, 72, '19A008', 'GAN A BOL', '', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:52:11', NULL, NULL, NULL, NULL, '1'),
	(14, 'ELEV_1598612004', 64, 1, 54, 73, '19A009', 'Thiery Yannick', '', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:53:24', NULL, NULL, NULL, NULL, '1'),
	(15, 'ELEV_1598612104', 65, 1, 55, 74, '19A010', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:55:04', NULL, NULL, NULL, NULL, '1'),
	(16, 'ELEV_1598612137', 66, 1, 56, 75, '19A011', 'NDAM NJOYA', 'Arouna', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:55:37', NULL, NULL, NULL, NULL, '1'),
	(17, 'ELEV_1598613207', 67, 1, 57, 76, '19A012', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:13:27', NULL, NULL, NULL, NULL, '1'),
	(18, 'ELEV_1598613304', 68, 1, 58, 77, '19A013', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:15:04', NULL, NULL, NULL, NULL, '1'),
	(19, 'ELEV_1598613367', 69, 1, 59, 78, '19A014', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:16:07', NULL, NULL, NULL, NULL, '1'),
	(20, 'ELEV_1598613383', 70, 1, 60, 79, '19A015', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:16:23', NULL, NULL, NULL, NULL, '1'),
	(21, 'ELEV_1598613657', 71, 1, 61, 80, '19A016', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:20:57', NULL, NULL, NULL, NULL, '1'),
	(22, 'ELEV_1598613708', 72, 1, 62, 81, '19A017', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:21:48', NULL, NULL, NULL, NULL, '1'),
	(23, 'ELEV_1598613732', 73, 1, 63, 82, '19A018', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:22:12', NULL, NULL, NULL, NULL, '1'),
	(24, 'ELEV_1598613766', 74, 1, 64, 83, '19A019', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:22:46', NULL, NULL, NULL, NULL, '1'),
	(25, 'ELEV_1598613850', 75, 1, 65, 84, '19A020', 'TSUALA', 'Florian', 'H', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:24:10', NULL, NULL, NULL, NULL, '1'),
	(26, 'ELEV_1598624250', 76, 2, 66, 85, '19A021', 'q', 'c', 'H', '2020-08-21 00:00:00', '55', 'no-photo.jpg', 0, 0, '2020-08-28 15:17:30', NULL, NULL, NULL, NULL, '1'),
	(27, 'ELEV_1599002224', 77, 4, 67, 86, '20A022', 'TSUALA', 'Florian', 'H', '2020-09-13 00:00:00', 'A', '20A022_1599002224_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:18:12', NULL, NULL, NULL, NULL, '1'),
	(28, 'ELEV_1599002332', 78, 4, 68, 87, '20A023', 'TSUALA', 'Florian', 'H', '2020-09-13 00:00:00', 'A', '20A023_1599002333_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:20:01', NULL, NULL, NULL, NULL, '1'),
	(29, 'ELEV_1599002784', 79, 4, 69, 88, '20A024', 'TSUALA', 'Florian', 'H', '2020-09-13 00:00:00', 'A', '20A024_1599002785_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:27:33', NULL, NULL, NULL, NULL, '1'),
	(30, 'ELEV_1599003120', 80, 4, 70, 89, '20A025', 'TSUALA', 'Florian', 'H', '2020-09-13 00:00:00', 'A', '20A025_1599003121_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:33:08', NULL, NULL, NULL, NULL, '1'),
	(31, 'ELEV_1599003196', 81, 4, 71, 90, '20A026', 'TSUALA', 'Florian', 'H', '2020-09-13 00:00:00', 'A', '20A026_1599003197_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:34:25', NULL, NULL, NULL, NULL, '1'),
	(32, 'ELEV_1599003345', 82, 4, 72, 91, '20A027', 'TSUALA', 'Florian', 'H', '2020-09-13 00:00:00', 'A', '20A027_1599003346_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:36:54', NULL, NULL, NULL, NULL, '1'),
	(33, 'ELEV_1599003490', 83, 4, 73, 92, '20A028', 'TSUALA', 'Florian', 'H', '2020-09-13 00:00:00', 'A', '20A028_1599003492_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:39:23', NULL, NULL, NULL, NULL, '1'),
	(34, 'ELEV_1599003688', 84, 2, 74, 93, '20A029', 'TSUALA', 'Florian', 'F', '2020-09-19 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-09-01 18:42:37', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `eleve` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. emprunt
DROP TABLE IF EXISTS `emprunt`;
CREATE TABLE IF NOT EXISTS `emprunt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eleve_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `date_emprunt` datetime DEFAULT NULL,
  `date_expiration` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_eleve_emprunt` (`eleve_id`),
  CONSTRAINT `fk_eleve_emprunt` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.emprunt : ~0 rows (environ)
/*!40000 ALTER TABLE `emprunt` DISABLE KEYS */;
/*!40000 ALTER TABLE `emprunt` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. etat_document
DROP TABLE IF EXISTS `etat_document`;
CREATE TABLE IF NOT EXISTS `etat_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.etat_document : ~0 rows (environ)
/*!40000 ALTER TABLE `etat_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `etat_document` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. exemplaire
DROP TABLE IF EXISTS `exemplaire`;
CREATE TABLE IF NOT EXISTS `exemplaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `etat_document_id` int(11) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `date_acquisition` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_document_exemplaire` (`document_id`),
  KEY `fk_etat_exemplaire` (`etat_document_id`),
  CONSTRAINT `fk_document_exemplaire` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`),
  CONSTRAINT `fk_etat_exemplaire` FOREIGN KEY (`etat_document_id`) REFERENCES `etat_document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.exemplaire : ~0 rows (environ)
/*!40000 ALTER TABLE `exemplaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `exemplaire` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. inscription_activite
DROP TABLE IF EXISTS `inscription_activite`;
CREATE TABLE IF NOT EXISTS `inscription_activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_activite_id` int(11) NOT NULL,
  `eleve_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `date_arret` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_enseigne_personnel_activite` (`personnel_activite_id`),
  KEY `fk_dirige_eleve` (`eleve_id`),
  CONSTRAINT `fk_dirige_eleve` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`),
  CONSTRAINT `fk_enseigne_personnel_activite` FOREIGN KEY (`personnel_activite_id`) REFERENCES `personnel_activite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.inscription_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `inscription_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscription_activite` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. jour_ouvrable
DROP TABLE IF EXISTS `jour_ouvrable`;
CREATE TABLE IF NOT EXISTS `jour_ouvrable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.jour_ouvrable : ~0 rows (environ)
/*!40000 ALTER TABLE `jour_ouvrable` DISABLE KEYS */;
/*!40000 ALTER TABLE `jour_ouvrable` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. matiere
DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discipline_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `couleur` varchar(254) DEFAULT NULL,
  `abreviation` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_discipline_matiere` (`discipline_id`),
  CONSTRAINT `fk_discipline_matiere` FOREIGN KEY (`discipline_id`) REFERENCES `discipline` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.matiere : ~0 rows (environ)
/*!40000 ALTER TABLE `matiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `matiere` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. parcours
DROP TABLE IF EXISTS `parcours`;
CREATE TABLE IF NOT EXISTS `parcours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classe_id` int(11) NOT NULL,
  `salle_classe_id` int(11) DEFAULT NULL,
  `eleve_id` int(11) NOT NULL,
  `statut_apprenant_id` int(11) NOT NULL,
  `annee_scolaire_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_inscription` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_est_inscrit` (`eleve_id`),
  KEY `fk_possede_classe` (`classe_id`),
  KEY `fk_possede_salle_classe` (`salle_classe_id`),
  KEY `fk_annee_academique_parcours` (`annee_scolaire_id`),
  KEY `fk_statut_apprenant_parcours` (`statut_apprenant_id`),
  CONSTRAINT `fk_annee_academique_parcours` FOREIGN KEY (`annee_scolaire_id`) REFERENCES `annee_scolaire` (`id`),
  CONSTRAINT `fk_est_inscrit` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`),
  CONSTRAINT `fk_possede_classe` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`),
  CONSTRAINT `fk_possede_salle_classe` FOREIGN KEY (`salle_classe_id`) REFERENCES `salle_classe` (`id`),
  CONSTRAINT `fk_statut_apprenant_parcours` FOREIGN KEY (`statut_apprenant_id`) REFERENCES `statut_apprenant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.parcours : ~11 rows (environ)
/*!40000 ALTER TABLE `parcours` DISABLE KEYS */;
INSERT IGNORE INTO `parcours` (`id`, `classe_id`, `salle_classe_id`, `eleve_id`, `statut_apprenant_id`, `annee_scolaire_id`, `code`, `libelle`, `description`, `date_inscription`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(4, 1, NULL, 24, 1, 2, 'PARC_1598613766', NULL, NULL, '2020-08-28 11:22:46', 0, '2020-08-28 12:22:46', NULL, NULL, NULL, NULL, '1'),
	(5, 1, NULL, 25, 1, 2, 'PARC_1598613850', NULL, NULL, '2020-08-28 11:24:10', 0, '2020-08-28 12:24:10', NULL, NULL, NULL, NULL, '1'),
	(6, 1, NULL, 26, 1, 2, 'PARC_1598624250', NULL, NULL, '2020-08-28 14:17:30', 0, '2020-08-28 15:17:30', NULL, NULL, NULL, NULL, '1'),
	(7, 2, NULL, 27, 1, 2, 'PARC_1599002226', NULL, NULL, '2020-09-01 23:17:07', 0, '2020-09-01 18:18:14', NULL, NULL, NULL, NULL, '1'),
	(8, 2, NULL, 28, 1, 2, 'PARC_1599002335', NULL, NULL, '2020-09-01 23:18:55', 0, '2020-09-01 18:20:02', NULL, NULL, NULL, NULL, '1'),
	(9, 2, NULL, 29, 1, 2, 'PARC_1599002786', NULL, NULL, '2020-09-01 23:26:27', 0, '2020-09-01 18:27:34', NULL, NULL, NULL, NULL, '1'),
	(10, 2, NULL, 30, 1, 2, 'PARC_1599003122', NULL, NULL, '2020-09-01 23:32:02', 0, '2020-09-01 18:33:10', NULL, NULL, NULL, NULL, '1'),
	(11, 2, NULL, 31, 1, 2, 'PARC_1599003198', NULL, NULL, '2020-09-01 23:33:19', 0, '2020-09-01 18:34:28', NULL, NULL, NULL, NULL, '1'),
	(12, 2, NULL, 32, 1, 2, 'PARC_1599003349', NULL, NULL, '2020-09-01 23:35:50', 0, '2020-09-01 18:36:57', NULL, NULL, NULL, NULL, '1'),
	(13, 2, NULL, 33, 1, 2, 'PARC_1599003498', NULL, NULL, '2020-09-01 23:38:19', 0, '2020-09-01 18:39:26', NULL, NULL, NULL, NULL, '1'),
	(14, 2, NULL, 34, 3, 2, 'PARC_1599003690', NULL, NULL, '2020-09-01 23:41:31', 0, '2020-09-01 18:42:38', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `parcours` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. pays
DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.pays : ~6 rows (environ)
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT IGNORE INTO `pays` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'CMR', 'Cameroun', 'Afrique en minuature', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(2, 'GA', 'Gabon', 'Terre du bois', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(3, 'CG', 'Congo', 'Pays de la sape', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(4, 'TG', 'Togo', NULL, 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(5, 'TD', 'Tchad', 'Pays du Sahel', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(6, 'PAYS_1598618896', 'France', 'le coq sportif', 0, '2020-08-28 13:48:16', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. pension_classe
DROP TABLE IF EXISTS `pension_classe`;
CREATE TABLE IF NOT EXISTS `pension_classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_pension_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `est_mensuel` enum('1','0') DEFAULT NULL,
  `mensualite` float DEFAULT NULL,
  `optionnel` tinyint(1) DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_classe_payer` (`classe_id`),
  KEY `fk_type_pension_payer` (`type_pension_id`),
  CONSTRAINT `fk_classe_payer` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`),
  CONSTRAINT `fk_type_pension_payer` FOREIGN KEY (`type_pension_id`) REFERENCES `type_pension` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.pension_classe : ~4 rows (environ)
/*!40000 ALTER TABLE `pension_classe` DISABLE KEYS */;
INSERT IGNORE INTO `pension_classe` (`id`, `type_pension_id`, `classe_id`, `code`, `libelle`, `montant`, `est_mensuel`, `mensualite`, `optionnel`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 1, 1, 'PENS_1598861726', NULL, 900000, '1', 100000, 0, 0, '2020-08-31 03:16:31', NULL, NULL, NULL, NULL, '1'),
	(2, 1, 2, 'PENS_1598862208', NULL, 900000, '1', 100000, 0, 0, '2020-08-31 03:24:33', NULL, NULL, NULL, NULL, '1'),
	(3, 2, 5, 'PENS_1599033143', NULL, 50000, '0', 0, 1, 0, '2020-09-02 02:53:31', NULL, NULL, NULL, NULL, '1'),
	(4, 4, 5, 'PENS_1599093524', NULL, 100000, '0', 0, 0, 0, '2020-09-02 19:39:49', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `pension_classe` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. pension_eleve
DROP TABLE IF EXISTS `pension_eleve`;
CREATE TABLE IF NOT EXISTS `pension_eleve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_pension_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `pension_classe_id` int(11) NOT NULL,
  `eleve_id` int(11) NOT NULL,
  `type_paiement_id` int(11) NOT NULL,
  `tranche_scolaire_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `motif` varchar(254) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `mois` int(11) DEFAULT NULL,
  `date_paie` datetime DEFAULT NULL,
  `reste` float DEFAULT NULL,
  `reduction` float DEFAULT NULL,
  `autres` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_type_pension_eleve` (`type_pension_id`),
  KEY `fk_classe_eleve` (`classe_id`),
  KEY `fk_pension_classe_eleve` (`pension_classe_id`),
  KEY `fk_pension_eleve` (`eleve_id`),
  KEY `fk_tranche_scolaire_pension_eleve` (`tranche_scolaire_id`),
  KEY `fk_type_paiement_pension_eleve` (`type_paiement_id`),
  CONSTRAINT `fk_classe_eleve` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`),
  CONSTRAINT `fk_pension_classe_eleve` FOREIGN KEY (`pension_classe_id`) REFERENCES `pension_classe` (`id`),
  CONSTRAINT `fk_pension_eleve` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`),
  CONSTRAINT `fk_tranche_scolaire_pension_eleve` FOREIGN KEY (`tranche_scolaire_id`) REFERENCES `tranche_scolaire` (`id`),
  CONSTRAINT `fk_type_paiement_pension_eleve` FOREIGN KEY (`type_paiement_id`) REFERENCES `type_paiement` (`id`),
  CONSTRAINT `fk_type_pension_eleve` FOREIGN KEY (`type_pension_id`) REFERENCES `type_pension` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.pension_eleve : ~0 rows (environ)
/*!40000 ALTER TABLE `pension_eleve` DISABLE KEYS */;
/*!40000 ALTER TABLE `pension_eleve` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. periode
DROP TABLE IF EXISTS `periode`;
CREATE TABLE IF NOT EXISTS `periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_sessionperiode` (`session_id`),
  CONSTRAINT `fk_session_periode` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.periode : ~0 rows (environ)
/*!40000 ALTER TABLE `periode` DISABLE KEYS */;
/*!40000 ALTER TABLE `periode` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. personnel
DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_personnel_id` int(11) NOT NULL,
  `pays_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `nom` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `sexe` enum('H','F') DEFAULT 'H',
  `photo` varchar(254) DEFAULT NULL,
  `telephone` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `adresse` varchar(254) DEFAULT NULL,
  `login` varchar(254) DEFAULT NULL,
  `password` varchar(254) DEFAULT NULL,
  `assurance` varchar(254) NOT NULL DEFAULT '',
  `date_prise_service` datetime DEFAULT NULL,
  `date_fin_carriere` datetime DEFAULT NULL,
  `bibliographie` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_type_personnel_personnel` (`type_personnel_id`),
  KEY `fk_pays_personnel` (`pays_id`),
  CONSTRAINT `fk_pays_personnel` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`),
  CONSTRAINT `fk_type_personnel_personnel` FOREIGN KEY (`type_personnel_id`) REFERENCES `type_personnel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.personnel : ~3 rows (environ)
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT IGNORE INTO `personnel` (`id`, `type_personnel_id`, `pays_id`, `code`, `nom`, `prenom`, `sexe`, `photo`, `telephone`, `email`, `adresse`, `login`, `password`, `assurance`, `date_prise_service`, `date_fin_carriere`, `bibliographie`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 1, 1, 'PERSO-01', 'KAKAMBI', 'Franck', 'H', 'no-photo.jpg', '+241 66 39 63 33', 'kakambi@gmail.com', 'Rue NTOUMAMANE 23', 'franck', '650a7fe5b3c1048c21706249a213cdc7', '', '2010-10-10 19:49:39', NULL, 'Homme pragmatique et travailleur', 0, '2020-04-24 19:49:39', NULL, NULL, NULL, NULL, '1'),
	(3, 3, 1, 'PERSO-03', 'KAMGA', 'Stephane', 'H', 'no-photo.jpg', '+241 66 39 63 33', 'kamga_stph@outlook.live', 'Rue NTOUMAMANE 23', 'kamga', '650a7fe5b3c1048c21706249a213cdc7', '', '2017-04-25 19:49:39', NULL, 'Homme pragmatique et travailleur', 0, '2020-04-24 19:49:39', NULL, NULL, NULL, NULL, '1'),
	(4, 1, 1, 'PERS_1598894111', 'TSUALA', 'Florian', 'F', 'no-photo.jpg', '0789456123', 'tsualaflorian@gmail.com', 'tsualaflorian@gmail.com', 'florian', '73262ad0334ab37227b2f7a0205f51db1e606681', '', '2020-08-06 00:00:00', '2020-08-30 00:00:00', 'ProDigit', 0, '2020-08-31 12:16:17', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. personnel_activite
DROP TABLE IF EXISTS `personnel_activite`;
CREATE TABLE IF NOT EXISTS `personnel_activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activite_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `pourcentage` float DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_enseigne_activite` (`activite_id`),
  KEY `fk_dirige_personnel` (`personnel_id`),
  CONSTRAINT `fk_dirige_personnel` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`),
  CONSTRAINT `fk_enseigne_activite` FOREIGN KEY (`activite_id`) REFERENCES `activite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.personnel_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `personnel_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnel_activite` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. planning_cours
DROP TABLE IF EXISTS `planning_cours`;
CREATE TABLE IF NOT EXISTS `planning_cours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classe_id` int(11) NOT NULL,
  `salle_classe_id` int(11) NOT NULL,
  `matiere_id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `tranche_horaire_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `journee` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_est_dispense` (`tranche_horaire_id`),
  KEY `fk_est_cours` (`cours_id`),
  KEY `fk_est_matiere` (`matiere_id`),
  KEY `fk_est_classe` (`classe_id`),
  KEY `fk_est_salle_classe` (`salle_classe_id`),
  CONSTRAINT `fk_est_classe` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`),
  CONSTRAINT `fk_est_cours` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`),
  CONSTRAINT `fk_est_dispense` FOREIGN KEY (`tranche_horaire_id`) REFERENCES `tranche_horaire` (`id`),
  CONSTRAINT `fk_est_matiere` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`id`),
  CONSTRAINT `fk_est_salle_classe` FOREIGN KEY (`salle_classe_id`) REFERENCES `salle_classe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.planning_cours : ~0 rows (environ)
/*!40000 ALTER TABLE `planning_cours` DISABLE KEYS */;
/*!40000 ALTER TABLE `planning_cours` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. planning_resto
DROP TABLE IF EXISTS `planning_resto`;
CREATE TABLE IF NOT EXISTS `planning_resto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abonnement_id` int(11) DEFAULT NULL,
  `code` varchar(254) DEFAULT NULL,
  `date_pontuellle` datetime DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_abonnement_resto_planning_resto` (`abonnement_id`),
  CONSTRAINT `fk_abonnement_resto_planning_resto` FOREIGN KEY (`abonnement_id`) REFERENCES `abonnement_resto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.planning_resto : ~0 rows (environ)
/*!40000 ALTER TABLE `planning_resto` DISABLE KEYS */;
/*!40000 ALTER TABLE `planning_resto` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. remboursement
DROP TABLE IF EXISTS `remboursement`;
CREATE TABLE IF NOT EXISTS `remboursement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `dette_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `motif` varchar(254) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `date_remboursement` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_contracter` (`personnel_id`),
  KEY `fk_est_effectuer` (`dette_id`),
  CONSTRAINT `fk_contracter` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`),
  CONSTRAINT `fk_est_effectuer` FOREIGN KEY (`dette_id`) REFERENCES `dette` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.remboursement : ~0 rows (environ)
/*!40000 ALTER TABLE `remboursement` DISABLE KEYS */;
/*!40000 ALTER TABLE `remboursement` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. repas
DROP TABLE IF EXISTS `repas`;
CREATE TABLE IF NOT EXISTS `repas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.repas : ~0 rows (environ)
/*!40000 ALTER TABLE `repas` DISABLE KEYS */;
/*!40000 ALTER TABLE `repas` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. reservation
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eleve_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `code` varchar(254) DEFAULT NULL,
  `date_reservation` datetime DEFAULT NULL,
  `commentaire` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_document_reservation` (`document_id`),
  KEY `fk_eleve_reservation` (`eleve_id`),
  CONSTRAINT `fk_document_reservation` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`),
  CONSTRAINT `fk_eleve_reservation` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.reservation : ~0 rows (environ)
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. restitution
DROP TABLE IF EXISTS `restitution`;
CREATE TABLE IF NOT EXISTS `restitution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emprunt_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `date_restitution` datetime DEFAULT NULL,
  `commentaire` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.restitution : ~0 rows (environ)
/*!40000 ALTER TABLE `restitution` DISABLE KEYS */;
/*!40000 ALTER TABLE `restitution` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. salaire
DROP TABLE IF EXISTS `salaire`;
CREATE TABLE IF NOT EXISTS `salaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `date_paie` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_personnel_salaire` (`personnel_id`),
  CONSTRAINT `fk_personnel_salaire` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.salaire : ~0 rows (environ)
/*!40000 ALTER TABLE `salaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `salaire` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. salle_classe
DROP TABLE IF EXISTS `salle_classe`;
CREATE TABLE IF NOT EXISTS `salle_classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classe_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_classe_salle_classe` (`classe_id`),
  CONSTRAINT `fk_classe_salle_classe` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.salle_classe : ~2 rows (environ)
/*!40000 ALTER TABLE `salle_classe` DISABLE KEYS */;
INSERT IGNORE INTO `salle_classe` (`id`, `classe_id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 5, 'SALL_1598856987', 'Cours-Preparatoire 1', '', 0, '2020-08-31 01:57:32', NULL, NULL, NULL, NULL, '1'),
	(2, 5, 'SALL_1598857003', 'Cours-Preparatoire 2', '', 0, '2020-08-31 01:57:48', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `salle_classe` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. session
DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee_scolaire_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_annee_scolaire_session` (`annee_scolaire_id`),
  CONSTRAINT `fk_annee_scolaire_session` FOREIGN KEY (`annee_scolaire_id`) REFERENCES `annee_scolaire` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.session : ~0 rows (environ)
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. statut_apprenant
DROP TABLE IF EXISTS `statut_apprenant`;
CREATE TABLE IF NOT EXISTS `statut_apprenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.statut_apprenant : ~3 rows (environ)
/*!40000 ALTER TABLE `statut_apprenant` DISABLE KEYS */;
INSERT IGNORE INTO `statut_apprenant` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'STAPP-01', 'Nouveau', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'STAPP-02', 'Redoublant', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 'STAPP-03', 'Ancien', '', 0, '2020-08-10 17:07:35', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `statut_apprenant` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. tranche_horaire
DROP TABLE IF EXISTS `tranche_horaire`;
CREATE TABLE IF NOT EXISTS `tranche_horaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `temps_debut` datetime DEFAULT NULL,
  `temps_fin` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.tranche_horaire : ~0 rows (environ)
/*!40000 ALTER TABLE `tranche_horaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `tranche_horaire` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. tranche_scolaire
DROP TABLE IF EXISTS `tranche_scolaire`;
CREATE TABLE IF NOT EXISTS `tranche_scolaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee_scolaire_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_annee_scolaire_tranche_scolaire` (`annee_scolaire_id`),
  CONSTRAINT `fk_annee_scolaire_tranche_scolaire` FOREIGN KEY (`annee_scolaire_id`) REFERENCES `annee_scolaire` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.tranche_scolaire : ~7 rows (environ)
/*!40000 ALTER TABLE `tranche_scolaire` DISABLE KEYS */;
INSERT IGNORE INTO `tranche_scolaire` (`id`, `annee_scolaire_id`, `code`, `libelle`, `description`, `date_debut`, `date_fin`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 2, 'TRAN_1598852718', 'Janvier', NULL, NULL, NULL, 0, '2020-08-31 00:46:23', NULL, NULL, NULL, NULL, '1'),
	(2, 2, 'TRAN_1598854167', 'FÃ©vrier', NULL, NULL, NULL, 0, '2020-08-31 01:10:32', NULL, NULL, NULL, NULL, '1'),
	(3, 2, 'TRAN_1598854187', 'Mars', NULL, NULL, NULL, 0, '2020-08-31 01:10:52', NULL, NULL, NULL, NULL, '1'),
	(4, 2, 'TRAN_1598854806', 'Avril', NULL, NULL, NULL, 0, '2020-08-31 01:21:11', NULL, NULL, NULL, NULL, '1'),
	(5, 2, 'TRAN_1598854815', 'Mai', NULL, NULL, NULL, 0, '2020-08-31 01:21:19', NULL, NULL, NULL, NULL, '1'),
	(6, 2, 'TRAN_1598854822', 'Juin', NULL, NULL, NULL, 0, '2020-08-31 01:21:27', NULL, NULL, NULL, NULL, '1'),
	(7, 2, 'TRAN_1598854833', 'Juillet', NULL, NULL, NULL, 0, '2020-08-31 01:21:37', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `tranche_scolaire` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. type_activite
DROP TABLE IF EXISTS `type_activite`;
CREATE TABLE IF NOT EXISTS `type_activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.type_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `type_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_activite` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. type_paiement
DROP TABLE IF EXISTS `type_paiement`;
CREATE TABLE IF NOT EXISTS `type_paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.type_paiement : ~3 rows (environ)
/*!40000 ALTER TABLE `type_paiement` DISABLE KEYS */;
INSERT IGNORE INTO `type_paiement` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'TYPE_1598618757', 'EspÃ¨ce', 'monnaie', 0, '2020-08-28 13:45:57', NULL, NULL, NULL, NULL, '1'),
	(2, 'TYPE_1598618805', 'chÃ¨que', 'numÃ©ro de chÃ¨que', 0, '2020-08-28 13:46:45', NULL, NULL, NULL, NULL, '1'),
	(3, 'TYPE_1598618856', 'Mobile-money', 'airtel ou mobicash', 0, '2020-08-28 13:47:36', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `type_paiement` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. type_pension
DROP TABLE IF EXISTS `type_pension`;
CREATE TABLE IF NOT EXISTS `type_pension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.type_pension : ~4 rows (environ)
/*!40000 ALTER TABLE `type_pension` DISABLE KEYS */;
INSERT IGNORE INTO `type_pension` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'TYPE_1598620518', 'ScolaritÃ©', 'obligatoire', 0, '2020-08-28 14:15:18', NULL, NULL, NULL, NULL, '1'),
	(2, 'TYPE_1598620548', 'Tenue Scolaire', 'obligatoire', 0, '2020-08-28 14:15:48', NULL, NULL, NULL, NULL, '1'),
	(3, 'TYPE_1598620563', 'Polo', 'facultatif', 0, '2020-08-28 14:16:03', NULL, NULL, NULL, NULL, '1'),
	(4, 'TYPE_1599051076', 'Inscription', 'Obligatoire', 0, '2020-09-02 07:52:25', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `type_pension` ENABLE KEYS */;

-- Listage de la structure de la table nkap-scour. type_personnel
DROP TABLE IF EXISTS `type_personnel`;
CREATE TABLE IF NOT EXISTS `type_personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creer_par` int(11) DEFAULT 0 COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table nkap-scour.type_personnel : ~4 rows (environ)
/*!40000 ALTER TABLE `type_personnel` DISABLE KEYS */;
INSERT IGNORE INTO `type_personnel` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'TYPER-01', 'Administrateur', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'TYPER-02', 'Sécrétaire', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 'TYPER-03', 'Opérateur de saisie', '', 0, '2020-08-10 17:07:35', NULL, NULL, NULL, NULL, '1'),
	(4, 'TYPER-04', 'Directeur', 'C\'est un nom de rôle', 0, '2020-08-10 10:22:38', NULL, NULL, NULL, NULL, '0');
/*!40000 ALTER TABLE `type_personnel` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
