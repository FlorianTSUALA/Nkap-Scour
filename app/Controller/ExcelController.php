<?php

namespace App\Controller;

use App\App;
use DateTime;
use App\Helpers\S;
use App\Model\Pays;
use App\Model\Eleve;
use App\Model\Classe;
use Core\Routing\URL;
use App\Model\Parcours;
use Core\Session\Request;
use App\Model\SalleClasse;
use App\Model\AnneeScolaire;

use function Core\Helper\dd;
use App\Model\DossierParental;
use App\Model\StatutApprenant;
use App\Repository\EleveRepository;
// use App\Controller\Admin\AppController;

class ExcelController extends AppController
{
    /**
     * Initialise les Models qu'on charge dans ce controller
     **/
    public function __construct()
    {
        parent::__construct();
        $this->loadModel('pays');
        $this->loadModel('statut_apprenant');
        $this->loadModel('classe');
        $this->loadModel('salle_classe');
        $this->loadModel('annee_scolaire');
       // $this->loadModel('antecedent_scolaire');
        $this->loadModel('eleve');
        $this->loadModel('parcours');
    }



    /**
     * permet la connexion d'utilisateur à la BD
     **/
    public function excell()
    {
        // require_once  (dirname (dirname (__DIR__))). "/lib/Excell/PHPExcel.php";
        $path="2020_CPA_T1Note.xlsx";
        $reader= PHPExcel_IOFactory::createReaderForFile($path);
        //$Reader->setReadDataOnly(true);
        $excel_Obj = $reader->load($path);
        

        //echo $worksheet->getCell('E33')->getValue();

      

        $i = 0;
            while ($excel_Obj->setActiveSheetIndex($i)){
                $worksheet=$excel_Obj->getSheet($i);
                $Worksheet = $excel_Obj->getActiveSheet();
                $lastRow = $worksheet->getHighestRow();
                $colomncount = $worksheet->getHighestDataColumn();
                $colomncount_number=PHPExcel_Cell::columnIndexFromString($colomncount);

                echo "<table border='1'>";
            for($row=1;$row<=$lastRow;$row++){
                echo "<tr>";
                for($col=1;$col<=$colomncount_number;$col++){
                    echo "<td>";
                
                        echo $worksheet->getCell(PHPExcel_Cell::stringFromColumnIndex($col).$row)->getValue();
                    
                    echo "</td>";
                }
                echo "</tr>";
            }	
        echo "</table>";
                
                $i++;
                //echo $excel_Obj->getSheetCount();
                if ($i == $excel_Obj->getSheetCount()) {
                break;    
            }
            $col1 =4; $row1=3;
            $inline= $worksheet->getCell(PHPExcel_Cell::stringFromColumnIndex($col1).$row1)->getValue();
            $timestamp = ($inline - 25569) * 86400;
            $date=date("d/m/y",$timestamp);
            echo $date;
            $col2 =13; $row2=2;
            

        $value=$worksheet->getCell(PHPExcel_Cell::stringFromColumnIndex($col2).$row2)->getOldCalculatedValue();
        echo " ".round_up($value, 2);

            }


        $classe = "";

        dd("ok");

        //ANTECEDANT SCOLAIRE
        $code_antecedent_scolaire = $this->antecedent_scolaire->genCode();
        $data_antecedent_scolaire = [
            'code' => $code_antecedent_scolaire,
            'classe' => $classe,
            
        ];
        $result_antecedent_scolaire = $this->antecedent_scolaire->save($data_antecedent_scolaire);
        $id_antecedent_scolaire = $this->antecedent_scolaire->id($code_antecedent_scolaire);

    

        //INFO ELEVE
        $code_eleve = $this->eleve->genCode();

        
        $matricule =  (new EleveRepository())->getMatricule() ;

        $photo_name = 'no-photo.jpg';
      


        $data_eleve = [
            'code' => $code_eleve,
            'matricule' => $matricule,
            'nom' => Request::getSecParam('nom_eleve', ''),
            'prenom' => Request::getSecParam('prenom_eleve', ''),
            
            'lieu_naissance' => Request::getSecParam('lieu_naissance_eleve', ''),
            'date_naissance' => Request::getSecParam('date_naissance_eleve', ''),
            'sexe' => Request::getSecParam('sexe_eleve', ''),
            'photo' => $photo_name,
            Eleve::PAYS_ID => $this->pays->id(Request::getSecParam('pays_eleve', ''), Pays::LIBELLE),
            'anciennete' => (Request::getSecParam('anciennete_eleve', '') === '')? 0 : Request::getSecParam('anciennete_eleve', ''),
           
            Eleve::GROUPE_FAMILIAL_ID => null,
       
            Eleve::ANTECEDENT_SCOLAIRE_ID => $id_antecedent_scolaire,
        ];

        $result_eleve = $this->eleve->save($data_eleve);
        $id_eleve = $this->eleve->id($code_eleve);

        $id_salle_classe = $this->salle_classe->id(Request::getSecParam('salle_classe_eleve', ''), SalleClasse::LIBELLE);
        $id_salle_classe = ($id_salle_classe == false) ? null : $id_salle_classe;

        $id_annee_scolaire = $this->annee_scolaire->id(Request::getSecParam('annee_scolaire', ''), AnneeScolaire::LIBELLE);
        $code_annee_scolaire = $this->annee_scolaire->code(Request::getSecParam('annee_scolaire', ''), AnneeScolaire::LIBELLE);
        //PARCOURS ELEVE
        $code_parcours = $this->parcours->genCode();
        $data_parcours = [
            'code' => $code_parcours,
            Parcours::ANNEE_SCOLAIRE_ID => $id_annee_scolaire,
            'date_inscription' => (new DateTime('NOW'))->format('Y-m-d H:i:s'),
            Parcours::ELEVE_ID => $id_eleve,
            Parcours::STATUT_APPRENANT_ID => $this->statut_apprenant->id(Request::getSecParam('statut_apprenant_eleve', ''), StatutApprenant::LIBELLE),
            Parcours::CLASSE_ID => $this->classe->id(Request::getSecParam('classe_eleve', ''), Classe::LIBELLE),
            Parcours::SALLE_CLASSE_ID => $id_salle_classe,
        ];

        $result_parcours = $this->parcours->save($data_parcours);
        $id_parcours = $this->parcours->id($code_parcours);

    }
}
