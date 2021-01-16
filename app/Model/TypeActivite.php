<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;
use Core\Model\HydrahonModel;

class TypeActivite extends Model implements FrequentlyReapeat
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