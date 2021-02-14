<?php

namespace App\Controller;

use App\Model\Classe;
use App\Model\Pays;
use App\Model\Eleve;
use Core\Session\Request;
use App\Model\DossierParental;
use App\Model\Parcours;
use App\Model\StatutApprenant;

class EmploiTempsController extends AppController
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
        $this->render('sections.emploi_temps.accueil', compact('exemple'));
    }


}