<?php

namespace App\Repository;

use App\Model\DBTable;
use function Core\Helper\dd;

class AnneeScolaireRepository{
    
    public function getActive($tag = null){

        $annee_scolaire = DBTable::getModel(DBTable::ANNEE_SCOLAIRE)
        ->select(['id', 'code', 'libelle'])
        ->where('visibilite', '=', 1)
        ->where('statut', '=', 1)
        ->orderBy('date_creation', 'desc')
        ->first();
        
        switch($tag){
            case 'id': return $annee_scolaire['id'];
            case 'code': return $annee_scolaire['code'];
            case 'libelle': return $annee_scolaire['libelle'];
            default: return $annee_scolaire;
        }
    }

    public function getAll(){

        $annee_scolaires = DBTable::getModel('annee_scolaire')
        ->select(['code'=>'id', 'libelle' => 'libelle'])
        ->where('visibilite', '=', 1)
        ->orderBy('date_creation', 'desc')
        ->get();
       
       return $annee_scolaires;
    }


}