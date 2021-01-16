<?php

namespace App\Controller;

use Exception;
use App\Helpers\S;
use Core\Model\Model;
use App\Model\DBTable;
use Core\Session\Request;
use App\Model\AbonnementActivite;
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
        var_dump($_POST);

        $eleve = DBTable::getModel('eleve')->select()->find($code, 'code');

        $eleve_code = Model::getId('eleve', Request::getSecParam('eleve_id', ''));
        $classe_code = Model::getId('classe', Request::getSecParam('classe_id', ''));

        $classe = DBTable::getModel('classe')->select()->find($classe_code);
       
        $classe_id = $classe['id'];
        $eleve_id = $eleve['id'];

        $statut_apprenant_id = Model::getId('statut_apprenant', Request::getSecParam('statut_apprenant_id', ''));
        $annee_scolaire_id = Model::getId('annee_scolaire', Request::getSecParam('annee_scolaire_id', ''));
        $type_paiement_id = Model::getId('type_paiement', Request::getSecParam('type_paiement_id', ''));

        $motif =  Request::getSecParam('motif');
        $reste =  Request::getSecParam('reste');
        $autre =  Request::getSecParam('autre');
        $reduction =  Request::getSecParam('reduction');
        $reference =  Request::getSecParam('reference');
        // $date_paiement =  Request::getSecParam('da9œte_paie');
        $date_paiement =  date('Y-m-d H:i:s');
        //Request::getSecParam('date_paie');
        $date_facture =  Request::getSecParam('date_facture');

        /*
        Deja realisé dans lors de l'inscription

        $parcours = DBTable::getModel('parcours');
        $parcours_code = Helpers::generateReference();
        $data_parcours = [];
        $data_parcours['code'] = $parcours_code;
        $data_parcours['classe_id'] = $classe_id;
        $data_parcours['eleve_id'] = $eleve_id;
        $data_parcours['annee_scolaire_id'] = $annee_scolaire_id;
        $data_parcours['statut_apprenant_id'] = $statut_apprenant_id;
        $data_parcours['date_inscription'] = date('Y-m-d H:i:s');
        // $data_parcours['date_inscription'] = $date_paiement;
        $parcours->insert($data_parcours)->execute();

        $parcours_id = Model::getId('parcours', $parcours_code);

        */

        $_SESSION[S::FAC_DATE] = Request::getSecParam('date_facture');
        $_SESSION[S::FAC_NOM] = $eleve['nom'];
        $_SESSION[S::FAC_PRENOM] = $eleve['prenom'];
        $_SESSION[S::FAC_CLASSE] = $classe['libelle'];
        $_SESSION[S::FAC_REF] = $reference;

        $data_pension = $_POST['pension_classe'];

        $_SESSION[S::FAC_PENSION] =  $data_pension;

        $_SESSION[S::FAC_AUTRE] =  $_POST['autre'];
        $_SESSION[S::FAC_ACTIVITE] =  $_POST['activites'];
        $_SESSION[S::FAC_CANTINE] =  $_POST['cantines'];


        //Enregistrement des payements des activites
        $abonnement_activite = DBTable::getModel('abonnement_activite');
        foreach ($data_pension as $item) {
           
            //$data['reduction'] = $reduction;
            //$data['code'] = Model::generateCode();
            //$data['type_paiement_id'] = $type_paiement_id;
            
            $code = AbonnementActivite::generateCode();
            $eleve_id = $eleve_id; 
            
            /*
            $periode = :.//
            $multiplicateur = :.//
            $montant_unitaire = :.//
            $montant_total = :.//
            $reduction = :.//
            $resume_periode = :.//
            
            $date_paiement = :.//
            $description = :.//
            $libelle = :.//
            */
        
            if (isset($multiplicateur) && is_array($multiplicateur)) {
                foreach ($multiplicateur as $tranche) {
                    
                    $mois  =  $tranche['value'];
                    $tranche_id =  $tranche['id'];
                    switch ($mois) {
                        case ($mois == 'Janvier' || $mois == 'janvier'):
                            $index_mois = '01';
                            break;
                        
                        case ($mois == 'Février' || $mois == 'Février'):
                            $index_mois = '02';
                            break;
                        
                        case ($mois == 'Mars' || $mois == 'mars'):
                            $index_mois = 3;
                            break;
                        
                        case ($mois == 'Avril' || $mois == 'avril'):
                            $index_mois = '04';
                            break;

                            
                        case ($mois == 'Mai' || $mois == 'mai'):
                            $index_mois = '05';
                            break;


                        case ($mois == 'Juin' || $mois == 'juin'):
                            $index_mois = '06';
                            break;
                            
                        
                        case ($mois == 'Juillet' || $mois == 'juillet'):
                            $index_mois = '07';
                            break;
                            

                        case ($mois == 'Aout' || $mois == 'aout'):
                            $index_mois = '08';
                            break;
                                
                        case ($mois == 'Septembre' || $mois == 'septembre'):
                            $index_mois = '09';
                            break;
                        
                        case ($mois == 'Octobre' || $mois == 'octobre'):
                            $index_mois = '10';
                            break;
                        
                        case ($mois == 'Novembre' || $mois == 'novembre'):
                            $index_mois = '11';
                            break;

                            
                        case ($mois == 'Decembre' || $mois == 'decembre'):
                            $index_mois = '12';
                            break;
                        default: 
                            $index_mois = -1;
                    }

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

        //Gestion des variables de session pour la soumission des pour impression de la facture.
        if ($this->session->has(S::DATA_TRANSPORT))
            $this->session->flush(S::DATA_TRANSPORT);

        //Pension eleve
        $type_paiement_id = "";
        $tranche_scolaire_id = [];
        $pension_classe_id = [];

        if ($this->session->has(S::DATA_TRANSPORT)) 
            $this->session->flush(S::DATA_TRANSPORT);

        if ($result) {
            $this->sendResponseAndExit('[{"msg": "Versement realisé avec success!!!"}]');
        } else {
            $this->sendResponseAndExit($code, false, 400, 'DB Error');
        }
    }
}
