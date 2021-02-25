<?php

namespace App\Controller;

use App\Model\Eleve;
use Core\Model\Model;
use App\Model\DBTable;
use App\Model\Parcours;
use Core\Helper\DBHelper;
use Core\Session\Request;
use App\Model\PensionEleve;
use Core\HTML\FlashMessages;
use function Core\Helper\dd;

use function Core\Helper\vd;
use Spipu\Html2Pdf\Html2Pdf;
use App\Model\DossierMedical;
use App\Model\DossierParental;
use App\Model\StatutApprenant;
use App\Model\AntecedentScolaire;
use App\Repository\ClasseRepository;
use App\Repository\CantineRepository;
use App\Repository\DocumentRepository;
use App\Model\AffectationClasseMatiere;
use App\Repository\PersonnelRepository;
use ClanCats\Hydrahon\Query\Expression;
use App\Repository\AnneeScolaireRepository;
use Core\HTML\MessageFlash\FlashMessagesStatic;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;
use App\Repository\AffectationSalleClasseRepository;

class TestController extends AppController
{

    public function __construct()
    {
        parent::__construct();
        $this->loadModel('cycle');
    }

    public function test()
    {
        
        $classes = DBTable::getModel(DBTable::ELEVE)
                    ->select(['code' => 'id', 'libelle' => 'value'])
                    ->join(DBTable::DOSSIER_PARENTAL, DossierParental::ID, '=', Eleve::DOSSIER_PARENTAL_ID)
                    ->join(DBTable::DOSSIER_MEDICAL, DossierMedical::ID, '=', Eleve::DOSSIER_MEDICAL_ID)
                    ->join(DBTable::ANTECEDENT_SCOLAIRE , AntecedentScolaire::ID, '=', Eleve::ANTECEDENT_SCOLAIRE_ID)
                    ->join(DBTable::PARCOURS, Parcours::ID, '=', Eleve::PARCOURS_ID)
                    ->join(DBTable::PENSION_ELEVE , StatutApprenant::ID, '=', Eleve::Stat)
                    ->join(DBTable::PENSION_ELEVE , PensionEleve::ID, '=', Eleve::PENSION_Eleve_ID)
                    ->join(DBTable::PENSION_ELEVE , PensionEleve::ID, '=', Eleve::PENSION_Eleve_ID)
                    ->join(DBTable::PENSION_ELEVE , PensionEleve::ID, '=', Eleve::PENSION_Eleve_ID)
                    ->join(DBTable::PENSION_ELEVE , PensionEleve::ID, '=', Eleve::PENSION_Eleve_ID)
                    ->join(DBTable::PENSION_ELEVE , PensionEleve::ID, '=', Eleve::PENSION_Eleve_ID)
                    ->join(DBTable::PENSION_ELEVE , PensionEleve::ID, '=', Eleve::PENSION_Eleve_ID)
                    // ->join(DBTable::ANNEE_SCOLAIRE , '', '', '')
                    ->where('visibilite', '=', 1)->get();
 
        // die("Hello");
        $this->render("test");  
    }

    public function testSQL()
    {
        $repository = new AffectationSalleClasseRepository();
        $result = $repository->getEnseignantNonAffecte();
        dd($result);
    }

    public function testpdf()
    {
    
        $date_facturation = 'Mardi, 24 Novembre 2020';
        $eleve = 'kakambi franck';
        $classe = 'Petite-section';
        $reference = 'AC45FA4464';
        $remise = '156';
        $reste = '0';
        $solde_paye = '0';
        $sous_total = '0';
        $items = [];
        $this->renderPDF('reports.cantine', compact('date_facturation', 'eleve', 'classe', 'reference', 'remise', 'reste', 'solde_paye', 'sous_total', 'items'), 'facture_cantine' );  
    
    }

    public function testAlert()
    {
        $filter_by = 'ALL';
        $code = '';
        $start_date = '2022-01-01';
        // $end_date = '';
        
        $cantine_repository = new CantineRepository();
        $items = $cantine_repository->getInfoByClasseDate($start_date, $filter_by, $code);
        dd($items);   
    }

    public function testA()
    {
        
        $repository = new classeRepository();
        $items = (new classeRepository())->getSalleClasseGroupByClasse();
        dd($items);
    }

    public function testB()
    {
        $annee_scolaire =  (new AnneeScolaireRepository())->getActive('id');

        $req = "
            select * from facture
            left
            
        
        ";

        $abonnements = DBTable::getModel(DBTable::ABONNEMENT_CANTINE)
        ->select(
            [
                'abonnement_cantine.code'=> 'id', 
                'abonnement_cantine.date_paiement'=> 'date_paiement', 
                'abonnement_cantine.date_debut'=> 'date_debut ', 
                'abonnement_cantine.date_fin'=> 'date_fin', 
                'abonnement_cantine.montant_total'=> 'montant_total', 
                'classe.libelle'=> 'classe', 
                'classe.code'=> 'code_classe', 
                new Expression("concat(eleve.nom,' ',eleve.prenom) as nom_eleve"),
                'eleve.code' => 'eleve_id'
            ]
        )
        ->join('eleve', 'eleve.id', '=', 'abonnement_cantine.eleve_id')
        ->join('parcours', 'eleve.id', '=', 'parcours.eleve_id')
        ->join('classe', 'parcours.classe_id', '=', 'classe.id')
        // ->where('parcours.annee_scolaire_id', '=', $annee_scolaire)
        ->get();
        dd($abonnements);
    }

    public function testB1()
    {
        $annee_scolaire =  (new AnneeScolaireRepository())->getActive('id');

        $abonnements = DBTable::getModel(DBTable::ABONNEMENT_CANTINE)
        ->select(
            [
                'abonnement_cantine.code'=> 'id', 
                'abonnement_cantine.date_paiement'=> 'date_paiement', 
                'abonnement_cantine.date_debut'=> 'date_debut ', 
                'abonnement_cantine.date_fin'=> 'date_fin', 
                'abonnement_cantine.montant_total'=> 'montant_total', 
                'classe.libelle'=> 'classe', 
                'classe.code'=> 'code_classe', 
                new Expression("concat(eleve.nom,' ',eleve.prenom) as nom_eleve"),
                'eleve.code' => 'eleve_id'
            ]
        )
        ->join('eleve', 'eleve.id', '=', 'abonnement_cantine.eleve_id')
        ->join('parcours', 'eleve.id', '=', 'parcours.eleve_id')
        ->join('classe', 'parcours.classe_id', '=', 'classe.id')
        ->join('pension_classe', 'pension_classe.classe_id', '=', 'parcours.classe_id')
        // ->where('parcours.visibilite', '=', 1)
        // ->where('parcours.annee_scolaire_id', '=', $annee_scolaire)
        ->get();
        dd($abonnements);
    }

    public function testC()
    {
        // $this->    
    }


}