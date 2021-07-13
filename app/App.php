<?php

namespace App;

use Core\BaseApp;

/**
 * Va stocker les informations nécessaires à plusieurs éléments de l'Application afin de les réutiliser un peu partout
 * @package App
 */
class App extends BaseApp 
{
	protected $title = 'Bienvenue aux Comelines';
	public $SCHOOL_NAME = 'Comelines';
	const ORGANISATION = 'Comelines';

}