<?php

namespace App\Controller;

use App\Model\DBTable;
use function Core\Helper\dd;
use function Core\Helper\vd;
use App\Repository\EleveRepository;
use App\Helpers\TraitCRUDController;
use App\Repository\BiblioRepository;
use App\Repository\DocumentRepository;
use App\Controller\Admin\AppController;

class BiblioController extends AppController
{

    private $biblio_repository;
    // use TraitCRUDController;
    public function __construct()
    {
        parent::__construct();
        $this->biblio_repository = new BiblioRepository;

        // @TODO
        // $this->vairant = DBTable::ABONNEMENT_biblio;
        $this->folder_view_index = 'biblio.abonnement_biblio';

        // $this->loadModel($this->vairant);
        $this->base_route = 'abonnement_biblio';
        $this->class_name = 'abonnement_biblio';

        $this->title_page = 'Gestion du abonnement_biblio - Comelines';
        $this->title_home = 'Gestion du abonnement_biblio';
        $this->create_title = "Ajout d'un abonnement_biblio";
        $this->view_title = "Information sur un abonnement_biblio";
        $this->update_title = "Mise à jour des informations du perosnnel";
        $this->delete_title = "Suppression du abonnement_biblio";
        $this->msg_delete = "Voulez-vous vraiment supprimer ce abonnement_biblio ";
        
    }
    
    
    public function accueil()
    {
        $exemple = [];
        $this->render('sections.biblio.accueil', compact('exemple'));
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

    public function emprunt()
    {
        $route = 'biblio_emprunt';
        $domaines = (new DocumentRepository())->getDocumentGroupByDomaine();
        $documents = (new DocumentRepository())->getDocument();
        $exemplaires = (new DocumentRepository())->getExemplaire($disponible = true);
        $etat_documents = (new DocumentRepository())->getEtatDocument();
        $eleves = (new EleveRepository() )->getInfoPerso();
        $this->render('sections.biblio.emprunt_exemplaire', compact('route', 'domaines', 'eleves', 'exemplaires', 'documents', 'etat_documents'));
    }

    public function emprunt_exemplaire()
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
