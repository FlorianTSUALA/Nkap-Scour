<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;        
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class TypePersonnel_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                new FormModel(true, self::LIBELLE ),
                new FormModel(true, self::DESCRIPTION ),
            ];
    }
    
}