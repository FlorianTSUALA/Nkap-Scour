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
CREATE DATABASE IF NOT EXISTS `Fqy2hYVwUB` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `Fqy2hYVwUB`;

-- Listage de la structure de la table Fqy2hYVwUB. abonnement_activite
CREATE TABLE IF NOT EXISTS `abonnement_activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inscription_activite_id` int(11) NOT NULL,
  `activite_id` int(11) NOT NULL,
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
  CONSTRAINT `fk_inscription_activite` FOREIGN KEY (`inscription_activite_id`) REFERENCES `inscription_activite` (`id`),
  CONSTRAINT `fk_activite` FOREIGN KEY (`activite_id`) REFERENCES `activite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.abonnement_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement_activite` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. abonnement_consomme
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
CREATE TABLE IF NOT EXISTS `abonnement_resto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eleve_id` int(11) NOT NULL,
  `code` varchar(254) DEFAULT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` text,
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
  CONSTRAINT `fk_eleveabonnement_resto` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.abonnement_resto : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_resto` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement_resto` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. activite
CREATE TABLE IF NOT EXISTS `activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_activite_id` int(11) NOT NULL,
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
  PRIMARY KEY (`id`),
  KEY `fk_type_activite` (`type_activite_id`),
  CONSTRAINT `fk_type_activite` FOREIGN KEY (`type_activite_id`) REFERENCES `type_activite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.activite : ~0 rows (environ)
/*!40000 ALTER TABLE `activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `activite` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. annee_scolaire
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
INSERT IGNORE INTO `annee_scolaire` (`id`, `code`, `slogan`, `libelle`, `mission`, `debut_annee`, `fin_annee`, `statut`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'ANSCO-01', 'Annee des lumieres', '2019-2020', 'Produire les meilleurs eleves du monde', '2019-09-15 00:00:00', '2020-05-15 00:00:00', '0', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'CORE_1598613732', '', '2020-2021', '', '2020-08-28 00:00:00', '2021-08-28 00:00:00', '1', 0, '2020-08-28 12:22:12', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `annee_scolaire` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. antecedent_scolaire
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.antecedent_scolaire : ~0 rows (environ)
/*!40000 ALTER TABLE `antecedent_scolaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `antecedent_scolaire` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. classe
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.classe : ~7 rows (environ)
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

-- Listage de la structure de la table Fqy2hYVwUB. composer
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
INSERT IGNORE INTO `cycle` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'CYCL-01', 'Maternel', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'CYCL-02', 'Primaire', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 'CYCL-03', 'Secondaire', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `cycle` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. depense
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.discipline : ~0 rows (environ)
/*!40000 ALTER TABLE `discipline` DISABLE KEYS */;
/*!40000 ALTER TABLE `discipline` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. document
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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.dossier_medical : ~0 rows (environ)
/*!40000 ALTER TABLE `dossier_medical` DISABLE KEYS */;
/*!40000 ALTER TABLE `dossier_medical` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. dossier_parental
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.dossier_parental : ~0 rows (environ)
/*!40000 ALTER TABLE `dossier_parental` DISABLE KEYS */;
/*!40000 ALTER TABLE `dossier_parental` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. eleve
CREATE TABLE IF NOT EXISTS `eleve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(254) NOT NULL DEFAULT '',
  `dossier_medical_id` int(11) NOT NULL,
  `pays_id` int(11) NOT NULL,
  `groupe_familial_id` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.eleve : ~0 rows (environ)
/*!40000 ALTER TABLE `eleve` DISABLE KEYS */;
/*!40000 ALTER TABLE `eleve` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. emprunt
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.matiere : ~0 rows (environ)
/*!40000 ALTER TABLE `matiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `matiere` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. parcours
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.parcours : ~0 rows (environ)
/*!40000 ALTER TABLE `parcours` DISABLE KEYS */;
/*!40000 ALTER TABLE `parcours` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. pays
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
INSERT IGNORE INTO `pays` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'CMR', 'Cameroun', 'Afrique en minuature', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(2, 'GA', 'Gabon', 'Terre du bois', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(3, 'CG', 'Congo', 'Pays de la sape', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(4, 'TG', 'Togo', NULL, 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(5, 'TD', 'Tchad', 'Pays du Sahel', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(6, 'PAYS_1598618896', 'France', 'le coq sportif', 0, '2020-08-28 13:48:16', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. pension_classe
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.pension_classe : ~4 rows (environ)
/*!40000 ALTER TABLE `pension_classe` DISABLE KEYS */;
INSERT IGNORE INTO `pension_classe` (`id`, `type_pension_id`, `classe_id`, `code`, `libelle`, `montant`, `est_mensuel`, `mensualite`, `optionnel`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 1, 1, 'PENS_1598861726', NULL, 900000, '1', 100000, 0, 0, '2020-08-31 03:16:31', NULL, NULL, NULL, NULL, '1'),
	(2, 1, 2, 'PENS_1598862208', NULL, 900000, '1', 100000, 0, 0, '2020-08-31 03:24:33', NULL, NULL, NULL, NULL, '1'),
	(4, 4, 5, 'PENS_1599093524', NULL, 100000, '0', 0, 0, 0, '2020-09-02 19:39:49', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `pension_classe` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. pension_eleve
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.pension_eleve : ~0 rows (environ)
/*!40000 ALTER TABLE `pension_eleve` DISABLE KEYS */;
/*!40000 ALTER TABLE `pension_eleve` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. periode
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
  INSERT IGNORE INTO `personnel` (`id`, `type_personnel_id`, `pays_id`, `code`, `nom`, `prenom`, `sexe`, `photo`, `telephone`, `email`, `adresse`, `login`, `password`, `assurance`, `date_prise_service`, `date_fin_carriere`, `bibliographie`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
    (1, 1, 1, 'PERSO-01', 'KAKAMBI', 'Franck', 'H', 'no-photo.jpg', '+241 66 39 63 33', 'kakambi@gmail.com', 'Rue NTOUMAMANE 23', 'franck', '650a7fe5b3c1048c21706249a213cdc7', '', '2010-10-10 19:49:39', NULL, 'Homme pragmatique et travailleur', 0, '2020-04-24 19:49:39', NULL, NULL, NULL, NULL, '1'),
    (3, 3, 1, 'PERSO-03', 'KAMGA', 'Stephane', 'H', 'no-photo.jpg', '+241 66 39 63 33', 'kamga_stph@outlook.live', 'Rue NTOUMAMANE 23', 'kamga', '650a7fe5b3c1048c21706249a213cdc7', '', '2017-04-25 19:49:39', NULL, 'Homme pragmatique et travailleur', 0, '2020-04-24 19:49:39', NULL, NULL, NULL, NULL, '1'),
    (4, 1, 1, 'PERS_1598894111', 'TSUALA', 'Florian', 'F', 'no-photo.jpg', '0789456123', 'tsualaflorian@gmail.com', 'tsualaflorian@gmail.com', 'florian', '73262ad0334ab37227b2f7a0205f51db1e606681', '', '2020-08-06 00:00:00', '2020-08-30 00:00:00', 'ProDigit', 0, '2020-08-31 12:16:17', NULL, NULL, NULL, NULL, '1');
  /*!40000 ALTER TABLE `personnel` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. personnel_activite
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

-- Listage de la structure de la table Fqy2hYVwUB. remboursement
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.salle_classe : ~2 rows (environ)
/*!40000 ALTER TABLE `salle_classe` DISABLE KEYS */;
INSERT IGNORE INTO `salle_classe` (`id`, `classe_id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 5, 'SALL_1598856987', 'Cours-Preparatoire 1', '', 0, '2020-08-31 01:57:32', NULL, NULL, NULL, NULL, '1'),
	(2, 5, 'SALL_1598857003', 'Cours-Preparatoire 2', '', 0, '2020-08-31 01:57:48', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `salle_classe` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. session
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
INSERT IGNORE INTO `statut_apprenant` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'STAPP-01', 'Nouveau', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'STAPP-02', 'Redoublant', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 'STAPP-03', 'Ancien', '', 0, '2020-08-10 17:07:35', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `statut_apprenant` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. tranche_horaire
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
INSERT IGNORE INTO `tranche_scolaire` (`id`, `annee_scolaire_id`, `code`, `libelle`, `description`, `date_debut`, `date_fin`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 2, 'TRAN_1598852718', 'Janvier', NULL, NULL, NULL, 0, '2020-08-31 00:46:23', NULL, NULL, NULL, NULL, '1'),
	(2, 2, 'TRAN_1598854167', 'FÃ©vrier', NULL, NULL, NULL, 0, '2020-08-31 01:10:32', NULL, NULL, NULL, NULL, '1'),
	(3, 2, 'TRAN_1598854187', 'Mars', NULL, NULL, NULL, 0, '2020-08-31 01:10:52', NULL, NULL, NULL, NULL, '1'),
	(4, 2, 'TRAN_1598854806', 'Avril', NULL, NULL, NULL, 0, '2020-08-31 01:21:11', NULL, NULL, NULL, NULL, '1'),
	(5, 2, 'TRAN_1598854815', 'Mai', NULL, NULL, NULL, 0, '2020-08-31 01:21:19', NULL, NULL, NULL, NULL, '1'),
	(6, 2, 'TRAN_1598854822', 'Juin', NULL, NULL, NULL, 0, '2020-08-31 01:21:27', NULL, NULL, NULL, NULL, '1'),
	(7, 2, 'TRAN_1598854833', 'Juillet', NULL, NULL, NULL, 0, '2020-08-31 01:21:37', NULL, NULL, NULL, NULL, '1'),
	(8, 2, 'TRAN_1599741417', 'Août', NULL, NULL, NULL, 0, '2020-09-10 12:36:57', NULL, NULL, NULL, NULL, '1'),
	(9, 2, 'TRAN_1599741435', 'Septembre', NULL, NULL, NULL, 0, '2020-09-10 12:37:16', NULL, NULL, NULL, NULL, '1'),
	(10, 2, 'TRAN_1599741467', 'Octobre', NULL, NULL, NULL, 0, '2020-09-10 12:37:47', NULL, NULL, NULL, NULL, '1'),
	(11, 2, 'TRAN_1599741478', 'Novembre', NULL, NULL, NULL, 0, '2020-09-10 12:37:58', NULL, NULL, NULL, NULL, '1'),
	(12, 2, 'TRAN_1599741486', 'Decembre', NULL, NULL, NULL, 0, '2020-09-10 12:38:06', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `tranche_scolaire` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. type_activite
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.type_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `type_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_activite` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. type_paiement
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
INSERT IGNORE INTO `type_paiement` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'TYPE_1598618757', 'EspÃ¨ce', 'monnaie', 0, '2020-08-28 13:45:57', NULL, NULL, NULL, NULL, '1'),
	(2, 'TYPE_1598618805', 'chÃ¨que', 'numÃ©ro de chÃ¨que', 0, '2020-08-28 13:46:45', NULL, NULL, NULL, NULL, '1'),
	(3, 'TYPE_1598618856', 'Mobile-money', 'airtel ou mobicash', 0, '2020-08-28 13:47:36', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `type_paiement` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. type_pension
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table Fqy2hYVwUB.type_pension : ~4 rows (environ)
/*!40000 ALTER TABLE `type_pension` DISABLE KEYS */;
INSERT IGNORE INTO `type_pension` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'TYPE_1598620518', 'Scolarité', 'obligatoire', 0, '2020-08-28 14:15:18', NULL, NULL, NULL, NULL, '1'),
	(4, 'TYPE_1599051076', 'Inscription', 'Obligatoire', 0, '2020-09-02 07:52:25', NULL, NULL, NULL, NULL, '1'),
	(5, 'TYPE_1599740833', 'Cantine', 'Optionnel', 0, '2020-09-10 12:27:14', NULL, NULL, NULL, NULL, '1'),
	(6, 'TYPE_1599741116', 'Club', 'Optionnel', 0, '2020-09-10 12:31:57', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `type_pension` ENABLE KEYS */;

-- Listage de la structure de la table Fqy2hYVwUB. type_personnel
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
INSERT IGNORE INTO `type_personnel` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'TYPER-01', 'Administrateur', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'TYPER-02', 'Sécrétaire', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 'TYPER-03', 'Opérateur de saisie', '', 0, '2020-08-10 17:07:35', NULL, NULL, NULL, NULL, '1'),
	(4, 'TYPER-04', 'Directeur', 'C\'est un nom de rôle', 0, '2020-08-10 10:22:38', NULL, NULL, NULL, NULL, '0');
/*!40000 ALTER TABLE `type_personnel` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
