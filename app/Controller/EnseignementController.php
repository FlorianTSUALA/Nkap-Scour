<?php

namespace App\Controller;

use App\Helpers\S;
use App\Model\Classe;
use Core\Model\Model;
use App\Model\DBTable;
use App\Model\Parcours;
use App\Helpers\Helpers;
use Core\Session\Request;
use App\Repository\ParcoursRepository;
use App\Controller\Admin\AppController;
use App\Model\AffectationClasseMatiere;

class EnseignementController extends AppController
{
    /**
     * Initialise les Models qu'on charge dans ce controller
     **/
    public function __construct()
    {
        parent::__construct();
        $this->loadModel('matiere');

    }

    public function index()
    {
        $this->app->setTitle('Gestion des emploie de temps  - Comelines');
        
        $this->render('sections.emploie_temps.emploie_temps');
        // $this->render('sections.emploie_temps.emploie_temps', compact('pays', 'classes', 'statut_apprenants'));
    }

 
    public function accueil()
    {
        $route = 'enseignement_accueil';
        $this->render('sections.enseignement.accueil', compact('route'));
    }


    public function note(){
        $route = 'note';

        $annee_scolaire_id = $this->session->get(S::ANNEE_SCOLAIRE); //annee scolaire courante

        // $classe_id = Request::getSecParam('classe');
        $salle_classes  = [];
        
        $classes = Helpers::toJSON(Classe::table()->select(['id'=>'id', 'libelle' => 'value'])->where('visibilite', 1)->get());
        $affectation_salle_eleve = (
            Parcours::table()
            ->select(
                [
                    'salle_classe.id' => 'salle_classe_id', 
                    'salle_classe.code' => 'salle_classe_code', 
                    'salle_classe.libelle' => 'salle_classe',

                    'classe.id' => 'classe_id',
                    'classe.code' => 'classe_code',
                    'classe.libelle' => 'classe',
                    
                    'statut_apprenant.id' => 'statut_apprenant_id',
                    'statut_apprenant.code' => 'statut_apprenant_code',
                    'statut_apprenant.libelle' => 'statut_apprenant',
                    
                    'eleve.id' => 'eleve_id',
                    'eleve.code' => 'eleve_code',
                    'eleve.nom' => 'eleve_nom',
                    'eleve.prenom' => 'eleve_prenom'
                ])
            ->join('eleve', 'eleve.id', '=', 'parcours.eleve_id')
            ->join('classe', 'classe.id', '=', 'parcours.classe_id')
            ->join('salle_classe', 'salle_classe.id', '=', 'parcours.salle_classe_id')
            ->join('statut_apprenant', 'statut_apprenant.id', '=', 'parcours.statut_apprenant_id')
            ->where('parcours.visibilite', 1)
            ->where('parcours.annee_scolaire_id', $annee_scolaire_id)
            ->whereNotNull('parcours.classe_id')
            // ->where('classe_id', $classe_id)
            ->orderBy('eleve.nom')
            ->get());
            
        Helpers::groupBy($affectation_salle_eleve, 'classe');
        $this->render('sections.note.index', compact('route', 'classes', 'salle_classes', 'affectation_salle_eleve'));

    }
        
    public function apiInfoNoteSalle()
    {
        # DRAFT

    }
 
    
    public function apiInitNoteSalle()
    {
        # DRAFT

    }
      

    public function apiListeSalleMatiere()
    {
        # DRAFT
        
    }

    public function apiListeClasseMatiere()
    {
        //DRAFT
        $classe_id = Request::getSecParam('classe', NULL);

        $annee_scolaire_id = $this->session->get(S::ANNEE_SCOLAIRE); //annee scolaire courante

        $model = AffectationClasseMatiere::table()
            ->select(
                [
                    'affectation_classe_matiere.classe_id' => 'classe', 
                    'affectation_classe_matiere.matiere_id' => 'matiere', 
                    'affectation_classe_matiere.coefficient' => 'coefficient' 
                ])
            ->where('affectation_classe_matiere.visibilite', 1)
            ->where('affectation_classe_matiere.annee_scolaire_id', $annee_scolaire_id);
        
        if(!is_null($classe_id))
            $model->where('affectation_classe_matiere.classe_id', $classe_id);
        
        $data = $model->get();
        $this->sendResponseAndExit(Helpers::toJSON($data), true);
    }
    
    public function apiListeClasseEleve()
    {
        # DRAFT
        $salle_classe_code = Request::getSecParam('salle_classe_id', NULL);
        $salle_classe_id = Model::getId(DBTable::SALLE_CLASSE, $salle_classe_code);
        
        
        $annee_scolaire_id = $this->session->get(S::ANNEE_SCOLAIRE); //annee scolaire courante

        $data = (new ParcoursRepository() )->getAffectationEleveBySalleClasse($salle_classe_id, $annee_scolaire_id);

        $this->sendResponseAndExit(Helpers::toJSON($data), true);  
    }
    

    
    public function apiUpdateNoteEleveMatiere()
    {
        # DRAFT

    }
    
    public function apiUpdateNoteEleve()
    {
        # DRAFT

    }
    
    public function apiInfoNoteClasse()
    {
        # DRAFT

    }
 
    public function apiInitNoteClasse()
    {
        # DRAFT

    }

    public function apiInitNote()
    {
        # DRAFT

    }

}