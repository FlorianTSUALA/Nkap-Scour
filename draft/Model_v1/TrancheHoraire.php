<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;        
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class TrancheHoraire_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const TEMPS_DEBUT = "temps_debut";
    const TEMPS_FIN = "temps_fin";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                new FormModel(true, self::LIBELLE ),
                new FormModel(true, self::TEMPS_DEBUT , 'Heure de debut', InputType::TIME),
                new FormModel(true, self::TEMPS_FIN ,'Heure de fin',InputType::TIME ),
            ];

    }
}