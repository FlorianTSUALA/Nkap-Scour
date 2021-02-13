<?php

namespace App;

use Core\BaseApp;
use ClanCats\Hydrahon\Query\Sql\Base;

/**
 * Va stocker les informations nécessaires à plusieurs éléments de l'Application afin de les réutiliser un peu partout
 * @package App
 */
class App extends BaseApp 
{
	protected $title = 'Bienvenue aux Comelines';
	public $SCHOOL_NAME = 'Les Comelines';
	const ORGANISATION = 'Les Comelines';



	// public static function getAppInstance() {
		
	// 	return BaseApp::getAppInstance(self::ORGANISATION);
	// }


}