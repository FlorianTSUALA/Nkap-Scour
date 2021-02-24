<?php

use App\Controller\ClubController;

use App\Controller\HomeController;
use App\Controller\PaysController;
use App\Controller\TestController;
use App\Controller\CoursController;
use App\Controller\CycleController;
use App\Controller\EleveController;
use App\Controller\RepasController;
use App\Controller\BiblioController;
use App\Controller\ClasseController;
use App\Controller\CantineController;
use App\Controller\DomaineController;
use App\Controller\MatiereController;
use App\Controller\PeriodeController;
use App\Controller\PrinterController;
use App\Controller\SessionController;
use App\Controller\ActiviteController;
use App\Controller\BulletinController;
use App\Controller\DocumentController;
use App\Controller\PersonnelController;
use App\Controller\ScolariteController;
use App\Controller\VersementController;
use App\Controller\Auth\LoginController;
use App\Controller\DisciplineController;
use App\Controller\EnseignantController;
use App\Controller\ExemplaireController;
use App\Controller\EmploiTempsController;
use App\Controller\InscriptionController;
use App\Controller\ParametrageController;
use App\Controller\SalleClasseController;
use App\Controller\TypePensionController;
use App\Controller\ComptabiliteController;
use App\Controller\EmploieTempsController;
use App\Controller\EtatDocumentController;
use App\Controller\TypeActiviteController;
use App\Controller\TypePaiementController;
use App\Controller\AnneeScolaireController;

use App\Controller\PensionClasseController;
use App\Controller\TypePersonnelController;
use App\Controller\PrixAbonnementController;
use App\Controller\TrancheHoraireController;
use App\Controller\StatutApprenantController;
use App\Controller\TrancheScolaireController;
use App\Controller\AbonnementActiviteController;
use App\Controller\InscriptionActiviteController;

//use App\Controller\CantineListeController;

//ACCUEIL
$router->addRoute('accueil', 'accueil', [HomeController::class, 'home']);

$router->addRoute('biblio_accueil', 'biblio/accueil', [BiblioController::class, 'accueil']);
$router->addRoute('cantine_accueil', 'cantine/accueil', [CantineController::class, 'accueil']);
$router->addRoute('club_accueil', 'club/accueil', [ClubController::class, 'accueil']);
$router->addRoute('personnel_accueil', 'personnel/accueil', [PersonnelController::class, 'accueil']);
$router->addRoute('enseignant_accueil', 'enseignant/accueil', [EnseignantController::class, 'accueil']);
$router->addRoute('bulletin_accueil', 'bulletin/accueil', [BulletinController::class, 'accueil']);
$router->addRoute('emploi_temps_accueil', 'emploi_temps/accueil', [EmploiTempsController::class, 'accueil']);
$router->addRoute('parametrage_accueil', 'parametrage/accueil', [ParametrageController::class, 'accueil']);
$router->addRoute('comptabilite_accueil', 'comptabilite/accueil', [ComptabiliteController::class, 'accueil']);
$router->addRoute('scolarite_accueil', 'scolarite/accueil', [ScolariteController::class, 'accueil']);


//Login
$router->addRoute('login', '', [LoginController::class, 'index']);
$router->addRoute('postlogin', 'login', [LoginController::class, 'login']);
$router->addRoute('logout', 'logout', [LoginController::class, 'logout']);

//Inscription
$router->addRoute('inscrire', 'inscription', [InscriptionController::class, 'index']);
$router->addRoute('inscrire-create', 'inscription/create/', [InscriptionController::class, 'inscrire']);

//Eleve live search
$router->addRoute('eleve-list-class', 'eleve/list/class/{code}', [EleveController::class, 'eleve_classe']);
$router->addRoute('eleve-list-all', 'eleve/list/class', [EleveController::class, 'eleve_classe']);
$router->addRoute('eleve_search_info', 'eleve_info/search/{search}', [EleveController::class, 'eleve_info']);
$router->addRoute('eleve_search_detail', 'eleve_detail/search/{code}', [EleveController::class, 'eleve_detail']);

//versement
$router->addRoute('versement_accueil', 'versement/accueil', [VersementController::class, 'accueil']);
$router->addRoute('versement', 'versement', [VersementController::class, 'index']);
$router->addRoute('versement-create', 'versement/create/{code}', [VersementController::class, 'save']);
$router->addRoute('versement_facture', 'versement/print/{code}', [VersementController::class, 'imprimer_facture']);
$router->addRoute('versement-preview', 'versement/preview/{code}', [VersementController::class, 'preview']);

$router->addRoute('versement_liste', 'versement/detail', [VersementController::class, 'liste_abonnee']);
$router->addRoute('versement_info', 'versement/info/', [VersementController::class, 'info']);

//Printer Report
$router->addRoute('print', 'print/{model}', [PrinterController::class, 'index']);

//Eleve
$router->crudRoute('activite', ActiviteController::class);

//Eleve
$router->crudRoute('type_activite', TypeActiviteController::class);

//Eleve
$router->crudRoute('inscription_activite', InscriptionActiviteController::class);

//cantine_liste
//$router->crudRoute('cantine_liste', CantineListeController::class);

//prix_abonnement
$router->crudRoute('prix_abonnement', PrixAbonnementController::class);

//Eleve
$router->crudRoute('abonnement_activite', AbonnementActiviteController::class);

//Eleve
$router->crudRoute('personnel_activite', AbonnementActiviteController::class);

//Eleve
$router->crudRoute('eleve', EleveController::class);


//class
$router->crudRoute('classe', ClasseController::class);

//salle de classe
$router->crudRoute('salle_classe', SalleClasseController::class);

//pension classe
$router->crudRoute('pension_classe', PensionClasseController::class);

//document
$router->crudRoute('document', DocumentController::class);

//etat_document
$router->crudRoute('etat_document', EtatDocumentController::class);

//exemplaire
$router->crudRoute('exemplaire', ExemplaireController::class);

//domaine
$router->crudRoute('domaine', DomaineController::class);

//cycle
$router->crudRoute('cycle', CycleController::class);

//Periode
$router->crudRoute('periode', PeriodeController::class);

//session
$router->crudRoute('session', SessionController::class);

//repas
$router->crudRoute('repas', RepasController::class);

//statut_apprenant
$router->crudRoute('statut_apprenant', StatutApprenantController::class);

//pays
$router->crudRoute('pays', PaysController::class);

//bulletin
$router->crudRoute("bulletin", BulletinController::class);

//annee_scolaire
$router->crudRoute('annee_scolaire', AnneeScolaireController::class);

//type_paiement
$router->crudRoute('type_paiement', TypePaiementController::class);

//affectation_classe_matiere
$router->crudRoute("affectation_classe_matiere", AffectationClasseMatiereController::class);

//tranche_scolaire
$router->crudRoute('tranche_scolaire', TrancheScolaireController::class);

//tranche_horaire
$router->crudRoute('tranche_horaire', TrancheHoraireController::class);

//type_personnel
$router->crudRoute('type_personnel', TypePersonnelController::class);

//type_pension
$router->crudRoute('type_pension', TypePensionController::class);

//Personnel
$router->crudRoute('personnel', PersonnelController::class);
$router->addRoute('ajout_personnel', 'personnel/nouveau', [PersonnelController::class, 'ajout']);
$router->addRoute('personnel_liste', 'personnel/detail', [PersonnelController::class, 'liste_abonnee']);
$router->addRoute('personnel_api_getall', 'personnel/api/all', [PersonnelController::class, 'getApiPersonnels']);

//AFFECTATION
$router->addRoute('affection_salle_enseignant', 'affectation/enseignant_salle', [AffectionController::class, 'ajout']);


//Cantine
$router->crudRoute('cantine', CantineController::class);
$router->addRoute('abonnement_cantine', 'cantine/abonnement', [CantineController::class, 'abonnement_cantine']);
$router->addRoute('enregistrement_cantine', 'cantine/create/{code}', [CantineController::class, 'save']);
$router->addRoute('facture_cantine', 'cantine/facture/{code}', [CantineController::class, 'imprimer_facture']);
$router->addRoute('cantine_liste', 'cantine/detail', [CantineController::class, 'liste_abonnee']);
$router->addRoute('cantine_abonnement_info', 'cantine/abonnement_info/', [CantineController::class, 'abonnement_info']);


//BIBLIOTHEQUE
$router->addRoute('biblio_ajout_livre', 'biblio/ajout_livre', [BiblioController::class, 'ajouterLivre']);
$router->addRoute('biblio_ajout_exemplaire', 'biblio/ajout_exemplaire', [BiblioController::class, 'ajouterExemplaire']);
$router->addRoute('biblio_activite', 'biblio/activite', [BiblioController::class, 'activite']);
$router->addRoute('biblio_historique', 'biblio/historique', [BiblioController::class, 'afficherHistorique']);
$router->addRoute('biblio_dashboard', 'biblio/dashboard', [BiblioController::class, 'dashboard']);
$router->addRoute('biblio_emprunt', 'biblio/emprunt', [BiblioController::class, 'emprunt']);
$router->addRoute('biblio_api_emprunt_save', 'biblio/api/emprunt/save', [BiblioController::class, 'enregistrerEmprunt']);
$router->addRoute('biblio_api_emprunt_liste', 'biblio/api/emprunt/all', [BiblioController::class, 'getListeEmprunt']);
$router->addRoute('biblio_api_restitution', 'biblio/api/restitution/{code}', [BiblioController::class, 'enregistrerRestitution']);
$router->addRoute('biblio_api_alerte', 'biblio/api/alerte/{code}', [BiblioController::class, 'alerte']);


//Cours - Affectation des matieres aux enseignants dans des classes
$router->crudRoute('cours', CoursController::class);

//Discipline
$router->crudRoute('discipline', DisciplineController::class);

//Matiere
$router->crudRoute('matiere', MatiereController::class);


//emploie de temps
$router->crudRoute('emploie_temps', EmploieTempsController::class);

// FOR DEVELOPEMENT TEST FUNCTION
$router->addRoute('test', 'test', [TestController::class, 'test']);
$router->addRoute('testr', 'testr', [TestController::class, 'testr']);
$router->addRoute('test-sql', 'testsql', [TestController::class, 'testSQL']);
$router->addRoute('test-pdf', 'testpdf', [TestController::class, 'testpdf']);
$router->addRoute('test-alert', 'test', [TestController::class, 'testAlert']);
$router->addRoute('testa', 'testa', [TestController::class, 'testA']);
$router->addRoute('testb', 'testb', [TestController::class, 'testB']);
$router->addRoute('testc', 'testc', [TestController::class, 'testC']);

