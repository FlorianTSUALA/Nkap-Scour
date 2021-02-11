<<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;        
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Repas_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    // const POINT_MARCHAND_ID = "point_marchand_id";
    // const NUMERO = "numero";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                // new FormModel(false, 'point_marchand','Point marchand' ),
                // new FormModel(true, self::NUMERO , 'Numéro', InputType::NUMBER),
                new FormModel(true, self::LIBELLE ),
                new FormModel(true, self::DESCRIPTION, 'Description', null, null, null, null, false ),
            ];

    }
}