<?php

namespace App\Controller;

use App\Helpers\S;
use App\Model\Classe;
use Core\Model\Model;
use App\Model\DBTable;
use App\Helpers\Helpers;
use Core\Session\Request;
use App\Helpers\DateHelpers;
use App\Model\AbonnementDetail;
use App\Model\AbonnementCantine;
use App\Helpers\TraitCRUDController;
use App\Controller\Admin\AppController;
use App\Model\Periode;
use ClanCats\Hydrahon\Query\Expression as Ex;


class CantineController extends AppController
{

    
    use TraitCRUDController;
    public function __construct()
    {
        parent::__construct();

        $this->vairant = DBTable::ABONNEMENT_CANTINE;
        $this->folder_view_index = 'cantine.abonnement_cantine';

        $this->loadModel($this->vairant);
        $this->base_route = 'abonnement_cantine';
        $this->class_name = 'abonnement_cantine';

        $this->title_page = 'Gestion du abonnement_cantine - Comelines';
        $this->title_home = 'Gestion du abonnement_cantine';
        $this->create_title = "Ajout d'un abonnement_cantine";
        $this->view_title = "Information sur un abonnement_cantine";
        $this->update_title = "Mise à jour des informations du perosnnel";
        $this->delete_title = "Suppression du abonnement_cantine";
        $this->msg_delete = "Voulez-vous vraiment supprimer ce abonnement_cantine ";
        
    }

    /*

        $eleves = DBTable::getModel('eleve')
                            ->select(
                                [
                                    new Ex("concat(eleve.nom,' ',eleve.prenom) as nom_complet"),
                                    'eleve.code' => 'id',
                                    'eleve.matricule' => 'matricule',
                                    'eleve.date_naissance' => 'date_naissance',
                                    'eleve.lieu_naissance' => 'lieu_naissance'
                                ]
                            )
                            ->where('visibilite', '=', 1)
                            ->get();





    public function getall()
    {
        $model = AbonnementCantine::table();
        $results = $model->select('
                type_abonnement_cantine.libelle as type_abonnement_cantine_id,
                pays.libelle as pays_id,
                abonnement_cantine.code as code,
                abonnement_cantine.nom,
                abonnement_cantine.prenom,
                abonnement_cantine.bibliographie')
            ->where('abonnement_cantine.visibilite', 1)
            ->join('type_abonnement_cantine', 'abonnement_cantine.type_abonnement_cantine_id', '=', 'type_abonnement_cantine.id')
            ->join('pays', 'abonnement_cantine.pays_id', '=', 'pays.id')
            ->get();
            
            return $results;
        }*/
        
        
    public function abonnement_cantine()
    {
        $this->app->setTitle('Abonnement Cantine- Comelines');

        $prix_abonnements = DBTable::getModel('prix_abonnement')
                            ->select(
                                [
                                    'prix_abonnement.code' => 'id',
                                    'prix_abonnement.montant' => 'montant',
                                    'prix_abonnement.periode' => 'periode',
                                    'prix_abonnement.description' => 'description'
                                ]
                            )
                            ->where('visibilite', '=', 1)
                            ->where('type_abonnement', '=', 'CANTINE')
                            ->get();

                            
        
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
        $type_paiements = DBTable::getModel('type_paiement')->select(['code'=>'id', 'libelle' => 'libelle'])->where('visibilite', '=', 1)->get();

        //var_dump($prix_abonnements);

        $this->render('sections.cantine.abonnement_cantine', compact('prix_abonnements', 'type_paiements', 'eleves', 'classes'));
    }

    public function save($code)
    {

        $model = DBTable::getModel(DBTable::ABONNEMENT_CANTINE);
        $code_cantine = AbonnementCantine::generateCode();

        $id_eleve = Model::getId(DBTable::ELEVE, Request::getSecParam('eleve_id', ''));
        
        $data_abonnment = [
            'code' => $code_cantine,
            'montant_total' => Request::getSecParam('montant_total', ''),
            'reduction' => Request::getSecParam('reduction', ''),
            'eleve_id' => $id_eleve,
            'reference' => Request::getSecParam('reference', ''),
            'date_debut' => Request::getSecParam('date_debut', ''),
            'date_fin' => Request::getSecParam('date_fin', ''),
            'date_paiement' => Request::getSecParam('date_paiement', ''),
        ];

        $result_cantine = $model->insert($data_abonnment)->execute();
        
        var_dump($result_cantine);

        $abonnement_detail = DBTable::getModel(DBTable::ABONNEMENT_DETAIL);
        $items = $_POST['cantines']['data'];

        // var_dump($items);

        $id_cantine = Model::getId(DBTable::ABONNEMENT_CANTINE, $code_cantine);

        $dayCount  = 0; 
        $start_day = Request::getSecParam('date_debut', '');
        $end_day = Request::getSecParam('date_debut', '');

        foreach($items as $item){
            
            $dayCount = Periode::getDayCount($item['periode']);

            $end_day = DateHelpers::addDays($start_day, $dayCount);

            $data_abonnment_detail = [
                'code' => AbonnementDetail::generateCode(),
                'cantine_id' => $id_cantine,
                'periode' =>  $item['periode'],
                'multiplicateur' =>  $item['duree'],
                'total' =>  $item['sous_total'],
                'prix_unitaire' =>  $item['prix_unitaire'],
                'date_debut' =>  $start_day,
                'date_fin' =>  $end_day
            ];
            
            $start_day = $end_day;

            $abonnement_detail->insert($data_abonnment_detail)->execute();
        }
        var_dump($result_cantine);

        if ($result_cantine) {
            // $this->setupSessionVerement();

            // $_SESSION[S::DATA_TRANSPORT][S::VERS_CODE_CANTINE] = $code_cantine ;
            // $_SESSION[S::DATA_TRANSPORT][S::VERS_CODE_CLASSE] = $this->classe->code(Request::getSecParam('classe_cantine', ''), Classe::LIBELLE) ;
            // $_SESSION[S::DATA_TRANSPORT][S::VERS_CLASSE] = Request::getSecParam('classe_cantine', '');

            $this->session->flash("Abonnement enregistrée avec success");

            // $this->render('sections.abonnement.abonnement_list');
            $this->sendResponseAndExit($code, false, 200, 'Good');
            
        } else {
            $this->sendResponseAndExit($result_cantine, false, 400, 'DB Error');
        }
    }

    public function liste_abonnee()
    {

     
        $classes = DBTable::getModel('classe')->select(['code'=>'id', 'libelle' => 'libelle'])->where('visibilite', '=', 1)->get();
      
        $annee_scolaire =  DBTable::getModel(DBTable::ANNEE_SCOLAIRE)->select(['id'])
                ->where('statut', '=', 1)
                ->one()['id'];
               
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
                        new Ex("concat(eleve.nom,' ',eleve.prenom) as nom_eleve"),
                        'eleve.code' => 'eleve_id'
                    ]
                )
                ->join('eleve', 'eleve.id', '=', 'abonnement_cantine.eleve_id')
                ->join('parcours', 'eleve.id', '=', 'parcours.eleve_id')
                ->join('classe', 'parcours.classe_id', '=', 'classe.id')
                ->join('pension_classe', 'pension_classe.classe_id', '=', 'parcours.classe_id')
                // ->where('parcours.visibilite', '=', 1)
                ->where('parcours.annee_scolaire_id', '=', $annee_scolaire)
                ->get();

        
            

        $this->render('sections.cantine.abonnement_liste', compact( 'classes','abonnements'));
    }

}
