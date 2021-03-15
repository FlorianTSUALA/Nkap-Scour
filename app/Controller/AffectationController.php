<?php

namespace App\Controller;

use App\Helpers\S;
use App\Model\Classe;
use App\Model\DBTable;
use App\Model\Matiere;
use App\Helpers\Helpers;
use App\Model\Personnel;

use function Core\Helper\dd;
use function Core\Helper\vd;
use App\Helpers\TraitCRUDController;
use ClanCats\Hydrahon\Query\Expression;
use App\Repository\AnneeScolaireRepository;
use App\Model\AffectationPersonnelSalleClasse;
use App\Controller\AffectationControllerTraitClasseMatiere;
use App\Controller\AffectationControllerTraitSalleEnseignant;

class AffectationController extends \App\Controller\Admin\AppController
{
    
    use TraitCRUDController, AffectationControllerTraitSalleEnseignant, AffectationControllerTraitClasseMatiere;

    public function __construct()
    {
        parent::__construct();

        $this->vairant = DBTable::AFFECTATION_CLASSE_MATIERE;
        $this->folder_view_index = 'affectation_classe_matiere.index';

        $this->loadModel($this->vairant);
        $this->base_route = 'affectation_classe_matiere';
        $this->class_name = 'AffectationClasseMatiere';

        $this->title_page = 'Gestion des affectation classe matiàre - Comelines';
        $this->title_home = 'Gestion des affectation classe matiàre';
        $this->create_title = "affectation classe matiàre";
        $this->view_title = "Information des affectations classe matiàre";
        $this->update_title = "Mise à jour d'un champs";
        $this->delete_title = "Suppression d'un champs";
        $this->msg_delete = "Voulez-vous vraiment supprimer ce champs? ";
        
    }
        
    public function affecterSalleEleve()
    {
        # code...
    }
        
    public function enregistrerAffectationSalleEleve($code)
    {
        # code...
    }
        
    public function modifierAffectationSalleEleve($code)
    {
        # code...
    }
        
    public function listeAffectationSalleEleve()
    {
        # code...
    }
        
}
    