<?php 

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Dette extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const MOTIF = "motif";
    const MONTANT = "montant";
    const DATE_EMPRUNT = "date_emprunt";
    const MONTANT_INTERET = "montant_interet";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
        [
            new FormModel(true, self::MOTIF, 'Date de debut', InputType::DATE),
        new FormModel(true, self::MONTANT, 'Montant', InputType::NUMBER),
        new FormModel(true, self::DATE_EMPRUNT, 'Date de debut', InputType::DATE),
        new FormModel(true, self::DATE_INTERET, 'Date de fin', InputType::DATE),
        ];

    }
}