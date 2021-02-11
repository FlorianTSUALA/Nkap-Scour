<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;        
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Session_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const ANNEE_SCOLAIRE_ID = "annee_scolaire_id";
    const DATE_DEBUT = "date_debut";
    const DATE_FIN = "date_fin";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $anneeScolaires = AnneeScolaire::table(DBTable::ANNEE_SCOLAIRE)
        ->select([ AnneeScolaire::CODE.' as id', AnneeScolaire::DEBUT_ANNEE.' as value'])
        ->where('visibilite', 1)->get();
        
        $this->fillables =
            [
                new FormModel(false, 'annee_scolaire_id','Année scolaire', InputType::SELECT2, $anneeScolaires, '', 
                    'Veuillez selectionnez une année scolaire', true, 'select2', '', '', '', AnneeScolaire::DEBUT_ANNEE,  InputType::DATE_YEAR),
                new FormModel(true, self::DATE_DEBUT , 'Date de début', InputType::DATE),
                new FormModel(true, self::DATE_FIN ,'Date de fin',InputType::DATE ),

            ];

    }
}