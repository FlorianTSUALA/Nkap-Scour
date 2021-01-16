<?php

namespace App\Helpers;

trait SessionHelpers
{
   public static function removeSession($sessions = [])
    {
        if (count($sessions) != 0) {
            foreach ($sessions as $sessionname) {
                unset($_SESSION["$sessionname"]);
            }
        }
    }



}