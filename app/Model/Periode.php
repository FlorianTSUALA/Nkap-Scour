<?php


namespace App\Model;

use Core\Model\Model;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Periode extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    protected $entity;   
    
    const SESSION_ID = "session_id";
    const DATE_DEBUT = "date_debut";
    const DATE_FIN = "date_fin";

    public function __construct(){
        $this->fillables =
            [
                new FormModel(false, self::SESSION_ID, 'Session', InputType::SELECT2),
                new FormModel(true, self::DATE_DEBUT,'Date de début',InputType::DATE ),
                new FormModel(true,self::DATE_FIN,'Date de fin',InputType::DATE ),
                new FormModel(true, self::LIBELLE, 'Libellé', null, null, null, null, false ),
                new FormModel(true, self::DESCRIPTION, 'Description', null, null, null, null, false ),
            ];
    }


    public static function getDayCount($periode){
        $dayCount = 0;
        switch($periode){
            case 'JOUR':
                $dayCount = 1;
                break;
            case 'SEMAINE':
                $dayCount = 7;
                break;
            case 'MOIS':
                $dayCount = 30;
                break;
            case 'ANNEE':
                $dayCount = 365;
                break;
            default:
        }
        return $dayCount;
    }
    
}