<?php

namespace App\Repository;

use App\Model\Exemplaire;
use Core\Repository\BaseRepository;

class ExemplaireRepository extends BaseRepository{
    
    public function getAll()
    {
        return Exemplaire::table()->select('
                document.titre as document_id, 
                document.code as external_target,
                etat_document.libelle as etat_document_id, 
                etat_document.code as external_target1,
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

    public function getAllEmprunt()
    {
        $req =
        "
            set @row_number = 0;
            select  (@row_number := @row_number + 1) as index,
                    emprunt.code as id,
                    document.titre as titre,
                    document.code_enregistrement as titre,
                     as classe,
                     as livre
            from emprunt 
            join document on exemplaire.id = emprunt.exemplaire_id
            join document on document.id = exemplaire.document_id
            join eleve on eleve.id = emprunt.eleve_id
            join salle_classe on document.id = emprunt.
            where   emprunt.restitution_id is not null and 
                    emprunt.visiblite = 1
            order by emprunt.id desc;
        ";

        $columns .= '{ "data": "date_emprunt" },';
        $columns .= '{ "data": "code_enregistrement" },';
        $columns .= '{ "data": "titre" },';
        $columns .= '{ "data": "eleve" },';
        $columns .= '{ "data": "classe" },';
        $columns .= '{ "data": "etat_document" },';
        $result = $this->query($req);
        return $this->toObject($result);
    }
}