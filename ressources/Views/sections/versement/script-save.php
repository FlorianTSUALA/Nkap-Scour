<?php

use Core\Routing\URL;
use App\Helpers\Helpers;

?>

<script>
// depoter ces variables dans le controller


    function sauvegarderVersement(){
        console.log(cantines);
        console.log(activites);
        console.log(autres);

        data = {

                'pension_classe': items,
                'cantines': cantines,
                'autres': autres,
                'activites': activites,
                'eleve_id':  $('#eleve_nom_complet option:selected').val(),
                'classe_id':  $('#classe option:selected').val(),
                'statut_apprenant_id':  $('#statut_apprenant option:selected').val(),
                'annee_scolaire_id':  $('#annee_scolaire option:selected').val(),
                'type_paiement_id':  $('#type_paiement option:selected').val(),
                'motif':  $('#motif').val(),
                // "reste":  $('#reste').val(),
                'autre':  $('#autres').val(),
                // "reduction":  reduction,
                'montant_paye':  $('#recap-total-bottom').val(),
                'sous_total':  $('#recap-sous_total').val(),
                'reduction':  $('#recap-remise').val(),
                'nom_eleve':  $('#eleve_nom_complet option:selected').text(),
                'date_paie':  $('#date_paie').val(),
                'reference':  $('#reference').val(),
                'date_facture':  <?= date('Y-m-d') ?> ,
                'date_paiement':  $('#date_paie').val(),
                // "reference": reference,
                // "date_facture":  date_facture,
         };

        $.ajax({
            url: '<?= URL::link('versement-create');?>'+$('#eleve_nom_complet option:selected').val(),
            type: 'post',
            data: data,
            dataType: 'json',
            beforeSend:function(){
                $(loading).show();
            },
            success:function(data){
                $("#btn_home").show();
                $("#btn_print").show();
                $(loading).hide();

               console.log(data);

            },
            error: function (textStatus, errorThrown) {
                Success = false;
                console.log(textStatus, errorThrown);
            }
        });


    }

</script>