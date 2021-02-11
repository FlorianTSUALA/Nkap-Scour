<?php

namespace App\Controller;

use App\Model\Classe;
use App\Model\Pays;
use App\Model\Eleve;
use Core\Session\Request;
use App\Model\DossierParental;
use App\Model\Parcours;
use App\Model\StatutApprenant;

class EmploieTempsController extends AppController
{
    /**
     * Initialise les Models qu'on charge dans ce controller
     **/
    public function __construct()
    {
        parent::__construct();
        $this->loadModel('matiere');
        $this->loadModel('personnel');
        $this->loadModel('type_personnel');
        $this->loadModel('classe');
        // $this->loadModel('activite');
        $this->loadModel('matiere');
        $this->loadModel('cours');
        $this->loadModel('tranche_horaire');

    }

    public function index()
    {
        $this->app->setTitle('Gestion des emploie de temps  - Comelines');
        
        $this->render('sections.emploie_temps.emploie_temps');
        // $this->render('sections.emploie_temps.emploie_temps', compact('pays', 'classes', 'statut_apprenants'));
    }

    /**
     * permet la connexion d'utilisateur à la BD
     **/
    public function inscrire()
    {
        //ANTECEDANT SCOLAIRE
        $code_antecedent_scolaire = $this->antecedent_scolaire->genCode();
        $data_antecedent_scolaire = [
            'code' => $code_antecedent_scolaire,
            'email' => Request::getSecParam('email', ''),
            'telephone' => Request::getSecParam('telephone', ''),
            'classe' => Request::getSecParam('classe', ''),
            'ecole' => Request::getSecParam('ecole', '')
        ];
        $result_antecedent_scolaire = $this->antecedent_scolaire->save($data_antecedent_scolaire);
        $id_antecedent_scolaire = $this->antecedent_scolaire->id($code_antecedent_scolaire);
        

        //DOSSIER MEDICAL
        $code_dossier_medical = $this->dossier_medical->genCode();
        $data_dossier_medical = [
            'code' => $code_dossier_medical,
            'autres' => Request::getSecParam('autres', ''),
            'probleme_particulier' => Request::getSecParam('probleme_particulier', ''),
            'email_medecin' => Request::getSecParam('email_medecin', ''),
            'telephone_medecin' => Request::getSecParam('telephone_medecin', ''),
            'nom_medecin' => Request::getSecParam('nom_medecin', ''),
            'maladie_recurrente' => Request::getSecParam('maladie_recurrente', ''),
            'allergie' => Request::getSecParam('allergie', ''),
            'groupe_sanguin' => Request::getSecParam('groupe_sanguin', ''),
        ];
        $result_dossier_medical = $this->dossier_medical->save($data_dossier_medical);
        $id_dossier_medical = $this->dossier_medical->id($code_dossier_medical);
        
        //DOSSIER PARENTAL
        $code_dossier_parental = $this->dossier_parental->genCode();
        $data_dossier_parental = [
            'code' => $code_dossier_parental,
            'est_tuteur_mere' => Request::getSecParam('est_tuteur_mere', ''),
            'email_mere' => Request::getSecParam('email_mere', ''),
            'ville_mere' => Request::getSecParam('ville_mere', ''),
            'telephone_mere' => Request::getSecParam('telephone_mere', ''),
            'lieu_travail_mere' => Request::getSecParam('lieu_travail_mere', ''),
            'profession_mere' => Request::getSecParam('profession_mere', ''),
            'employeur_mere' => Request::getSecParam('employeur_mere', ''),
            DossierParental::PAYS_MERE_ID => $this->pays->id(Request::getSecParam('pays_mere', ''), Pays::LIBELLE),
            'prenom_mere' => Request::getSecParam('prenom_mere', ''),
            'nom_mere' => Request::getSecParam('nom_mere', ''),
            'nom_pere' => Request::getSecParam('nom_pere', ''),
            'prenom_pere' => Request::getSecParam('prenom_pere', ''),
            DossierParental::PAYS_PERE_ID => $this->pays->id(Request::getSecParam('pays_pere', ''), Pays::LIBELLE),
            'employeur_pere' => Request::getSecParam('employeur_pere', ''),
            'profession_pere' => Request::getSecParam('profession_pere', ''),
            'lieu_travail_pere' => Request::getSecParam('lieu_travail_pere', ''),
            'telephone_pere' => Request::getSecParam('telephone_pere', ''),
            'ville_pere' => Request::getSecParam('ville_pere', ''),
            'email_pere' => Request::getSecParam('email_pere', ''),
            'est_tuteur_pere' => Request::getSecParam('est_tuteur_pere', ''),
            'telephone_personne_urgence' => Request::getSecParam('telephone_personne_urgence', ''),
            'nom_personne_urgence' => Request::getSecParam('nom_personne_urgence', ''),
            'prenom_personne_urgence' => Request::getSecParam('prenom_personne_urgence', ''),
        ];
        $result_dossier_parental = $this->dossier_parental->save($data_dossier_parental);
        $id_dossier_parental = $this->dossier_parental->id($code_dossier_parental);
        
        //INFO ELEVE
        $code_eleve = $this->eleve->genCode();

        $matricule =  $this->eleve->genMatricule();

        $photo_name = Request::saveImg($matricule);
        if($photo_name === 1){
            $photo_name = 'no-photo.jpg';
        }

        $data_eleve = [
            'code' => $code_eleve,
            'matricule_eleve' => $this->eleve->genMatricule(),
            'nom_eleve' => Request::getSecParam('nom_eleve', ''),
            'prenom_eleve' => Request::getSecParam('prenom_eleve', ''),
            'lieu_naissance_eleve' => Request::getSecParam('lieu_naissance_eleve', ''),
            'date_naissance_eleve' => Request::getSecParam('date_naissance_eleve', ''),
            'sexe_eleve' => Request::getSecParam('sexe_eleve', ''),
            'photo' => $photo_name,
            Eleve::PAYS_ID => $this->pays->id(Request::getSecParam('pays_eleve', ''), Pays::LIBELLE),
            'anciennete_eleve' => Request::getSecParam('anciennete_eleve', ''),
            Eleve::DOSSIER_PARENTAL_ID => $id_dossier_parental,
            Eleve::DOSSIER_MEDICAL_ID => $id_dossier_medical,
            Eleve::ANTECEDENT_SCOLAIRE_ID => $id_antecedent_scolaire,
        ];
        $result_eleve = $this->eleve->save($data_eleve);
        $id_eleve = $this->eleve->id($code_eleve);
        
        
        //PARCOURS ELEVE
        $code_parcours = $this->parcours->genCode();
        $data_parcours = [
            'code' => $code_parcours,
            Parcours::ANNEE_SCOLAIRE_ID => $this->eleve->genAnneeScolaireID(),
            'date_inscription' => Date('YYYY-mm-dd'),
            Parcours::ELEVE_ID => $id_eleve,
            Parcours::STATUT_APPRENANT_ID => $this->statut_apprenant->id(Request::getSecParam('statut_apprenant_eleve', ''), StatutApprenant::LIBELLE),
            Parcours::CLASSE_ID => $this->classe->id(Request::getSecParam('classe_eleve', ''), Classe::LIBELLE),
        ];
        $result_parcours = $this->parcours->save($data_parcours);
        $id_parcours = $this->parcours->id($code_parcours);
        

        if($result_antecedent_scolaire && $result_dossier_medical && $result_dossier_parental && $result_eleve && $result_parcours ){
            $this->redirect('sections.eleve.index');
            $this->redirectWithFlashMessage('sections.eleve.index');
        }else{
            $this->sendResponseAndExit($result_parcours, FALSE, 400, 'DB Error');
        }
    }


}