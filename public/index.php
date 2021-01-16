<?php
//Error reporting
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

define('ROOT', dirname(__DIR__));
define('BASE_PATH', "nkap-scour/public/");

require_once ROOT . '/app/App.php';

App::load();

use Core\Routing\URL;
use Core\Helper\Helpers;
use Core\Routing\Router;
use Core\Routing\RouteNotFoundException;

$router = new Router();

$helper = new Helpers();
$helper->declareDebug();

$action = str_replace( strtolower(App::base_url()) , "", strtolower(App::full_url()) );

require_once "../routes/api.php";
require_once "../routes/web.php";

URL::registerRouter($router);

try{
    $router->call($action);
}catch(RouteNotFoundException $ex){
    //App::abort(404);
}


if (isset($_SESSION['input'])) unset($_SESSION['input']);