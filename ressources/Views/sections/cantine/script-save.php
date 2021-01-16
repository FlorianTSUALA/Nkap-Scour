<?php

use Core\Routing\URL;
use App\Helpers\Helpers;

?>

<script>
    var reference = "<?= Helpers::generateReference(); ?>";
    var date_facture = "<?= Helpers::getFullDate(date("Y-m-d H:i:s")); ?>";


    function pad(number, length = 2) {
        var str = '' + number;
        while (str.length < length) str = '0' + str
        return str;
    }

    function toSQLDate(str_date){
        let dt = new Date(str_date)
        // don't remove console
        console.log(str_date)
        console.log(dt)
        return dt.getFullYear() + '-' + pad(dt.getMonth()+1) + '-' + pad(dt.getDate()) + ' ' + 
                pad(dt.getHours()) + ':' + pad(dt.getMinutes()) + ':' + pad(dt.getSeconds())
    }

    function sauvegarderVersement(){

        data = {
                "cantines": items,
                "eleve_id":  $('#eleve_nom_complet option:selected').val(),
                "classe_id":  $('#classe option:selected').val(),
                // "annee_scolaire_id":  $('#annee_scolaire option:selected').val(),
                // "type_paiement_id":  $('#type_paiement option:selected').val(),
                // "motif":  $('#motif').val(),
                // "reste":  $('#reste').val(),
                // "autre":  $('#autres').val(),
                "reduction":  $('#reduction').val(),
                "reference": reference,
                "montant_total": $( "#montant_total" ).val(),
                "date_paiement":  toSQLDate($( "#date_versement" ).val()),
                "date_debut":   toSQLDate(date_debut),
                "date_facture":  toSQLDate(date_facture),
                "date_fin":  toSQLDate(date_fin),
         };

         console.log(data);

        $.ajax({
            url: '<?= URL::link('enregistrement_cantine');?>'+$('#eleve_nom_complet option:selected').val(),
            type: 'post',
            data: data,
            dataType: 'json',
            beforeSend:function(){
                // $("#btn_save").hide();
                // $("#btn_back").hide();
                $(loading).show();
            },
            success:function(data){
                //$("#btn_save").hide();
                $("#btn_home").show();
                //$("#btn_back").hide();
                $("#btn_print").show();
                $(loading).hide();

               console.log(data);

            },
            error: function (textStatus, errorThrown) {
                $("#btn_save").show();
                $("#btn_back").show();
                Success = false;
                console.log(textStatus, errorThrown);
            }
        });


    }

</script>