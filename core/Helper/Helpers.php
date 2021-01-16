<?php

namespace Core\Helper;

class Helpers{

    // https://stackoverflow.com/questions/4458837/how-to-define-global-functions-in-php
    // https://www.sigerr.org/make-php-lib-functions-like-dump-or-dd-globally-available
    // https://stackoverflow.com/questions/19816438/make-var-dump-look-pretty
    function declareDebug(){
        // we can delcalre all funciton that we want to use in projet


        function dd1($expression, ...$_ ){
            highlight_string("<?php\n " . var_export($expression, true) . "?>");
            echo '<script>document.getElementsByTagName("code")[0].getElementsByTagName("span")[1].remove() ;document.getElementsByTagName("code")[0].getElementsByTagName("span")[document.getElementsByTagName("code")[0].getElementsByTagName("span").length - 1].remove() ; </script>';
            die();
        }
        
        function dd2($expression, ...$_ ){
            // var_dump($expression, $_);
            echo '<pre>' . var_export($expression, true) . '</pre>';
            die('---------------- || -------------------');
        }

        function dd($expression , $title = " -NKAP-SCOUR- ", ...$_){
            $background="#EEEEEE";
            $color="#000000";
            
            dump($expression, $title, $background, $color, $_);
            die();
        }
        
        function vd($expression, ...$_ ){
            // echo '<pre>' . var_export($expression, true) . '</pre>';
            var_dump($expression, $_);
        }
    
        function dump($data, $title="", $background="#EEEEEE", $color="#000000", ...$_){
            //=== Style  
            echo "  
            <style>
                /* Styling pre tag */
                pre {
                    padding:10px 20px;
                    white-space: pre-wrap;
                    white-space: -moz-pre-wrap;
                    white-space: -pre-wrap;
                    white-space: -o-pre-wrap;
                    word-wrap: break-word;
                }
        
                /* ===========================
                == To use with XDEBUG 
                =========================== */
                /* Source file */
                pre small:nth-child(1) {
                    font-weight: bold;
                    font-size: 14px;
                    color: #CC0000;
                }
                pre small:nth-child(1)::after {
                    content: '';
                    position: relative;
                    width: 100%;
                    height: 20px;
                    left: 0;
                    display: block;
                    clear: both;
                }
        
                /* Separator */
                pre i::after{
                    content: '';
                    position: relative;
                    width: 100%;
                    height: 15px;
                    left: 0;
                    display: block;
                    clear: both;
                    border-bottom: 1px solid grey;
                }  
            </style>
            ";
        
            //=== Content            
            echo "<pre style='background:$background; color:$color; padding:10px 20px; border:2px inset $color'>";
            echo    "<h2>$title</h2>";
                    var_dump($data, $_); 
            echo "</pre>";
        
        }

        function var_view($var)
        {

            ini_set("highlight.keyword", "#a50000;  font-weight: bolder");
            ini_set("highlight.string", "#5825b6; font-weight: lighter; ");

            ob_start();
            highlight_string("<?php\n" . var_export($var, true) . "?>");
            $highlighted_output = ob_get_clean();

            $highlighted_output = str_replace( ["&lt;?php","?&gt;"] , '', $highlighted_output );

            echo $highlighted_output;
            die();
        }



    }


}