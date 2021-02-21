<?php

namespace App\Repository;

use App\Model\Exemplaire;
use Core\Repository\BaseRepository;

class ExemplaireRepository extends BaseRepository{
    
    public function getAll()
    {
        return Exemplaire::table()->select('
                document.titre as document_id, 
                etat_document.libelle as etat_document_id, 
                exemplaire.code as code, 
                exemplaire.code_enregistrement as code_enregistrement, 
                exemplaire.date_acquisition as date_acquisition,
                exemplaire.statut as statut
                ')
        ->where('exemplaire.visibilite','=', 1)
        ->join('document', 'exemplaire.document_id', '=', 'document.id')
        ->join('etat_document', 'exemplaire.etat_document_id', '=', 'etat_document.id')
        ->get();
    }

}