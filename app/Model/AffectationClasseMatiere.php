<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;
use ClanCats\Hydrahon\Query\Expression as Ex;
        

class AffectationClasseMatiere extends Model implements FrequentlyReapeat
{
    use HydrahonModel;

    const CLASSE_ID = "classe_id";
    const MATIERE_ID = "matiere_id";
    const COFFICIENT = "coefficient";

    
    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $classes = Classe::table()->select([ 'code' => 'id' , 'libelle' => 'value'])->where('visibilite', 1)->get();
        $matieres =  Matiere::table()->select([ 'code' => 'id', 'libelle' => 'value'])->where('visibilite', 1)->get();


        $this->fillables =
            [
              new FormModel(true, 'coefficient','Coefficient'),      
              new FormModel(false,'classe_id','Classe', InputType::SELECT2, $classes, '', 'Choisir une classe', true, 'select2 form-control'),
              new FormModel(false, 'matiere_id', 'Matière', InputType::SELECT2, $matieres, '', 'Choisir une matiere', true, 'select2 form-control'),

              //new FormModel(false,'classe_id','Classe', InputType::SELECT2, $classes, '', 'Choisir une classe', true, 'select2 form-control'),
            

            ];
    }
}