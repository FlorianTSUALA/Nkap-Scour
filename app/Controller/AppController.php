<?php

namespace App\Controller;

use \App;
use Core\Session\Session;
use Core\HTML\Form\FormField;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\BootstrapForm;

class AppController extends \Core\Controller\Controller
{
    /** @var Object \App $app Instance du singleton App */
    protected $app;

    /** @var Object $form Instance de BootstrapForm pour créer les formulaires de modif et d'ajout */
    protected $form;

    protected $session;

    /**
     * Initialise les variables pour cette application
     **/
    public function __construct()
    {
        $this->template = 'default';

        $this->viewPath = ROOT . '/ressources/views/';

        $this->app = App::getInstance();
        
        $this->form = new BootstrapForm();
        
        $this->field = new FormField();

        $this->session = new Session();
        
    }

    /**
     * Charge les Models
     *
     * @param string $modelName Nom du Model à charger
     * @return type
     * @throws conditon
     **/
    protected function loadModel(string $modelName)
    {
        $this->$modelName = $this->app->getModel($modelName);

    }
 
    protected function fill($to_extract, $fillables){


        return array_map( function($fillable) use ($to_extract)
        {   
            if(is_array($to_extract) && count($to_extract) > 1){
                if(is_object($fillable)){
                    $fillable  = (array) $fillable;
                }
                $tmp = [];
                foreach($to_extract as $item){
                    $tmp += [$item => $fillable[$item]];
               }
                return $tmp;
            }else{
                if(is_array($to_extract))
                {
                    
                    return $fillable[$to_extract];
                }else{
                    return $fillable->{$to_extract};
                }
            } 
        }, $fillables);


    }
 
    protected function fillExternal($fillables){
        $fillables = array_filter($fillables, function($item){
            return !$item->{FormModel::INTERNAL};
        });
        
        return array_map( function($fillable)
        {   
            if(is_object($fillable)){
                $fillable  = (array) $fillable;
            }
            $tmp = ['code' => $fillable[FormModel::NAME], 'table' => $fillable[FormModel::TABLE]];
            return $tmp;
          
        }, $fillables);
    }


}