<?php 

namespace App\Model;

use Core\Model\Model;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Document extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    protected $entity;

    const DOMAINE_ID = "domaine_id";
    const NUMERO_ENREGISTREMENT = "numero_enregistrement";
    const CODE_ISBN = "code_isbn";
    const TITRE = "titre";
    const COUVERTURE = "couverture";
    const AUTEUR = "auteur";
    const NOMBRE_PAGE = "nombre_page";
    const DATE_PUBLICATION = "date_publication";
    const MAISON_EDITION = "maison_edition";

    public function __construct(){
        $this->fillables =
            [
                new FormModel(true,'domaine' , 'Domaine'),
                new FormModel(true, self::NUMERO_ENREGISTREMENT , 'Numéro d\'enregistrement', InputType::NUMBER),
                new FormModel(true, self::CODE_ISBN , 'Code isbn', InputType::DATE),
                new FormModel(true, self::TITRE ),
                new FormModel(true, self::COUVERTURE ),
                new FormModel(true, self::AUTEUR ),
                new FormModel(true, self::NOMBRE_PAGE , 'Nombre de page', InputType::NUMBER),
                new FormModel(true, self::DATE_PUBLICATION , 'Date de publication', InputType::DATE),
                new FormModel(true, self::MAISON_EDITION , 'Maison d\'edition', InputType::TEXT),

            ];

    }
}