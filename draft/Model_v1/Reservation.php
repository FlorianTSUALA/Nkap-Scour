<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;        
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Reservation_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const ELEVE_ID = "eleve_id";
    const DOCUMENT_ID = "document_id";
    const DATE_RESERVATION = "date_reservation";
    const COMMENTAIRE = "commentaire";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                new FormModel(false,'eleve','Elève'),
                new FormModel(false,'document','Document'),
                new FormModel(true, self::DATE_RESERVATION ,'Date de réservation',InputType::DATE ),
                new FormModel(true, self::COMMENTAIRE ),

            ];

    }
}
