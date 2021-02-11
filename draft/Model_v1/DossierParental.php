<?php 

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class DossierParental_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;
    
    const PAYS_MERE_ID = "pays_mere_id";
    const PAYS_PERE_ID = "pays_pere_id";
    const NOM_PERE = "nom_pere"; 
    const PRENOM_PERE = "prenom_pere"; 
    const PROFESSION_PERE = "profession_pere"; 
    const EMPLOYEUR_PERE = "employeur_pere"; 
    const LIEU_TRAVAIL_PERE = "lieu_travail_pere"; 
    const QUARTIER_PERE = "quartier_pere"; 
    const TELEPHONE_PERE = "telephone_pere"; 
    const VILLE_PERE = "ville_pere"; 
    const EST_TUTEUR = "est_tuteur";
    const EMAIL_PERE = "email_pere"; 
    const SIGNATURE_PERE = "signature_pere"; 
    const NOM_MERE = "nom_mere"; 
    const PRENOM_MERE = "prenom_mere"; 
    const PROFESSION_MERE = "profession_mere"; 
    const EMPLOYEUR_MERE = "employeur_mere"; 
    const LIEU_TRAVAIL_MERE = "lieu_travail_mere"; 
    const QUARTIER_MERE = "quartier_mere";
    const TELEPHONE_MERE = "telephone_mere"; 
    const VILLE_MERE = "ville_mere"; 
    const EST_TUTRICE = "est_tutrice";
    const EMAIL_MERE = "email_mere"; 
    const SIGNATURE_MERE = "signature_mere";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [

                new FormModel(false, 'pays_mere' , 'Pays de la mère'),
                new FormModel(false, 'pays_pere' ,'Pays du père'),
                new FormModel(true, self::NOM_PERE ,'Nom du père',InputType::TEXT ),
                new FormModel(true, self::PRENOM_PERE ,'Prenom du père',InputType::TEXT ),
                new FormModel(true, self::PROFESSION_PERE , 'Profession du père', InputType::TEXT),
                new FormModel(true, self::EMPLOYEUR_PERE , 'Employeur du père', InputType::TEXT),
                new FormModel(true, self::LIEU_TRAVAIL_PERE , 'Lieu de travail du père', InputType::TEXT),
                new FormModel(true, self::QUARTIER_PERE ,'Quartier du père',InputType::TEXT ),
                new FormModel(true, self::TELEPHONE_PERE ,'Téléphone du père',InputType::TEL ),
                new FormModel(true, self::VILLE_PERE ,'Ville du père',InputType::TEXT ),
                new FormModel(true, self::EST_TUTEUR , 'Est tuteur', InputType::RADIO, [['id'=>'N', 'value'=>'Non'], ['id'=>'O', 'value'=>'Oui']]),
                new FormModel(true, self::EMAIL_PERE , 'Email du père', InputType::EMAIL),
                new FormModel(true, self::SIGNATURE_PERE , 'Signature du père', InputType::TEXT),
                new FormModel(true, self::NOM_MERE ,'Nom de la mere',InputType::TEXT ),
                new FormModel(true, self::PRENOM_MERE ,'Prenom du mère',InputType::TEXT ),
                new FormModel(true, self::PROFESSION_MERE ,'Professio de lan mère',InputType::TEXT ),
                new FormModel(true, self::EMPLOYEUR_MERE , 'Employeur de la mère', InputType::TEXT),
                new FormModel(true, self::LIEU_TRAVAIL_MERE , 'Lieu de travail de la mère', InputType::EMAIL),
                new FormModel(true, self::QUARTIER_MERE , 'Quartier de la mère', InputType::TEXT),
                new FormModel(true, self::TELEPHONE_MERE ,'Telephone de la mère',InputType::TEL ),
                new FormModel(true, self::VILLE_MERE ,'Ville de la mère',InputType::TEXT ),
                new FormModel(true, self::EST_TUTRICE ,'Est tutrice',InputType::RADIO, [['id'=>'N', 'value'=>'Non'], ['id'=>'O', 'value'=>'Oui']] ),
                new FormModel(true, self::EMAIL_MERE , 'Email de la mère', InputType::EMAIL),
                new FormModel(true, self::SIGNATURE_MERE , 'Signature de la mère', InputType::TEXT),



            ];

    }
}