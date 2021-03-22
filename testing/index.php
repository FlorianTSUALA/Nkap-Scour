
<body>
<center>

<?php
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

?>
</center>
</body>
</html>