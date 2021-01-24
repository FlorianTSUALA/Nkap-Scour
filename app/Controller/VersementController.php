<?php

namespace App\Controller;

use Exception;
use App\Helpers\S;
use Core\Model\Model;
use App\Model\DBTable;
use App\Model\Periode;
use Core\Session\Request;
use App\Helpers\DateHelpers;
use function Core\Helper\dd;
use function Core\Helper\vd;
use App\Model\AbonnementDetail;
use App\Model\AbonnementCantine;
use App\Model\AbonnementActivite;
use App\Model\Facture;
use App\Model\PensionEleve;
use ClanCats\Hydrahon\Query\Expression as Ex;

class VersementController extends AppController
{
    
    public function __construct()
    {
        parent::__construct();

        // $this->vairant = DBTable::versement;
        // $this->folder_view_index = 'versement.index';

        // $this->loadModel($this->vairant);
        $this->base_route = 'versement';
        // $this->class_name = 'pension_eleve';

        $this->title_page = 'Gestion des versements - Comelines';
        $this->title_home = 'Gestion des versements';
        $this->create_title = "Creation d'un versement";
        $this->view_title = "Information d'un versement";
        $this->update_title = "Mise à jour d'un versement";
        $this->delete_title = "Suppression d'un versement";
        $this->msg_delete = "Voulez-vous vraiment supprimer ce versement ";
    }

    /*
    *  **   * Renvoie le formulaire de versement
    */
    public function index()
    {
        $title = "Gestion des frais scolaires";
        $this->app->setTitle($this->title_page);
        // $fillables = $this->{$this->vairant}->fillables;
        // $class_name = $this->class_name;
        $base_route = $this->base_route;
        $create_title = $this->create_title;
        $view_title = $this->view_title;
        $update_title = $this->update_title;
        $delete_title = $this->delete_title;
        $msg_delete = $this->msg_delete;

        $eleves = DBTable::getModel('eleve')
                    ->select(
                        [
                            new Ex("concat(eleve.nom,' ',eleve.prenom) as libelle"),
                            'eleve.code' => 'id',
                            'eleve.matricule' => 'matricule',
                            'eleve.date_naissance' => 'date_naissance',
                            'eleve.lieu_naissance' => 'lieu_naissance'
                        ]
                    )
                    ->where('visibilite', '=', 1)
                    ->get();

        $classes = DBTable::getModel('classe')->select(['code'=>'id', 'libelle' => 'libelle'])->where('visibilite', '=', 1)->get();

        //Liste des prix associés aux offres de la cantine
        //$abonnement_cantine = DBTable::getModel('abonnement_cantine')->select(['code'=>'id', 'libelle' => 'libelle', 'montant'=>'montant'])->where('code', '=', 'MOIS')->where('visibilite', '=', 1)->one();
        // var_dump($abonnement_cantine); die();
        $annee_scolaires = DBTable::getModel('annee_scolaire')
                            ->select(['code'=>'id', 'libelle' => 'libelle'])
                            ->where('visibilite', '=', 1)
                            ->where('statut', '=', 1)
                            ->orderBy('date_creation', 'desc')
                            ->get();


        $statut_apprenants = DBTable::getModel('statut_apprenant')
                            ->select(['code'=>'id', 'libelle' => 'libelle'])
                            ->where('visibilite', '=', 1)
                            ->orderBy('date_creation', 'desc')
                            ->get();

        $pension_classe = DBTable::getModel('pension_classe')
            ->select(
                [
                    'classe.code' => 'classe',
                    'type_pension.code' => 'type_pension',
                    'pension_classe.code' => 'id',
                    'pension_classe.montant' => 'montant',
                    'pension_classe.est_mensuel' => 'est_mensuel',
                    'pension_classe.mensualite' => 'mensualite',
                    'pension_classe.libelle' => 'libelle'
                ]
            )
            ->join('classe', 'classe.id', '=', 'pension_classe.classe_id')
            ->join('type_pension', 'type_pension.id', '=', 'pension_classe.type_pension_id')
            ->where('pension_classe.visibilite', '=', 1)
            ->get();

        $pension_classe = json_encode($pension_classe);

        $salle_classes = DBTable::getModel('salle_classe')->select(['code'=>'id', 'libelle' => 'libelle'])->where('visibilite', '=', 1)->get();
        $type_paiements = DBTable::getModel('type_paiement')->select(['code'=>'id', 'libelle' => 'libelle'])->where('visibilite', '=', 1)->get();

        $type_pensions = DBTable::getModel('type_pension')->select(['code'=>'id', 'libelle' => 'libelle'])->where('visibilite', '=', 1)->get();
        $activites = DBTable::getModel('activite')->select(['code'=>'id', 'libelle' => 'libelle', 'montant' => 'montant'])->where('visibilite', '=', 1)->get();
        
        $prix_abonnement_cantine = DBTable::getModel('prix_abonnement')
                            ->select('prix_abonnement.montant')
                            ->where('visibilite', '=', 1)
                            ->where('periode', '=', 'MOIS')
                            ->where('type_abonnement', '=', 'CANTINE')
                            //->where('type_abonnement_id', '=', 0)
                            ->one()['montant']; 
                   
        $prix_abonnement_activites = DBTable::getModel('prix_abonnement')
                            ->select(
                                [
                                    'prix_abonnement.code' => 'id',
                                    'prix_abonnement.montant' => 'montant',
                                    'prix_abonnement.periode' => 'periode',
                                    'prix_abonnement.description' => 'description'
                                ]
                            )
                            ->where('visibilite', '=', 1)
                            ->where('type_abonnement', '=', 'ACTIVITE')
                            //->where('type_abonnement_id', '=', 0)
                            ->get();

        // Tranche de l'annee scolaire en cours
        $tranche_scolaires = DBTable::getModel('tranche_scolaire')
        ->select(['code'=>'id', 'libelle' => 'libelle'])
        // ->join()
        ->where('visibilite', '=', 1)
        // ->where('statut', '=', 1)
        ->get();

        $this->render('sections.versement.versement_scolarite', compact(
            //'abonnement_cantine',
            //'class_name', 'base_route', 'title', 'create_title', 'view_title', 'update_title', 'delete_title', 'msg_delete',
            'activites',
            'title',
            'classes',
            'statut_apprenants',
            'annee_scolaires',
            'eleves',
            'pension_classe',
            'salle_classes',
            'type_pensions',
            'type_paiements',
            'tranche_scolaires',
            'prix_abonnement_activites',
            'prix_abonnement_cantine'
        ));
    }

    /*
    *  Enregistre les informations de  versement et retpurne le status d'enregistrement
    */
    public function save($code)
    {
        dd($_POST);
        $eleve = DBTable::getModel('eleve')->select()->find($code, 'code');
        $eleve_id = $eleve->id;
        $classe = DBTable::getModel('classe')->select()->find(Request::getSecParam('classe_id', ''), 'code');
        $classe_id = $classe->id;

        $montant_paye = Request::getSecParam('montant_paye');;
        $nom_eleve = Request::getSecParam('nom_eleve');;
        $reduction = Request::getSecParam('reduction');;
        $date_facture = Request::getSecParam('date_facture');;
        // $motif =  Request::getSecParam('motif');
        // $reste =  Request::getSecParam('reste');
        // $autre =  Request::getSecParam('autre');
        $reduction =  Request::getSecParam('reduction');
        $reference =  Request::getSecParam('reference');
        $date_paiement =  Request::getSecParam('date_paie');
        // $date_paiement =  date('Y-m-d H:i:s');

        $statut_apprenant_id = Model::getId(DBTable::STATUT_APPRENANT, Request::getSecParam('statut_apprenant_id', ''));
        $annee_scolaire_id = Model::getId(DBTable::ANNEE_SCOLAIRE, Request::getSecParam('annee_scolaire_id', ''));
        $type_paiement_id = Model::getId(DBTable::TYPE_PAIEMENT, Request::getSecParam('type_paiement_id', ''));
        
        //Facture
            $model_facture = DBTable::getModel(DBTable::FACTURE);
            $code_facture = Facture::generateCode();
            $data_facture = [
                'code' => $code_facture,
                'type_paiement_id' => $type_paiement_id,
                'libelle' => 'Facture versment',
                'reference' => $reference,
                'beneficiaire' => $nom_eleve,
                'gestionnaire' => 'Secretaire',
                'montant' => $montant_paye,
                'reduction' => $reduction,
                'date_facture' => $date_facture,
                'description' => '',
            ];
            $model_facture->insert($data_facture)->execute();
            $facure_id = Model::getId(DBTable::FACTURE, $code_facture);
        //Facture

        //AUTRES
            $autres = $_POST['autres'];
            $motif = $autres['type_pension'];
            $montant = $autres['montant'];
            $reduction = $autres['remise'];
            
    
            $model_pension_eleve = DBTable::getModel(DBTable::PENSION_ELEVE);

            $data_pension_eleve_autre = [
                'code' => PensionEleve::generateCode(),
                'facture_id' => $facure_id,
                'type_pension_id' => null,
                'pension_classe_id' => null,
                'tranche_scolaire_id' => null,
                'classe_id' => $classe_id,
                'eleve_id' => $eleve_id,
                'montant' => $montant,
                'reduction' => $reduction,
                'motif' => $motif,
                'quantite' => 1
            ];
            $model_pension_eleve->insert($data_pension_eleve_autre)->execute();;
        //AUTRES


        //CANTINE
            $cantines = $_POST['cantines'];
           
            $items = $cantines['recapitulatif'];
            
            $hasDiscountinous = true;
            $i = 0;
            $j = 0;

            for($i = 0; $i<count($items); $i++){

                $prev_index_month = DateHelpers::getIndexMonth($items[$i]['value']);
                $current_index_month = $prev_index_month;
                
                if(($i+1) == count($items)){
                    $j = $i;
                }else{
                    for ($j = $i+1; $j<count($items); $j++) {
                        $current_index_month = DateHelpers::getIndexMonth($items[$j]['value']);
                        if($current_index_month != ($prev_index_month + 1)){
                            break;
                        }
                        $prev_index_month = $current_index_month;
                    }
                }

                $start_date = DateHelpers::getFirstDayOfMonthByStrFrMonth(DateHelpers::getIndexToEnStrMonth($current_index_month-($j-$i)));
                $end_date = DateHelpers::getLastDayOfMonthByStrFrMonth(DateHelpers::getIndexToEnStrMonth($current_index_month));

                $model_cantine = DBTable::getModel(DBTable::ABONNEMENT_CANTINE);
                $code_cantine = AbonnementCantine::generateCode();
                $data_abonnment_cantine = [
                    'code' => $code_cantine,
                    'eleve_id' => $eleve_id,
                    'montant' => $cantines['montant'] * $cantines['multiplicateur'] ,
                    'reduction' => $cantines['remise'],
                    'date_debut' => $start_date,
                    'date_fin' => $end_date,
                ];
                
                $result_abonnement_cantine = $model_cantine->insert($data_abonnment_cantine)->execute();
                $abonnement_cantine_id = Model::getId(DBTable::ABONNEMENT_CANTINE, $code_cantine);
                
                for ($k = $i; $k<$j; $k++) {
                    
                    $item = $items[$k];
                    $mois = $item['value'];
                    $start_day = DateHelpers::getFirstDayOfMonthByStrFrMonth($mois);
                    $end_day = DateHelpers::getLastDayOfMonthByStrFrMonth($mois);
                
                    $abonnement_detail = DBTable::getModel(DBTable::ABONNEMENT_DETAIL);
                    $data_abonnment_detail = [
                        'code' => AbonnementDetail::generateCode(),
                        'cantine_id' => $abonnement_cantine_id,
                        'periode' =>  'MOIS',
                        'multiplicateur' => $cantines['multiplicateur'],
                        'total' =>  $cantines['montant'] * $cantines['multiplicateur'],
                        'prix_unitaire' =>  $cantines['montant'],
                        'date_debut' =>  $start_day,
                        'date_fin' =>  $end_day
                    ];
                    $abonnement_detail->insert($data_abonnment_detail)->execute();

                }
                $i = $j;
                
            }
        
        //CANTINE


        //ACTIVITE

            $activites = $_POST['activites'];
            
            $items = $activites['recapitulatif'];
            $reduction = $activites['remise'];

            $hasDiscountinous = true;
            $i = 0;
            $j = 0;

            for($i = 0; $i<count($items); $i++){

                $prev_index_month = DateHelpers::getIndexMonth($items[$i]['value']);
                $current_index_month = $prev_index_month;
                
                if(($i+1) == count($items)){
                    $j = $i;
                }else{
                    for ($j = $i+1; $j<count($items); $j++) {
                        $current_index_month = DateHelpers::getIndexMonth($items[$j]['value']);
                        if($current_index_month != ($prev_index_month + 1)){
                            break;
                        }
                        $prev_index_month = $current_index_month;
                    }
                }

                $start_date = DateHelpers::getFirstDayOfMonthByStrFrMonth(DateHelpers::getIndexToEnStrMonth($current_index_month-($j-$i)));
                $end_date = DateHelpers::getLastDayOfMonthByStrFrMonth(DateHelpers::getIndexToEnStrMonth($current_index_month));

                $model_abonnement_activite = DBTable::getModel(DBTable::ABONNEMENT_ACTIVITE);
                $code_abonnement_activite = AbonnementActivite::generateCode();

                $data_abonnement_activite = [
                    'code' => $code_abonnement_activite,
                    'eleve_id' => $eleve_id,
                    'montant' => $activites['montant'] * $activites['multiplicateur'] ,
                    'reduction' => $activites['remise'],
                    'date_debut' => $start_date,
                    'date_fin' => $end_date,
                ];
                
                $result_abonnement_cantine = $model_cantine->insert($data_abonnement_activite)->execute();
                $abonnement_activite_id = Model::getId(DBTable::ABONNEMENT_CANTINE, $code_abonnement_activite);
                
                for ($k = $i; $k<$j; $k++) {
                    
                    $item = $items[$k];
                    $mois = $item['value'];
                    $start_day = DateHelpers::getFirstDayOfMonthByStrFrMonth($mois);
                    $end_day = DateHelpers::getLastDayOfMonthByStrFrMonth($mois);
                
                    $abonnement_detail = DBTable::getModel(DBTable::ABONNEMENT_DETAIL);
                    $data_abonnment_detail = [
                        'code' => AbonnementDetail::generateCode(),
                        'cantine_id' => $abonnement_activite_id,
                        'periode' =>  'MOIS',
                        'multiplicateur' => $activites['multiplicateur'],
                        'total' =>  $activites['montant'] * $activites['multiplicateur'],
                        'prix_unitaire' =>  $activites['montant'],
                        'date_debut' =>  $start_day,
                        'date_fin' =>  $end_day
                    ];
                    $abonnement_detail->insert($data_abonnment_detail)->execute();

                }
                $i = $j;
                
            }
        
        //ACTIVITE

        
        //PENSION ELEVE
        $data_pension = $_POST['pension_classe'];
        $abonnement_activite = DBTable::getModel('abonnement_activite');

        foreach ($data_pension as $item) {
        
            $data['reduction'] = $reduction;
            $data['code'] = Model::generateCode();
            $data['type_paiement_id'] = $type_paiement_id;
        
            if (isset($multiplicateur) && is_array($multiplicateur)) {
                foreach ($multiplicateur as $tranche) {

                    $mois  =  $tranche['value'];
                    $tranche_id =  $tranche['id'];
                    $index_mois = DateHelpers::getStrIndexMonth($mois);
                    

                    $query_date = date('01-'.$index_mois.'-'.date("Y"));

                    // First day of the month.
                    $date_debut =  date('Y-m-01', strtotime($query_date));

                    // Last day of the month.
                    $date_fin = date('Y-m-t', strtotime($query_date));

                    $date_debut = date("Y-m-1", strtotime("-1 month") ) ;
        
                    $date_fin = date("Y-m-t", strtotime("-1 month") ) ;

                    $data = [];
                    $date_paiement = $date_paiement;
                    $date_debut = $item['date_debut'];
                    $date_fin = $item['date_fin'];
                    $periode = $item['periode'];
                    $multiplicateur = $item['recapitulatif'];
                    $montant_unitaire = $item['mensualite'];
                    $montant_total = $item['montant'];

                    $data['date_paiement'] = $date_paiement;
                    $data['date_debut'] = $date_debut;
                    $data['date_fin'] = $date_fin;
                    $data['periode'] = $periode;
                    $data['multiplicateur'] = $multiplicateur;
                    $data['montant_unitaire'] = $montant_unitaire;
                    $data['montant_total'] = $montant_total;
                    
                    $data['tranche_scolaire_id'] = Model::getId('tranche_scolaire', $tranche['id']);
                    $data['montant'] = $mensualite;

                
                    try {
                        var_dump($data);
                        $result = $abonnement_activite->insert($data)->execute();
                    } catch (Exception $ex) {
                    }
                }
            } else {
                $data = [];
                $date_paiement = $item['date_paiement'];
                $date_debut = $item['date_debut'];
                $date_fin = $item['date_fin'];
                $periode = $item['periode'];
                $multiplicateur = $item['recapitulatif'];
                $montant_unitaire = $item['mensualite'];
                $montant_total = $item['montant'];


                
                $data['date_paiement'] = $date_paiement;
                $data['date_debut'] = $date_debut;
                $data['date_fin'] = $date_fin;
                $data['periode'] = $periode;
                $data['multiplicateur'] = $multiplicateur;
                $data['montant_unitaire'] = $montant_unitaire;
                $data['montant_total'] = $montant_total;
                
                $data['tranche_scolaire_id'] = null;
                try {
                    var_dump($data);
                    $result = $abonnement_activite->insert($data)->execute();
                } catch (Exception $ex) {
                }
            }

        }
        //PENSION ELEVE

    }

    public function print(){
        
        // $periode
        // $date_debut
        // $date_fin
        // $prix_unitaire
        // $quantite
        // $total
        // , compact('date_facturation', 'eleve', 'classe', 'reference', 'remise', 'reste', 'solde_paye', 'sous_total', 'items'), 'facture_cantine'
        $this->renderPDF('reports.versement' );  

    }

}
