<?php

namespace App\Controller;

use App\Helpers\S;
use App\Model\Periode;
use App\Helpers\TraitCRUDController;
use App\Controller\Admin\AppController;

class PeriodeController extends AppController
{
    use TraitCRUDController;
    
    public function __construct()
    {
        parent::__construct();

        $this->vairant = 'periode';
        $this->folder_view_index = 'periode.index';

        $this->loadModel($this->vairant);
        $this->base_route = 'periode';
        $this->class_name = 'Periode';

        $this->title_page = 'Gestion des periodes - Comelines';
        $this->title_home = 'Gestion des periodes';
        $this->create_title = "Creation d'une periode";
        $this->view_title = "Information d'une periode";
        $this->update_title = "Mise à jour d'une periode";
        $this->delete_title = "Suppression d'une periode";
        $this->msg_delete = "Voulez-vous vraiment supprimer cette periode ";
    }
        
    public function getall(){
        $model = Periode::table();
        
        $results = $model->select([
                'session.libelle' => 'session_id', 
                'periode.code' => 'code', 
                'periode.libelle' => 'libelle', 
                'periode.date_debut' => 'date_debut', 
                'periode.date_fin as date_fin'
                ])  ->join('session', 'periode.session_id', '=', 'session.id')
                    ->where('periode.visibilite', 1)
                    ->get();
        return $results;
    }

}
