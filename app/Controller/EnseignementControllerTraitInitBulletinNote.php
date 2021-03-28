<?php

namespace App\Controller;

use App\Helpers\S;
use App\Model\Classe;
use Core\Model\Model;
use App\Model\DBTable;
use App\Model\Periode;
use App\Model\Composer;
use App\Model\Parcours;
use App\Helpers\Helpers;
use Core\Session\Request;
use function Core\Helper\dd;
use App\Repository\PeriodeRepository;

use App\Repository\ParcoursRepository;
use App\Controller\Admin\AppController;
use App\Model\AffectationClasseMatiere;
use App\Repository\SalleClasseRepository;
use App\Repository\EnseignementRepository;

trait EnseignementControllerTraitInitBulletinNote
{

      /**
     * retourne true si il existe des affectations concernant l'affectation des enseignants à une salle de classe
     * pour une année scolaire donnné
     *
     * @param string $annee_scolaire_code
     * @return boolean
     */
    public function verifierExistenceBulletinSallePeriode($annee_scolaire_id, $salle_classe_id, $periode_id)
    {
        $result = Composer::table()
                        ->select([ 'code' => 'id' ])
                        ->where('visibilite', 1)
                        ->where('periode_id', $periode_id)
                        ->where('annee_scolaire_id', $annee_scolaire_id)
                        ->where('salle_classe_id', $salle_classe_id)
                        ->get();
        return ( is_array($result) && count($result)>0);
    }




     //initialisation pour une année scolaire définies
    //To do
    public function initBulletinSalle($annee_scolaire_id, $classe_id, $periode_id )
    {
        // $personnels = (Personnel::table()->select([ 'code' => 'id' , new Expression("concat(nom,' ',prenom) as value")])->where('visibilite', 1)->get());
        eleve_id
        $cours = Helpers::toJSON(DBTable::table()->select(['id'=>'id', 'libelle' => 'value']))
        $personnel_id = Helpers::toJSON(DBTable::table()->select)
        $eleves
        for ($i = 0; $i <count($annee_scolaires); $i++){
            $annee_scolaire = $annee_scolaires[$i]['id'];
            for ($j = 0; $j <count($salle_classes); $j++){
                $salle_classe = $salle_classes[$j]['id'];
                $data = ['annee_scolaire_id' => $annee_scolaire, 'salle_classe_id' => $salle_classe, 'code' =>  AffectationPersonnelSalleClasse::generateCode()];
                // vd($data); 
                AffectationPersonnelSalleClasse::table()->insert($data)->execute();
            }
        }
       
    }

    public function genererBulletinSalle($annee_scolaire_code)
    {
        $annee_scolaire_id = AnneeScolaire::getId(DBTable::ANNEE_SCOLAIRE, $annee_scolaire_code);
        $this->_genererAffectationSalleEnseignant($annee_scolaire_id);
        echo true;
    }

  

}