<?php
/**
 * Created by PhpStorm.
 * User: Stéphane KAMGA
 * Date: 16/02/2019
 * Time: 13:36
 */

if (!function_exists("required_input")) {
    function required_input()
    {
        echo "<strong class='text-danger font-weight-bolder h5'>*</strong>&nbsp;";
    }
}

if (!function_exists("constructMessageFlash")) {
    function constructMessageFlash($title = "ERREUR", $message = "Votre login et/ou mot de passe est incorrect!!", $alert = "dark", $time = 6000)
    {
        $data = array([ SESSION::NOTIFICATION_TITLE => $title,
                        SESSION::NOTIFICATION_MESSAGE => $message,
                        SESSION::NOTIFICATION_ALERT => $alert,
                        SESSION::NOTIFICATION_TIME => $time
        ]);
        return $data;
    }
}

if (!function_exists("displayMessageFlash")) {
    function displayMessageFlash(
        $title = "ERREUR", $message = "Votre login et/ou mot de passe est incorrect!!",
        $alert = MessageFlash::alert_info,
        $time = 10000)
    {
       $flashMessage = "<script>
       $(function() {";

        $options = "{";
        //$options .= " $.toast({";
        $options .="  timeOut: ".$time. ",";    // How long the toast will display without user interaction
        $options .="  extendedTimeOut : 2000,";   // How long the toast will display after a user hovers over it
        $options .="  showMethod : 'slideDown',";

        $options .="  hideMethod : 'slideUp',";
        $options .="  closeMethod : 'slideUp',";
       // $options .="  positionClass : 'toast-center',";
        $options .="  progressBar  : true,";
        $options .="  preventDuplicates  : true";
        $options .=" } ";

        switch($alert){
            case MessageFlash::alert_info :
                $flashMessage .= "toastr.info(  '". $title ."',  '". $message."', ". $options. " );";

            break;
            case MessageFlash::alert_error :
                $flashMessage .= "toastr.error('". $title ."',  '". $message."', ". $options. ");";

            break;
            case MessageFlash::alert_warning :
                $flashMessage .= "toastr.warning('". $title ."',  '". $message."', ". $options. ");";

            break;
            case MessageFlash::alert_success :
                $flashMessage .= "toastr.success('". $title ."',  '". $message."', ". $options. ");";

            break;
            default :
        }

        $flashMessage .= ' }); </script> ';

        return $flashMessage;
    }
}

/*
if (!function_exists("displayMessageFlash")) {
    //https://kamranahmed.info/toast#quick-demos
    function displayMessageFlash(
        $title = "ERREUR", $message = "Votre login et/ou mot de passe est incorrect!!",
        $bgColor = "#9EC600",
        $time = 6000, $transition = MessageFlash::showHideTransition_fade,
        $position = MessageFlash::position_mid_center,
        $icon = MessageFlash::icon_warning, $loader = MessageFlash::loader_on)
    {
       $flashMessage = "<script>
       $(function() {";
        $flashMessage .= " $.toast({";
        $flashMessage .="  heading: '".$title. "',";
        $flashMessage .="  text: '".$message. "',";
        $flashMessage .="  showHideTransition: '".$transition. "',";
        $flashMessage .="  hideAfter: '".$time. "',";
        $flashMessage .="  icon: '".$icon. "',";
        $flashMessage .="  position: '".$position. "',";
        $flashMessage .="  loader: '".$loader. "',";
        //$flashMessage .="  textColor: '".$textColor. "',";
        $flashMessage .="  bgColor: '".$bgColor. "',";
        $flashMessage .="  });";


        $flashMessage .=' console.log( "ready!" );
                }); </script> ';

        return $flashMessage;
    }
}

*/

if (!function_exists("flashMessage")) {
    function flashMessage($title = "ERREUR", $message = "Votre login et/ou mot de passe est incorrect!!", $alert = "dark", $time = 10)
    {
        ?>
        <div class="container">
            <div class="alert alert-<?= $alert; ?> text-dark offset-3 col-6" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

                <h4 class="alert-heading"><?= $title; ?> :</h4>
                <p>
                    <?php
                    if(is_array($message))
                        print_r($message);
                    else
                        echo $message;
                    ?>
                </p>
                <hr>
                <p class="mb-0">Veuillez fermer cette boite de dialogue au coin supérieur droit.</p>
            </div>
        </div>


        <?php
    }
}

if (!function_exists("not_empty")) {
    function not_empty($fields = [])
    {
        if (count($fields) != 0) {
            foreach ($fields as $field) {
                if (empty($_POST["$field"]) || trim($_POST["$field"]) == "") {
                    return false;
                }
            }
            return true;
        }
    }
}

if (!function_exists("go_back_to")) {
    function go_back_to($adresse = "", $temps = NULL)
    {
        //bestKGSCode();
        if (!empty($adresse) && $temps == null) {
            header("Location: $adresse");
            exit();
            exit(_("<a href=\"$adresse\" title=\"Cliquez ici\">Si la redirection ne se fait pas, cliquez ici.</a>"));
        } elseif (!empty($adresse)) {
            if (!headers_sent()) {
                header("Refresh:$temps; url=$adresse");
                exit;
            } else {
                echo '<meta http-equiv="refresh" content="' . $temps, ';url=' . $adresse . '" />';
            }
        } else {
            var_dump($_SERVER['REQUEST_URI']);
            Redirect($_SERVER['REQUEST_URI']);
        }
    }
}

if (!function_exists("xaf")) {
    function xaf($prix = 0, $devise = "")
    {
        return number_format($prix, 0, ',', ' ')." ".$devise;
    }
}


/*
 * Calculate the old giving by date of born
 * @param date $dateborn
 * @return int|false Returns the result of soustraction now by $dateborn
 * @since 1.0.0
*/
if (!function_exists("getOld")) {
    function getOld($dateborn)
    {
        $dateborn = date_create($dateborn);
        $old = date("Y") - date_format($dateborn,"Y");

        return ($old < 0) ? false : $old;
    }
}


/*
 * Calculate the date of born giving by old
 * @param int $old
 * @return Date|false Returns the date of born. For example Year-Month-Day
 * @since 1.0.0
*/
if (!function_exists("getBornDate")) {
    function getBornDate($old)
    {
        $dateborn = date("Y") - $old;
        return $dateborn > date("Y") ? false : "$dateborn-01-01";
    }
}


/*
 * Verify the born date
 * @param string $expression
 * @return bool Returns a result of logical comparaison
 * @since 1.0.0
*/
if (!function_exists("checkBornDate")) {
    function checkBornDate($expression)
    {
        $date = explode("/", $expression);
        //REVIEW AMELIORATE THIS FUNCTION
        if(count($date) > 2)
        {
            $day = $date[0];
            $month = $date[1];
            $year = $date[2];
            if(!is_numeric($day) || !is_numeric($month) || !is_numeric($year))
                return false;
            return checkdate($month, $day, $year);
        }
        return true;
    }
}


/*
 * Check the good date
 * @param string $expression
 * @return bool Returns a result of logical comparaison
 * @since 1.0.0
*/
if (!function_exists("isItGoodDate")) {
    function isItGoodDate($date, $isBornDate = false, $delimiter = "-", $positionOfYear = 0)
    {
        $date = explode($delimiter, $date);

        if(count($date) > 1)
        {
            $day = $date[2-$positionOfYear];
            $month = $date[1];
            $year = $date[$positionOfYear];

            if(!is_numeric($day) || !is_numeric($month) || !is_numeric($year))
                return false;
            else if($isBornDate)
                return (($year == date("Y") || ($year == (date("Y") - 1) && $month == 12)) && checkdate($month, $day, $year));
            else
                return checkdate($month, $day, $year);
        }
        return false;
    }
}


/*
 * Transform date or old
 * @param string $expression
 * @return date Returns date format in MySQL convention
 * @since 1.0.0
*/
if (!function_exists("getMySQLDate")) {
    function getMySQLDate($expression)
    {
        $date = explode("/", $expression);
        return (count($date) > 1) ? mysqlDate($expression) : getBornDate($expression);
    }
}


/*
 * Get date with the time
 * @return datetime Returns date with the time in MySQL convention
 * @since 1.0.0
*/
if (!function_exists("getDatetime")) {
    $defaultTimeZone='UTC';
    if(date_default_timezone_get()!=$defaultTimeZone) date_default_timezone_set($defaultTimeZone);

    function getDatetime($format=DATE_FORMAT_LONG, $timestamp=false, $timezone="Africa/Libreville")
    {
        $userTimezone = new DateTimeZone(!empty($timezone) ? $timezone : 'GMT');
        $gmtTimezone = new DateTimeZone('GMT');
        $myDateTime = new DateTime(($timestamp!=false?date("r",(int)$timestamp):date("r")), $gmtTimezone);
        $offset = $userTimezone->getOffset($myDateTime);
        return date($format, ($timestamp!=false?(int)$timestamp:$myDateTime->format('U')) + $offset);
    }
}


/*
 * Produce HTML RENDER MAIL MESSAGE
 * @param string
 * @since 1.0.0
*/
if (!function_exists("getEmailMessage")) {
    function getEmailMessage($mailTitle = "Confirmation de votre adresse email", $mailContent = "Nous sommes ravi de vous avoir au sein de la communauté SUMBA.")
    {
        return '<html lang="fr-FR">
                        <head>
                            <meta charset="utf-8" />
                            <title>' . KGS_APPS_NAME . ' - ' . $mailTitle . ' </title>
                        </head>

                        <body>
                            <div style="margin-left: 25%; margin-right: 25%; font-family: \'Segoe UI\',serif;">
                                <div style="background-color:' . SUMBA_VERT . ';margin-bottom: 0; padding: 2%; color: white;">
                                    <h1 style="margin: 0;">' . KGS_APPS_NAME . '</h1>
                                </div>

                                <div style="background-color:' . SUMBA_BLANC . '; margin-top: 0; padding: 5%;">
                                    ' . $mailContent . '
                                    <div style="margin:0 -5.5% -5.5% -5.5%; padding:2%; background-color:' . SUMBA_BLEU . '; color: white;">
                                        <span>&copy; 2020 - Contact <b>(+241) 066 39 63 33</b></span>
                                    </div>
                                </div>
                            </div>
                        </body>
                    </html>';
    }
}



if (!function_exists("stringProtectedUcword")) {
    function stringProtectedUcword($string)
    {
        return trim(htmlspecialchars(ucwords(mb_strtolower($string))));
    }
}


if (!function_exists("stringProtectedLower")) {
    function stringProtectedLower($string)
    {
        return trim(htmlspecialchars(mb_strtolower($string)));
    }
}


if (!function_exists("stringProtectedUpper")) {
    function stringProtectedUpper($string)
    {
        return trim(htmlspecialchars(mb_strtoupper($string)));
    }
}




//Gerer l'etat actif des liens
if (!function_exists("set_active")) {
    function set_active($file, $class = 'active')
    {
        $path = pathinfo($_SERVER["SCRIPT_NAME"]);
        $page = $path["basename"];

        $file .= ".php";

        if ($page == $file) {
            return $class;
        } else {
            return '';
        }
    }
}

//Gerer l'etat actif des liens
if (!function_exists("set_open")) {
    function set_open($file, $class = 'open')
    {
        $path = pathinfo($_SERVER["SCRIPT_NAME"]);
        $page = $path["basename"];

        $file .= ".php";

        if ($page == $file) {
            return $class;
        } else {
            return '';
        }
    }
}

// COMPTE LE NOMBRE DE LIGNE D'UN FICHIER
if (!function_exists("count_file_line")) {
    function count_file_line($file, $length = 300)
    {
        $line_count = 0;
        $handle = fopen($file, "r");
        while(!feof($handle))
        {
            $line = fgets($handle);
            $line_count ++;
        }
        fclose($handle);

        return $line_count;
    }
}


/*
 * Modify file log of users
 * @param string $account , string $username AND string $action
 * @since 1.0.0
*/
if (!function_exists("setKGSLog")) {
    function setKGSLog($account, $username, $action, $admin = false)
    {
        $dir = KGS_RESSOURCES_LOG_DIRECTORY;
        $rotate = date("Ymd");
        $filename = $dir . DIRECTORY_SEPARATOR . LOG::FILE_NAME . Code::CODE_SEPARATEUR . LOG::TYPE_USER . Code::CODE_SEPARATEUR .$rotate . ".kgs";
        if($admin)
        {
            $filename = $dir . DIRECTORY_SEPARATOR . LOG::FILE_NAME . Code::CODE_SEPARATEUR . LOG::TYPE_ADMIN . Code::CODE_SEPARATEUR .$rotate . ".kgs";
        }

        $log = 'Grâce au compte "' . $account . '" : ';
        $log .= getFullDate(getDatetime()) . ", ";
        $log .= $username . " " . $action . " ";
        $log .= "Depuis le navigateur " . (isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : "CURL - Browser") . " et via l'adresse IP " . get_user_ip_address();

        $stream = @fopen($filename, "a");
        if (!$stream) {
            echo "Error! Couldn't open the file.";
        }
        else
        {
            fputs($stream, encodeFileText($log) . "\n");
            fclose($stream);
        }
    }
}


/*
 * @author Stéphane KAMGA
 * Obtenir l'adresse ip de l'utilisateur
 * @since 1.0.0
*/
if (!function_exists("get_user_ip_address")) {
    function get_user_ip_address(){
        if(!empty($_SERVER['HTTP_CLIENT_IP'])){
            //ip from share internet
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        }elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
            //ip pass from proxy
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        }else{
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        return $ip;
    }
}


/*
 * Save Log System
 * @param nothing
 * @since 1.0.0
*/
if (!function_exists("setLogSys")) {
    function setLogSys()
    {
        $dir1 = ".." . DIRECTORY_SEPARATOR . "ressources" . DIRECTORY_SEPARATOR . "log";
        $dir2 = DIRECTORY_SEPARATOR . "ressources" . DIRECTORY_SEPARATOR ."log";

        $dir = (file_exists($dir1) && is_dir($dir1)) ? $dir1 : $dir2;
        $rotate = date("Ymd");
        $filename = $dir . DIRECTORY_SEPARATOR . "syslog" .$rotate. ".kgs";

        $log = get_user_ip_address() . " ";
        $log .= getFullDate(getDatetime()) . " ";
        $log .= $_SERVER['HTTP_USER_AGENT'] . ", ";

        $stream = @fopen($filename, "a");
        fputs($stream, $log . "\n");
        fclose($stream);
    }
}



if (!function_exists("downloadCSV")) {
    function downloadCSV($dataTitle = [], $dataContent = [], $filename = "kgs-sumba.csv", $delimiter=";") {
        header('Content-Type: application/csv');
        header('Content-Disposition: attachment; filename="'.$filename.'";');

        $f = fopen('php://output', 'w');

        fputcsv($f, $dataTitle, $delimiter);
        foreach ($dataContent as $line) {
            fputcsv($f, $line, $delimiter);
        }

        die();
    }
}


/*
 * Cypher string
 * @param string $string
 * @return string Returns crypted string
 * @since 1.0.0
*/
if (!function_exists("crypted")) {
    function crypted($string)
    {
        return md5(
            sha1(
                md5(
                    base64_encode(
                        base64_encode(
                            base64_encode($string)
                        )
                    )
                )
            )
        );
    }
}


/*
 * Show a good message for user
 * @param string $thing AND string $color
 * @since 1.0.0
*/
if (!function_exists("printBoldThing")) {
    function printBoldThing($thing, $color = "red")
    {
        echo '<strong style="color:'. $color .';">'. $thing .'</strong>';
    }
}


/*
 * Truncate String
 * @param
 * @since 1.0.0
*/
if (!function_exists("truncateString")) {
    function truncateString($string, $limit = 20, $pad="...")
    {
        $charset = 'UTF-8';

        return (mb_strlen($string, $charset) > $limit) ? mb_substr($string, 0, $limit - strlen($pad), $charset) . $pad : $string;
    }
}


/*
 * Show the version of the application
 * @since 1.0.0
*/
if (!function_exists("versionApps")) {
    function versionApps()
    {
        //bestKGSCode();
        echo "SUMBA ver 0.0.1 designed by IT-MAX";
    }
}


/*
 * Encode the URL
 * @param string $url
 * @return string Returns URL encoded
 * @since 1.0.0
*/
if (!function_exists("encodeURL")) {
    function encodeURL($url)
    {
        return base64_encode(
            base64_encode(
                base64_encode(
                    base64_encode(
                        base64_encode(
                            $url
                        )
                    )
                )
            )
        ) ;
    }
}


/*
 * Decode the URL
 * @param string $url
 * @return string Returns URL decoded
 * @since 1.0.0
*/
if (!function_exists("decodeURL")) {
    function decodeURL($url)
    {
        return base64_decode(
            base64_decode(
                base64_decode(
                    base64_decode(
                        base64_decode(
                            $url
                        )
                    )
                )
            )
        ) ;
    }
}


/*
 * Cypher message to save in file
 * @param string $text
 * @return string Returns text crypted
 * @since 1.0.0
*/
if (!function_exists("encodeFileText")) {
    function encodeFileText($text)
    {
        return base64_encode(
            base64_encode(
                base64_encode(
                    base64_encode(
                        base64_encode(
                            $text
                        )
                    )
                )
            )
        ) ;
    }
}


/*
 * Decrypting of message for using
 * @param string $text
 * @return string Returns text decrypted
 * @since 1.0.0
*/
if (!function_exists("decodeFileText")) {
    function decodeFileText($text)
    {
        return base64_decode(
            base64_decode(
                base64_decode(
                    base64_decode(
                        base64_decode(
                            $text
                        )
                    )
                )
            )
        ) ;
    }
}


/*
 * Completing string with a symbol to his length
 * @param string $string , string $symbol , int $length AND string $position
 * @return string Returns string with adding symbol
 * @since 1.0.0
*/
if (!function_exists("addSymbol")) {
    function addSymbol($string, $symbol = "0", $length = "2", $position = "left")
    {
        if($position == "both")
            return str_pad($string, $length, $symbol, STR_PAD_BOTH);
        elseif($position == "right")
            return str_pad($string, $length, $symbol, STR_PAD_RIGHT);
        else
            return str_pad($string, $length, $symbol, STR_PAD_LEFT);
    }
}

/*
 * Show one page with the link for exit
 * @param string $message , string $link AND string $linkname
 * @since 1.0.0
*/
if (!function_exists("showNothingPage")) {
    function showNothingPage($message = "Oups...", $link = ".", $linkname = "Dashboard")
    {
        ?>
        <div class="container">
            <br />
            <br />

            <div class="jumbotron bg-<?= KGS_BG_COLOR;?> shadow-lg text-white">
                <h1 class="display-4 text-white"><i class="i-Information"></i>&nbsp;Information non disponible !</h1>
                <p class="lead"><?= "Oups... ". $message;?></p>
                <hr class="my-4 bg-white">
                <p>Chers utilisateurs vos données sont confidentielles.</p>
                <a class="btn btn-<?= KGS_BUTTON_MAIN_COLOR;?> btn-lg pull-right" href="<?= $link; ?>" role="button"><i class="i-Dashboard"></i>&nbsp;<?= $linkname; ?></a>
            </div>
        </div>
        <?php
    }
}


/*
 * Swapping Object
 * @param Object &$a AND Object &$b
 * @since 1.0.0
*/
if (!function_exists("swap")) {
    function swap(&$a, &$b)
    {
        $tmp = $a;
        $a = $b;
        $b = $tmp;
    }
}


/*
 * Swapping date
 * @param date &$date1 AND date &$date2
 * @since 1.0.0
*/
if (!function_exists("swapDate")) {
    function swapDate(&$date1, &$date2)
    {
        $d1 = $date1;
        $d2 = $date2;

        $tmp1 = explode(" ", $d1);
        $tmp1 = !empty($tmp1[1]);

        $tmp2 = explode(" ", $d2);
        $tmp2 = !empty($tmp2[1]);

        $d1 = date_create($d1);
        $d2 = date_create($d2);

        if(date_format($d1, "Y") > date_format($d2, "Y"))
            swap($date1, $date2);
        elseif(date_format($d1, "m") > date_format($d2, "m"))
            swap($date1, $date2);
        elseif(date_format($d1, "d") > date_format($d2, "d"))
            swap($date1, $date2);

        if($tmp1 && $tmp2)
        {
            if(date_format($d1, "H") > date_format($d2, "H"))
                swap($date1, $date2);
            elseif(date_format($d1, "i") > date_format($d2, "i"))
                swap($date1, $date2);
            elseif(date_format($d1, "s") > date_format($d2, "s"))
                swap($date1, $date2);
        }
    }
}


/*
 * Format date with slash
 * @param date $date
 * @return string|false Returns date to format day/month/year
 * @since 1.0.0
*/
if (!function_exists("slashDateFormat")) {
    function slashDateFormat($date)
    {
        $tmp = explode("-", $date);
        return (count($tmp) == 3) ? $tmp[2]. "/" .$tmp[1]. "/" .$tmp[0] : false;
    }
}


/*
 * Format date with MySQL convention
 * @param date $date with slash seperator
 * @return string|false Returns date to format year-month-day
 * @since 1.0.0
*/
if (!function_exists("mysqlDate")) {
    function mysqlDate($date)
    {
        $tmp = explode("/", $date);
        return (count($tmp) == 3) ? $tmp[2]. "-" .$tmp[1]. "-" .$tmp[0] : false;
    }
}

/*
 * Stylising input form
 * @param Object $expression AND string $class
 * @return string Returns the class style corresponding
 * @since 1.0.0
*/
if (!function_exists("classInput")) {
    function classInput($expression, $class = "info")
    {
        return !empty($expression) ? "alert-$class" : "";
    }
}

/*
 * Put the value in input form
 * @param Object $expression
 * @return string Returns the good value
 * @since 1.0.0
*/
if (!function_exists("valueInput")) {
    function valueInput($expression)
    {
        return !empty($expression) ? $expression : "";
    }
}

/*
 * Generate de link of pagination system
 * @param int $last_page , string $link , int $page_num AND int $nbre_page_max_gauche_et_droite
 * @return string|false Returns the link of pagination system
 * @since 1.0.0
*/
if (!function_exists("paginationServer")) {
    function paginationServer($last_page, $link, $page_num, $nbre_page_max_gauche_et_droite)
    {
        $pagination = false;
        //bestKGSCode();
        if($last_page != 1)
        {
            $pagination = '<ul class="pagination">';
            // LIEN DU COTE GAUCHE
            if($page_num > 1)
            {
                $previous = $page_num - 1;
                //LIEN PRECEDENT
                $pagination .= '<li class="page-item"><a class="page-link" href="' . $link. '?page=' . encodeURL($previous) . '">&laquo;&nbsp;Précédent&nbsp;</a></li>';

                for($i = $page_num - $nbre_page_max_gauche_et_droite; $i < $page_num; ++$i)
                {
                    if($i > 0)
                    {
                        $pagination .= '<li class="page-item"><a class="page-link" href="' . $link. '?page=' . encodeURL($i) . '">&nbsp;' . $i . '&nbsp;</a></li>';
                    }
                }
            }

            //LIEN ACTIF
            $pagination .= '<li class="page-item active"><a class="page-link" href="">&nbsp;' . $page_num . '&nbsp;</a></li>';

            // LIEN DU COTE DROIT
            for($i = $page_num + 1; $i <= $last_page; ++$i)
            {
                $pagination .= '<li class="page-item"><a class="page-link" href="' . $link. '?page=' . encodeURL($i) . '">&nbsp;' . $i . '&nbsp;</a></li>';

                if($i >= $page_num + $nbre_page_max_gauche_et_droite)
                {
                    break;
                }
            }

            //LIEN SUIVANT
            if($page_num != $last_page)
            {
                $next = $page_num + 1;
                $pagination .= '<li class="page-item"><a class="page-link" href="' . $link. '?page=' . encodeURL($next) . '">&nbsp;Suivant&nbsp;&raquo;</a></li>';
            }
            $pagination .= '</ul>';
        }
        return $pagination;
    }
}

/*
 * Verified timeout()
 * @param array $dataLink
 * @since 1.0.0
*/
if (!function_exists("timeoutSession")) {
    function timeoutSession($arraySession = [], $page = ".", $admin = false)
    {
        //bestKGSCode();
        if(!empty($_SESSION[Session::TIMEOUT]))
        {
            if(time() - $_SESSION[Session::TIMEOUT] < KGS_SESSION_TIME_OUT)
            {
                $_SESSION[Session::TIMEOUT] = time();
            }
            else
            {
                for($i = 0, $n = count($arraySession); $i < $n; ++$i)
                {
                    unset($_SESSION["$arraySession[$i]"]);
                }
                $_SESSION[Session::RETURN_PAGE] = $page;

                //TROUVER UN MOYEN DE REDIRECTION PLUS CONVIVIALE
                if($admin)
                {
                    /**
                     * KGS ~ ANOTHER WAY TO VERIFY
                     */
                    go_back_to("connexion.php");
                }
                else
                {
                    go_back_to("..");
                }
            }
        }
        else
        {
            $_SESSION[Session::TIMEOUT] = time();
        }
    }
}

/*
 * Generate the toggle column
 * @param array $dataLink
 * @return string|false Returns all link of toggle element
 * @since 1.0.0
*/
if (!function_exists("toggleColumn")) {
    function toggleColumn($dataLink = [], $start = 0)
    {
        $toggle = '<ul class="pagination">';
        for($i = 0, $n = count($dataLink); $i < $n; ++$i)
        {
            $toggle .= '<li class="page-item"><a class="page-link bg-light" data-column="' . ($i + $start) . '" style="cursor: pointer;">';
            $toggle .= $dataLink[$i] . '</a></li>';
        }
        $toggle .= '</ul>';
        return $toggle ? : false;
    }
}

/*
 * Find index of object attribute value check in array
 * @param array $dataObject, $attribut colunm to match and $value check
 * @return string|false Returns all link of toggle element
 * @since 1.0.0
*/
if (!function_exists("getObjectIndexInArray")) {
    function getObjectIndexInArray($dataObject, $attribut, $value)
    {
        $index = 0;
        foreach($dataObject as $data)
        {
            if($value == $data->{$attribut})
            {
                return $index;
            }
            ++$index;
        }

        return false;
    }
}

/*
 * Generate the modal view info by Stéphane KAMGA
 * Permet de produire une fenetre modal de visualisation des informations
 * @param string $idModal, string $labelAria, string $bg, string $title, array $data, array $icon, array $link AND array $linkStyle
 * @since 1.0.0
*/
if (!function_exists("showModalView")) {
    function showModalView($idModal = "viewData", $labelAria = "viewLabel", $bg = "dark", $title = "", $data = [], $icon = [], $link = [], $linkStyle = [], $item = 3, $format="modal-lg")
    {
        /**
         * GESTION DES AFFICHAGES SPECIAUX POUR LES IMAGES, ...
         */
        $extension = explode(",", KGS_IMGAGE_EXTENSION);
        $occurrence = 0;
        $position = array();
        $tmp_data = array_values($data);
        for($i = 0, $n = count($tmp_data); $i < $n; ++$i)
        {
            for($j = 0, $m = count($extension); $j < $m; ++$j)
                $occurrence += substr_count($tmp_data[$i], $extension[$j]);
            if($occurrence)
                $position[$i] = $i;
            else
                $position[$i] = -1;
            $occurrence = 0;
        }
        ?>
        <div class="modal fade border-0" id="<?= $idModal; ?>" tabindex="-3" role="dialog" aria-labelledby="<?= $labelAria;?> ">
            <div class="modal-dialog modal-dialog-centered <?= $format;?>" role="document">
                <div class="modal-content">
                    <div class="modal-header text-white bg-<?= $bg; ?>">
                        <h5 class="modal-title" id="<?= $labelAria; ?>"><?= $title; ?></h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                <?php
                                $i = 0; $j = 1;
                                foreach ($data as $key => $value) {
                                    if($j == 1)
                                        echo "<tr class='bg-transparent border-bottom border'>";
                                    ?>
                                   <td class="border-left border">
                                       <span class="text-15 font-weight-600 text-primary i-<?= $icon[$i]; ?>">&nbsp;&nbsp;<?= $key; ?></span> <br>
                                       <?php
                                       if ($position[$i] == $i)
                                       {
                                           ?>
                                           <img class="profile-picture avatar-md rounded-circle" src="<?= $value ;?>" alt="Photo" />
                                           <?php
                                       }
                                       else
                                       {
                                           ?>
                                           <small class="text-17 font-weight-700"><?= $value ?: printBoldThing(repeatChar()); ?></small>
                                           <?php
                                       }
                                       ?>
                                   </td>
                                    <?php
                                    if($j == $item)
                                        echo "</tr>";

                                    ++$j;
                                    $j = (($j == ($item+1)) ? 1 : $j);
                                    ++$i;
                                }
                                ?>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="modal-footer bg-<?= $bg; ?>">
                        <div class="btn-group">
                            <a href="" class="btn btn-danger" data-dismiss="modal">
                                <span class="i-Close"></span>&nbsp;Fermer
                            </a>
                            <?php
                            $linkStyle_key =array_keys($linkStyle);
                            $linkStyle_value =array_values($linkStyle);
                            $i = 0;
                            foreach ($link as $key => $value)
                            {
                                ?>
                                <a href="<?= $value;?>" class="btn btn-<?= $linkStyle_key[$i];?>" data-dismiss="modal">
                                    <span class="i-<?= $linkStyle_value[$i];?>"></span>&nbsp;<?= $key;?>
                                </a>
                                <?php
                                ++$i;
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php
    }
}


/*
 * @fonction getValidRequestInput
 * @param array $field of array of request
 * @return string|NULL Returns return content associated to request field or NULL if not exist
 * @since 1.0.0
 * @date 09-04-2020
*/
if (!function_exists("getValidRequestInput")) {
    function getValidRequestInput($field, $requestType = "GET")
    {
        switch($requestType){
            case REQUEST_POST:
                return isset($_POST[$field])? stringProtected($_POST[$field]) : NULL;
            break;
            case REQUEST_GET:
                return isset($_GET[$field])? stringProtected($_GET[$field]) : NULL;
            break;
            default:
                return NULL;
        }
    }
}

if (!function_exists("getTransactionSummary")) {
    function getTransactionSummary($transaction){
        return "Motif : <b>" .$transaction->motif."</b>| Montant : <b>".$transaction->montant."</b>| Ref : <b>".$transaction->reference. "</b>";
    }
}

if (!function_exists("getRandomBootstrapColor")) {
    function getRandomBootstrapColor(){
        $arrX = array("warning", "info","success", "danger", "primary", "light", "dark");
        // get random index from array $arrX
        $randIndex = array_rand($arrX);
        // output the value for the random index
        return $arrX[$randIndex];
    }
}

//Retourne la date ecroulé apres tel nombre de temps
if (!function_exists("getPreviousDay")) {
    function getPreviousDay($day_count){
        return date(DATE_FORMAT_LONG, time() - $day_count*24*3600);
    }
}


if (!function_exists("makeClause")) {
    //Retourne la date ecroulé apres tel nombre de temps
    function makeClause($clause_left, $clause_operator, $clause_right, $clause_connector = NULL){
        //$clause_operator = ()?
        if(is_null($clause_connector)){
            return array(
                Query::CLAUSE_LEFT => $clause_left,
                Query::OPERATOR  => $clause_operator,
                Query::CLAUSE_RIGHT => $clause_right
            );
        }else{
            return array(
                Query::CLAUSE_LEFT => $clause_left,
                Query::OPERATOR  => $clause_operator,
                Query::CLAUSE_RIGHT => $clause_right,
                Query::CONNECTOR => $clause_connector
            );
        }
    }
}

if (!function_exists("json_encode_unicode")) {
    function json_encode_unicode($data)
    {
        return preg_replace_callback('/(?<!\\\\)\\\\u([0-9a-f]{4})/i',
        function ($matches) {
            $d = pack("H*", $matches[1]);
            return mb_convert_encoding($d, "UTF-8", "UTF-16BE");
        }, json_encode($data)
        );
    }
}

if (!function_exists("create_slug")) {
    function create_slug($string){
        $slug=preg_replace('/[^A-Za-z0-9-]+/', '-', $string);
        return $slug;
    }
}

if (!function_exists("create_slug_with")) {
    function create_slug_with($separate_with, $string){
        $slug=preg_replace('/[^A-Za-z0-9-]+/', $separate_with, $string);
        return $slug;
    }
}

?>