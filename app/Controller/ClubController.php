<?php

namespace App\Controller;

use App\Controller\Admin\AppController;

class ClubController extends AppController
{
    /**
     * Initialise les Models qu'on charge dans ce controller
     **/
    public function __construct()
    {
        parent::__construct();
        $this->loadModel('matiere');

    }

    public function index()
    {
        $this->app->setTitle('Gestion des emploie de temps  - Comelines');
        
        $this->render('sections.emploie_temps.emploie_temps');
        // $this->render('sections.emploie_temps.emploie_temps', compact('pays', 'classes', 'statut_apprenants'));
    }

 
    public function accueil()
    {
        $exemple = [];
        $this->render('sections.club.accueil', compact('exemple'));
    }

}