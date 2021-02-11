<?php

namespace App\Model;

use Core\Model\Model;
use Core\HTML\Form\FormModel;        
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class EtatDocument extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    protected $entity;   
    
    public function __construct(){
        $this->fillables =
            [
                new FormModel(true, self::LIBELLE ),
                new FormModel(true, self::DESCRIPTION ),

            ];
    }
}