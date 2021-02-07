<?php

namespace App\Model;

use Core\Model\Model;
use App\Helpers\Helpers;
use Core\Database\Database;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class VueAbonnementCantine extends Model implements FrequentlyReapeat
{
    use HydrahonModel;

    const CLASSE = "classe_id";
    const NOM_ELEVE = "nom_eleve";
    const Matricule = "matricule";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                new FormModel(false, self::CLASSE, 'classe'),
                new FormModel(false, self::NOM_ELEVE, 'nom et prenom'),
            ];
    }
}