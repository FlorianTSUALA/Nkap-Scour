<?php

namespace App\Controller;

use App\Model\Pays;
use App\Model\DBTable;
use App\Helpers\Helpers;
use App\Model\Personnel;
use Core\Session\Request;
use App\Helpers\HTMLHelper;
use App\Model\TypePersonnel;
use function Core\Helper\dd;

use function Core\Helper\vd;
use Core\HTML\Form\FormModel;
use App\Helpers\TraitCRUDController;
use App\Repository\ClasseRepository;
use App\Controller\Admin\AppController;

use App\Repository\PersonnelRepository;
use ClanCats\Hydrahon\Query\Expression;
use App\Repository\AnneeScolaireRepository;
use ClanCats\Hydrahon\Query\Expression as Ex;

class PersonnelController extends AppController
{
    use TraitCRUDController;
    public function __construct()
    {
        parent::__construct();

        $this->vairant = DBTable::PERSONNEL;
        $this->folder_view_index = 'personnel.index';


        $this->loadModel($this->vairant);
        $this->loadModel('pays');
        $this->loadModel('type_personnel');
        $this->base_route = 'personnel';
        $this->class_name = 'personnel';

        $this->title_page = 'Gestion du personnel - Comelines';
        $this->title_home = 'Gestion du personnel';
        $this->create_title = "Ajout d'un personnel";
        $this->view_title = "Information sur un personnel";
        $this->update_title = "Mise à jour des informations du perosnnel";
        $this->delete_title = "Suppression du personnel";
        $this->msg_delete = "Voulez-vous vraiment supprimer ce personnel ";
    }


    public function getall()
    {
        $model = Personnel::table();
        $results = $model->select('
                type_personnel.libelle as type_personnel_id,
                pays.libelle as pays_id,
                personnel.code as code,
                personnel.nom,
                personnel.prenom,
                personnel.sexe,
                personnel.photo,
                personnel.assurance,
                personnel.telephone,
                personnel.email,
                personnel.adresse,
                personnel.login,
                personnel.password,
                personnel.date_prise_service,
                personnel.date_fin_carriere,
                personnel.bibliographie')
            ->where('personnel.visibilite', 1)
            ->join('type_personnel', 'personnel.type_personnel_id', '=', 'type_personnel.id')
            ->join('pays', 'personnel.pays_id', '=', 'pays.id')
            ->get();


        return $results;
    }


    public function ajout()
    {
        $this->app->setTitle('Ajout d\'un personnel  - Comelines');
        // $type_personnels = $this->type_personnel->all(); 
        $type_personnels = TypePersonnel::table()->select([ 'code' => 'id' , 'libelle' => 'value'])->where('visibilite', 1)->get();
        // $pays = $this->pays->all();
        $pays = Pays::table()->select([ 'code' => 'id' , 'libelle' => 'value'])->where('visibilite', 1)->get() ;

        $this->render('sections.personnel.ajout_personnel', compact('pays',  'type_personnels'));

    }

    public function save()
    {
        //INFO PERSONNEL
        $code_personnel = Personnel::generateCode();

        $matricule = $code_personnel;

        $photo_name = Request::saveImg($matricule . '_photo_profile', 'photo', 'img/personnel');
        if ($photo_name === 1) {
            $photo_name = 'no-photo.jpg';
        }

        $piece_jointes ='photo_autres';
        $photo_peices_jointes = Request::saveImg($matricule . '_photo_peices_jointes', 'photo_autres', 'img/personnel');
        if ($photo_peices_jointes === 1) {
            $photo_peices_jointes = 'no-photo.jpg';
        }
      

        $data_personnel = [
            'type_personnel_id' =>  Personnel::getId(DBTable::TYPE_PERSONNEL, Request::getSecParam('type_personnel', ''), TypePersonnel::CODE),
            'pays_id' =>  Pays::getId(DBTable::PAYS, Request::getSecParam('pays', ''), Pays::CODE),
            'nom' => Request::getSecParam('nom', '') ,
            'prenom' => Request::getSecParam('prenom', '') ,
            'sexe' => Request::getSecParam('sexe', '') ,
            'photo' => Request::getSecParam('photo', '') ,
            'telephone' => Request::getSecParam('telephone', '') ,
            'email' => Request::getSecParam('email', '') ,
            'adresse' => Request::getSecParam('adresse', '') ,
            'login' => Request::getSecParam('login', '') ,
            'password' => Request::getSecParam('password', '') ,
            'date_prise_service' => Request::getSecParam('date_prise_service', '') ,
            'date_fin_carriere' => Request::getSecParam('date_fin_carriere', '') ,
            'bibliographie' => Request::getSecParam('bibliographie', '') ,
            'assurance' => Request::getSecParam('nom_personnel', '') ,
            'piece_jointes' =>  $photo_peices_jointes ,
            'code' => $code_personnel,
            'photo' => $photo_name
        ];

        $result_personnel = Personnel::table()->insert($data_personnel);
        $result_personnel = true;
        
        if ($result_personnel) {
            $this->sendResponseAndExit(Helpers::toJSON($result_personnel, TRUE));
        } else {
            $this->sendResponseAndExit($result_personnel, false, 400, 'DB Error');
        }
    }


    public function update($code)
    {
        $data = Request::getSecPostParam($this->{$this->vairant}->fillables);
        $data = $this->resolveCode2IdInput($data, $this->fillExternal($this->{$this->vairant}->fillables));
        $clause = [ 'code' => $code ];

        $data[Personnel::PASSWORD] = sha1($data[Personnel::PASSWORD]);

        $result = $this->{$this->vairant}->update($data, $clause);

        if($result){
            $items = $this->getall();
            $data = HTMLHelper::genBodyTable($items, $this->class_name, $this->fill(['label','name', 'type', FormModel::EXTERNAL_TYPE], $this->{$this->vairant}->fillables));
            $this->sendResponseAndExit($data);
        }else{
            $this->sendResponseAndExit($data, FALSE, 400, 'DB Error');
        }
    }




    public function save1()
    {
        $data = Request::getSecPostParam($this->{$this->vairant}->fillables);
        $data = $this->resolveCode2IdInput($data, $this->fillExternal($this->{$this->vairant}->fillables));
        $data += ['code' => $this->{$this->vairant}->genCode()];

        $data[Personnel::PASSWORD] = sha1($data[Personnel::PASSWORD]);

        $result = $this->{$this->vairant}->save($data);
        if($result){
            $items = $this->getall();
            $data = HTMLHelper::genBodyTable($items, $this->class_name, $this->fill(['label','name', 'type', FormModel::EXTERNAL_TYPE], $this->{$this->vairant}->fillables));
            $this->sendResponseAndExit($data);
        }else{
            $this->sendResponseAndExit($data, FALSE, 400, 'DB Error');
        }
    }

   
    public function liste_abonnee()
    {
        $personnels = (new PersonnelRepository())->getDocumentGroupByPersonnel();   
        $classes = (new ClasseRepository())->getSalleClasseGroupByClasse();
        

        
        $annee_scolaire_id =  (new AnneeScolaireRepository())->getActive('id');

        $data_info_personnels = (new PersonnelRepository())->getInfoPersonnels($annee_scolaire_id);

        // dd($data_info_personnels);
        $this->render('sections.personnel.personnel_liste', compact( 'classes','data_info_personnels', 'personnels'));
    }

    public function liste_classe()
    {

        $personnels = (new PersonnelRepository())->getDocumentGroupByPersonnel();   
        $classes = (new ClasseRepository())->getSalleClasseGroupByClasse();
        
        $annee_scolaire_id =  (new AnneeScolaireRepository())->getActive('id');

        $data_info_personnels = (new PersonnelRepository())->getInfoPersonnels($annee_scolaire_id);

        // dd($data_info_personnels);
        $this->render('sections.personnel.personnel_salle_classe', compact( 'classes','data_info_personnels', 'personnels'));
    }



    public function getApiPersonnels()  
    {
        $annee_scolaire_id =  (new AnneeScolaireRepository())->getActive('id');

        $data_info_personnels = (new PersonnelRepository())->getInfoPersonnels($annee_scolaire_id);

        echo Helpers::toJSON($data_info_personnels) ;
    }



    public function getApiAllEssentiel()  
    {
        $personnels = Helpers::toJSON(Personnel::table()->select([ 'id' => 'id' , new Expression("concat(nom,' ',prenom) as value")])->where('visibilite', 1)->get());
        $this->sendResponseAndExit(Helpers::toJSON($personnels, TRUE));
    }


}