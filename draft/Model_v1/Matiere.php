<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;        
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Matiere_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const DISCIPLINE_ID = "discipline_id";
    const COULEUR = "couleur";
    const ABREVIATION = "abreviation";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);
        $disciplines = Discipline::table()->select([ 'code' => 'id' , 'libelle' => 'value'])->where('visibilite', 1)->get();
        $this->fillables =
            [
                new FormModel(false, self::DISCIPLINE_ID, 'Discipline', InputType::SELECT2, $disciplines, '', 'Choisir un cycle', true, 'select2 form-control'),
                new FormModel(true, self::LIBELLE ),
                new FormModel(true, self::ABREVIATION,'Abbrévation', null, null, null, null, false ),
                new FormModel(true, self::COULEUR,'Couleur', null, null, null, null, false ),
                new FormModel(true, self::DESCRIPTION ,'Description', null, null, null, null, false),
            ];
    }
}