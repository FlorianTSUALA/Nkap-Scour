<?php

namespace App\Model;

use Core\Model\Model;
use Core\Database\Database;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;

class AbonnementActivite_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;

    const ELEVE_ID = "eleve_id";
    const MULTIPLICATEUR = "multiplicateur";
    const DATE_PAIEMENT = "date_paiement";
    const DATE_DEBUT = "date_debut";
    const DATE_FIN = "date_fin";
    const MONTANT = "montant";
    const PERIODE = "periode";

    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $inscription_eleves = InscriptionActivite::table()->select([ 'code' => 'id' , 'libelle' => 'value'])->where('visibilite', 1)->get();
        $activites = Activite::table()->select([ 'code' => 'id' , 'libelle' => 'value'])->where('visibilite', 1)->get();
        $periodes = ['JOUR', 'SEMAINE', 'MOIS', 'ANNEE'];

        $this->fillables =
        [
            new FormModel(false, 'eleve', 'Elève'),
            new FormModel(true, self::MULTIPLICATEUR, self::MULTIPLICATEUR, InputType::NUMBER),
            new FormModel(true, self::DATE_PAIEMENT, self::DATE_PAIEMENT, InputType::DATE, [], '', '', false),
            new FormModel(true, self::DATE_DEBUT, self::DATE_DEBUT, InputType::DATE, [], '', '', false),
            new FormModel(true, self::DATE_FIN, self::DATE_FIN, InputType::DATE, [], '', '', false),
            new FormModel(true, self::MONTANT, self::MONTANT, InputType::NUMBER, [], '', '', false),
            new FormModel(true, self::PERIODE, self::PERIODE, InputType::SELECT2, $periodes, '', '', false),
            new FormModel(true, self::LIBELLE, 'Libellé', InputType::TEXT, [], '', '', false),
        ];

    }
}