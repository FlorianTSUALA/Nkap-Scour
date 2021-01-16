-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.4.10-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Listage des données de la table nkap-scour.abonnement_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement_activite` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.abonnement_cantine : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_cantine` DISABLE KEYS */;
INSERT INTO `abonnement_cantine` (`id`, `code`, `eleve_id`, `facture_id`, `periode`, `multiplicateur`, `montant_unitaire`, `montant_total`, `reduction`, `resume_periode`, `date_debut`, `date_fin`, `date_paiement`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, '121212', 2, 12112, 'JOUR', 1, 21212, 1212111, 2121, '212', NULL, NULL, NULL, 0, '2021-01-12 03:03:11', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `abonnement_cantine` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.abonnement_cantine_old : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_cantine_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement_cantine_old` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.abonnement_consomme : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_consomme` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement_consomme` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.activite : ~0 rows (environ)
/*!40000 ALTER TABLE `activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `activite` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.annee_scolaire : ~2 rows (environ)
/*!40000 ALTER TABLE `annee_scolaire` DISABLE KEYS */;
INSERT INTO `annee_scolaire` (`id`, `code`, `slogan`, `libelle`, `mission`, `debut_annee`, `fin_annee`, `statut`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'ANSCO-01', 'Annee des lumieres', '2019-2020', 'Produire les meilleurs eleves du monde', '2019-09-15 00:00:00', '2020-05-15 00:00:00', '0', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'CORE_1598613732', '', '2020-2021', '', '2020-08-28 00:00:00', '2021-08-28 00:00:00', '1', 0, '2020-08-28 12:22:12', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `annee_scolaire` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.antecedent_scolaire : ~93 rows (environ)
/*!40000 ALTER TABLE `antecedent_scolaire` DISABLE KEYS */;
INSERT INTO `antecedent_scolaire` (`id`, `ecole`, `classe`, `telephone`, `email`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`, `code`) VALUES
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

-- Listage des données de la table nkap-scour.classe : ~7 rows (environ)
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
INSERT INTO `classe` (`id`, `cycle_id`, `code`, `libelle`, `description`, `scolarite_min`, `scolarite_max`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 3, 'SECTION_1', 'Petite-section', '', 200456, 435000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 2, 'SECTION_2', 'Moyenne-section', '', 300400, 470000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 1, 'SECTION_3', 'Grande-section', '', 200456, 435000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(4, 2, 'SIL', 'SIL', '', 600456, 735000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(5, 2, 'CP', 'Cours-Preparatoire', '', 500456, 735000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(6, 2, 'CE1', 'Cours-Elementaire', '', 500456, 735000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(9, 2, 'CM2', 'Cours-Moyen', '', 500456, 735000, 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.composer : ~0 rows (environ)
/*!40000 ALTER TABLE `composer` DISABLE KEYS */;
/*!40000 ALTER TABLE `composer` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.cours : ~0 rows (environ)
/*!40000 ALTER TABLE `cours` DISABLE KEYS */;
INSERT INTO `cours` (`id`, `classe_id`, `salle_classe_id`, `matiere_id`, `personnel_id`, `code`, `libelle`, `description`, `volume_horaire`, `coefficient`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 1, 1, 30, 1, 'COUR_1610398343', '', NULL, 1, 1, 0, '2021-01-11 21:52:23', NULL, NULL, NULL, NULL, '1'),
	(2, 1, 1, 30, 1, 'COUR_1610398478', '', NULL, 1, 1, 0, '2021-01-11 21:54:38', NULL, NULL, NULL, NULL, '1'),
	(3, 1, 1, 30, 1, 'COUR_1610398496', '', NULL, 1, 1, 0, '2021-01-11 21:54:56', NULL, NULL, NULL, NULL, '1'),
	(4, 1, 1, 30, 1, 'COUR_1610398506', '', NULL, 2, 2, 0, '2021-01-11 21:55:06', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `cours` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.cycle : ~3 rows (environ)
/*!40000 ALTER TABLE `cycle` DISABLE KEYS */;
INSERT INTO `cycle` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'CYCL-01', 'Maternel', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'CYCL-02', 'Primaire', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 'CYCL-03', 'Secondaire', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `cycle` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.depense : ~0 rows (environ)
/*!40000 ALTER TABLE `depense` DISABLE KEYS */;
/*!40000 ALTER TABLE `depense` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.dette : ~0 rows (environ)
/*!40000 ALTER TABLE `dette` DISABLE KEYS */;
/*!40000 ALTER TABLE `dette` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.discipline : ~0 rows (environ)
/*!40000 ALTER TABLE `discipline` DISABLE KEYS */;
INSERT INTO `discipline` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(4, 'DISC_1610394424', 'FRANÇAIS', '', 0, '2021-01-11 20:47:04', NULL, NULL, NULL, NULL, '1'),
	(5, 'DISC_1610394529', 'MATHEMATIQUES', '', 0, '2021-01-11 20:48:49', NULL, NULL, NULL, NULL, '1'),
	(6, 'DISC_1610394544', 'EVEIL', '', 0, '2021-01-11 20:49:04', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `discipline` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.document : ~0 rows (environ)
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.domaine : ~0 rows (environ)
/*!40000 ALTER TABLE `domaine` DISABLE KEYS */;
/*!40000 ALTER TABLE `domaine` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.dossier_medical : ~84 rows (environ)
/*!40000 ALTER TABLE `dossier_medical` DISABLE KEYS */;
INSERT INTO `dossier_medical` (`id`, `code`, `allergie`, `groupe_sanguin`, `probleme_particulier`, `maladie_recurrente`, `nom_medecin`, `telephone_medecin`, `email_medecin`, `autres`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
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

-- Listage des données de la table nkap-scour.dossier_parental : ~67 rows (environ)
/*!40000 ALTER TABLE `dossier_parental` DISABLE KEYS */;
INSERT INTO `dossier_parental` (`id`, `code`, `pays_mere_id`, `pays_pere_id`, `nom_pere`, `prenom_pere`, `profession_pere`, `employeur_pere`, `lieu_travail_pere`, `quartier_pere`, `telephone_pere`, `ville_pere`, `bureau_pere`, `est_tuteur`, `email_pere`, `signature_pere`, `nom_mere`, `prenom_mere`, `profession_mere`, `employeur_mere`, `lieu_travail_mere`, `quartier_mere`, `telephone_mere`, `ville_mere`, `bureau_mere`, `est_tutrice`, `email_mere`, `signature_mere`, `nom_personne_urgence`, `prenom_personne_urgence`, `telephone_personne_urgence`, `lien`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(7, 'DOSS_1598606922', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 10:28:42', NULL, NULL, NULL, NULL, '1'),
	(9, 'DOSS_1598607252', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 10:34:12', NULL, NULL, NULL, NULL, '1'),
	(10, 'DOSS_1598607436', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 10:37:16', NULL, NULL, NULL, NULL, '1'),
	(11, 'DOSS_1598607641', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 10:40:41', NULL, NULL, NULL, NULL, '1'),
	(12, 'DOSS_1598607760', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 10:42:40', NULL, NULL, NULL, NULL, '1'),
	(13, 'DOSS_1598607812', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 10:43:32', NULL, NULL, NULL, NULL, '1'),
	(14, 'DOSS_1598607909', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 10:45:09', NULL, NULL, NULL, NULL, '1'),
	(15, 'DOSS_1598608011', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 10:46:51', NULL, NULL, NULL, NULL, '1'),
	(16, 'DOSS_1598608040', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 10:47:20', NULL, NULL, NULL, NULL, '1'),
	(17, 'DOSS_1598608055', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 10:47:35', NULL, NULL, NULL, NULL, '1'),
	(18, 'DOSS_1598608379', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 10:52:59', NULL, NULL, NULL, NULL, '1'),
	(19, 'DOSS_1598608721', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 10:58:41', NULL, NULL, NULL, NULL, '1'),
	(20, 'DOSS_1598609138', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:05:38', NULL, NULL, NULL, NULL, '1'),
	(21, 'DOSS_1598609199', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:06:39', NULL, NULL, NULL, NULL, '1'),
	(22, 'DOSS_1598609647', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:14:07', NULL, NULL, NULL, NULL, '1'),
	(23, 'DOSS_1598609749', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:15:49', NULL, NULL, NULL, NULL, '1'),
	(24, 'DOSS_1598609804', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:16:45', NULL, NULL, NULL, NULL, '1'),
	(25, 'DOSS_1598609851', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:17:31', NULL, NULL, NULL, NULL, '1'),
	(26, 'DOSS_1598609909', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:18:29', NULL, NULL, NULL, NULL, '1'),
	(27, 'DOSS_1598609967', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:19:27', NULL, NULL, NULL, NULL, '1'),
	(28, 'DOSS_1598609986', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:19:46', NULL, NULL, NULL, NULL, '1'),
	(29, 'DOSS_1598610048', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:20:48', NULL, NULL, NULL, NULL, '1'),
	(30, 'DOSS_1598610091', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:21:31', NULL, NULL, NULL, NULL, '1'),
	(31, 'DOSS_1598610486', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:28:06', NULL, NULL, NULL, NULL, '1'),
	(32, 'DOSS_1598610524', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:28:44', NULL, NULL, NULL, NULL, '1'),
	(33, 'DOSS_1598610621', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:30:21', NULL, NULL, NULL, NULL, '1'),
	(34, 'DOSS_1598610688', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:31:28', NULL, NULL, NULL, NULL, '1'),
	(35, 'DOSS_1598610717', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:31:57', NULL, NULL, NULL, NULL, '1'),
	(36, 'DOSS_1598610803', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:33:23', NULL, NULL, NULL, NULL, '1'),
	(37, 'DOSS_1598610881', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:34:41', NULL, NULL, NULL, NULL, '1'),
	(38, 'DOSS_1598610922', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:35:22', NULL, NULL, NULL, NULL, '1'),
	(39, 'DOSS_1598611007', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:36:47', NULL, NULL, NULL, NULL, '1'),
	(40, 'DOSS_1598611319', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:41:59', NULL, NULL, NULL, NULL, '1'),
	(41, 'DOSS_1598611352', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:42:32', NULL, NULL, NULL, NULL, '1'),
	(42, 'DOSS_1598611369', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:42:49', NULL, NULL, NULL, NULL, '1'),
	(43, 'DOSS_1598611406', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:43:26', NULL, NULL, NULL, NULL, '1'),
	(44, 'DOSS_1598611423', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:43:43', NULL, NULL, NULL, NULL, '1'),
	(45, 'DOSS_1598611454', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:44:14', NULL, NULL, NULL, NULL, '1'),
	(46, 'DOSS_1598611506', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:45:06', NULL, NULL, NULL, NULL, '1'),
	(47, 'DOSS_1598611553', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:45:53', NULL, NULL, NULL, NULL, '1'),
	(48, 'DOSS_1598611675', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:47:55', NULL, NULL, NULL, NULL, '1'),
	(49, 'DOSS_1598611714', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:48:34', NULL, NULL, NULL, NULL, '1'),
	(50, 'DOSS_1598611721', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:48:41', NULL, NULL, NULL, NULL, '1'),
	(51, 'DOSS_1598611726', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:48:46', NULL, NULL, NULL, NULL, '1'),
	(52, 'DOSS_1598611820', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:50:20', NULL, NULL, NULL, NULL, '1'),
	(53, 'DOSS_1598611931', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:52:11', NULL, NULL, NULL, NULL, '1'),
	(54, 'DOSS_1598612004', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:53:24', NULL, NULL, NULL, NULL, '1'),
	(55, 'DOSS_1598612104', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:55:04', NULL, NULL, NULL, NULL, '1'),
	(56, 'DOSS_1598612137', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 11:55:37', NULL, NULL, NULL, NULL, '1'),
	(57, 'DOSS_1598613207', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 12:13:27', NULL, NULL, NULL, NULL, '1'),
	(58, 'DOSS_1598613304', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 12:15:04', NULL, NULL, NULL, NULL, '1'),
	(59, 'DOSS_1598613367', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 12:16:07', NULL, NULL, NULL, NULL, '1'),
	(60, 'DOSS_1598613383', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 12:16:23', NULL, NULL, NULL, NULL, '1'),
	(61, 'DOSS_1598613657', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 12:20:57', NULL, NULL, NULL, NULL, '1'),
	(62, 'DOSS_1598613708', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 12:21:48', NULL, NULL, NULL, NULL, '1'),
	(63, 'DOSS_1598613732', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 12:22:12', NULL, NULL, NULL, NULL, '1'),
	(64, 'DOSS_1598613766', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 12:22:46', NULL, NULL, NULL, NULL, '1'),
	(65, 'DOSS_1598613850', 3, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 12:24:10', NULL, NULL, NULL, NULL, '1'),
	(66, 'DOSS_1598624250', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-08-28 15:17:30', NULL, NULL, NULL, NULL, '1'),
	(67, 'DOSS_1599002223', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-09-01 18:18:10', NULL, NULL, NULL, NULL, '1'),
	(68, 'DOSS_1599002332', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-09-01 18:19:59', NULL, NULL, NULL, NULL, '1'),
	(69, 'DOSS_1599002784', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-09-01 18:27:30', NULL, NULL, NULL, NULL, '1'),
	(70, 'DOSS_1599003119', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-09-01 18:33:06', NULL, NULL, NULL, NULL, '1'),
	(71, 'DOSS_1599003196', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-09-01 18:34:22', NULL, NULL, NULL, NULL, '1'),
	(72, 'DOSS_1599003345', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-09-01 18:36:52', NULL, NULL, NULL, NULL, '1'),
	(73, 'DOSS_1599003489', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-09-01 18:39:16', NULL, NULL, NULL, NULL, '1'),
	(74, 'DOSS_1599003686', NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', NULL, '', '', '', NULL, 0, '2020-09-01 18:42:32', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `dossier_parental` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.eleve : ~34 rows (environ)
/*!40000 ALTER TABLE `eleve` DISABLE KEYS */;
INSERT INTO `eleve` (`id`, `code`, `dossier_medical_id`, `pays_id`, `groupe_familial_id`, `dossier_parental_id`, `antecedent_scolaire_id`, `matricule`, `nom`, `prenom`, `prenom_usage`, `sexe`, `date_naissance`, `lieu_naissance`, `photo`, `anciennete`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'ELEV_1598610091', 40, 1, NULL, 30, 49, '2019-09-15 08:00:00A000', 'TSUALA', 'Florian', NULL, '', '2000-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:21:31', NULL, NULL, NULL, NULL, '1'),
	(2, 'ELEV_1598610486', 41, 1, NULL, 31, 50, '2019-09-15 08:00:0019-0', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:28:06', NULL, NULL, NULL, NULL, '1'),
	(3, 'ELEV_1598610688', 44, 1, NULL, 34, 53, '2019-09-15 08:00:0019-0', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:31:28', NULL, NULL, NULL, NULL, '1'),
	(4, 'ELEV_1598610803', 46, 1, NULL, 36, 55, '1919-0', 'pro', 'di', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:33:23', NULL, NULL, NULL, NULL, '1'),
	(5, 'ELEV_1598610881', 47, 1, NULL, 37, 56, '20A001', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:34:41', NULL, NULL, NULL, NULL, '1'),
	(6, 'ELEV_1598611007', 49, 1, NULL, 39, 58, '19A001', 'pro', 'digit', NULL, '', '2000-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:36:47', NULL, NULL, NULL, NULL, '1'),
	(7, 'ELEV_1598611506', 56, 1, NULL, 46, 65, '19A002', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:45:06', NULL, NULL, NULL, NULL, '1'),
	(8, 'ELEV_1598611553', 57, 1, NULL, 47, 66, '19A003', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:45:54', NULL, NULL, NULL, NULL, '1'),
	(9, 'ELEV_1598611714', 59, 1, NULL, 49, 68, '19A004', 'Mulanda ISTIEMUGA', 'priscile jeane', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:48:34', NULL, NULL, NULL, NULL, '1'),
	(10, 'ELEV_1598611721', 60, 1, NULL, 50, 69, '19A005', 'kamga Nitedem', 'stephane', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:48:41', NULL, NULL, NULL, NULL, '1'),
	(11, 'ELEV_1598611726', 61, 1, NULL, 51, 70, '19A006', 'franck', 'ikamba', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:48:46', NULL, NULL, NULL, NULL, '1'),
	(12, 'ELEV_1598611820', 62, 1, NULL, 52, 71, '19A007', 'tadjou', 'Stephane', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:50:20', NULL, NULL, NULL, NULL, '1'),
	(13, 'ELEV_1598611931', 63, 1, NULL, 53, 72, '19A008', 'GAN A BOL', '', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:52:11', NULL, NULL, NULL, NULL, '1'),
	(14, 'ELEV_1598612004', 64, 1, NULL, 54, 73, '19A009', 'Thiery Yannick', '', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:53:24', NULL, NULL, NULL, NULL, '1'),
	(15, 'ELEV_1598612104', 65, 1, NULL, 55, 74, '19A010', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:55:04', NULL, NULL, NULL, NULL, '1'),
	(16, 'ELEV_1598612137', 66, 1, NULL, 56, 75, '19A011', 'NDAM NJOYA', 'Arouna', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 11:55:37', NULL, NULL, NULL, NULL, '1'),
	(17, 'ELEV_1598613207', 67, 1, NULL, 57, 76, '19A012', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:13:27', NULL, NULL, NULL, NULL, '1'),
	(18, 'ELEV_1598613304', 68, 1, NULL, 58, 77, '19A013', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:15:04', NULL, NULL, NULL, NULL, '1'),
	(19, 'ELEV_1598613367', 69, 1, NULL, 59, 78, '19A014', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:16:07', NULL, NULL, NULL, NULL, '1'),
	(20, 'ELEV_1598613383', 70, 1, NULL, 60, 79, '19A015', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:16:23', NULL, NULL, NULL, NULL, '1'),
	(21, 'ELEV_1598613657', 71, 1, NULL, 61, 80, '19A016', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:20:57', NULL, NULL, NULL, NULL, '1'),
	(22, 'ELEV_1598613708', 72, 1, NULL, 62, 81, '19A017', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:21:48', NULL, NULL, NULL, NULL, '1'),
	(23, 'ELEV_1598613732', 73, 1, NULL, 63, 82, '19A018', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:22:12', NULL, NULL, NULL, NULL, '1'),
	(24, 'ELEV_1598613766', 74, 1, NULL, 64, 83, '19A019', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:22:46', NULL, NULL, NULL, NULL, '1'),
	(25, 'ELEV_1598613850', 75, 1, NULL, 65, 84, '19A020', 'TSUALA', 'Florian', NULL, '', '2020-08-15 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-08-28 12:24:10', NULL, NULL, NULL, NULL, '1'),
	(26, 'ELEV_1598624250', 76, 2, NULL, 66, 85, '19A021', 'q', 'c', NULL, '', '2020-08-21 00:00:00', '55', 'no-photo.jpg', 0, 0, '2020-08-28 15:17:30', NULL, NULL, NULL, NULL, '1'),
	(27, 'ELEV_1599002224', 77, 4, NULL, 67, 86, '20A022', 'TSUALA', 'Florian', NULL, '', '2020-09-13 00:00:00', 'A', '20A022_1599002224_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:18:12', NULL, NULL, NULL, NULL, '1'),
	(28, 'ELEV_1599002332', 78, 4, NULL, 68, 87, '20A023', 'TSUALA', 'Florian', NULL, '', '2020-09-13 00:00:00', 'A', '20A023_1599002333_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:20:01', NULL, NULL, NULL, NULL, '1'),
	(29, 'ELEV_1599002784', 79, 4, NULL, 69, 88, '20A024', 'TSUALA', 'Florian', NULL, '', '2020-09-13 00:00:00', 'A', '20A024_1599002785_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:27:33', NULL, NULL, NULL, NULL, '1'),
	(30, 'ELEV_1599003120', 80, 4, NULL, 70, 89, '20A025', 'TSUALA', 'Florian', NULL, '', '2020-09-13 00:00:00', 'A', '20A025_1599003121_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:33:08', NULL, NULL, NULL, NULL, '1'),
	(31, 'ELEV_1599003196', 81, 4, NULL, 71, 90, '20A026', 'TSUALA', 'Florian', NULL, '', '2020-09-13 00:00:00', 'A', '20A026_1599003197_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:34:25', NULL, NULL, NULL, NULL, '1'),
	(32, 'ELEV_1599003345', 82, 4, NULL, 72, 91, '20A027', 'TSUALA', 'Florian', NULL, '', '2020-09-13 00:00:00', 'A', '20A027_1599003346_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:36:54', NULL, NULL, NULL, NULL, '1'),
	(33, 'ELEV_1599003490', 83, 4, NULL, 73, 92, '20A028', 'TSUALA', 'Florian', NULL, '', '2020-09-13 00:00:00', 'A', '20A028_1599003492_veste-foliage-petrole.jpg', 0, 0, '2020-09-01 18:39:23', NULL, NULL, NULL, NULL, '1'),
	(34, 'ELEV_1599003688', 84, 2, NULL, 74, 93, '20A029', 'TSUALA', 'Florian', NULL, 'F', '2020-09-19 00:00:00', 'A', 'no-photo.jpg', 0, 0, '2020-09-01 18:42:37', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `eleve` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.emprunt : ~0 rows (environ)
/*!40000 ALTER TABLE `emprunt` DISABLE KEYS */;
/*!40000 ALTER TABLE `emprunt` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.etat_document : ~0 rows (environ)
/*!40000 ALTER TABLE `etat_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `etat_document` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.exemplaire : ~0 rows (environ)
/*!40000 ALTER TABLE `exemplaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `exemplaire` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.groupe_familial : ~0 rows (environ)
/*!40000 ALTER TABLE `groupe_familial` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupe_familial` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.inscription_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `inscription_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscription_activite` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.jour_ouvrable : ~0 rows (environ)
/*!40000 ALTER TABLE `jour_ouvrable` DISABLE KEYS */;
/*!40000 ALTER TABLE `jour_ouvrable` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.matiere : ~0 rows (environ)
/*!40000 ALTER TABLE `matiere` DISABLE KEYS */;
INSERT INTO `matiere` (`id`, `discipline_id`, `code`, `libelle`, `couleur`, `abreviation`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(30, 4, 'MATI_1610394869', 'LECTURE EXPRESSIVE', '', '', '', 0, '2021-01-11 20:54:29', NULL, NULL, NULL, NULL, '1'),
	(31, 4, 'MATI_1610394890', 'LECTURE(COMPRÉHENSION)', '', '', '', 0, '2021-01-11 20:54:50', NULL, NULL, NULL, NULL, '1'),
	(32, 4, 'MATI_1610394904', 'ORTHOGRAPHE', '', '', '', 0, '2021-01-11 20:55:04', NULL, NULL, NULL, NULL, '1'),
	(33, 4, 'MATI_1610394917', 'GRAMMAIRE', '', '', '', 0, '2021-01-11 20:55:17', NULL, NULL, NULL, NULL, '1'),
	(34, 4, 'MATI_1610394929', 'CONJUGAISON', '', '', '', 0, '2021-01-11 20:55:29', NULL, NULL, NULL, NULL, '1'),
	(35, 4, 'MATI_1610394945', 'VOCABULAIRE', '', '', '', 0, '2021-01-11 20:55:45', NULL, NULL, NULL, NULL, '1'),
	(36, 4, 'MATI_1610394977', 'EXPRESSION ECRITE', '', '', '', 0, '2021-01-11 20:56:17', NULL, NULL, NULL, NULL, '1'),
	(37, 4, 'MATI_1610395009', 'EXPRESSION / SOIN', '', '', '', 0, '2021-01-11 20:56:49', NULL, NULL, NULL, NULL, '1'),
	(38, 4, 'MATI_1610395041', 'POISIE', '', '', '', 0, '2021-01-11 20:57:21', NULL, NULL, NULL, NULL, '1'),
	(39, 5, 'MATI_1610395068', 'NUMÉRATION', '', '', '', 0, '2021-01-11 20:57:48', NULL, NULL, NULL, NULL, '1'),
	(40, 5, 'MATI_1610395088', 'OPÉRATIONS/CALCUL MENTALE', '', '', '', 0, '2021-01-11 20:58:08', NULL, NULL, NULL, NULL, '1'),
	(41, 5, 'MATI_1610395102', 'MESURE', '', '', '', 0, '2021-01-11 20:58:22', NULL, NULL, NULL, NULL, '1'),
	(42, 5, 'MATI_1610395119', 'MESURES /REPERAGES', '', '', '', 0, '2021-01-11 20:58:39', NULL, NULL, NULL, NULL, '1'),
	(43, 5, 'MATI_1610395210', 'GEOMETRIE', '', '', '', 0, '2021-01-11 21:00:10', NULL, NULL, NULL, NULL, '1'),
	(44, 5, 'MATI_1610395228', 'ETUDES DE SITUATIONS', '', '', '', 0, '2021-01-11 21:00:28', NULL, NULL, NULL, NULL, '1'),
	(45, 6, 'MATI_1610395261', 'STRUCTURATION ESPACE TEMPS', '', '', '', 0, '2021-01-11 21:01:01', NULL, NULL, NULL, NULL, '1'),
	(46, 6, 'MATI_1610395348', 'EDUCATION CIVIQUE', '', '', '', 0, '2021-01-11 21:02:28', NULL, NULL, NULL, NULL, '1'),
	(47, 4, 'MATI_1610395378', 'SCIENCES', '', '', '', 0, '2021-01-11 21:02:58', NULL, NULL, NULL, NULL, '1'),
	(48, 6, 'MATI_1610395405', 'EDUCATION ARTISTIQUE', '', '', '', 0, '2021-01-11 21:03:25', NULL, NULL, NULL, NULL, '1'),
	(49, 4, 'MATI_1610395425', 'EDUCATION PHYSIQUE', '', '', '', 0, '2021-01-11 21:03:45', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `matiere` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.parcours : ~11 rows (environ)
/*!40000 ALTER TABLE `parcours` DISABLE KEYS */;
INSERT INTO `parcours` (`id`, `classe_id`, `salle_classe_id`, `eleve_id`, `statut_apprenant_id`, `annee_scolaire_id`, `code`, `libelle`, `description`, `date_inscription`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
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

-- Listage des données de la table nkap-scour.pays : ~6 rows (environ)
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'CMR', 'Cameroun', 'Afrique en minuature', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(2, 'GA', 'Gabon', 'Terre du bois', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(3, 'CG', 'Congo', 'Pays de la sape', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(4, 'TG', 'Togo', NULL, 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(5, 'TD', 'Tchad', 'Pays du Sahel', 0, '2020-05-13 02:59:48', NULL, NULL, NULL, NULL, '1'),
	(6, 'PAYS_1598618896', 'France', 'le coq sportif', 0, '2020-08-28 13:48:16', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.pension_classe : ~4 rows (environ)
/*!40000 ALTER TABLE `pension_classe` DISABLE KEYS */;
INSERT INTO `pension_classe` (`id`, `type_pension_id`, `classe_id`, `code`, `libelle`, `montant`, `est_mensuel`, `mensualite`, `optionnel`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 1, 1, 'PENS_1598861726', NULL, 900000, '1', 100000, 0, 0, '2020-08-31 03:16:31', NULL, NULL, NULL, NULL, '1'),
	(2, 1, 2, 'PENS_1598862208', NULL, 900000, '1', 100000, 0, 0, '2020-08-31 03:24:33', NULL, NULL, NULL, NULL, '1'),
	(3, 2, 5, 'PENS_1599033143', NULL, 50000, '0', 0, 1, 0, '2020-09-02 02:53:31', NULL, NULL, NULL, NULL, '1'),
	(4, 4, 5, 'PENS_1599093524', NULL, 100000, '0', 0, 0, 0, '2020-09-02 19:39:49', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `pension_classe` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.pension_eleve : ~0 rows (environ)
/*!40000 ALTER TABLE `pension_eleve` DISABLE KEYS */;
/*!40000 ALTER TABLE `pension_eleve` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.periode : ~0 rows (environ)
/*!40000 ALTER TABLE `periode` DISABLE KEYS */;
/*!40000 ALTER TABLE `periode` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.personnel : ~3 rows (environ)
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` (`id`, `type_personnel_id`, `pays_id`, `code`, `nom`, `prenom`, `sexe`, `photo`, `telephone`, `email`, `adresse`, `autres`, `login`, `password`, `assurance`, `date_prise_service`, `date_fin_carriere`, `bibliographie`, `pieces_jointes`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 1, 1, 'PERSO-01', 'KAKAMBI', 'Franck', 'H', 'no-photo.jpg', '+241 66 39 63 33', 'kakambi@gmail.com', 'Rue NTOUMAMANE 23', NULL, 'franck', '650a7fe5b3c1048c21706249a213cdc7', '', '2010-10-10 19:49:39', NULL, 'Homme pragmatique et travailleur', NULL, 0, '2020-04-24 19:49:39', NULL, NULL, NULL, NULL, '1'),
	(3, 3, 1, 'PERSO-03', 'KAMGA', 'Stephane', 'H', 'no-photo.jpg', '+241 66 39 63 33', 'kamga_stph@outlook.live', 'Rue NTOUMAMANE 23', NULL, 'kamga', '650a7fe5b3c1048c21706249a213cdc7', '', '2017-04-25 19:49:39', NULL, 'Homme pragmatique et travailleur', NULL, 0, '2020-04-24 19:49:39', NULL, NULL, NULL, NULL, '1'),
	(4, 1, 1, 'PERS_1598894111', 'TSUALA', 'Florian', 'F', 'no-photo.jpg', '0789456123', 'tsualaflorian@gmail.com', 'tsualaflorian@gmail.com', NULL, 'florian', '73262ad0334ab37227b2f7a0205f51db1e606681', '', '2020-08-06 00:00:00', '2020-08-30 00:00:00', 'ProDigit', NULL, 0, '2020-08-31 12:16:17', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.personnel_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `personnel_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnel_activite` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.planning_cours : ~0 rows (environ)
/*!40000 ALTER TABLE `planning_cours` DISABLE KEYS */;
/*!40000 ALTER TABLE `planning_cours` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.planning_resto : ~0 rows (environ)
/*!40000 ALTER TABLE `planning_resto` DISABLE KEYS */;
/*!40000 ALTER TABLE `planning_resto` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.prix_abonnement : ~5 rows (environ)
/*!40000 ALTER TABLE `prix_abonnement` DISABLE KEYS */;
INSERT INTO `prix_abonnement` (`id`, `code`, `montant`, `periode`, `type_abonnement`, `type_abonnement_id`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'JOUR', 2500, 'JOUR', 'CANTINE', 0, 'Cantine', 0, '2020-09-24 00:47:54', NULL, NULL, NULL, NULL, '1'),
	(2, 'MOIS', 12500, 'SEMAINE', 'CANTINE', 0, 'Cantine', 0, '2020-09-24 01:12:54', NULL, NULL, NULL, NULL, '1'),
	(3, 'SEMAINE', 50000, 'MOIS', 'CANTINE', 0, 'Cantine', 0, '2020-09-24 01:13:04', NULL, NULL, NULL, NULL, '1'),
	(4, 'PRIX_1603995234', 100000, 'ANNEE', 'ACTIVITE', 1, 'Judo', 0, '2020-10-29 18:13:56', NULL, NULL, NULL, NULL, '1'),
	(5, 'PRIX_1603995251', 100000, 'JOUR', 'ACTIVITE', 2, 'Karaté', 0, '2020-10-29 18:14:14', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `prix_abonnement` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.remboursement : ~0 rows (environ)
/*!40000 ALTER TABLE `remboursement` DISABLE KEYS */;
/*!40000 ALTER TABLE `remboursement` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.repas : ~0 rows (environ)
/*!40000 ALTER TABLE `repas` DISABLE KEYS */;
/*!40000 ALTER TABLE `repas` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.reservation : ~0 rows (environ)
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.restitution : ~0 rows (environ)
/*!40000 ALTER TABLE `restitution` DISABLE KEYS */;
/*!40000 ALTER TABLE `restitution` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.salaire : ~0 rows (environ)
/*!40000 ALTER TABLE `salaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `salaire` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.salle_classe : ~2 rows (environ)
/*!40000 ALTER TABLE `salle_classe` DISABLE KEYS */;
INSERT INTO `salle_classe` (`id`, `classe_id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 5, 'SALL_1598856987', 'Cours-Preparatoire 1', '', 0, '2020-08-31 01:57:32', NULL, NULL, NULL, NULL, '1'),
	(2, 5, 'SALL_1598857003', 'Cours-Preparatoire 2', '', 0, '2020-08-31 01:57:48', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `salle_classe` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.session : ~0 rows (environ)
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.statut_apprenant : ~3 rows (environ)
/*!40000 ALTER TABLE `statut_apprenant` DISABLE KEYS */;
INSERT INTO `statut_apprenant` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'STAPP-01', 'Nouveau', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(2, 'STAPP-02', 'Redoublant', '', 0, '2020-08-10 17:07:21', NULL, NULL, NULL, NULL, '1'),
	(3, 'STAPP-03', 'Ancien', '', 0, '2020-08-10 17:07:35', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `statut_apprenant` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.tranche_horaire : ~0 rows (environ)
/*!40000 ALTER TABLE `tranche_horaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `tranche_horaire` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.tranche_scolaire : ~7 rows (environ)
/*!40000 ALTER TABLE `tranche_scolaire` DISABLE KEYS */;
INSERT INTO `tranche_scolaire` (`id`, `annee_scolaire_id`, `code`, `libelle`, `description`, `date_debut`, `date_fin`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 2, 'TRAN_1598852718', 'Janvier', NULL, NULL, NULL, 0, '2020-08-31 00:46:23', NULL, NULL, NULL, NULL, '1'),
	(2, 2, 'TRAN_1598854167', 'FÃ©vrier', NULL, NULL, NULL, 0, '2020-08-31 01:10:32', NULL, NULL, NULL, NULL, '1'),
	(3, 2, 'TRAN_1598854187', 'Mars', NULL, NULL, NULL, 0, '2020-08-31 01:10:52', NULL, NULL, NULL, NULL, '1'),
	(4, 2, 'TRAN_1598854806', 'Avril', NULL, NULL, NULL, 0, '2020-08-31 01:21:11', NULL, NULL, NULL, NULL, '1'),
	(5, 2, 'TRAN_1598854815', 'Mai', NULL, NULL, NULL, 0, '2020-08-31 01:21:19', NULL, NULL, NULL, NULL, '1'),
	(6, 2, 'TRAN_1598854822', 'Juin', NULL, NULL, NULL, 0, '2020-08-31 01:21:27', NULL, NULL, NULL, NULL, '1'),
	(7, 2, 'TRAN_1598854833', 'Juillet', NULL, NULL, NULL, 0, '2020-08-31 01:21:37', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `tranche_scolaire` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.type_activite : ~0 rows (environ)
/*!40000 ALTER TABLE `type_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_activite` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.type_paiement : ~3 rows (environ)
/*!40000 ALTER TABLE `type_paiement` DISABLE KEYS */;
INSERT INTO `type_paiement` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'TYPE_1598618757', 'EspÃ¨ce', 'monnaie', 0, '2020-08-28 13:45:57', NULL, NULL, NULL, NULL, '1'),
	(2, 'TYPE_1598618805', 'chÃ¨que', 'numÃ©ro de chÃ¨que', 0, '2020-08-28 13:46:45', NULL, NULL, NULL, NULL, '1'),
	(3, 'TYPE_1598618856', 'Mobile-money', 'airtel ou mobicash', 0, '2020-08-28 13:47:36', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `type_paiement` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.type_pension : ~4 rows (environ)
/*!40000 ALTER TABLE `type_pension` DISABLE KEYS */;
INSERT INTO `type_pension` (`id`, `code`, `libelle`, `description`, `creer_par`, `date_creation`, `modifier_par`, `date_modification`, `supprimer_par`, `date_suppression`, `visibilite`) VALUES
	(1, 'TYPE_1598620518', 'ScolaritÃ©', 'obligatoire', 0, '2020-08-28 14:15:18', NULL, NULL, NULL, NULL, '1'),
	(2, 'TYPE_1598620548', 'Tenue Scolaire', 'obligatoire', 0, '2020-08-28 14:15:48', NULL, NULL, NULL, NULL, '1'),
	(3, 'TYPE_1598620563', 'Polo', 'facultatif', 0, '2020-08-28 14:16:03', NULL, NULL, NULL, NULL, '1'),
	(4, 'TYPE_1599051076', 'Inscription', 'Obligatoire', 0, '2020-09-02 07:52:25', NULL, NULL, NULL, NULL, '1');
/*!40000 ALTER TABLE `type_pension` ENABLE KEYS */;

-- Listage des données de la table nkap-scour.type_personnel : ~4 rows (environ)
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
