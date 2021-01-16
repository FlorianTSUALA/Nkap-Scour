<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Classe extends Model implements FrequentlyReapeat
{
    use HydrahonModel;

    const CYCLE_ID = "cycle_id";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $cycles = Cycle::table()->select([ 'code' => 'id' , 'libelle' => 'value'])->where('visibilite', 1)->get();
        $this->fillables =
        [
            new FormModel(false,'cycle_id','Cycle', InputType::SELECT2, $cycles, '', 'Choisir un cycle', true, 'select2 form-control'),
            new FormModel(true, self::LIBELLE, 'Libellé' ),
        ];


    }
}