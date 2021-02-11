<?php

namespace App\Repository;

use App\Model\Eleve;
use App\Model\Parcours;
use Core\Controller\BaseRepository;

class EleveRepository extends BaseRepository{
    
        
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
        $parcours = Parcours::table();
    
        $eleve = $eleve->select(['id', 'code', 'nom', 'prenom', 'sexe', 'date_naissance', 'lieu_naissance', 'pays.libelle'=>'pays' ])
                ->join('pays', 'pays.id', '=', 'eleve.pays_id')
                ->where('eleve.visibilite', '=', 1)
                ->where('eleve.code', '=', $code)
                ->one();
        
        $parcours = $parcours
                ->select(
                    [
                        'id', 'code', 'nom', 'prenom', 'sexe', 
                        'date_naissance', 
                        'pension_classe.type' => '', 
                        'pension_classe.' => '', 
                        'pays.libelle'=>'pays' 
                    ]
                )
                ->join('eleve', 'eleve.id', '=', 'parcours.eleve_id')
                ->join('eleve', 'eleve.id', '=', 'parcours.eleve_id')
                ->join('pension_classe', 'pension_classe.classe_id', '=', 'parcours.classe_id')
                ->join('eleve', 'eleve.id', '=', 'parcours.eleve_id')
                ->where('parcours.visibilite', '=', 1)
                ->where('parcours.eleve_id', '=', $eleve->id)
                ->one();
            //Add pension classe
    }
}