<?php

namespace App\Controller;

use App\Model\DBTable;
use App\Helpers\TraitCRUDController;

class DocumentController extends AppController
{
    use TraitCRUDController;
   
    public function __construct()
    {
        parent::__construct();

        $this->vairant = DBTable::DOCUMENT;
        $this->folder_view_index = 'document.index';

        $this->loadModel($this->vairant);
        $this->base_route = 'document';
        $this->class_name = 'Document';

        $this->title_page = 'Gestion des documents - Comelines';
        $this->title_home = 'Gestion des documents';
        $this->create_title = "Creation d'un document";
        $this->view_title = "Information d'un document";
        $this->update_title = "Mise à jour d'un document";
        $this->delete_title = "Suppression d'un document";
        $this->msg_delete = "Voulez-vous vraiment supprimer ce document ";
    }

}
