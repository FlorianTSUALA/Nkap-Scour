<?php

namespace App\Controller;

use App\Model\AntecedentScolaire;
use App\Model\DBTable;
use App\Model\DossierMedical;
use App\Model\DossierParental;
use App\Model\Eleve;
use App\Model\Parcours;
use App\Model\PensionEleve;
use App\Model\StatutApprenant;
use Core\Session\Request;
use Core\HTML\FlashMessages;
use Core\HTML\MessageFlash\FlashMessagesStatic;
use Spipu\Html2Pdf\Html2Pdf;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

class TestController extends AppController
{

    public function __construct()
    {
        parent::__construct();
        $this->loadModel('cycle');
    }

    public function test()
    {
        
        $classes = DBTable::getModel(DBTable::ELEVE)
                    ->select(['code' => 'id', 'libelle' => 'value'])
                    ->join(DBTable::DOSSIER_PARENTAL, DossierParental::ID, '=', Eleve::DOSSIER_PARENTAL_ID)
                    ->join(DBTable::DOSSIER_MEDICAL, DossierMedical::ID, '=', Eleve::DOSSIER_MEDICAL_ID)
                    ->join(DBTable::ANTECEDENT_SCOLAIRE , AntecedentScolaire::ID, '=', Eleve::ANTECEDENT_SCOLAIRE_ID)
                    ->join(DBTable::PARCOURS, Parcours::ID, '=', Eleve::PARCOURS_ID)
                    ->join(DBTable::PENSION_ELEVE , StatutApprenant::ID, '=', Eleve::Stat)
                    ->join(DBTable::PENSION_ELEVE , PensionEleve::ID, '=', Eleve::PENSION_Eleve_ID)
                    ->join(DBTable::PENSION_ELEVE , PensionEleve::ID, '=', Eleve::PENSION_Eleve_ID)
                    ->join(DBTable::PENSION_ELEVE , PensionEleve::ID, '=', Eleve::PENSION_Eleve_ID)
                    ->join(DBTable::PENSION_ELEVE , PensionEleve::ID, '=', Eleve::PENSION_Eleve_ID)
                    ->join(DBTable::PENSION_ELEVE , PensionEleve::ID, '=', Eleve::PENSION_Eleve_ID)
                    ->join(DBTable::PENSION_ELEVE , PensionEleve::ID, '=', Eleve::PENSION_Eleve_ID)
                    // ->join(DBTable::ANNEE_SCOLAIRE , '', '', '')
                    ->where('visibilite', '=', 1)->get();
 
        // die("Hello");
        $this->render("test");  
    }

    public function testSQL()
    {
        // $this->    
    }

    public function testpdf()
    {


        try {
            ob_start();
            include dirname(__FILE__).'/res/cantineList2.php';
            $content = ob_get_clean();

            $html2pdf = new Html2Pdf('P', 'A4', 'fr');
            $html2pdf->pdf->SetDisplayMode('fullpage');
            //$html2pdf->setDefaultFont("GOTHIC.php");
            $html2pdf->writeHTML($content);
            $html2pdf->output('examplSe04.pdf');
        } catch (Html2PdfException $e) {
            $html2pdf->clean();

            $formatter = new ExceptionFormatter($e);
            echo $formatter->getHtmlMessage();
        }    
    }

    public function testAlert()
    {
        // $this->    
    }

    public function testA()
    {
        // $this->    
    }

    public function testB()
    {
        // $this->    
    }

    public function testC()
    {
        // $this->    
    }


}