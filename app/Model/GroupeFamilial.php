<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\Model\HydrahonModel;
use Core\HTML\Form\FormModel;        

class GroupeFamilial extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const REFENCE = 'reference';
    
    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                new FormModel(true, self::LIBELLE),
                new FormModel(true, self::REFENCE),
                new FormModel(true, self::DESCRIPTION),
            ];
    }
}