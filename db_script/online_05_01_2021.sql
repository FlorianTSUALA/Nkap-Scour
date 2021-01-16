-- --------------------------------------------------------
-- Hôte :                        remotemysql.com
-- Version du serveur:           8.0.13-4 - Percona Server (GPL), Release '4', Revision 'f0a32b8'
-- SE du serveur:                debian-linux-gnu
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour Fqy2hYVwUB
DROP DATABASE IF EXISTS `Fqy2hYVwUB`;
CREATE DATABASE IF NOT EXISTS `Fqy2hYVwUB` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `Fqy2hYVwUB`;

-- Listage de la structure de la table Fqy2hYVwUB. abonnement_activite
DROP TABLE IF EXISTS `abonnement_activite`;
CREATE TABLE IF NOT EXISTS `abonnement_activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inscription_activite_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `date_paiement` date DEFAULT NULL,
  `mois` int(11) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_inscription_activite` (`inscription_activite_id`),
  CONSTRAINT `fk_inscription_activite` FOREIGN KEY (`inscription_activite_id`) REFERENCES `inscription_activite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.abonnement_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement_activite` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. abonnement_cantine
DROP TABLE IF EXISTS `abonnement_cantine`;
CREATE TABLE IF NOT EXISTS `abonnement_cantine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `libelle` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `montant_unitaire` float DEFAULT NULL,
  `reduction` float DEFAULT NULL,
  `montant_total` float DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `description` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periode` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `multiplicateur` int(11) DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table Fqy2hYVwUB.abonnement_cantine : ~3 rows (environ)
/*!40000 ALTER TABLE `abonnement_cantine` DISABLE KEYS */;
INSERT INTO `abonnement_cantine` (`id`, `code`, `libelle`, `montant_unitaire`, `reduction`, `montant_total`, `date_debut`, `date_fin`, `description`, `periode`, `multiplicateur`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'JOUR', 'Journalier', 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-09-24 00:47:54', NULL, NULL, NULL, NULL, '1'),
	(2, 'MOIS', 'Mensuel', 5000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-09-24 01:12:54', NULL, NULL, NULL, NULL, '1'),
	(3, 'SEMAINE', 'Hebdomadaire', 89310, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-09-24 01:13:04', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `abonnement_cantine` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. abonnement_consomme
DROP TABLE IF EXISTS `abonnement_consomme`;
CREATE TABLE IF NOT EXISTS `abonnement_consomme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repas_id` int(11) NOT NULL,
  `jour_ouvrable_id` int(11) NOT NULL,
  `abonnement_resto_id` int(11) DEFAULT NULL,
  `code` varchar(254) DEFAULT NULL,
  `date_effective` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.abonnement_consomme : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_consomme` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement_consomme` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. abonnement_resto
DROP TABLE IF EXISTS `abonnement_resto`;
CREATE TABLE IF NOT EXISTS `abonnement_resto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eleve_id` int(11) NOT NULL,
  `abonnement_cantine_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `montant` double DEFAULT NULL,
  `entendu` varchar(254) DEFAULT NULL,
  `multiplicateur` int(11) DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_eleveabonnement_resto` (`eleve_id`),
  KEY `_abonnementcantine_abonnement_resto` (`abonnement_cantine_id`),
  CONSTRAINT `fk_abonnementcantine_abonnement_resto` FOREIGN KEY (`abonnement_cantine_id`) REFERENCES `abonnement_cantine` (`id`),
  CONSTRAINT `fk_eleveabonnement_resto` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.abonnement_resto : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_resto` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement_resto` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. activite
DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_activite_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `montant` double DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_type_activite` (`type_activite_id`),
  CONSTRAINT `fk_type_activite` FOREIGN KEY (`type_activite_id`) REFERENCES `type_activite` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.activite : ~3 rows (environ)
/*!40000 ALTER TABLE `activite` DISABLE KEYS */;
INSERT INTO `activite` (`id`, `type_activite_id`, `code`, `libelle`, `montant`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 1, 'ACTI_1599816321', 'Judo', 500, '', 0, '2020-09-11 09:25:22', NULL, NULL, NULL, NULL, '1'),
	(2, 1, 'ACTI_1599816340', 'Karaté', 6000, '', 0, '2020-09-11 09:25:40', NULL, NULL, NULL, NULL, '1'),
	(3, 3, 'ACTI_1599816363', 'Corale', 98633, '', 0, '2020-09-11 09:26:04', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `activite` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. annee_scolaire
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
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.annee_scolaire : ~2 rows (environ)
/*!40000 ALTER TABLE `annee_scolaire` DISABLE KEYS */;
INSERT INTO `annee_scolaire` (`id`, `code`, `slogan`, `libelle`, `mission`, `debut_annee`, `fin_annee`, `statut`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'ANSCO-01', 'Annee des lumieres', '2019-2020', 'Produire les meilleurs eleves du monde', '2019-09-15 00:00:00', '2020-05-15 00:00:00', '0', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'CORE_1598613732', '', '2020-2021', '', '2020-08-28 00:00:00', '2021-08-28 00:00:00', '1', 0, '2020-08-28 12:22:12', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `annee_scolaire` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. antecedent_scolaire
DROP TABLE IF EXISTS `antecedent_scolaire`;
CREATE TABLE IF NOT EXISTS `antecedent_scolaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ecole` varchar(254) DEFAULT NULL,
  `classe` varchar(254) DEFAULT NULL,
  `telephone` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  `code` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.antecedent_scolaire : ~7 rows (environ)
/*!40000 ALTER TABLE `antecedent_scolaire` DISABLE KEYS */;
INSERT INTO `antecedent_scolaire` (`id`, `ecole`, `classe`, `telephone`, `email`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`, `code`) VALUES
	(125, '', '', '', '', 0, '2020-09-24 23:19:14', NULL, NULL, NULL, NULL, '1', 'ANTE_1600989553'),
	(126, '', '', '', '', 0, '2020-09-24 23:20:02', NULL, NULL, NULL, NULL, '1', 'ANTE_1600989601'),
	(127, 'les comelies', 'cm1', '11111111', '', 0, '2020-09-25 04:07:23', NULL, NULL, NULL, NULL, '1', 'ANTE_1601006842'),
	(128, 'les comelies', 'cm1', '11111111', '', 0, '2020-10-13 20:51:08', NULL, NULL, NULL, NULL, '1', 'ANTE_1602622266'),
	(129, '', '', '', '', 0, '2020-10-14 09:27:24', NULL, NULL, NULL, NULL, '1', 'ANTE_1602667643'),
	(130, 'les comelies', 'cm1', '', '', 0, '2020-10-15 13:28:16', NULL, NULL, NULL, NULL, '1', 'ANTE_1602768495'),
	(131, 'les comelies', 'cm1', '', '', 0, '2020-10-15 13:28:22', NULL, NULL, NULL, NULL, '1', 'ANTE_1602768501'),
	(132, '', '', '', '', 0, '2020-10-26 05:06:15', NULL, NULL, NULL, NULL, '1', 'ANTE_1603689111');
/*!40000 ALTER TABLE `antecedent_scolaire` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. classe
DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `scolarite_min` float DEFAULT NULL,
  `scolarite_max` float DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_cycle_classe` (`cycle_id`),
  CONSTRAINT `fk_cycle_classe` FOREIGN KEY (`cycle_id`) REFERENCES `cycle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.classe : ~11 rows (environ)
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
INSERT INTO `classe` (`id`, `cycle_id`, `code`, `libelle`, `description`, `scolarite_min`, `scolarite_max`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 2, 'SECTION_1', 'Petite-section', '', 200456, 435000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 2, 'SECTION_2', 'Moyenne-section', '', 300400, 470000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 1, 'SECTION_3', 'Grande-section', '', 200456, 435000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(4, 2, 'SIL', 'SIL', '', 600456, 735000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(5, 2, 'CP', 'Cours-Préparatoire 1', '', 500456, 735000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(6, 2, 'CE1', 'Cours-Elémentaire 1', '', 500456, 735000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(9, 2, 'CM2', 'Cours-Moyen 1', '', 500456, 735000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(13, 2, 'CLAS_1600904413', 'Cours-Préparatoire 2', NULL, NULL, NULL, 0, '2020-09-23 23:40:14', NULL, NULL, NULL, NULL, '1'),
	(14, 1, 'CLAS_1600904483', 'Cours-Elementaire 2', NULL, NULL, NULL, 0, '2020-09-23 23:41:23', NULL, NULL, NULL, NULL, '1'),
	(15, 1, 'CLAS_1600904517', 'Cours-Moyen 2', NULL, NULL, NULL, 0, '2020-09-23 23:41:58', NULL, NULL, NULL, NULL, '1'),
	(16, 1, 'CLAS_1600904547', 'Crèche', NULL, NULL, NULL, 0, '2020-09-23 23:42:28', NULL, NULL, NULL, NULL, '1'),
	(17, 1, 'CLAS_1600904564', 'Garderie', NULL, NULL, NULL, 0, '2020-09-23 23:42:45', NULL, NULL, NULL, NULL, '1'),
	(18, 1, 'CLAS_1603164771', 'Toute petite section', NULL, NULL, NULL, 0, '2020-10-20 03:32:51', NULL, NULL, NULL, NULL, '1'),
	(19, 1, 'CLAS_1603164787', 'Petite section', NULL, NULL, NULL, 0, '2020-10-20 03:33:08', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. composer
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
  `description` text,
  `note` float DEFAULT NULL,
  `mention` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.composer : ~0 rows (environ)
/*!40000 ALTER TABLE `composer` DISABLE KEYS */;
/*!40000 ALTER TABLE `composer` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. cours
DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classe_id` int(11) NOT NULL,
  `salle_classe_id` int(11) NOT NULL,
  `matiere_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `volume_horaire` int(11) DEFAULT NULL,
  `coefficient` int(11) DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.cours : ~0 rows (environ)
/*!40000 ALTER TABLE `cours` DISABLE KEYS */;
/*!40000 ALTER TABLE `cours` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. cycle
DROP TABLE IF EXISTS `cycle`;
CREATE TABLE IF NOT EXISTS `cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.cycle : ~3 rows (environ)
/*!40000 ALTER TABLE `cycle` DISABLE KEYS */;
INSERT INTO `cycle` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'CYCL-01', 'Maternel', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'CYCL-02', 'Primaire', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 'CYCL-03', 'Secondaire', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `cycle` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. depense
DROP TABLE IF EXISTS `depense`;
CREATE TABLE IF NOT EXISTS `depense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `motif` varchar(254) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `piece_jointes` text,
  `quantite` int(11) DEFAULT NULL,
  `date_achat` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_personnelAchat` (`personnel_id`),
  CONSTRAINT `fk_personnel_achat` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.depense : ~0 rows (environ)
/*!40000 ALTER TABLE `depense` DISABLE KEYS */;
/*!40000 ALTER TABLE `depense` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. dette
DROP TABLE IF EXISTS `dette`;
CREATE TABLE IF NOT EXISTS `dette` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `motif` varchar(254) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `date_emprunt` datetime DEFAULT NULL,
  `montant_interet` float DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.dette : ~0 rows (environ)
/*!40000 ALTER TABLE `dette` DISABLE KEYS */;
/*!40000 ALTER TABLE `dette` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. discipline
DROP TABLE IF EXISTS `discipline`;
CREATE TABLE IF NOT EXISTS `discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.discipline : ~2 rows (environ)
/*!40000 ALTER TABLE `discipline` DISABLE KEYS */;
INSERT INTO `discipline` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'DISC_1603533789', 'FRANÇAIS', '', 0, '2020-10-24 10:03:10', NULL, NULL, NULL, NULL, '1'),
	(2, 'DISC_1603533816', 'MATHÉMATIQUES', '', 0, '2020-10-24 10:03:36', NULL, NULL, NULL, NULL, '1'),
	(3, 'DISC_1603533831', 'EVEIL', '', 0, '2020-10-24 10:03:52', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `discipline` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. document
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
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_domaine_document` (`domaine_id`),
  CONSTRAINT `fk_domaine_document` FOREIGN KEY (`domaine_id`) REFERENCES `domaine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.document : ~0 rows (environ)
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. domaine
DROP TABLE IF EXISTS `domaine`;
CREATE TABLE IF NOT EXISTS `domaine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.domaine : ~0 rows (environ)
/*!40000 ALTER TABLE `domaine` DISABLE KEYS */;
/*!40000 ALTER TABLE `domaine` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. dossier_medical
DROP TABLE IF EXISTS `dossier_medical`;
CREATE TABLE IF NOT EXISTS `dossier_medical` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `allergie` text,
  `groupe_sanguin` varchar(254) DEFAULT NULL,
  `probleme_particulier` text,
  `maladie_recurrente` text,
  `nom_medecin` varchar(254) DEFAULT NULL,
  `telephone_medecin` varchar(254) DEFAULT NULL,
  `email_medecin` varchar(254) DEFAULT NULL,
  `autres` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.dossier_medical : ~7 rows (environ)
/*!40000 ALTER TABLE `dossier_medical` DISABLE KEYS */;
INSERT INTO `dossier_medical` (`id`, `code`, `allergie`, `groupe_sanguin`, `probleme_particulier`, `maladie_recurrente`, `nom_medecin`, `telephone_medecin`, `email_medecin`, `autres`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(116, 'DOSS_1600989554', '', '', '', '', '', '', '', '', 0, '2020-09-24 23:19:14', NULL, NULL, NULL, NULL, '1'),
	(117, 'DOSS_1600989602', '', '', '', '', '', '', '', '', 0, '2020-09-24 23:20:02', NULL, NULL, NULL, NULL, '1'),
	(118, 'DOSS_1601006842', 'ra', 'A', 'rc', 'rb', 'diddy', 'ffffff', 'dd@gmail.com', 'rd', 0, '2020-09-25 04:07:24', NULL, NULL, NULL, NULL, '1'),
	(119, 'DOSS_1602622267', 'a', 'A', 'c', 'b', 'diddy', 'ffffff', 'dd@gmail.com', 'd', 0, '2020-10-13 20:51:08', NULL, NULL, NULL, NULL, '1'),
	(120, 'DOSS_1602667644', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-10-14 09:27:24', NULL, NULL, NULL, NULL, '1'),
	(121, 'DOSS_1602768495', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-10-15 13:28:16', NULL, NULL, NULL, NULL, '1'),
	(122, 'DOSS_1602768502', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-10-15 13:28:23', NULL, NULL, NULL, NULL, '1'),
	(123, 'DOSS_1603689112', '', 'Inconnu', '', '', '', '', '', '', 0, '2020-10-26 05:06:16', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `dossier_medical` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. dossier_parental
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
  `bureau_pere` varchar(254) DEFAULT NULL,
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
  `bureau_mere` varchar(254) DEFAULT NULL,
  `est_tutrice` tinyint(1) DEFAULT NULL,
  `email_mere` varchar(254) DEFAULT NULL,
  `signature_mere` varchar(254) DEFAULT NULL,
  `nom_personne_urgence` varchar(254) DEFAULT NULL,
  `prenom_personne_urgence` varchar(254) DEFAULT NULL,
  `telephone_personne_urgence` varchar(254) DEFAULT NULL,
  `lien` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.dossier_parental : ~7 rows (environ)
/*!40000 ALTER TABLE `dossier_parental` DISABLE KEYS */;
INSERT INTO `dossier_parental` (`id`, `code`, `pays_mere_id`, `pays_pere_id`, `nom_pere`, `prenom_pere`, `profession_pere`, `employeur_pere`, `lieu_travail_pere`, `quartier_pere`, `telephone_pere`, `ville_pere`, `bureau_pere`, `est_tuteur`, `email_pere`, `signature_pere`, `nom_mere`, `prenom_mere`, `profession_mere`, `employeur_mere`, `lieu_travail_mere`, `quartier_mere`, `telephone_mere`, `ville_mere`, `bureau_mere`, `est_tutrice`, `email_mere`, `signature_mere`, `nom_personne_urgence`, `prenom_personne_urgence`, `telephone_personne_urgence`, `lien`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(106, 'DOSS_1600989554', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-09-24 23:19:15', NULL, NULL, NULL, NULL, '1'),
	(107, 'DOSS_1600989602', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-09-24 23:20:03', NULL, NULL, NULL, NULL, '1'),
	(108, 'DOSS_1601006843', 1, 1, 'adolphe', 'Yvan', 'enseignant', 'government', '13431', NULL, '07741716', 'ecole', NULL, NULL, 'papa@gmail.com', NULL, 'celine1', 'celine2', 'ménagère', 'famille', '13431', NULL, '99999', 'maison', NULL, NULL, 'mmm@gmail.com', NULL, 'franki', 'fran', '88888', NULL, 0, '2020-09-25 04:07:25', NULL, NULL, NULL, NULL, '1'),
	(109, 'DOSS_1602622268', 1, 1, 'adolphe', 'adolphe', 'enseignant', 'government', '2020', NULL, '07741716', 'ecole', NULL, NULL, 'papa@gmail.com', NULL, 'celine1', 'celine2', 'ménagère', 'famille', '13431', NULL, '99999', 'maison', NULL, NULL, 'mmm@gmail.com', NULL, 'franki', 'fran', '88888', NULL, 0, '2020-10-13 20:51:09', NULL, NULL, NULL, NULL, '1'),
	(110, 'DOSS_1602667644', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-10-14 09:27:25', NULL, NULL, NULL, NULL, '1'),
	(111, 'DOSS_1602768496', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-10-15 13:28:17', NULL, NULL, NULL, NULL, '1'),
	(112, 'DOSS_1602768502', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-10-15 13:28:23', NULL, NULL, NULL, NULL, '1'),
	(113, 'DOSS_1603689112', NULL, NULL, '', '', '', '', '', NULL, '', NULL, 'A', NULL, '', NULL, '', '', '', '', '', NULL, '', NULL, 'A', NULL, '', NULL, '', '', '', 'A', 0, '2020-10-26 05:06:16', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `dossier_parental` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. eleve
DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) NOT NULL DEFAULT '',
  `dossier_medical_id` int(11) NOT NULL,
  `pays_id` int(11) DEFAULT NULL,
  `groupe_familial_id` int(11) DEFAULT NULL,
  `dossier_parental_id` int(11) NOT NULL,
  `antecedent_scolaire_id` int(11) NOT NULL,
  `matricule` varchar(254) DEFAULT NULL,
  `nom` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `prenom_usage` varchar(50) DEFAULT NULL,
  `sexe` enum('F','M') DEFAULT 'M',
  `date_naissance` datetime DEFAULT NULL,
  `lieu_naissance` varchar(254) DEFAULT NULL,
  `photo` varchar(254) DEFAULT NULL,
  `anciennete` int(11) DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  KEY `fk_groupe_familial_eleve` (`groupe_familial_id`),
  CONSTRAINT `fk_eleve_antecedent_scolaire` FOREIGN KEY (`antecedent_scolaire_id`) REFERENCES `antecedent_scolaire` (`id`),
  CONSTRAINT `fk_eleve_dossier_medical` FOREIGN KEY (`dossier_medical_id`) REFERENCES `dossier_medical` (`id`),
  CONSTRAINT `fk_eleve_dossier_parental` FOREIGN KEY (`dossier_parental_id`) REFERENCES `dossier_parental` (`id`),
  CONSTRAINT `fk_pays_eleve` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.eleve : ~5 rows (environ)
/*!40000 ALTER TABLE `eleve` DISABLE KEYS */;
INSERT INTO `eleve` (`id`, `code`, `dossier_medical_id`, `pays_id`, `groupe_familial_id`, `dossier_parental_id`, `antecedent_scolaire_id`, `matricule`, `nom`, `prenom`, `prenom_usage`, `sexe`, `date_naissance`, `lieu_naissance`, `photo`, `anciennete`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(52, 'ELEV_1601006844', 118, 1, NULL, 108, 127, '20A001', 'kakambi', 'franck', NULL, 'M', '2020-09-06 00:00:00', 'bandja', 'no-photo.jpg', 0, 0, '2020-09-25 04:07:26', NULL, NULL, NULL, NULL, '1'),
	(53, 'ELEV_1602622268', 119, 1, NULL, 109, 128, '20A002', 'kakambi', 'cabrel', NULL, 'M', '2020-09-28 00:00:00', 'bafoussam', 'no-photo.jpg', 0, 0, '2020-10-13 20:51:11', NULL, NULL, NULL, NULL, '1'),
	(54, 'ELEV_1602667644', 120, 3, NULL, 110, 129, '20A003', 'schembri', 'Eliora Nehira', NULL, 'F', '2020-10-08 00:00:00', 'libreville', 'no-photo.jpg', 0, 0, '2020-10-14 09:27:26', NULL, NULL, NULL, NULL, '1'),
	(55, 'ELEV_1602768496', 121, 1, NULL, 111, 130, '20A004', 'kakambi', 'Eliora Nehira', NULL, 'F', '2020-10-02 00:00:00', 'bandja', 'no-photo.jpg', 0, 0, '2020-10-15 13:28:18', NULL, NULL, NULL, NULL, '1'),
	(56, 'ELEV_1602768503', 122, 1, NULL, 112, 131, '20A005', 'kakambi', 'Eliora Nehira', NULL, 'F', '2020-10-02 00:00:00', 'bandja', 'no-photo.jpg', 0, 0, '2020-10-15 13:28:25', NULL, NULL, NULL, NULL, '1'),
	(57, 'ELEV_1603689113', 123, 1, NULL, 113, 132, '20A006', 'A', 'A', '', 'M', '2020-10-09 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-10-26 05:06:18', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `eleve` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. emprunt
DROP TABLE IF EXISTS `emprunt`;
CREATE TABLE IF NOT EXISTS `emprunt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eleve_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `date_emprunt` datetime DEFAULT NULL,
  `date_expiration` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_eleve_emprunt` (`eleve_id`),
  CONSTRAINT `fk_eleve_emprunt` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.emprunt : ~0 rows (environ)
/*!40000 ALTER TABLE `emprunt` DISABLE KEYS */;
/*!40000 ALTER TABLE `emprunt` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. etat_document
DROP TABLE IF EXISTS `etat_document`;
CREATE TABLE IF NOT EXISTS `etat_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.etat_document : ~0 rows (environ)
/*!40000 ALTER TABLE `etat_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `etat_document` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. exemplaire
DROP TABLE IF EXISTS `exemplaire`;
CREATE TABLE IF NOT EXISTS `exemplaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `etat_document_id` int(11) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `date_acquisition` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.exemplaire : ~0 rows (environ)
/*!40000 ALTER TABLE `exemplaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `exemplaire` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. groupe_familial
DROP TABLE IF EXISTS `groupe_familial`;
CREATE TABLE IF NOT EXISTS `groupe_familial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `reference` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.groupe_familial : ~0 rows (environ)
/*!40000 ALTER TABLE `groupe_familial` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupe_familial` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. inscription_activite
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
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.inscription_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `inscription_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscription_activite` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. jour_ouvrable
DROP TABLE IF EXISTS `jour_ouvrable`;
CREATE TABLE IF NOT EXISTS `jour_ouvrable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.jour_ouvrable : ~0 rows (environ)
/*!40000 ALTER TABLE `jour_ouvrable` DISABLE KEYS */;
/*!40000 ALTER TABLE `jour_ouvrable` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. matiere
DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discipline_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `couleur` varchar(254) DEFAULT NULL,
  `abreviation` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_discipline_matiere` (`discipline_id`),
  CONSTRAINT `fk_discipline_matiere` FOREIGN KEY (`discipline_id`) REFERENCES `discipline` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.matiere : ~29 rows (environ)
/*!40000 ALTER TABLE `matiere` DISABLE KEYS */;
INSERT INTO `matiere` (`id`, `discipline_id`, `code`, `libelle`, `couleur`, `abreviation`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 1, 'MATI_1603534310', 'LECTURE (Déchiffrage)', '', '', '', 0, '2020-10-24 10:11:51', NULL, NULL, NULL, NULL, '1'),
	(2, 1, 'MATI_1603534355', 'EXERCICES DE LECTURE', '', '', '', 0, '2020-10-24 10:12:36', NULL, NULL, NULL, NULL, '1'),
	(3, 1, 'MATI_1603534381', 'COPIE', '', '', '', 0, '2020-10-24 10:13:02', NULL, NULL, NULL, NULL, '1'),
	(4, 1, 'MATI_1603534402', 'ORTHOGRAPHE', '', '', '', 0, '2020-10-24 10:13:23', NULL, NULL, NULL, NULL, '1'),
	(5, 1, 'MATI_1603534420', 'EXPRESSION ORALE', '', '', '', 0, '2020-10-24 10:13:40', NULL, NULL, NULL, NULL, '1'),
	(6, 1, 'MATI_1603534444', 'POÉSIE', '', '', '', 0, '2020-10-24 10:14:04', NULL, NULL, NULL, NULL, '1'),
	(7, 2, 'MATI_1603534475', 'NUMÉROTATION', '', '', '', 0, '2020-10-24 10:14:35', NULL, NULL, NULL, NULL, '1'),
	(8, 1, 'MATI_1603534520', 'OPÉRATION / CALCUL MENTAL', '', '', '', 0, '2020-10-24 10:15:21', NULL, NULL, NULL, NULL, '1'),
	(9, 1, 'MATI_1603534550', 'GÉOMÉTRIE/MESURES', '', '', '', 0, '2020-10-24 10:15:50', NULL, NULL, NULL, NULL, '1'),
	(10, 1, 'MATI_1603534571', 'ETUDE DE SITUATION', '', '', '', 0, '2020-10-24 10:16:11', NULL, NULL, NULL, NULL, '1'),
	(11, 1, 'MATI_1603534657', 'STRUCTURATION ESPACE / TEMPS EDUCATION CIVIQUE SCIENCES', '', '', '', 0, '2020-10-24 10:17:37', NULL, NULL, NULL, NULL, '1'),
	(12, 3, 'MATI_1603534700', 'EDUCATION ARTISTIQUE', '', '', '', 0, '2020-10-24 10:18:20', NULL, NULL, NULL, NULL, '1'),
	(13, 1, 'MATI_1603534793', 'EDUCATION PHYSIQUE', '', '', '', 0, '2020-10-24 10:19:54', NULL, NULL, NULL, NULL, '1'),
	(14, 1, 'MATI_1603534819', 'COMPORTEMENT', '', '', '', 0, '2020-10-24 10:20:19', NULL, NULL, NULL, NULL, '1'),
	(15, 1, 'MATI_1603535410', 'LECTURE EXPRESSIVE', '', '', '', 0, '2020-10-24 10:30:11', NULL, NULL, NULL, NULL, '1'),
	(16, 1, 'MATI_1603535458', 'LECTURE (compréhension)', '', '', '', 0, '2020-10-24 10:30:59', NULL, NULL, NULL, NULL, '1'),
	(17, 1, 'MATI_1603535502', 'ORTHOGRAPHE', '', '', '', 0, '2020-10-24 10:31:43', NULL, NULL, NULL, NULL, '1'),
	(18, 1, 'MATI_1603535515', 'GRAMMAIRE', '', '', '', 0, '2020-10-24 10:31:55', NULL, NULL, NULL, NULL, '1'),
	(19, 1, 'MATI_1603535535', 'CONJUGAISON', '', '', '', 0, '2020-10-24 10:32:15', NULL, NULL, NULL, NULL, '1'),
	(20, 1, 'MATI_1603535553', 'VOCABULAIRE', '', '', '', 0, '2020-10-24 10:32:33', NULL, NULL, NULL, NULL, '1'),
	(21, 1, 'MATI_1603535587', 'EXPRESSION-ÉCRITE', '', '', '', 0, '2020-10-24 10:33:08', NULL, NULL, NULL, NULL, '1'),
	(22, 1, 'MATI_1603535613', 'ECRITURE / SOIN', '', '', '', 0, '2020-10-24 10:33:34', NULL, NULL, NULL, NULL, '1'),
	(23, 1, 'MATI_1603535629', 'POÉSIE', '', '', '', 0, '2020-10-24 10:33:50', NULL, NULL, NULL, NULL, '1'),
	(24, 2, 'MATI_1603535859', 'NUMÉRATION', '', '', '', 0, '2020-10-24 10:37:39', NULL, NULL, NULL, NULL, '1'),
	(25, 1, 'MATI_1603535961', 'MESURES / REPÉRAGES', '', '', '', 0, '2020-10-24 10:39:21', NULL, NULL, NULL, NULL, '1'),
	(26, 1, 'MATI_1603535991', 'GÉOMÉTRIE', '', '', '', 0, '2020-10-24 10:39:51', NULL, NULL, NULL, NULL, '1'),
	(27, 3, 'MATI_1603536223', 'STRUCTURATION ESPACE/TEMPS', '', '', '', 0, '2020-10-24 10:43:43', NULL, NULL, NULL, NULL, '1'),
	(28, 1, 'MATI_1603536245', 'EDUCATION CIVIQUE', '', '', '', 0, '2020-10-24 10:44:06', NULL, NULL, NULL, NULL, '1'),
	(29, 1, 'MATI_1603536263', 'SCIENCES', '', '', '', 0, '2020-10-24 10:44:23', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `matiere` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. parcours
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
  `description` text,
  `date_inscription` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.parcours : ~5 rows (environ)
/*!40000 ALTER TABLE `parcours` DISABLE KEYS */;
INSERT INTO `parcours` (`id`, `classe_id`, `salle_classe_id`, `eleve_id`, `statut_apprenant_id`, `annee_scolaire_id`, `code`, `libelle`, `description`, `date_inscription`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(13, 1, NULL, 52, 1, 2, 'PARC_1601006845', NULL, NULL, '2020-09-25 04:07:25', 0, '2020-09-25 04:07:27', NULL, NULL, NULL, NULL, '1'),
	(14, 1, NULL, 53, 1, 2, 'PARC_1602622270', NULL, NULL, '2020-10-13 20:51:11', 0, '2020-10-13 20:51:12', NULL, NULL, NULL, NULL, '1'),
	(15, 1, NULL, 54, 1, 2, 'PARC_1602667646', NULL, NULL, '2020-10-14 09:27:26', 0, '2020-10-14 09:27:27', NULL, NULL, NULL, NULL, '1'),
	(16, 1, NULL, 55, 1, 2, 'PARC_1602768497', NULL, NULL, '2020-10-15 13:28:18', 0, '2020-10-15 13:28:19', NULL, NULL, NULL, NULL, '1'),
	(17, 1, NULL, 56, 1, 2, 'PARC_1602768504', NULL, NULL, '2020-10-15 13:28:24', 0, '2020-10-15 13:28:25', NULL, NULL, NULL, NULL, '1'),
	(18, 1, NULL, 57, 1, 2, 'PARC_1603689114', NULL, NULL, '2020-10-26 05:11:55', 0, '2020-10-26 05:06:19', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `parcours` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. pays
DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.pays : ~6 rows (environ)
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'CMR', 'Cameroun', 'Afrique en minuature', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(2, 'GA', 'Gabon', 'Terre du bois', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(3, 'CG', 'France', 'Coq sportif', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(4, 'TG', 'Togo', NULL, 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(5, 'TD', 'Tchad', 'Pays du Sahel', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(6, 'PAYS_1598618896', 'Congo', 'Pays  de la sape', 0, '2020-08-28 13:48:16', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. pension_classe
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
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.pension_classe : ~28 rows (environ)
/*!40000 ALTER TABLE `pension_classe` DISABLE KEYS */;
INSERT INTO `pension_classe` (`id`, `type_pension_id`, `classe_id`, `code`, `libelle`, `montant`, `est_mensuel`, `mensualite`, `optionnel`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 1, 1, 'PENS_1598861726', NULL, 100000, '1', 100000, 0, 0, '2020-08-31 03:16:31', NULL, NULL, NULL, NULL, '1'),
	(2, 4, 2, 'PENS_1598862208', NULL, 100000, '0', 100000, 0, 0, '2020-08-31 03:24:33', NULL, NULL, NULL, NULL, '1'),
	(4, 4, 5, 'PENS_1599093524', NULL, 100000, '0', 100000, 0, 0, '2020-09-02 19:39:49', NULL, NULL, NULL, NULL, '1'),
	(5, 4, 1, 'PENS_1601195566', NULL, 100000, '0', 100000, 0, 0, '2020-09-27 08:32:48', NULL, NULL, NULL, NULL, '1'),
	(6, 1, 2, 'PENS_1601195597', NULL, 100000, '1', 100000, 0, 0, '2020-09-27 08:33:18', NULL, NULL, NULL, NULL, '1'),
	(7, 1, 5, 'PENS_1601195965', NULL, 100000, '1', 100000, 0, 0, '2020-09-27 08:39:26', NULL, NULL, NULL, NULL, '1'),
	(8, 1, 3, 'PENS_1601196031', NULL, 100000, '1', 100000, 0, 0, '2020-09-27 08:40:32', NULL, NULL, NULL, NULL, '1'),
	(9, 4, 6, 'PENS_1601196083', NULL, 100000, '0', 100000, 0, 0, '2020-09-27 08:41:24', NULL, NULL, NULL, NULL, '1'),
	(10, 4, 4, 'PENS_1601196344', NULL, 100000, '0', 100000, 0, 0, '2020-09-27 08:45:45', NULL, NULL, NULL, NULL, '1'),
	(12, 1, 4, 'PENS_1601197015', NULL, 100000, '1', 100000, 0, 0, '2020-09-27 08:56:57', NULL, NULL, NULL, NULL, '1'),
	(15, 4, 3, 'PENS_1601197476', NULL, 100000, '0', 100000, 0, 0, '2020-09-27 09:04:37', NULL, NULL, NULL, NULL, '1'),
	(16, 1, 6, 'PENS_1601197955', NULL, 100000, '1', 100000, 0, 0, '2020-09-27 09:12:36', NULL, NULL, NULL, NULL, '1'),
	(17, 4, 9, 'PENS_1601198065', NULL, 100000, '0', 100000, 0, 0, '2020-09-27 09:14:26', NULL, NULL, NULL, NULL, '1'),
	(18, 1, 1, 'PENS_1601198093', NULL, 100000, '1', 100000, 0, 0, '2020-09-27 09:14:55', NULL, NULL, NULL, NULL, '1'),
	(19, 4, 13, 'PENS_1601198124', NULL, 100000, '0', 100000, 0, 0, '2020-09-27 09:15:25', NULL, NULL, NULL, NULL, '1'),
	(21, 4, 14, 'PENS_1601198173', NULL, 100000, '0', 100000, 0, 0, '2020-09-27 09:16:14', NULL, NULL, NULL, NULL, '1'),
	(22, 1, 14, 'PENS_1601198268', NULL, 100000, '1', 100000, 0, 0, '2020-09-27 09:17:50', NULL, NULL, NULL, NULL, '1'),
	(23, 4, 15, 'PENS_1601198295', NULL, 100000, '0', 100000, 0, 0, '2020-09-27 09:18:16', NULL, NULL, NULL, NULL, '1'),
	(24, 1, 1, 'PENS_1601198326', NULL, 100000, '1', 100000, 0, 0, '2020-09-27 09:18:48', NULL, NULL, NULL, NULL, '1'),
	(25, 4, 16, 'PENS_1601198348', NULL, 100000, '0', 100000, 0, 0, '2020-09-27 09:19:10', NULL, NULL, NULL, NULL, '1'),
	(26, 1, 1, 'PENS_1601198378', NULL, 100000, '1', 100000, 0, 0, '2020-09-27 09:19:40', NULL, NULL, NULL, NULL, '1'),
	(27, 1, 16, 'PENS_1601198484', NULL, 100000, '1', 100000, 0, 0, '2020-09-27 09:21:25', NULL, NULL, NULL, NULL, '1'),
	(28, 4, 17, 'PENS_1601198505', NULL, 100000, '0', 100000, 0, 0, '2020-09-27 09:21:46', NULL, NULL, NULL, NULL, '1'),
	(29, 1, 1, 'PENS_1601198531', NULL, 100000, '1', 100000, 0, 0, '2020-09-27 09:22:12', NULL, NULL, NULL, NULL, '1'),
	(30, 1, 18, 'PENS_1603164863', NULL, 100000, '1', 100000, 0, 0, '2020-10-20 03:34:24', NULL, NULL, NULL, NULL, '1'),
	(31, 4, 1, 'PENS_1603164903', NULL, 100000, '0', 100000, 0, 0, '2020-10-20 03:35:04', NULL, NULL, NULL, NULL, '1'),
	(32, 1, 19, 'PENS_1603164921', NULL, 100000, '1', 100000, 0, 0, '2020-10-20 03:35:22', NULL, NULL, NULL, NULL, '1'),
	(33, 1, 1, 'PENS_1603164954', NULL, 100000, '1', 100000, 0, 0, '2020-10-20 03:35:54', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `pension_classe` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. pension_eleve
DROP TABLE IF EXISTS `pension_eleve`;
CREATE TABLE IF NOT EXISTS `pension_eleve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_pension_id` int(11) DEFAULT NULL,
  `classe_id` int(11) NOT NULL,
  `pension_classe_id` int(11) DEFAULT NULL,
  `eleve_id` int(11) NOT NULL,
  `type_paiement_id` int(11) NOT NULL,
  `tranche_scolaire_id` int(11) DEFAULT NULL,
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
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.pension_eleve : ~2 rows (environ)
/*!40000 ALTER TABLE `pension_eleve` DISABLE KEYS */;
INSERT INTO `pension_eleve` (`id`, `type_pension_id`, `classe_id`, `pension_classe_id`, `eleve_id`, `type_paiement_id`, `tranche_scolaire_id`, `code`, `libelle`, `motif`, `montant`, `quantite`, `mois`, `date_paie`, `reste`, `reduction`, `autres`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 1, 2, 6, 56, 1, 1, 'CORE_1602805196', 'C87AEE17DA', '', 90000, 2, NULL, '2020-10-15 23:39:56', 0, 0, NULL, 0, '2020-10-15 23:39:58', NULL, NULL, NULL, NULL, '1'),
	(2, 1, 2, 6, 56, 1, 2, 'CORE_1602805196', 'C87AEE17DA', '', 90000, 2, NULL, '2020-10-15 23:39:56', 0, 0, NULL, 0, '2020-10-15 23:39:58', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `pension_eleve` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. periode
DROP TABLE IF EXISTS `periode`;
CREATE TABLE IF NOT EXISTS `periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_sessionperiode` (`session_id`),
  CONSTRAINT `fk_session_periode` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.periode : ~0 rows (environ)
/*!40000 ALTER TABLE `periode` DISABLE KEYS */;
/*!40000 ALTER TABLE `periode` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. personnel
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
  `autres` varchar(1000) DEFAULT NULL,
  `login` varchar(254) DEFAULT NULL,
  `password` varchar(254) DEFAULT NULL,
  `assurance` varchar(254) NOT NULL DEFAULT '',
  `date_prise_service` datetime DEFAULT NULL,
  `date_fin_carriere` datetime DEFAULT NULL,
  `bibliographie` varchar(1000) DEFAULT NULL,
  `pieces_jointes` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.personnel : ~3 rows (environ)
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` (`id`, `type_personnel_id`, `pays_id`, `code`, `nom`, `prenom`, `sexe`, `photo`, `telephone`, `email`, `adresse`, `autres`, `login`, `password`, `assurance`, `date_prise_service`, `date_fin_carriere`, `bibliographie`, `pieces_jointes`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 1, 1, 'PERSO-01', 'KAKAMBI', 'Franck', 'H', 'no-photo.jpg', '+241 66 39 63 33', 'kakambi@gmail.com', 'Rue NTOUMAMANE 23', NULL, 'franck', '73262ad0334ab37227b2f7a0205f51db1e606681', '', '2010-10-10 19:49:39', NULL, 'Homme pragmatique et travailleur', NULL, 0, '2020-04-24 19:49:39', NULL, NULL, NULL, NULL, '1'),
	(3, 3, 1, 'PERSO-03', 'KAMGA', 'Stephane', 'H', 'no-photo.jpg', '+241 66 39 63 33', 'kamga_stph@outlook.live', 'Rue NTOUMAMANE 23', NULL, 'kamga', '73262ad0334ab37227b2f7a0205f51db1e606681', '', '2017-04-25 19:49:39', NULL, 'Homme pragmatique et travailleur', NULL, 0, '2020-04-24 19:49:39', NULL, NULL, NULL, NULL, '1'),
	(4, 1, 1, 'PERS_1598894111', 'TSUALA', 'Florian', 'F', 'no-photo.jpg', '0789456123', 'tsualaflorian@gmail.com', 'tsualaflorian@gmail.com', NULL, 'florian', '73262ad0334ab37227b2f7a0205f51db1e606681', '', '2020-08-06 00:00:00', '2020-08-30 00:00:00', 'ProDigit', NULL, 0, '2020-08-31 12:16:17', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. personnel_activite
DROP TABLE IF EXISTS `personnel_activite`;
CREATE TABLE IF NOT EXISTS `personnel_activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activite_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `pourcentage` float DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.personnel_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `personnel_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnel_activite` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. planning_cours
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
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.planning_cours : ~0 rows (environ)
/*!40000 ALTER TABLE `planning_cours` DISABLE KEYS */;
/*!40000 ALTER TABLE `planning_cours` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. planning_resto
DROP TABLE IF EXISTS `planning_resto`;
CREATE TABLE IF NOT EXISTS `planning_resto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abonnement_id` int(11) DEFAULT NULL,
  `code` varchar(254) DEFAULT NULL,
  `date_pontuellle` datetime DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_abonnement_resto_planning_resto` (`abonnement_id`),
  CONSTRAINT `fk_abonnement_resto_planning_resto` FOREIGN KEY (`abonnement_id`) REFERENCES `abonnement_resto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.planning_resto : ~0 rows (environ)
/*!40000 ALTER TABLE `planning_resto` DISABLE KEYS */;
/*!40000 ALTER TABLE `planning_resto` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. prix_abonnement
DROP TABLE IF EXISTS `prix_abonnement`;
CREATE TABLE IF NOT EXISTS `prix_abonnement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `periode` enum('JOUR','SEMAINE','MOIS','ANNEE') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'MOIS',
  `type_abonnement` enum('ACTIVITE','CANTINE') COLLATE utf8_unicode_ci DEFAULT 'ACTIVITE' COMMENT 'CANTINE, ACTIVITE',
  `type_abonnement_id` int(11) DEFAULT '0',
  `description` varchar(254) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Listage des données de la table Fqy2hYVwUB.prix_abonnement : ~5 rows (environ)
/*!40000 ALTER TABLE `prix_abonnement` DISABLE KEYS */;
INSERT INTO `prix_abonnement` (`id`, `code`, `montant`, `periode`, `type_abonnement`, `type_abonnement_id`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'JOUR', 2500, 'JOUR', 'CANTINE', 0, 'Cantine', 0, '2020-09-24 00:47:54', NULL, NULL, NULL, NULL, '1'),
	(2, 'MOIS', 12500, 'SEMAINE', 'CANTINE', 0, 'Cantine', 0, '2020-09-24 01:12:54', NULL, NULL, NULL, NULL, '1'),
	(3, 'SEMAINE', 50000, 'MOIS', 'CANTINE', 0, 'Cantine', 0, '2020-09-24 01:13:04', NULL, NULL, NULL, NULL, '1'),
	(4, 'PRIX_1603995234', 100000, 'ANNEE', 'ACTIVITE', 1, 'Judo', 0, '2020-10-29 18:13:56', NULL, NULL, NULL, NULL, '1'),
	(5, 'PRIX_1603995251', 100000, 'JOUR', 'ACTIVITE', 2, 'Karaté', 0, '2020-10-29 18:14:14', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `prix_abonnement` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. remboursement
DROP TABLE IF EXISTS `remboursement`;
CREATE TABLE IF NOT EXISTS `remboursement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `dette_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `motif` varchar(254) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `date_remboursement` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.remboursement : ~0 rows (environ)
/*!40000 ALTER TABLE `remboursement` DISABLE KEYS */;
/*!40000 ALTER TABLE `remboursement` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. repas
DROP TABLE IF EXISTS `repas`;
CREATE TABLE IF NOT EXISTS `repas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.repas : ~0 rows (environ)
/*!40000 ALTER TABLE `repas` DISABLE KEYS */;
/*!40000 ALTER TABLE `repas` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. reservation
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eleve_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `code` varchar(254) DEFAULT NULL,
  `date_reservation` datetime DEFAULT NULL,
  `commentaire` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.reservation : ~0 rows (environ)
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. restitution
DROP TABLE IF EXISTS `restitution`;
CREATE TABLE IF NOT EXISTS `restitution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emprunt_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `date_restitution` datetime DEFAULT NULL,
  `commentaire` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.restitution : ~0 rows (environ)
/*!40000 ALTER TABLE `restitution` DISABLE KEYS */;
/*!40000 ALTER TABLE `restitution` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. salaire
DROP TABLE IF EXISTS `salaire`;
CREATE TABLE IF NOT EXISTS `salaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `date_paie` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_personnel_salaire` (`personnel_id`),
  CONSTRAINT `fk_personnel_salaire` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.salaire : ~0 rows (environ)
/*!40000 ALTER TABLE `salaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `salaire` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. salle_classe
DROP TABLE IF EXISTS `salle_classe`;
CREATE TABLE IF NOT EXISTS `salle_classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classe_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_classe_salle_classe` (`classe_id`),
  CONSTRAINT `fk_classe_salle_classe` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.salle_classe : ~26 rows (environ)
/*!40000 ALTER TABLE `salle_classe` DISABLE KEYS */;
INSERT INTO `salle_classe` (`id`, `classe_id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 5, 'SALL_1598856987', 'Cours-Preparatoire 1 A', '', 0, '2020-08-31 01:57:32', NULL, NULL, NULL, NULL, '1'),
	(2, 5, 'SALL_1598857003', 'Cours-Preparatoire 1 B', '', 0, '2020-08-31 01:57:48', NULL, NULL, NULL, NULL, '1'),
	(3, 17, 'SALL_1600906919', 'Garderie', '', 0, '2020-09-24 00:22:00', NULL, NULL, NULL, NULL, '1'),
	(4, 4, 'SALL_1600907219', 'SIL A', '', 0, '2020-09-24 00:27:00', NULL, NULL, NULL, NULL, '1'),
	(5, 4, 'SALL_1600907248', 'SIL B', '', 0, '2020-09-24 00:27:29', NULL, NULL, NULL, NULL, '1'),
	(6, 2, 'SALL_1600907310', 'Moyenne-section A', '', 0, '2020-09-24 00:28:30', NULL, NULL, NULL, NULL, '1'),
	(7, 2, 'SALL_1600907345', 'Moyenne-section B', '', 0, '2020-09-24 00:29:05', NULL, NULL, NULL, NULL, '1'),
	(8, 3, 'SALL_1600907557', 'Grande-section A', '', 0, '2020-09-24 00:32:38', NULL, NULL, NULL, NULL, '1'),
	(9, 1, 'SALL_1600907683', 'Petite-section B', '', 0, '2020-09-24 00:34:43', NULL, NULL, NULL, NULL, '1'),
	(10, 1, 'SALL_1600907731', 'Petite-section A', '', 0, '2020-09-24 00:35:31', NULL, NULL, NULL, NULL, '1'),
	(11, 3, 'SALL_1600907901', 'Grande-section B', '', 0, '2020-09-24 00:38:22', NULL, NULL, NULL, NULL, '1'),
	(12, 6, 'SALL_1600908224', 'cours-Elémentaire 1 A', '', 0, '2020-09-24 00:43:45', NULL, NULL, NULL, NULL, '1'),
	(13, 6, 'SALL_1600908264', 'Cours-Elémentaire 1 B', '', 0, '2020-09-24 00:44:24', NULL, NULL, NULL, NULL, '1'),
	(14, 14, 'SALL_1600908326', 'Cours-Elémentaire 2 A', '', 0, '2020-09-24 00:45:27', NULL, NULL, NULL, NULL, '1'),
	(15, 14, 'SALL_1600908337', 'Cours-Elémentaire 2 B', '', 0, '2020-09-24 00:45:38', NULL, NULL, NULL, NULL, '1'),
	(16, 13, 'SALL_1600908426', 'Cours-Préparatoire 2 A', '', 0, '2020-09-24 00:47:07', NULL, NULL, NULL, NULL, '1'),
	(17, 13, 'SALL_1600908440', 'Cours-Préparatoire 2 B', '', 0, '2020-09-24 00:47:21', NULL, NULL, NULL, NULL, '1'),
	(18, 4, 'SALL_1603166972', 'SIL C', '', 0, '2020-10-20 04:09:33', NULL, NULL, NULL, NULL, '1'),
	(19, 5, 'SALL_1603167039', 'Cours-Préparatoire 1 C', '', 0, '2020-10-20 04:10:39', NULL, NULL, NULL, NULL, '1'),
	(20, 6, 'SALL_1603167085', 'Cours-Elémentaire 1 C', '', 0, '2020-10-20 04:11:25', NULL, NULL, NULL, NULL, '1'),
	(21, 13, 'SALL_1603167122', 'Cours-Préparatoire 2 C', '', 0, '2020-10-20 04:12:03', NULL, NULL, NULL, NULL, '1'),
	(22, 14, 'SALL_1603167158', 'Cours-Elémentaire 2 C', '', 0, '2020-10-20 04:12:38', NULL, NULL, NULL, NULL, '1'),
	(23, 9, 'SALL_1603167341', 'Cours-Moyen 1 A', '', 0, '2020-10-20 04:15:42', NULL, NULL, NULL, NULL, '1'),
	(24, 1, 'SALL_1603167351', 'Cours-Moyen 1 C', '', 0, '2020-10-20 04:15:52', NULL, NULL, NULL, NULL, '1'),
	(25, 1, 'SALL_1603167361', 'Cours-Moyen 1 B', '', 0, '2020-10-20 04:16:01', NULL, NULL, NULL, NULL, '1'),
	(26, 15, 'SALL_1603167378', 'Cours-Moyen 2 A', '', 0, '2020-10-20 04:16:19', NULL, NULL, NULL, NULL, '1'),
	(27, 1, 'SALL_1603167390', 'Cours-Moyen 2 B', '', 0, '2020-10-20 04:16:31', NULL, NULL, NULL, NULL, '1'),
	(28, 1, 'SALL_1603167402', 'Cours-Moyen 2 C', '', 0, '2020-10-20 04:16:43', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `salle_classe` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. session
DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee_scolaire_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_annee_scolaire_session` (`annee_scolaire_id`),
  CONSTRAINT `fk_annee_scolaire_session` FOREIGN KEY (`annee_scolaire_id`) REFERENCES `annee_scolaire` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.session : ~0 rows (environ)
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. statut_apprenant
DROP TABLE IF EXISTS `statut_apprenant`;
CREATE TABLE IF NOT EXISTS `statut_apprenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.statut_apprenant : ~3 rows (environ)
/*!40000 ALTER TABLE `statut_apprenant` DISABLE KEYS */;
INSERT INTO `statut_apprenant` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'STAPP-01', 'Nouveau', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'STAPP-02', 'Redoublant', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 'STAPP-03', 'Ancien', '', 0, '2020-08-10 17:07:35', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `statut_apprenant` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. tranche_horaire
DROP TABLE IF EXISTS `tranche_horaire`;
CREATE TABLE IF NOT EXISTS `tranche_horaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `temps_debut` datetime DEFAULT NULL,
  `temps_fin` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.tranche_horaire : ~0 rows (environ)
/*!40000 ALTER TABLE `tranche_horaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `tranche_horaire` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. tranche_scolaire
DROP TABLE IF EXISTS `tranche_scolaire`;
CREATE TABLE IF NOT EXISTS `tranche_scolaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee_scolaire_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_annee_scolaire_tranche_scolaire` (`annee_scolaire_id`),
  CONSTRAINT `fk_annee_scolaire_tranche_scolaire` FOREIGN KEY (`annee_scolaire_id`) REFERENCES `annee_scolaire` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.tranche_scolaire : ~12 rows (environ)
/*!40000 ALTER TABLE `tranche_scolaire` DISABLE KEYS */;
INSERT INTO `tranche_scolaire` (`id`, `annee_scolaire_id`, `code`, `libelle`, `description`, `date_debut`, `date_fin`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 2, 'TRAN_1598852718', 'Janvier', NULL, NULL, NULL, 0, '2020-08-31 00:46:23', NULL, NULL, NULL, NULL, '1'),
	(2, 2, 'TRAN_1598854167', 'Février', NULL, NULL, NULL, 0, '2020-08-31 01:10:32', NULL, NULL, NULL, NULL, '1'),
	(3, 2, 'TRAN_1598854187', 'Mars', NULL, NULL, NULL, 0, '2020-08-31 01:10:52', NULL, NULL, NULL, NULL, '1'),
	(4, 2, 'TRAN_1598854806', 'Avril', NULL, NULL, NULL, 0, '2020-08-31 01:21:11', NULL, NULL, NULL, NULL, '1'),
	(5, 2, 'TRAN_1598854815', 'Mai', NULL, NULL, NULL, 0, '2020-08-31 01:21:19', NULL, NULL, NULL, NULL, '1'),
	(6, 2, 'TRAN_1598854822', 'Juin', NULL, NULL, NULL, 0, '2020-08-31 01:21:27', NULL, NULL, NULL, NULL, '1'),
	(9, 2, 'TRAN_1599741435', 'Septembre', NULL, NULL, NULL, 0, '2020-09-10 12:37:16', NULL, NULL, NULL, NULL, '1'),
	(10, 2, 'TRAN_1599741467', 'Octobre', NULL, NULL, NULL, 0, '2020-09-10 12:37:47', NULL, NULL, NULL, NULL, '1'),
	(11, 2, 'TRAN_1599741478', 'Novembre', NULL, NULL, NULL, 0, '2020-09-10 12:37:58', NULL, NULL, NULL, NULL, '1'),
	(12, 2, 'TRAN_1599741486', 'Decembre', NULL, NULL, NULL, 0, '2020-09-10 12:38:06', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `tranche_scolaire` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. type_activite
DROP TABLE IF EXISTS `type_activite`;
CREATE TABLE IF NOT EXISTS `type_activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.type_activite : ~2 rows (environ)
/*!40000 ALTER TABLE `type_activite` DISABLE KEYS */;
INSERT INTO `type_activite` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'TYPE_1599815632', 'Art martial', 'Art martial', 0, '2020-09-11 09:13:53', NULL, NULL, NULL, NULL, '1'),
	(2, 'TYPE_1599815662', 'Art plastique', 'Art plastique', 0, '2020-09-11 09:14:23', NULL, NULL, NULL, NULL, '1'),
	(3, 'TYPE_1599815680', 'Art musical', 'Art musical', 0, '2020-09-11 09:14:41', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `type_activite` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. type_paiement
DROP TABLE IF EXISTS `type_paiement`;
CREATE TABLE IF NOT EXISTS `type_paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.type_paiement : ~3 rows (environ)
/*!40000 ALTER TABLE `type_paiement` DISABLE KEYS */;
INSERT INTO `type_paiement` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'TYPE_1598618757', 'Espèce', 'monnaie', 0, '2020-08-28 13:45:57', NULL, NULL, NULL, NULL, '1'),
	(2, 'TYPE_1598618805', 'chèque', 'chèque', 0, '2020-08-28 13:46:45', NULL, NULL, NULL, NULL, '1'),
	(3, 'TYPE_1598618856', 'Mobile-money', 'airtel ou mobicash', 0, '2020-08-28 13:47:36', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `type_paiement` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. type_pension
DROP TABLE IF EXISTS `type_pension`;
CREATE TABLE IF NOT EXISTS `type_pension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.type_pension : ~2 rows (environ)
/*!40000 ALTER TABLE `type_pension` DISABLE KEYS */;
INSERT INTO `type_pension` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'TYPE_1598620518', 'Scolarité', 'obligatoire', 0, '2020-08-28 14:15:18', NULL, NULL, NULL, NULL, '1'),
	(4, 'TYPE_1599051076', 'Inscription', 'Obligatoire', 0, '2020-09-02 07:52:25', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `type_pension` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. type_personnel
DROP TABLE IF EXISTS `type_personnel`;
CREATE TABLE IF NOT EXISTS `type_personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
  `creer_par` int(11) DEFAULT '0' COMMENT '{0 => SuperAdmin}',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_par` int(11) DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `supprimer_par` int(11) DEFAULT NULL,
  `date_suppression` datetime DEFAULT NULL,
  `visibilite` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.type_personnel : ~4 rows (environ)
/*!40000 ALTER TABLE `type_personnel` DISABLE KEYS */;
INSERT INTO `type_personnel` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'TYPER-01', 'Administrateur', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'TYPER-02', 'Sécrétaire', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 'TYPER-03', 'Opérateur de saisie', '', 0, '2020-08-10 17:07:35', NULL, NULL, NULL, NULL, '1'),
	(4, 'TYPER-04', 'Directeur', 'C\'est un nom de rôle', 0, '2020-08-10 10:22:38', NULL, NULL, NULL, NULL, '0');
/*!40000 ALTER TABLE `type_personnel` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
