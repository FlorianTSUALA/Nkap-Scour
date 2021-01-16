<?php

namespace App\Controller;

use App\Helpers\TraitCRUDController;

class SessionController extends AppController
{
    use TraitCRUDController;
    
    public function __construct()
    {
        parent::__construct();

        $this->vairant = 'session';
        $this->folder_view_index = 'session.index';

        $this->loadModel($this->vairant);
        $this->base_route = 'session';
        $this->class_name = 'Session';

        $this->title_page = 'Gestion des sessions - Comelines';
        $this->title_home = 'Gestion des sessions';
        $this->create_title = "Creation d'une session";
        $this->view_title = "Information d'une session";
        $this->update_title = "Mise à jour d'une session";
        $this->delete_title = "Suppression d'une session";
        $this->msg_delete = "Voulez-vous vraiment supprimer cette session ";
    }

}
