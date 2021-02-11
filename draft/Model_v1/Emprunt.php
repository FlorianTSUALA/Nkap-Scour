<?php 

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Emprunt_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const ELEVE_ID = "eleve_id";
    const DATE_EMPRUNT = "date_emprunt";
    const DATE_EXPIRATION = "date_expiration";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                new FormModel(false, 'eleve','Elève' ),
                new FormModel(true, self::DATE_EMPRUNT , 'Date d\'emprunt', InputType::DATE),
                new FormModel(true, self::DATE_EXPIRATION ,'Date d\'expiration',InputType::DATE ),

            ];

    }
}