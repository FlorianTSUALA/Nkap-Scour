<?php

namespace App\Controller;

use App\Model\DBTable;
use function Core\Helper\dd;
use function Core\Helper\vd;
use App\Helpers\TraitCRUDController;
use App\Repository\BiblioRepository;
use App\Controller\Admin\AppController;

class BiblioController extends AppController
{

    private $cantine_repository;
    use TraitCRUDController;
    public function __construct()
    {
        parent::__construct();
        $this->cantine_repository = new BiblioRepository;

        // @TODO
        $this->vairant = DBTable::ABONNEMENT_CANTINE;
        $this->folder_view_index = 'cantine.abonnement_cantine';

        $this->loadModel($this->vairant);
        $this->base_route = 'abonnement_cantine';
        $this->class_name = 'abonnement_cantine';

        $this->title_page = 'Gestion du abonnement_cantine - Comelines';
        $this->title_home = 'Gestion du abonnement_cantine';
        $this->create_title = "Ajout d'un abonnement_cantine";
        $this->view_title = "Information sur un abonnement_cantine";
        $this->update_title = "Mise à jour des informations du perosnnel";
        $this->delete_title = "Suppression du abonnement_cantine";
        $this->msg_delete = "Voulez-vous vraiment supprimer ce abonnement_cantine ";
        
    }
    
    
    public function ajouterLivre()
    {
        # code... 
    }

    public function ajouterExemplaire()
    {
        # code... 
    }

    public function activite()
    {
        # code... 
    }

    public function afficherHistorique()
    {
        # code... 
    }

    public function dashboard()
    {
        # code... 
    }

    public function emprunt($code)
    {
        # code... 
    }
    
    public function restitution($code)
    {
        # code... 
    }

    public function alerte($code)
    {
        # code... 
    }


}
