<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;        
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Parcours_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const CLASSE_ID = "classe_id";
    const ELEVE_ID = "eleve_id";
    const STATUT_APPRENANT_ID = "statut_apprenant_id";
    const ANNEE_SCOLAIRE_ID = "annee_scolaire_id";
    const DATE_INSCRIPTION = "date_inscription";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                new FormModel(false, 'classe','Classe'),
                new FormModel(false, 'eleve','Elève'),
                new FormModel(false, 'statut_apprenant','Statut apprenant' ),
                new FormModel(false, 'annee_scolaire','Année scolaire' ),
                new FormModel(true, self::DATE_INSCRIPTION,'date d\'inscription',InputType::DATE ),

            ];

    }
}