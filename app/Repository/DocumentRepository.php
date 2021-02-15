<?php

namespace App\Repository;

use App\Model\DBTable;

use function Core\Helper\dd;
use function Core\Helper\vd;
use Core\Repository\BaseRepository;

class DocumentRepository extends BaseRepository{
    
        
    public function getDocumentGroupByDomaine(){
        
        $domaines =  DBTable::getModel(DBTable::DOMAINE)->select(
        [   
            'id',
            'code',
            'libelle'
        ])
        ->where('visibilite', '=', 1)
        ->get();

        $documents = [];            
        
        foreach($domaines as $domaine){
            $data_domaine = [
                'domaine_id' => $domaine['code'],
                'domaine' => $domaine['libelle'],
            ];

            $_documents =  DBTable::getModel(DBTable::DOCUMENT)->select(
            [   
                'code' => 'document_id',
                'titre' => 'document'
            ])
            ->where('visibilite', '=', 1)
            ->where('domaine_id', '=', $domaine['id'])
            ->get();

            $data_domaine['documents'] = $_documents??[];
           
            array_push($documents, $data_domaine);
            
        }
        
        return $documents;
    }

    public function draft()
    {
        $documents =  DBTable::getModel(DBTable::DOMAINE)->select(
            [   
                'document.code' => 'document_id', 
                'document.libelle' => 'document', 
                'domaine.code' => 'domaine_id', 
                'domaine.libelle' => 'domaine'
            ])
            ->join(DBTable::DOCUMENT, 'document.domaine_id', '=', 'domaine.id')
            ->where('domaine.visibilite', '=', 1)
            ->get();
            
    }


}