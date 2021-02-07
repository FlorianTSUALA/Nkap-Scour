<?php

use Core\Routing\URL;
use App\Helpers\Helpers;

?>

<script>
    //CORE FUNCTION DEFINITION
    function pad(number, length = 2) {
        var str = '' + number;
        while (str.length < length) str = '0' + str
        return str;
    }
    
    function strToLocaleDateTime(str_date){
        let pattern = /(\d{2})\/(\d{2})\/(\d{4})/
        let date = new Date(str_date.toString().replace(pattern,'$3-$2-$1'))
        return  date
    }

    function isValidDate(d) {
       return d instanceof Date && !isNaN(d);
    }

    function toSQLDateTime(str_date){
        let dt = new Date(str_date)
        if(isValidDate(dt)){ //---> '27/07/2021' Invalid Date
            dt = strToLocaleDateTime(dt)
        }
        console.log(dt)

        // don't remove console
        return dt.getFullYear() + '-' + pad(dt.getMonth()+1) + '-' + pad(dt.getDate()) + ' ' + 
                pad(dt.getHours()) + ':' + pad(dt.getMinutes()) + ':' + pad(dt.getSeconds())
    }
    
</script>

<script>

    var reference = "<?= Helpers::generateReference(); ?>";
    // var long_date_facture = "<?= Helpers::getFullDate(date('Y-m-d H:i:s')); ?>";


    function sauvegarderVersement(){
        console.log(data_facture['date_fin'])
        console.log(new Date(data_facture['date_fin']))
        console.log(toSQLDateTime(data_facture['date_fin']))

        data = {
                'cantines': items,
                'eleve_id':  $('#eleve_nom_complet option:selected').val(),
                'classe_id':  $('#classe option:selected').val(),
                'nom_eleve':  $('#eleve_nom_complet option:selected').text(),
                // 'annee_scolaire_id':  $('#annee_scolaire option:selected').val(),
                'type_paiement_id':  $('#type_paiement option:selected').val(),
                // 'motif':  $('#motif').val(),
                // 'reste':  $('#reste').val(),
                // 'autre':  $('#autres').val(),
                'reduction':  $('#reduction').val(),
                'reference': reference,
                'montant_total': $( "#montant_total" ).val(),
                'date_paiement':  toSQLDateTime($( "#date_versement" ).val()),
                'date_debut':   toSQLDateTime(date_debut),
                // 'date_facture': '<?= date('Y-m-d') ?>' ,
                'date_fin':  toSQLDateTime(data_facture['date_fin']),
         };

         console.log(data);

        $.ajax({
            url: '<?= URL::link('enregistrement_cantine');?>'+$('#eleve_nom_complet option:selected').val(),
            type: 'post',
            data: data,
            dataType: 'json',
            beforeSend:function(){
                // $('#btn_save').hide();
                // $('#btn_back').hide();
                $(loading).show();
            },
            success:function(data){
                //$('#btn_save').hide();
                $('#btn_home').show();
                //$('#btn_back').hide();
                $('#btn_print').show();
                $(loading).hide();

               console.log(data);

            },
            error: function (textStatus, errorThrown) {
                $('#btn_save').show();
                $('#btn_back').show();
                Success = false;
                console.log(textStatus, errorThrown);
            }
        });


    }


    function PrintVersement(){
        data_facture['eleve_id'] = $('#eleve_nom_complet option:selected').val()
        data_facture['classe_id'] = $('#classe option:selected').val()
        data_facture['montant_total'] = $( '#montant_total' ).val()
        data = {
                
                'reduction':  $('#reduction').val(),
                'reference': reference,
                'montant_total': data_facture['montant_total'],
                'date_paiement':  toSQLDateTime($( '#date_versement' ).val()),
                'date_debut':   toSQLDateTime(date_debut),
                'date_facture':  toSQLDateTime(date_facture),
                'date_fin':  toSQLDateTime(date_fin),
         };

         data_facture['data'] = $data
         console.log(data);

        $.ajax({
            url: '<?= URL::link('enregistrement_cantine');?>'+$('#eleve_nom_complet option:selected').val(),
            type: 'post',
            data: data_facture,
            dataType: 'json',
            beforeSend:function(){
                // $('#btn_save').hide();
                // $('#btn_back').hide();
                $(loading).show();
            },
            success:function(data){
                //$('#btn_save').hide();
                $('#btn_home').show();
                //$('#btn_back').hide();
                $('#btn_print').show();
                $(loading).hide();

               console.log(data);

            },
            error: function (textStatus, errorThrown) {
                $('#btn_save').show();
                $('#btn_back').show();
                Success = false;
                console.log(textStatus, errorThrown);
            }
        });


    }

</script>