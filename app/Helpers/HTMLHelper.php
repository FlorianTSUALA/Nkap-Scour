<?php

namespace App\Helpers;

use App\Model\FrequentlyReapeat;
use Core\HTML\Form\FormModel;
use Core\HTML\Form\InputType;

trait HTMLHelper
{

    public static function formatHeader($title) {
        return ucwords(str_replace('_', ' ', helpers::toCamelCase($title)));
    }

    public static function formatFieldTable($title) {
        return ucwords(str_replace('_', ' ', helpers::toCamelCase($title)));
    }

    public static function genHeaderTable($headerItems) {
        $html  = '<tr>';
        $html .= '   <th>N°</th>';
        foreach($headerItems as $headerItem){
            $html .= '  <th>' . $headerItem . '</th>';
            // $html .= '  <th>' . helpers::formatHeader($headerItem) . '</th>';
        }
        $html .= '   <th>Actions</th>';
        $html .= '</tr>';
        return $html;
    }

    public static function genBodyTable($items, $className, $headerItems) {
        $html = '';
        $i = 0;
        //var_dump($items, $headerItems); die();
        if(isset($items) && is_array($items) && count($items)>0)
            foreach($items as $item):
                $html .= helpers::genRowBodyTable(++$i, $item, $headerItems);
            endforeach; 
        else
            $html .=
                '<tr>
                    <div class="alert alert-warning mb-2" role="alert">
                        <strong>Oups!</strong> Table vide, aucune données enrigistrées.
                    </div>
                </tr>';
        return $html;
    }

    public static function genRowBodyTable($i, $model, $headerItems)
    {
        
       // var_dump($model, $headerItems);
        $model = Helpers::object_to_array($model);
        $headerItems = Helpers::object_to_array($headerItems);

        $html = '<tr>';
        $html .= '  <td>'. $i .'</td>';
        //var_dump($model, $headerItems);
        //die();
        
        foreach($headerItems as $headerItem)
        {
            $headerItem = Helpers::object_to_array($headerItem);
            $headerItem = Helpers::object_to_array($headerItem);
            $html .= '  <td  style="word-wrap: break-word;min-width: 20px;max-width: 200px;">' . helpers::formatToReadableOutput($model[$headerItem[FormModel::NAME]], $headerItem[FormModel::EXTERNAL_TYPE]) . '</td>';
        }
    
        $html .= '   <td width="20%">
                        <button data-id="'. $model[FrequentlyReapeat::CODE] .'" type="button" class=" btn_delete_data btn btn-sm btn-danger"><i class="ft-trash-2"></i></button>
                        <button data-id="'. $model[FrequentlyReapeat::CODE] .'" type="button" class=" btn_update_data btn btn-sm btn-green"><i class="ft-edit-2"></i></button>
                        <button data-id="'. $model[FrequentlyReapeat::CODE] .'" type="button" class=" btn_read_data btn btn-sm btn-blue"><i class="ft-eye"></i></button>
                    </td>';
        $html .= '</tr>';
        return $html;
    }

    public static function buildDetailModel($model, $headerItems){
        $html = '<div class="table-responsive" style="width:100%;height:100%;" >
                    <table class="table table-white-space no-wrap table-middle mb-0"  style="width:100%;height:100%; margin: 0 auto;">
                        <tbody>
                            '.helpers::buildItemDetailModel($model, $headerItems).'
                        </tbody>
                    </table>
                </div>';
            return $html;
    }

    public static function buildItemDetailModel($model, $headerItems){
        $html = '';

        $model = Helpers::object_to_array($model);
        $headerItems = Helpers::object_to_array($headerItems);
        
        foreach($headerItems as $headerItem){
            $html .= '<tr>
                        <td>
                            <p class="text-bold-600 align-middle">'.$headerItem[FormModel::LABEL].' : </p>
                        </td>
                        <td >
                            <pre class="language-markup">'.helpers::formatToReadableOutput($model[$headerItem[FormModel::NAME]], $headerItem[FormModel::EXTERNAL_TYPE]).'</pre>
                        </td>
                    </tr>';
        }
        return $html;
    }

    public static function formatToReadableOutput($value, $type){
        switch($type){
            case InputType::TEXT:
                return $value;
            case InputType::EMAIL:
                return $value;
            case InputType::PASSWORD:
                return $value;
            case InputType::HIDDEN:
                return $value;
            case InputType::NUMBER:
                return $value;
            case InputType::FILE:
                return $value;
            case InputType::DATE:
                return Helpers::getFullDate($value);
            case InputType::DATE_DAY:
                return Helpers::getFullDay($value);
            case InputType::DATE_MONTH:
                return Helpers::getFullMonth($value);
            case InputType::DATE_YEAR:
                return Helpers::getFullYear($value);
            case InputType::DATE_TIME_LOCAL:    
                return Helpers::getFullDateTime($value);
            case InputType::TIME:
                return $value;
            case InputType::TEL:
                return $value;
            case InputType::CHECKBOX:
                return $value;
            case InputType::TEXTAREA:
                return $value;
            default:
                return $value;
        }
    
    }

    public static function required_input()
    {
        echo "<strong class='text-danger font-weight-bolder h5'>*</strong>&nbsp;";
    }
    
    public static function required_input_text()
    {
        return "<strong class='text-danger font-weight-bolder h5'>*</strong>&nbsp;";
    }

    public static function getOld($dateborn)
    {
        $dateborn = date_create($dateborn);
        $old = date("Y") - date_format($dateborn,"Y");

        return ($old < 0) ? false : $old;
    }

    public static function dataTableCommunOptions(){
        $options = " dom: 'flitp',
                    language: {
                        'scrollY': '1000px',
                        'scrollCollapse': true,
                        'scrollX': true,
                        //'lengthMenu': [[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Tout']],
                        'iDisplayLength': -1,
                        'lengthMenu': 'Afficher _MENU_ éléments par page',
                        'zeroRecords': 'Oups... Aucune données disponible',
                        'info': 'Page _PAGE_ sur _PAGES_',
                        'infoEmpty': 'Aucun enregistrement disponible',
                        'infoFiltered': '(filtre appliqué sur _MAX_ éléments au total du tableau actuel)',
                        'decimal': ',',
                        'thousands': ' ',
                        'paginate': {
                            'first': 'Premier',
                            'last': 'Dernier',
                            'next': 'Suiv.',
                            'previous': 'Préc.'
                        },
                        'search': 'Zone de recherche : &nbsp; &nbsp; &nbsp;',
                        'searchPlaceholder': 'entrer un mot clé',
                        buttons: {
                            colvis: '<i class=\"fa fa-eye\" aria-hidden=\"true\"></i>Visibilité',
                            copy: '<span class=\"i-Stamp-1\">Copiez</span>',
                            print: '<span class=\"i-Stamp-1\">Imprimez</span>',
                            copyTitle: 'Ajouté au presse-papiers',
                            copyKeys: 'Appuyez sur <i>ctrl</i> ou <i>\u2318</i> + <i>C</i> pour copier les données du tableau à votre presse-papiers. <br><br>Pour annuler, cliquez sur ce message ou appuyez sur Echap.',
                            copySuccess: {
                                _: '%d lignes copiées',
                                1: '1 ligne copiée'
                            },
                        }
                    },
         ";
         return $options;
    }

}