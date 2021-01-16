<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;        
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Salaire extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const PERSONNEL_ID = "personnel_id";
    const MONTANT = "montant";
    const DATE_PAIE = "date_paie";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                new FormModel(false, 'personnel','Personnel' ),
                new FormModel(true, self::MONTANT , 'Montant', InputType::NUMBER),
                new FormModel(true, self::DATE_PAIE ,'Date de paie',InputType::DATE ),

            ];

    }
}