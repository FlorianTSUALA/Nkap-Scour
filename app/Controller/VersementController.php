<?php

namespace App\Controller;

use Exception;
use App\Helpers\S;
use Core\Model\Model;
use App\Model\DBTable;
use App\Model\Facture;
use App\Model\Periode;
use App\Helpers\Helpers;
use Core\Session\Request;
use App\Model\PensionEleve;
use function Core\Helper\dd;
use function Core\Helper\vd;
use App\Model\AbonnementDetail;
use App\Model\AbonnementCantine;
use App\Model\AbonnementActivite;
use App\Repository\AnneeScolaireRepository;
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
        $annee_scolaires =  (new AnneeScolaireRepository())->getAll();



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


        $ids_pension_eleve = [];
        $ids_pension_abonnement_detail = [];
        $ids_pension_cantine = [];
        $ids_pension_activite = [];


        // vd('welcome');
        $eleve_id = DBTable::getModel('eleve')->select()->find($code, 'code')['id'];
        $classe_id = DBTable::getModel('classe')->select()->find(Request::getSecParam('classe_id', ''), 'code')['id'];
        // var_dump($classe_id);
        $montant_paye = Request::getSecParam('montant_paye', 0);
        $nom_eleve = Request::getSecParam('nom_eleve', 0);
        $reduction = Request::getSecParam('reduction', 0);
        $date_facture = date('Y-m-d') ;
        // $motif =  Request::getSecParam('motif');
        // $reste =  Request::getSecParam('reste');
        // $autre =  Request::getSecParam('autre');
        // $reduction =  Request::getSecParam('reduction');
        $reference =  Request::getSecParam('reference', 0);
        $date_paiement =  Request::getSecParam('date_paiement');
        // $date_paiement =  date('Y-m-d H:i:s');

        $statut_apprenant_id = Model::getId(DBTable::STATUT_APPRENANT, Request::getSecParam('statut_apprenant_id', ''));
        $annee_scolaire_id = Model::getId(DBTable::ANNEE_SCOLAIRE, Request::getSecParam('annee_scolaire_id', ''));
        $type_paiement_id = Model::getId(DBTable::TYPE_PAIEMENT, Request::getSecParam('type_paiement_id', ''));
    //    vd('ok begin '.$montant_paye);
        
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
            $result_facture = $model_facture->insert($data_facture)->execute();
            $facure_id = Model::getId(DBTable::FACTURE, $code_facture);
        //Facture
        //  vd('ok Facture');

        
    
    //PENSION ELEVE
            $data_pension = $_POST['pension_classe'];


            //vd( $data_pension );
            foreach ($data_pension as $item) {

                $motif = $item['type_pension'];
                $montant = $item['montant'];
                $reduction = $item['reduction'];
                $type_pension_code = $item['type_pension_code'];
                $pension_classe_code = $item['pension_classe_code'];
                $est_mensuel = $item['est_mensuel'];
                $quantite = $item['recapitulatif'];

                $type_pension_id = Model::getId(DBTable::TYPE_PENSION, $type_pension_code);
                $pension_classe_id = Model::getId(DBTable::PENSION_CLASSE, $pension_classe_code);

                if($est_mensuel == 1){    
                    foreach($item['multiplicateur'] as $tranche){
                        {
                            $model_pension_eleve = DBTable::getModel(DBTable::PENSION_ELEVE);

                            $tranche_scolaire_code = $tranche['id'];
                            $tranche_scolaire_id = Model::getId(DBTable::TRANCHE_SCOLAIRE, $tranche_scolaire_code);

                            $motif = 'Payement Periodique - '.$tranche['value'];
                            $code_pension_eleve = PensionEleve::generateCode();

                            $data_pension_eleve = [
                                'code' => $code_pension_eleve,
                                'facture_id' => $facure_id,
                                'type_pension_id' => $type_pension_id,
                                'pension_classe_id' => $pension_classe_id,
                                'tranche_scolaire_id' => $tranche_scolaire_id,
                                'classe_id' => $classe_id,
                                'eleve_id' => $eleve_id,
                                'montant' => $montant,
                                'reduction' => $reduction,
                                'motif' => $motif,
                                'quantite' => 1
                            ];
                            
                            $model_pension_eleve->insert($data_pension_eleve)->execute();
                            $pension_eleve_id = Model::getId(DBTable::PENSION_ELEVE, $code_pension_eleve);
                            array_push($ids_pension_eleve, $pension_eleve_id);
                        }
                    }
                }else{
                    {
                        $model_pension_eleve = DBTable::getModel(DBTable::PENSION_ELEVE);

                        $motif = 'Payement Non periodique';
                        $code_pension_eleve = PensionEleve::generateCode();
                        
                        $data_pension_eleve_autre = [
                            'code' => $code_pension_eleve,
                            'facture_id' => $facure_id,
                            'type_pension_id' => $type_pension_id,
                            'pension_classe_id' => $pension_classe_id,
                            'tranche_scolaire_id' => null,
                            'classe_id' => $classe_id,
                            'eleve_id' => $eleve_id,
                            'montant' => $montant,
                            'reduction' => $reduction,
                            'motif' => $motif,
                            'quantite' => $quantite
                        ];

                        $model_pension_eleve->insert($data_pension_eleve_autre)->execute();
                        $pension_eleve_id = Model::getId(DBTable::PENSION_ELEVE, $code_pension_eleve);
                        array_push($ids_pension_eleve, $pension_eleve_id);
                    }
                }
            }
        //  vd('ok Pension eleve');

    //PENSION ELEVE
    

    //ACTIVITE

        $activites = $_POST['activites'];
        
        $items = $activites['multiplicateur']??[];
        $reduction = $activites['remise'];
        


        $k = 0;
        foreach($activites['activites'] as $activite){
            $nom_activite = $activite['value'];
            $code_activite = $activite['id'];
            $montant_activite = $activite['montant'];
            
            $i = 0;
            $j = 0;

            // vd(($items));
            // vd(($activites));
            $z = 0;
            for ($i = 0; $i<count($items); $i++) {

                $prev_index_month = Helpers::strFrMonth2Index($items[$i]['value']);
                $current_index_month = $prev_index_month;
                
                $isLast = ($i+1) == count($items);

                if (!$isLast)
                    for ($j = $i+1; $j<count($items); $j++) {
                        $current_index_month = Helpers::strFrMonth2Index($items[$j]['value']);
                        $x = ($prev_index_month + 1);
                        $y = ($current_index_month + 0);
                        
                        if ($y != $x) break;  
    
                        $prev_index_month = $current_index_month;
                    }
                else
                    $j = $i;

                $offset = $j - 1 - $i;
                $quantite = $offset + 1;
                // vd(" --- OFFSET : $offset ----");
                $total = count($items);
                // echo "---- TOtal = {$total}i = $i; j = $j; --- OFFSET : $offset ---- <br/>";
                
                if ($quantite < 0) break;
                $quantite = ($isLast)? 1 : $offset;

                $start_date = Helpers::getFirstDayOfMonthByStrFrMonth( $items[$i]['value'] );
                $end_date = Helpers::getLastDayOfMonthByStrFrMonth(  Helpers::addFrMonth( $items[$i]['value'], $offset) );

                $model_abonnement_activite = DBTable::getModel(DBTable::ABONNEMENT_ACTIVITE);
                $code_abonnement_activite = AbonnementActivite::generateCode();

                $data_abonnement_activite = [
                    'code' => $code_abonnement_activite,
                    'facture_id' => $facure_id,
                    'eleve_id' => $eleve_id,
                    'montant_total' => $montant_activite * $activites['recapitulatif'],
                    'reduction' => $activites['remise'],
                    'date_debut' => $start_date,
                    'date_fin' => $end_date,
                ];
                
                $result_abonnement_activite = $model_abonnement_activite->insert($data_abonnement_activite)->execute();
                $abonnement_activite_id = Model::getId(DBTable::ABONNEMENT_CANTINE, $code_abonnement_activite);
                array_push($ids_pension_activite, $abonnement_activite_id);

                $abonnement_detail = DBTable::getModel(DBTable::ABONNEMENT_DETAIL);
                
                $code_abonnement_detail = AbonnementDetail::generateCode();
                
                $data_abonnment_detail = [
                    'code' => $code_abonnement_detail,
                    'abonnement_id' => $abonnement_activite_id,
                    'periode' =>  'MOIS',
                    'type_abonnement' => 'ACTIVITE',
                    'multiplicateur' => $quantite,
                    'total' =>  $activite['montant'] * $quantite,
                    'prix_unitaire' =>  $activite['montant'],
                    'date_debut' =>  $start_date,
                    'date_fin' =>  $end_date
                ];
                
                $result_abonnement_detail = $abonnement_detail->insert($data_abonnment_detail)->execute();
                $abonnement_detail_id = Model::getId(DBTable::ABONNEMENT_DETAIL, $code_abonnement_detail);
                array_push($ids_pension_abonnement_detail, $abonnement_detail_id);

                $i = $j - 1;

                if ($isLast) break; 
                if ($z == 100) die('upd to 10'); 
                $z++;
            }
            //vd('yep -+ Pro');
        
            if ($k == 10) die('upd to 100'); 
            $k++;
        
        }
        // vd('ok Activité');
    //ACTIVITE

        
    //CANTINE
            
        
        $cantines = $_POST['cantines'];
           
        $items = $cantines['recapitulatif'];
        
        $hasDiscountinous = true;
        $i = 0;
        $j = 0;
        $k = 0;
        //vd('--- total ---'. count($items));

        for ($i = 0; $i<count($items); $i++) {

            $prev_index_month = Helpers::strFrMonth2Index($items[$i]['value']);
            $current_index_month = $prev_index_month;
            
            $isLast = ($i+1) == count($items);

            if (!$isLast)
                for ($j = $i+1; $j<count($items); $j++) {
                    $current_index_month = Helpers::strFrMonth2Index($items[$j]['value']);
                    $x = ($prev_index_month + 1);
                    $y = ($current_index_month + 0);
                    
                    if ($y != $x) break;  

                    $prev_index_month = $current_index_month;
                }
            else
                $j = $i;

            $offset = $j - 1 - $i;
            $quantite = $offset + 1;
            // vd(" --- OFFSET : $offset ----");
            
            
            if ($quantite < 0) break;
            $quantite = ($isLast)? 1 : $offset;

            $start_date = Helpers::getFirstDayOfMonthByStrFrMonth( $items[$i]['value'] );
            $end_date = Helpers::getLastDayOfMonthByStrFrMonth(  Helpers::addFrMonth( $items[$i]['value'], $offset) );

            $model_cantine = DBTable::getModel(DBTable::ABONNEMENT_CANTINE);
            $code_cantine = AbonnementCantine::generateCode();
            $data_abonnment_cantine = [
                'code' => $code_cantine,
                'facture_id' => $facure_id,
                'eleve_id' => $eleve_id,
                'montant_total' => $cantines['montant'] * $cantines['multiplicateur'] ,
                'reduction' => $cantines['remise'],
                'date_debut' => $start_date,
                'date_fin' => $end_date,
            ];
            
            $result_abonnement_cantine = $model_cantine->insert($data_abonnment_cantine)->execute();
            $abonnement_cantine_id = Model::getId(DBTable::ABONNEMENT_CANTINE, $code_cantine);
            array_push($ids_pension_cantine, $abonnement_cantine_id);

            $abonnement_detail = DBTable::getModel(DBTable::ABONNEMENT_DETAIL);
            // vd('ok -- Cant ---');
            $code_abonnement_detail = AbonnementDetail::generateCode();

            $data_abonnment_detail = [
                'code' => $code_abonnement_detail,
                'abonnement_id' => $abonnement_cantine_id,
                'periode' =>  'MOIS',
                'multiplicateur' => $quantite,
                'total' =>  $cantines['montant'] * $quantite,
                'prix_unitaire' =>  $cantines['montant'],
                'date_debut' =>  $start_date,
                'date_fin' =>  $end_date
            ];
            $abonnement_detail->insert($data_abonnment_detail)->execute();
            $abonnement_detail_id = Model::getId(DBTable::ABONNEMENT_DETAIL, $code_abonnement_detail);
            array_push($ids_pension_abonnement_detail, $abonnement_detail_id);
            $i = $j - 1;
        }
        //vd('ok Cantine');


   

    //CANTINE


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
        $result_pension_eleve = $model_pension_eleve->insert($data_pension_eleve_autre)->execute();
    //AUTRES
    
    //vd('ok Autres');
    
    //vd($result_pension_eleve , $result_abonnement_detail , $result_abonnement_cantine , $result_facture);
        // $result = $result_pension_eleve && $result_abonnement_detail && $result_abonnement_cantine && $result_facture ;
        $result = true;
        if($result){
            $this->sendResponseAndExit(Helpers::toJSON('Versement enregistré avec sucess', TRUE));
        }else{
            $this->sendResponseAndExit(Helpers::toJSON('Erreur d\'enregistement à la base de données !!!', TRUE), false, 400, 'BD error : data '. $code);
        }
        

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
