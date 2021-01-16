<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;        
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class Exemplaire extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const DOCUMENT_ID = "document_id";
    const ETAT_DOCUMENT_ID = "etat_document_id";
    const CODE = "code";
    const DATE_ACQUISITION = "date_acquisition";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                new FormModel(false, 'document','Document'),
                new FormModel(false, 'etat_document','Etat du document'),
                new FormModel(true, self::CODE ,'Code',InputType::TEXT ),
                new FormModel(true, self::DATE_ACQUISITION ,'Date d\'acquisition',InputType::DATE ),

            ];

    }
}
