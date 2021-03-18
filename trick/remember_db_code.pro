<?php

use Core\Model\Model;
use App\Model\DBTable;
use Core\Session\Request;



$annee_scolaire_id = Model::getId(DBTable::ANNEE_SCOLAIRE, Request::getSecParam('annee_scolaire_id', ''));


?>