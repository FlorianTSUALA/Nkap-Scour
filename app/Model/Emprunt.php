<?php 

namespace App\Model;

use Core\Model\Model;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Emprunt extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    protected $entity;   
    
    const ELEVE_ID = "eleve_id";
    const DATE_EMPRUNT = "date_emprunt";
    const DATE_EXPIRATION = "date_expiration";

    public function __construct(){
        parent::__construct();
        $this->fillables =
            [
                new FormModel(false, 'eleve','Elève' ),
                new FormModel(true, self::DATE_EMPRUNT , 'Date d\'emprunt', InputType::DATE),
                new FormModel(true, self::DATE_EXPIRATION ,'Date d\'expiration',InputType::DATE ),

            ];

    }
}