<?php

namespace App\Repository;

use App\Model\Eleve;
use App\Model\Facture;
use App\Model\AbonnementCantine;

use function Core\Helper\dd;

class CantineRepository{
    


    public function getInfoByclassePeriod( $day_date, string $salle_classe_id){

        $abonnement = AbonnementCantine::table();

        if(!$salle_classe_id){
            $abonnement = $abonnement->select(['nom', 'prenom', 'salle_classe.libelle'=>'classe'])
            ->join('eleve', 'eleve.id','=','abonnement_cantine.eleve_id')
            ->join('parcours','parcours.eleve_id','=','eleve.id')
            ->join('salle_classe','parccours.salle_classe_id','=','salle_classe.id')
            ->where($day_date)
            -> BETWEEN ('abonnement_cantine.date_debut'  AND 'abonnement_cantine.date_fin');

        }
       else {
        $abonnement = $abonnement->select(['nom', 'prenom', 'salle_classe.libelle'=>'classe'])
        ->join('eleve', 'eleve.id','=','abonnement_cantine.eleve_id')
        ->join('parcours','parcours.eleve_id','=','eleve.id')
        ->join('salle_classe','parccours.salle_classe_id','=','salle_classe.id')
        ->where($day_date)
        -> BETWEEN ('abonnement_cantine.date_debut'  AND 'abonnement_cantine.date_fin')
        ->where('salle_class.id','=','$salle_classe_id');
       
       }
       dd($abonnement);
       
    }
       
    

}