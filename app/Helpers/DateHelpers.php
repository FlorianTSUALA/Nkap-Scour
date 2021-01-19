<?php

namespace App\Helpers;

use DateTime;
use Exception;
use DatePeriod;
use DateInterval;

trait DateHelpers
{


    public static function addDays($date, $days){
        return date('Y-m-d', strtotime($date. " + {$days} days"));
    }
    
    public static function swapDate(&$date1, &$date2)
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


    public static function getPreviousDay($day_count){
        return date(DATE_FORMAT_LONG, time() - $day_count*24*3600);
    }

    
    public static function getFullDate($datetime , $forMailing = false)
    {
        $tmp = explode(" ", $datetime);
        $tmp = !empty($tmp[1]);

        $datetime = date_create($datetime);

        $day = date_format($datetime, "N");
        $day = self::_getFullDay($day);

        $month = date_format($datetime, "m");
        $month = self::_getFullMonth($month);

        if($forMailing)
            $date = substr($day, 0, 3) . " " . date_format($datetime, "d") . " " . substr($month, 0, 3) . " " . date_format($datetime, "Y");
        else
            $date = "$day, ". date_format($datetime, "d") ." $month " . date_format($datetime, "Y");
        $fulldate = ucwords($date);

        return $fulldate;
    }

    public static function getFullDateTime($datetime, $forMailing = false)
    {
        $tmp = explode(" ", $datetime);
        $tmp = !empty($tmp[1]);

        $datetime = date_create($datetime);

        $day = date_format($datetime, "N");
        $day = self::_getFullDay($day);

        $month = date_format($datetime, "m");
        $month = self::_getFullMonth($month);

        if($forMailing)
            $date = substr($day, 0, 3) . " " . date_format($datetime, "d") . " " . substr($month, 0, 3) . " " . date_format($datetime, "Y");
        else
            $date = "$day, ". date_format($datetime, "d") ." $month " . date_format($datetime, "Y");
        $fulldate = ucwords($date);

        if($tmp)
        {
            if($forMailing)
                $time = date_format($datetime, "H") . ":" . date_format($datetime, "i");
            else
                $time = date_format($datetime, "H") . "h " . date_format($datetime, "i") . "min";
            $fulldate .= " à $time";
        }

        return $fulldate;
    }

    public static function _getFullDay($day)
    {
 
        $day -= 1;
        $jour = array('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche');
        return $jour[$day];
    }

    public static function _getFullYear($day)
    {
        $day -= 1;
        $jour = array('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche');
        return $jour[$day];
    }

    public static function _getFullMonth($month)
    {
        $month -= 1;
        $mois = array('Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre');
        return $mois[$month];
    }

    public static function getFullDay($datetime)
    {
        $day = date_format($datetime, "N");

        $jour = array('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche');
        return $jour[$day];
    }

    public static function getFullYear($datetime)
    {
        $time = strtotime($datetime);
        return date("Y", $time);
    }

    public static function getFullMonth($datetime)
    {
        $month = date_format($datetime, "m");
        
        $mois = array('Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre');
        return $mois[$month];
    }

    public static function getStrIndexMonth($mois)
    {
        switch ($mois) {
            case ($mois == 'Janvier' || $mois == 'janvier'):
                $index_mois = '01';
                break;
            
            case ($mois == 'Février' || $mois == 'février' || $mois == 'fevrier' || $mois == 'Fevrier'):
                $index_mois = '02';
                break;
            
            case ($mois == 'Mars' || $mois == 'mars'):
                $index_mois = 3;
                break;
            
            case ($mois == 'Avril' || $mois == 'avril'):
                $index_mois = '04';
                break;

                
            case ($mois == 'Mai' || $mois == 'mai'):
                $index_mois = '05';
                break;


            case ($mois == 'Juin' || $mois == 'juin'):
                $index_mois = '06';
                break;
                
            
            case ($mois == 'Juillet' || $mois == 'juillet'):
                $index_mois = '07';
                break;
                

            case ($mois == 'Aout' || $mois == 'aout' || $mois == 'Août' || $mois == 'août'):
                $index_mois = '08';
                break;
                    
            case ($mois == 'Septembre' || $mois == 'septembre'):
                $index_mois = '09';
                break;
            
            case ($mois == 'Octobre' || $mois == 'octobre'):
                $index_mois = '10';
                break;
            
            case ($mois == 'Novembre' || $mois == 'novembre'):
                $index_mois = '11';
                break;

                
            case ($mois == 'Decembre' || $mois == 'decembre'):
                $index_mois = '12';
                break;
            default: 
                $index_mois = -1;
        }

        return $index_mois;
    }
    

    public static function getYearOld($old)
    {
        $dateborn = 0;
        try{
            $dateborn = date("Y") - date("Y", strtotime($old));
        }catch(Exception $ex){
            $dateborn = 0;
        }
        return $dateborn > date("Y") ? false : $dateborn;
    }

    public static function getBornDate($old)
    {
        $dateborn = date("Y") - $old;
        return $dateborn > date("Y") ? false : "$dateborn-01-01";
    }

    

    public static function getLastDayOfYear($date)
    {
        //https://thisinterestsme.com/php-get-last-day-of-month/
        return date("Y-m-d", strtotime("Last day of December", strtotime($date)));
    }

    public static function getMonthInDateInterval($startDate, $endDate)
    {
        $months = [];
        $start    = (new DateTime($startDate))->modify('first day of this month');
        $end      = (new DateTime($endDate))->modify('first day of next month');
        $interval = DateInterval::createFromDateString('1 month');
        $period   = new DatePeriod($start, $interval, $end);
        foreach ($period as $dt)
            array_push($months, $dt->format("m"));         
        return $months;
    }
    
    public static function getCurrentToEndMonthOfYear($start_date = NULL){
        $start_date = ($start_date)??date('Y-m-d H:i:s');
        $num = date("n",strtotime($start_date));
        array_push($months, date("F", strtotime($start_date)));

        for($i = ($num + 1); $i <= 12; $i++){
            $dateObj = DateTime::createFromFormat('!m', $i);
            array_push($months, $dateObj->format('F'));
        }
        return $months;
    }

    public static function getFirstDayMonth($query_date)
    {
        $date_debut =  date('Y-m-01', strtotime($query_date));
        return $date_debut;
    }

    
    public static function getFirstDayNextMonth($query_date)
    {
        $endDate = new DateTime('1st January Next Year');
        return $endDate->format('Y-m-d');
    }

    
    public static function getLastDayMonth($query_date)
    {
        $date_fin = date('Y-m-t', strtotime($query_date));
        return $date_fin;
    }

    public static function phpDate2MyslDate($mysqldate)
    {
        $phpdate = strtotime( $mysqldate );
        $mysqldate = date( 'Y-m-d H:i:s', $phpdate );    
    }


}