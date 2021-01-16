<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;
use ClanCats\Hydrahon\Query\Expression as Ex;

class PersonnelActivite extends Model implements FrequentlyReapeat
{
    use HydrahonModel;

    const ACTICITE_ID = "acticite_id";
    const PERSONNEL_ID = "personnel_id";
    const POURCENTAGE = "pourcentage";
    const MONTANT = "montant";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $personnels = Personnel::table()->select([ 'code' => 'id' , new Ex("concat(personnel.nom,' ',personnel.prenom) as libelle"),])->where('visibilite', 1)->get();
        $activites = Activite::table()->select([ 'code' => 'id' , 'libelle' => 'value'])->where('visibilite', 1)->get();
        $this->fillables =
        [
            new FormModel(false,'activite_id','Activite', InputType::SELECT2, $activites, '', 'Choisir une activité', true, 'select2 form-control'),
            new FormModel(false,'personnel_id','Personnel', InputType::SELECT2, $personnels, '', 'Choisir un personnel', true, 'select2 form-control'),
            new FormModel(true, self::POURCENTAGE, self::POURCENTAGE, InputType::NUMBER, [], '', '', false),
            new FormModel(true, self::MONTANT, self::MONTANT, InputType::NUMBER, [], '', '', false),
            new FormModel(true, self::LIBELLE, 'Libellé', InputType::TEXT, [], '', '', false),
            new FormModel(true, self::DESCRIPTION,  self::DESCRIPTION, InputType::TEXT, [], '', '', false ),
        ];


    }
}