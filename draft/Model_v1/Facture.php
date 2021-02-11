<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\Model\HydrahonModel;
use Core\HTML\Form\FormModel;        

class Facture_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;

    const REFERENCE = "reference";
    const MONTANT = "montant";
    const REDUCTION = "reduction";
    const DATE_FACTURE = "date_facture";
    const BENEFICAIRE = "beneficaire";
    const GESTIONNAIRE = "gestionnaire";
    
    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                new FormModel(true, self::LIBELLE),
                new FormModel(true, self::DESCRIPTION),
               //to complete

            ];
    }
}