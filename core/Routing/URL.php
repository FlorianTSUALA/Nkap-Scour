<?php

namespace Core\Routing;

use App;
use App\Helpers\Helpers;
use core\Routing\URLNotFoundException;

class  URL{

    private static $router;

    public static function path(string $name): string
    {
        if(!self::$router->has($name)){
            throw new URLNotFoundException("Le nom de route specifiée est introuvable !!!");
        }
        return self::$router->get($name)->getPath();
    }

    public static function link(string $name): string
    {
        if(!self::$router->has($name)){
            throw new URLNotFoundException("Le nom de route specifiée est introuvable !!!");
		}
		$path = self::$router->get($name)->getPath();
		if( Helpers::contains('{', $path) ){
			$path = explode('{', $path)[0];
		} 
        return  App::base_url() . $path;
    }

    public static function base(): string
    {
        return  App::base_url();
    }

    public static function res(): string
    {
        return  str_replace('public/', '', App::base_url()) ;
    }

    
	/**
	 * register router
	*/
	public static function registerRouter($router) {
		self::$router = $router;
		
	}
	/**
	 * 
	 * @return Core\Routing\Router
	 */
	function getRouter(): Core\Routing\Router {
		return $this->router;
	}
	
	/**
	 * 
	 * @param Core\Routing\Router $router 
	 * @return URL
	 */
	function setRouter(Core\Routing\Router $router): self {
		$this->router = $router;
		return $this;
	}
}