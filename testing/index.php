<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>

<?php

use App\Model\Eleve;
use App\Model\DBTable;
use App\Model\Parcours;
use Core\Session\Request;

use App\Model\SalleClasse;
use function Core\Helper\dd;
use App\Repository\EleveRepository;

require_once "Classes/PHPExcel.php";
$path="2020_CPA_T1Note.xlsx";
$reader= PHPExcel_IOFactory::createReaderForFile($path);
//$Reader->setReadDataOnly(true);
$excel_Obj = $reader->load($path);
 

//echo $worksheet->getCell('E33')->getValue();

//echo $colomncount;
function round_up($value, $places)
{
    $mult = pow(10, abs($places));
     return $places < 0 ?
    ceil($value / $mult) * $mult :
        ceil($value * $mult) / $mult;
}

$i = 0;
	$html = '';

	while ($excel_Obj->setActiveSheetIndex($i))
	{
		$worksheet=$excel_Obj->getSheet($i);
		$Worksheet = $excel_Obj->getActiveSheet();
		$lastRow = $worksheet->getHighestRow();
        $colomncount = $worksheet->getHighestDataColumn();
        $colomncount_number=PHPExcel_Cell::columnIndexFromString($colomncount);

		$html .= "<table border='1'>";
		for($row=1;$row<=$lastRow;$row++){
			$html .=  "<tr>";
			//  for($col=1;$col<=5;$col++){
			// 	$html .=  "<td>";

			// 	$html .=  $nom; //$worksheet->getCell(PHPExcel_Cell::stringFromColumnIndex($col).$row)->getValue();
			// 	$html .=  "</td>";
					
			// 	$html .=  "</td>";
			// }
			$index_nom = 2;
			$index_prenom = 3;
			$index_date_naissance = 4;
			$index_lieu_naissance = 5;
			// $index_nom = 2;
			// $index_nom = 2;
				$td_open .=  "<td>";
				$td_closed .=  "</td>";
			$nom = $td_open . $worksheet->getCell(PHPExcel_Cell::stringFromColumnIndex($index_nom).$row)->getValue() .$td_closed;
			$prenom = $td_open . $worksheet->getCell(PHPExcel_Cell::stringFromColumnIndex($index_prenom).$row)->getValue() .$td_closed;
			$date_naissance = $td_open . $worksheet->getCell(PHPExcel_Cell::stringFromColumnIndex($index_date_naissance).$row)->getValue() .$td_closed;
			$lieu_naissance = $td_open . $worksheet->getCell(PHPExcel_Cell::stringFromColumnIndex($index_lieu_naissance).$row)->getValue() .$td_closed;
			$html .= $nom. $prenom.$date_naissance.$lieu_naissance;
			$html .=  "</tr>";
		}	
		$html .= "</table>";	
		
		$i++;
		//echo $excel_Obj->getSheetCount();
		if ($i == $excel_Obj->getSheetCount()) 
				break;    
		$col1 =4; $row1=3;
		$inline= $worksheet->getCell(PHPExcel_Cell::stringFromColumnIndex($col1).$row1)->getValue();
		$timestamp = ($inline - 25569) * 86400;
		$date=date("d/m/y",$timestamp);
		echo $date;
		$col2 =13; $row2=2;
	

		$value=$worksheet->getCell(PHPExcel_Cell::stringFromColumnIndex($col2).$row2)->getOldCalculatedValue();
		$html .= " ".round_up($value, 2);

    }
	echo $html;



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

?>
</body>
</html>