<?php

use Core\Model\Model;
use App\Model\DBTable;
use Core\Session\Request;
use App\Model\AbonnementCantine;

// retrive id by code
$eleve_code = Model::getId('eleve', Request::getSecParam('eleve_id', ''));

// retrive code by id
// $eleve_code = Model::get('eleve', Request::getSecParam('eleve_id', ''));



$model = DBTable::getModel(DBTable::ABONNEMENT_DETAIL);


$code_cantine = AbonnementCantine::generateCode();

