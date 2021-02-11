<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;        
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Restitution_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const EMPRUNT_ID = "emprunt_id";
    const DATE_RESTITUTION = "date_restitution";
    const COMMENTAIRE = "commentaire";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                new FormModel(false, 'emprunt','Emprunt' ),
                new FormModel(true, self::DATE_RESTITUTION , 'Date de restitution', InputType::DATE),
                new FormModel(true, self::COMMENTAIRE ),

            ];

    }
}