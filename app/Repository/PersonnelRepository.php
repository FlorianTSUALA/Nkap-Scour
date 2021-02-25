<?php

namespace App\Repository;

use App\Model\DBTable;
use ClanCats\Hydrahon\Query\Expression;

use function Core\Helper\dd;
use function Core\Helper\vd;
use Core\Repository\BaseRepository;

class PersonnelRepository extends BaseRepository{
    
        
    public function getDocumentGroupByPersonnel(){
        
        $type_personnels =  DBTable::getModel(DBTable::TYPE_PERSONNEL)->select(
        [   
            'id',
            'code',
            'libelle',
          
        ])
        ->where('visibilite', '=', 1)
        ->get();

        $results = [];            
        
        foreach($type_personnels as $type_personnel)    {
            $_data_type_personnel = [
                'type_personnel_id' => $type_personnel['code'],
                'type_personnel' => $type_personnel['libelle'],
            ];

            $tmp =  DBTable::getModel(DBTable::PERSONNEL)->select(
            [   
                'code' => 'personnel_id',
                'nom' => 'personnel_nom',
                'prenom' => 'personnel_prenom'
            ])
            ->where('visibilite', '=', 1)
            ->where('type_personnel_id', '=', $type_personnel['id'])
            ->get();

            $_data_type_personnel['personnels'] = $tmp??[];
           
            array_push($results, $_data_type_personnel);
            
        }
        
        return $results;
    }

    public function getInfoPersonnels($annee_scolaire_id)
    {
        return DBTable::getModel(DBTable::PERSONNEL)
        ->select(
            [
                'personnel.code'=> 'id', 
                'personnel.telephone'=> 'telephone',
                'salle_classe.libelle'=> 'classe', 
                'type_personnel.libelle'=> 'fonction', 
                'salle_classe.code'=> 'salle_classe_id', 
                new Expression("concat(personnel.nom,' ',personnel.prenom) as nom_personnel"),
                'type_personnel.code' => 'type_personnel_id'
            ]
        )
        ->join('type_personnel', 'type_personnel.id', '=', 'personnel.type_personnel_id')
        ->join('salle_classe', 'salle_classe.id', '=', 'personnel.salle_classe_id')
        ->join('parcours', 'parcours.salle_classe_id', '=', 'salle_classe.id')
        // ->where('parcours.visibilite', '=', 1)
        ->where('parcours.annee_scolaire_id', '=', $annee_scolaire_id)
        ->get();
            
    }

    

}