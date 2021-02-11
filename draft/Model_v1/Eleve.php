<?php

namespace App\Model;

use DateTime;
use Core\Model\Model;
use App\Helpers\Helpers;
use Core\Database\Database;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;
use Core\Model\HydrahonModel;
use App\Helpers\HelpersBusinessLogic;

class Eleve_v1 extends Model implements FrequentlyReapeat
{
    use HydrahonModel;

    const DOSSIER_MEDICAL_ID = "dossier_medical_id";
    const PAYS_ID = "pays_id";
    const GROUPE_FAMILIAL_ID = "groupe_familial_id";
    const DOSSIER_PARENTAL_ID = "dossier_parental_id";
    const ANTECEDENT_SCOLAIRE_ID = "antecedent_scolaire_id";
    const MATRICULE = "matricule";
    const NOM = "nom";
    const PRENOM = "prenom";
    const SURNOM = "surnom";
    const SEXE = "sexe";
    const DATE_NAISSANCE = "date_naissance";
    const LIEU_NAISSANCE = "lieu_naissance";
    const PHOTO = "photo";
    const ANCIENNETE = "anciennete";


    public function __construct(Database $db, $entity = null){
        parent::__construct($db);

        $this->fillables =
            [
                new FormModel(false, 'dossier_medical','Dossier médical'),
                new FormModel(false, self::PAYS_ID, 'Pays'),
                new FormModel(false, self::GROUPE_FAMILIAL_ID, 'Groupe familial'),
                new FormModel(false, 'dossier_parental','Dossier parental'),
                new FormModel(false, 'antecedent_scolaire','Antécédent scolaire' ),
                new FormModel(true, self::MATRICULE, 'Matricule', null, null, null, null, false),
                new FormModel(true, self::NOM),
                new FormModel(true, self::PRENOM),
                new FormModel(true, self::SURNOM),
                new FormModel(true, self::SEXE),
                new FormModel(true, self::DATE_NAISSANCE ,'Date de naissance',InputType::DATE ),
                new FormModel(true, self::LIEU_NAISSANCE , 'Lieu de naissance', InputType::TEXT),
                new FormModel(true, self::PHOTO),

            ];

    }

    public function getEleveInscriptionInfoby(){
        $req =
        "
            select  InfoEleve.pays_mere as pays_mere, InfoEleve.pays_pere as pays_pere,
            InfoEleve.email as email, InfoEleve.ecole as ecole,
            InfoEleve.classe as classe, InfoEleve.telephone as telephone,
            InfoEleve.allergie as allergie, InfoEleve.groupe_sanguin as groupe_sanguin,
            InfoEleve.maladie_recurrente as maladie_recurrente, InfoEleve.probleme_particulier as probleme_particulier,
            InfoEleve.nom_medecin as nom_medecin, InfoEleve.telephone_medecin as telephone_medecin,
            InfoEleve.email_medecin as email_medecin, InfoEleve.autres as autres,
            InfoEleve.matricule as matricule_eleve, InfoEleve.nom as nom_eleve, InfoEleve.prenom as prenom_eleve,
            InfoEleve.sexe as sexe_eleve,
            InfoEleve.date_naissance as date_naissance_eleve, InfoEleve.lieu_naissance as lieu_naissance_eleve,
            InfoEleve.anciennete as anciennete_eleve, InfoEleve.photo as photo_eleve,
            InfoParcours.date_inscription_parcours as date_inscription_parcours, InfoParcours.classe as classe_parcours,
            InfoParcours.statut_annee_scolaire as statut_annee_scolaire,
            InfoParcours.annee_scolaire as annee_scolaire, InfoParcours.statut_apprenant as statut_apprenant
            from
            (
                select  dp.pays_mere as pays_mere, dp.pays_pere as pays_pere,
                        antecedent_scolaire.email as email, antecedent_scolaire.ecole as ecole,
                        antecedent_scolaire.classe as classe, antecedent_scolaire.telephone as telephone,
                        dossier_medical.allergie as allergie, dossier_medical.groupe_sanguin as groupe_sanguin,
                        dossier_medical.maladie_recurrente as maladie_recurrente, dossier_medical.probleme_particulier as probleme_particulier,
                        dossier_medical.nom_medecin as nom_medecin, dossier_medical.telephone_medecin as telephone_medecin,
                        dossier_medical.email_medecin as email_medecin, dossier_medical.autres as autres,
                        eleve.matricule as matricule, eleve.nom as nom, eleve.prenom as prenom, eleve.sexe as sexe,
                        eleve.date_naissance as date_naissance, eleve.lieu_naissance as lieu_naissance,
                        eleve.anciennete as anciennete, eleve.photo as photo, eleve.id as id
                from
                    (
                        select dossier_parental.id as id, pp.libelle as pays_pere, pm.libelle as pays_mere
                        from dossier_parental
                        left join pays as pp on pp.id = dossier_parental.pays_pere_id
                        left join pays as pm on pm.id = dossier_parental.pays_mere_id
                    ) dp,
                    eleve
                        left join antecedent_scolaire on eleve.antecedent_scolaire_id = antecedent_scolaire.id
                        left join dossier_medical on eleve.dossier_medical_id = dossier_medical.id
                        left join pays on pays.id = eleve.pays_id
                where dp.id = eleve.dossier_parental_id

            ) InfoEleve,
            (
                select  parcours.eleve_id as id, parcours.date_inscription_parcours, classe.libelle as classe_parcours,
                        annee_scolaire.debut_annee as annee_scolaire, annee_scolaire.statut as statut_annee_scolaire, statut_apprenant.libelle as statut_apprenant
                from parcours
                left join classe on classe.id = parcours.classe_id
                left join statut_apprenant on statut_apprenant.id = parcours.statut_apprenant_id
                left join annee_scolaire on annee_scolaire.id = parcours.classe_id
                #where annee_scolaire.statut = 1
            )  InfoParcours
            where InfoEleve.id = InfoParcours.id
            order by InfoParcours.date_inscription
        ";
        $result = $this->query($req);
        return $this->toObject($result);
    }

    public function getEleveInscriptionInfoById($matricule){
        $req =
        "
            select  InfoEleve.pays_mere as pays_mere, InfoEleve.pays_pere as pays_pere,
            InfoEleve.email as email, InfoEleve.ecole as ecole,
            InfoEleve.classe as classe, InfoEleve.telephone as telephone,
            InfoEleve.allergie as allergie, InfoEleve.groupe_sanguin as groupe_sanguin,
            InfoEleve.maladie_recurrente as maladie_recurrente, InfoEleve.probleme_particulier as probleme_particulier,
            InfoEleve.nom_medecin as nom_medecin, InfoEleve.telephone_medecin as telephone_medecin,
            InfoEleve.email_medecin as email_medecin, InfoEleve.autres as autres,
            InfoEleve.matricule as matricule_eleve, InfoEleve.nom as nom_eleve, InfoEleve.prenom as prenom_eleve,
            InfoEleve.sexe as sexe_eleve,
            InfoEleve.date_naissance as date_naissance_eleve, InfoEleve.lieu_naissance as lieu_naissance_eleve,
            InfoEleve.anciennete as anciennete_eleve, InfoEleve.photo as photo_eleve,
            InfoParcours.date_inscription_parcours as date_inscription_parcours, InfoParcours.classe as classe_parcours,
            InfoParcours.statut_annee_scolaire as statut_annee_scolaire,
            InfoParcours.annee_scolaire as annee_scolaire, InfoParcours.statut_apprenant as statut_apprenant
            from
            (
                select  dp.pays_mere as pays_mere, dp.pays_pere as pays_pere,
                        antecedent_scolaire.email as email, antecedent_scolaire.ecole as ecole,
                        antecedent_scolaire.classe as classe, antecedent_scolaire.telephone as telephone,
                        dossier_medical.allergie as allergie, dossier_medical.groupe_sanguin as groupe_sanguin,
                        dossier_medical.maladie_recurrente as maladie_recurrente, dossier_medical.probleme_particulier as probleme_particulier,
                        dossier_medical.nom_medecin as nom_medecin, dossier_medical.telephone_medecin as telephone_medecin,
                        dossier_medical.email_medecin as email_medecin, dossier_medical.autres as autres,
                        eleve.matricule as matricule, eleve.nom as nom, eleve.prenom as prenom, eleve.sexe as sexe,
                        eleve.date_naissance as date_naissance, eleve.lieu_naissance as lieu_naissance,
                        eleve.anciennete as anciennete, eleve.photo as photo, eleve.id as id
                from
                    (
                        select dossier_parental.id as id, pp.libelle as pays_pere, pm.libelle as pays_mere
                        from dossier_parental
                        left join pays as pp on pp.id = dossier_parental.pays_pere_id
                        left join pays as pm on pm.id = dossier_parental.pays_mere_id
                    ) dp,
                    eleve
                        left join antecedent_scolaire on eleve.antecedent_scolaire_id = antecedent_scolaire.id
                        left join dossier_medical on eleve.dossier_medical_id = dossier_medical.id
                        left join pays on pays.id = eleve.pays_id
                where dp.id = eleve.dossier_parental_id

            ) InfoEleve,
            (
                select  parcours.eleve_id as id, parcours.date_inscription_parcours, classe.libelle as classe_parcours,
                        annee_scolaire.debut_annee as annee_scolaire, annee_scolaire.statut as statut_annee_scolaire, statut_apprenant.libelle as statut_apprenant
                from parcours
                left join classe on classe.id = parcours.classe_id
                left join statut_apprenant on statut_apprenant.id = parcours.statut_apprenant_id
                left join annee_scolaire on annee_scolaire.id = parcours.classe_id
                #where annee_scolaire.statut = 1
            )  InfoParcours
            where InfoEleve.id = InfoParcours.id and InfoEleve.matricule=?
            order by InfoParcours.date_inscription
        ";
        $result = $this->query($req, array($matricule));
        return $this->toObject($result);
    }

    public function getEleveInscriptionInfo(){
        $req =
            "                select  InfoEleve.pays_mere as pays_mere, InfoEleve.pays_pere as pays_pere,
            InfoEleve.email as email, InfoEleve.ecole as ecole,
            InfoEleve.classe as classe, InfoEleve.telephone as telephone,
            InfoEleve.allergie as allergie, InfoEleve.groupe_sanguin as groupe_sanguin,
            InfoEleve.maladie_recurrente as maladie_recurrente, InfoEleve.probleme_particulier as probleme_particulier,
            InfoEleve.nom_medecin as nom_medecin, InfoEleve.telephone_medecin as telephone_medecin,
            InfoEleve.email_medecin as email_medecin, InfoEleve.autres as autres,
            InfoEleve.matricule as matricule_eleve, InfoEleve.nom as nom_eleve, InfoEleve.prenom as prenom_eleve,
            InfoEleve.sexe as sexe_eleve,
            InfoEleve.date_naissance as date_naissance_eleve, InfoEleve.lieu_naissance as lieu_naissance_eleve,
            InfoEleve.anciennete as anciennete_eleve, InfoEleve.photo as photo_eleve,
            InfoParcours.date_inscription as date_inscription_parcours, InfoParcours.classe_parcours as classe_parcours,
            InfoParcours.statut_annee_scolaire as statut_annee_scolaire,
            InfoParcours.annee_scolaire as annee_scolaire, InfoParcours.statut_apprenant as statut_apprenant
            from
            (
                select  dp.pays_mere as pays_mere, dp.pays_pere as pays_pere,
                        antecedent_scolaire.email as email, antecedent_scolaire.ecole as ecole,
                        antecedent_scolaire.classe as classe, antecedent_scolaire.telephone as telephone,
                        dossier_medical.allergie as allergie, dossier_medical.groupe_sanguin as groupe_sanguin,
                        dossier_medical.maladie_recurrente as maladie_recurrente, dossier_medical.probleme_particulier as probleme_particulier,
                        dossier_medical.nom_medecin as nom_medecin, dossier_medical.telephone_medecin as telephone_medecin,
                        dossier_medical.email_medecin as email_medecin, dossier_medical.autres as autres,
                        eleve.matricule as matricule, eleve.nom as nom, eleve.prenom as prenom, eleve.sexe as sexe,
                        eleve.date_naissance as date_naissance, eleve.lieu_naissance as lieu_naissance,
                        eleve.anciennete as anciennete, eleve.photo as photo, eleve.id as id
                from
                    (
                        select dossier_parental.id as id, pp.libelle as pays_pere, pm.libelle as pays_mere
                        from dossier_parental
                        left join pays as pp on pp.id = dossier_parental.pays_pere_id
                        left join pays as pm on pm.id = dossier_parental.pays_mere_id
                    ) dp,
                    eleve
                        left join antecedent_scolaire on eleve.antecedent_scolaire_id = antecedent_scolaire.id
                        left join dossier_medical on eleve.dossier_medical_id = dossier_medical.id
                        left join pays on pays.id = eleve.pays_id
                where dp.id = eleve.dossier_parental_id

            ) InfoEleve,
            (
                select  parcours.eleve_id as id, parcours.eleve_id, parcours.date_inscription, classe.libelle as classe_parcours,
                        annee_scolaire.debut_annee as annee_scolaire, annee_scolaire.statut as statut_annee_scolaire, statut_apprenant.libelle as statut_apprenant
                from parcours
                left join classe on classe.id = parcours.classe_id
                left join statut_apprenant on statut_apprenant.id = parcours.statut_apprenant_id
                left join annee_scolaire on annee_scolaire.id = parcours.classe_id
                #where annee_scolaire.statut = 1
            )  InfoParcours
            where InfoEleve.id = InfoParcours.eleve_id
            order by InfoParcours.date_inscription

        ";
        $result = $this->query($req);
        return $this->toObject($result);
    }

    public function getEleveClass($classe_id){
        $req =
        "                select  InfoEleve.pays_mere as pays_mere, InfoEleve.pays_pere as pays_pere,
        InfoEleve.email as email, InfoEleve.ecole as ecole,
        InfoEleve.classe as classe, InfoEleve.telephone as telephone,
        InfoEleve.allergie as allergie, InfoEleve.groupe_sanguin as groupe_sanguin,
        InfoEleve.maladie_recurrente as maladie_recurrente, InfoEleve.probleme_particulier as probleme_particulier,
        InfoEleve.nom_medecin as nom_medecin, InfoEleve.telephone_medecin as telephone_medecin,
        InfoEleve.email_medecin as email_medecin, InfoEleve.autres as autres,
        InfoEleve.matricule as matricule_eleve, InfoEleve.nom as nom_eleve, InfoEleve.prenom as prenom_eleve,
        InfoEleve.sexe as sexe_eleve,
        InfoEleve.date_naissance as date_naissance_eleve, InfoEleve.lieu_naissance as lieu_naissance_eleve,
        InfoEleve.anciennete as anciennete_eleve, InfoEleve.photo as photo_eleve,
        InfoParcours.date_inscription as date_inscription_parcours, InfoParcours.classe_parcours as classe_parcours,
        InfoParcours.statut_annee_scolaire as statut_annee_scolaire,
        InfoParcours.annee_scolaire as annee_scolaire, InfoParcours.statut_apprenant as statut_apprenant
        from
        (
            select  dp.pays_mere as pays_mere, dp.pays_pere as pays_pere,
                    antecedent_scolaire.email as email, antecedent_scolaire.ecole as ecole,
                    antecedent_scolaire.classe as classe, antecedent_scolaire.telephone as telephone,
                    dossier_medical.allergie as allergie, dossier_medical.groupe_sanguin as groupe_sanguin,
                    dossier_medical.maladie_recurrente as maladie_recurrente, dossier_medical.probleme_particulier as probleme_particulier,
                    dossier_medical.nom_medecin as nom_medecin, dossier_medical.telephone_medecin as telephone_medecin,
                    dossier_medical.email_medecin as email_medecin, dossier_medical.autres as autres,
                    eleve.matricule as matricule, eleve.nom as nom, eleve.prenom as prenom, eleve.sexe as sexe,
                    eleve.date_naissance as date_naissance, eleve.lieu_naissance as lieu_naissance,
                    eleve.anciennete as anciennete, eleve.photo as photo, eleve.id as id
            from
                (
                    select dossier_parental.id as id, pp.libelle as pays_pere, pm.libelle as pays_mere
                    from dossier_parental
                    left join pays as pp on pp.id = dossier_parental.pays_pere_id
                    left join pays as pm on pm.id = dossier_parental.pays_mere_id
                ) dp,
                eleve
                    left join antecedent_scolaire on eleve.antecedent_scolaire_id = antecedent_scolaire.id
                    left join dossier_medical on eleve.dossier_medical_id = dossier_medical.id
                    left join pays on pays.id = eleve.pays_id
            where dp.id = eleve.dossier_parental_id

        ) InfoEleve,
        (
            select  parcours.eleve_id as id, parcours.eleve_id, parcours.date_inscription, classe.libelle as classe_parcours,
                    annee_scolaire.debut_annee as annee_scolaire, annee_scolaire.statut as statut_annee_scolaire, statut_apprenant.libelle as statut_apprenant
            from parcours
            left join classe on classe.id = parcours.classe_id
            left join statut_apprenant on statut_apprenant.id = parcours.statut_apprenant_id
            left join annee_scolaire on annee_scolaire.id = parcours.classe_id
            where parcours.classe_id="+ $classe_id +
        ")  InfoParcours
        where InfoEleve.id = InfoParcours.eleve_id
        order by InfoParcours.date_inscription

        ";
        $result = $this->query($req);
        return $this->toObject($result);
    }

    public function genAnneeScolaireID(){
        $annee_scolaire = DBTable::getModel('annee_scolaire');
        $debut_annee = (int)substr(date('Y'), 2, 2);
        //create new if not exists
        //TODO Creattion de triggers de renitialisation du statut des années scolaires inactivées
        $id_annee_scolaire = $annee_scolaire->select()->where(AnneeScolaire::STATUT, '=', 1)->last()[AnneeScolaire::ID];
        $en_cours = $annee_scolaire->select()->where(AnneeScolaire::STATUT, '=', 1)->last()[AnneeScolaire::DEBUT_ANNEE];
        $en_cours = (int)substr($en_cours, 2, 2);
        if($debut_annee > $en_cours){//Ajouter des conditins supplementaires
            // if($id_annee_scolaire = $annee_scolaire->select('id')->where(AnneeScolaire::DEBUT_ANNEE, '=', $debut_annee)->exists() ){
                $code_annee_scolaire = AnneeScolaire::generateCode();
                $debut_annee =  (new DateTime('NOW'))->format('Y-m-d H:i:s');
                $data = [
                    AnneeScolaire::CODE => $code_annee_scolaire,
                    AnneeScolaire::DEBUT_ANNEE => $debut_annee,
                    AnneeScolaire::FIN_ANNEE => date("Y-m-d H:i:s", strtotime(date("Y-m-d H:i:s", strtotime($debut_annee)) . " + 1 year")),
                    AnneeScolaire::STATUT => 1,
                ];
                $annee_scolaire->insert($data)->execute();
                $id_annee_scolaire = $annee_scolaire->select('id')->find('code', $code_annee_scolaire);
        }

        return $id_annee_scolaire;
    }


    public function genMatricule(){
        //$matricule = HelpersBusinessLogic::genMatricule();
        $i = 0;
        $j = 6;

        $year = DBTable::getModel('annee_scolaire')
                ->select()
                ->where(AnneeScolaire::STATUT, 1)
                ->first()[AnneeScolaire::DEBUT_ANNEE];

        $eleve = DBTable::getModel('eleve');
        $lastMatricule = $eleve->select()->last()[Eleve::MATRICULE];

        $lastMatricule = ($eleve->select()->exists())? $lastMatricule : substr(date('Y'), 2, 2).'A000';

        $lastNumber = substr($lastMatricule, 3, 3);
        $character = substr($lastMatricule, 2, 1);

        if($lastNumber == 999){
            $character = Helpers::getIncCharacter($character, 1);
            $lastNumber = 0;
        }

        $this->incNumerToStringLenght($lastNumber);
        $matricule = substr($year, 2, 2).$character.$lastNumber;

        while($eleve->select()->where(Eleve::MATRICULE, '=', $matricule)->exists()){
            $matricule = $this->genMatricule();
        }

        return $matricule;
    }


    private function incNumerToStringLenght(&$number){
        $number = (int)$number;
        $number++;
        if( $number < 10){
            $number = "00".$number;
        }elseif($number < 100){
            $number = "0".$number;
        }
    }
}