<?php

namespace Core\Session;

use App\Helpers\Helpers;

class Request
{
    /**
	 * Tests if the current request is a POST request
	 * @return boolean
	 */
	public static function isPost()
	{
		return ($_SERVER['REQUEST_METHOD'] == 'POST' ? true : false);
	}

	/**
	 * Tests if the current request is a GET request
	 * @return boolean
	 */
	protected static function isGet()
	{
		return ($_SERVER['REQUEST_METHOD'] == 'GET' ? true : false);
	}

	/**
	 * fetches the given parameter data.
	 * @param string $key the key to look for.
	 * @param mixed $default the default value to return, if the given parameter is not set.
	 */
	public static function getParam($key, $default = null)
	{
		if (self::isPost()) {
			if(isset($local_data)) {
				return $local_data ;
			}
		}
		else if (self::isGet()) {
			if(isset($_GET[$key])) {
				return $_GET[$key];
			}
		}

		return $default;
	}

	/**
	 * fetches the given parameter data.
	 * @param string $key the key to look for.
	 * @param mixed $default the default value to return, if the given parameter is not set.
	 */
	public static function getSecParam($key, $default = null, $data = null)
	{
		$local_data = null;

		if($key == null && $data == null){
			return $default;
		}

		if (self::isPost() ){
			if(isset($_POST[$key])){
				$local_data = ($data == null)? $_POST[$key] : $data ;
			}
		}
		else if (self::isGet()) {
			if(isset($_GET[$key])){
				$local_data = ($data == null)? $_GET[$key]: $data;
			}

		}else{
			return $default;
		}

		if(isset($local_data)) {
			if(is_array($local_data)){
				$tmp = $local_data;
				$local = [];
				if(Helpers::isAssoc($tmp)){
					foreach($tmp as $key => $value){
						$local[self::getSecParam(null, $default, $key)] = self::getSecParam(null, $default, $value);
					}
				}else{
					foreach($tmp as $value){
						array_push($local, self::getSecParam(null, $default, $value));
					}
				}
				return $local;
			}else{
				return InputRequestControl::stringProtected($local_data);
			}
		}

		return $default;
	}
	
 /////////////////////////////////

	public static function getSecPostParam($items)
	{
		$data = [];

		foreach($items as $item){
			$item = (array)$item;
			$data += [$item['name'] => self::getSecParam($item['name'])];
		}

		return $data;
	}

    public static function saveImg(string $photo = "photo_eleve", string $name, $local_folder="img/eleve/"){
        // Check if the form was submitted
        if($_SERVER["REQUEST_METHOD"] == "POST"){
            // Check if file was uploaded without errors
            if(isset($_FILES[$photo]) && $_FILES[$photo]["error"] == 0){
                $allowed = array("jpg" => "image/jpg", "jpeg" => "image/jpeg", "gif" => "image/gif", "png" => "image/png");
                $filename = $name . '_'.time(). '_' . $_FILES[$photo]["name"];
                $filetype = $_FILES[$photo]["type"];
                $filesize = $_FILES[$photo]["size"];

                // Verify file extension
                $ext = pathinfo($filename, PATHINFO_EXTENSION);
                if(!array_key_exists($ext, $allowed)) die("Erreur: Bien vouloir selectionner le bon format d'image.Actualisez la page  et recommencez");

                // Verify file size - 5MB maximum
                $maxsize = 5 * 1024 * 1024;
                if($filesize > $maxsize) die("Errer: Erreur la taile du fichier depasse la taille limite.");

                // Verify MYME type of the file
                if(in_array($filetype, $allowed)){
                    // Check whether file exists before uploading it
                    if(file_exists("../ressources/uploads/".$local_folder . $filename)){
                        //echo $filename . " is already exists.";
                        return $filename;
                    } else{
                        move_uploaded_file($_FILES[$photo]["tmp_name"], "../ressources/uploads/".$local_folder . $filename);
                        //echo "Fichier importé avec succes.";
                        return $filename;
                    }
                } else{

                    //echo "Error: There was a problem uploading your file. Please try again.";
                    return 1;
                }
            } else{
                //echo "Error: " . $_FILES[$photo]["error"];
                return 1;
            }
        }
    }

	public function getCurrentPage($page_tag = 'page'){
        return filter_input(INPUT_GET, $page_tag, FILTER_VALIDATE_INT, array(
            'options' => array(
                'default'   => 1,
                'min_range' => 1,
            ),
        ));
	}

	/**
	 * Returns a list of parameters given in the current request
	 * @return array the params given
	 */
	public static function getAllParams()
	{
		if (self::isPost()) {
			return $_POST;
		}
		else if (self::isGet()) {
			return $_GET;
		}
    }

}

