<?php

namespace App\Repository;

use App\Model\Eleve;
use App\Model\AbonnementCantine;

class CantineRepository{
    
        
    public function info(string $search){
        $eleve = Eleve::table();

        $eleve = $eleve->select(['id', 'code', 'nom', 'prenom', 'sexe', 'date_naissance', 'lieu_naissance', 'pays.libelle'=>'pays' ])
                ->join('pays', 'pays.id', '=', 'eleve.pays_id')
                ->where('eleve.visibilite', '=', 1);

        $data = explode(" ", $search);

        foreach($data as $item){
            $eleve = $eleve->orWhere('eleve.nom', 'like', '%'.$item.'%');
            $eleve = $eleve->orWhere('eleve.prenom', 'like', '%'.$item.'%');
        }
        
        $eleves = $eleve->limit(5)->get();

        echo json_encode($eleves);
        
    }

    public function detail(string $code){
        $eleve = Eleve::table();
        $abonnement = AbonnementCantine::table();
    
        $eleve = $eleve->select(['id', 'code', 'nom', 'prenom', 'sexe', 'date_naissance', 'lieu_naissance', 'pays.libelle'=>'pays' ])
                ->join('pays', 'pays.id', '=', 'eleve.pays_id')
                ->where('eleve.visibilite', '=', 1)
                ->where('eleve.code', '=', $code)
                ->one();
        
        $abonnement = $abonnement
                ->select(
                    [
                        'id', 'code', 'nom', 'prenom', 'sexe', 
                        'date_naissance', 
                        'pension_classe.type' => '', 
                        'pension_classe.' => '', 
                        'pays.libelle'=>'pays' 
                    ]
                )
                ->join('eleve', 'eleve.id', '=', 'abonnement_cantine.eleve_id')
                ->where('abonnement_cantine.eleve_id', '=', $eleve->id)
                ->one();
            //Add pension classe
    }
}