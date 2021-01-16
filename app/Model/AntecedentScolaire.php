<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;        
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class AntecedentScolaire extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const CLASSE = "classe";
    const TELEPHONE = "telephone";
    const EMAIL = "email";
    const ECOLE = "ecole";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
        [
            new FormModel(true,self::CLASSE),
            new FormModel(true,self::TELEPHONE, 'Téléphone', InputType::NUMBER),
            new FormModel(true,self::EMAIL, 'Email', InputType::EMAIL),
            new FormModel(true,self::ECOLE),

        ];


}
}
