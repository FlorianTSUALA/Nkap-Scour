<?php

    use App\Helpers\Helpers;

    $signataire = "Charbonnier LaRose";
    $funtion_signataire = "Le Sécrétariat";

?>


<script>
    var items = []
    var date_debut
    var date_fin
    var date_facture = '<?= Helpers::getFullDate(date('y-M-d')) ?>'

    // Variable pour la generation des etats
    var reduction;
    var type_paiement;
    var eleve_nom_complet;
    var classe
    var montant_total
    var date_versement

    // DEFINITION DES ID des elements PHP

    var section_versement = $('#section_versement')
    var section_recaputilatif = $('#section_recaputilatif')

    var btn_preview = $('#btn_preview')
    var btn_save = $('#btn_save')
    var btn_home = $('#btn_home')
    var btn_back = $('#btn_back')
    var btn_print = $('#btn_print')
    var loading = $('#loading')

    var prix_abonnements = <?php echo Helpers::toJSON($prix_abonnements) ; ?>;
    
    //GESTION DE AJOUT DYNAMIQUE DE BLOCK
    (function(window, document, $) {
        //'use strict'

        function updateItem(parent, editPirx=true){
            let selected = parent.find(".periode").val()
            if(prix_abonnements.length === 0) return
            let tmp = prix_abonnements.filter((item)=>{
                return String(item.periode) === String(selected)
            })
            let current = tmp[0]
            if(editPirx)
                parent.find(".prix_unitaire").val( parseFloat(current.montant) )
            parent.find(".sous_total").val( parent.find(".prix_unitaire").val()* parent.find(".duree").val() )
            init()
        }

        function init(){
            items = $('.repeater').repeaterVal()

            let sum = 0
            if( items !== undefined && items.data != undefined ){
                console.log(items.data)
                items.data.forEach(function(item, index){
                let val = parseFloat(item.sous_total)
                    if (!isNaN(val))
                            sum += val
                })

                if((sum - $('#reduction').val()) < 1)
                    $('#reduction').val(0)
                $('#montant_total').val(sum - $('#reduction').val())
            }
        }

        function initItem(target){
            let selected = $(target).find('.periode').val()
            if(prix_abonnements.length === 0) return
            console.log("Periode "+selected)
            let tmp = prix_abonnements.filter((item)=>{
                return String(item.periode) === String(selected)
            })
           
            let current = tmp[0]
            $(target).find('.prix_unitaire').val( parseFloat(current.montant) )
            $(target).find('.duree').val( 1 )
            $(target).find('.sous_total').val( $(target).find(".prix_unitaire").val()* $(target).find(".duree").val() )
            init()
        }


        $('#section_versement').on('change', ".prix_unitaire", function(){
            let parent = $(this).parent().parent().parent().parent()
            updateItem(parent, false)
        })

        $('#section_versement').on('change', "select.periode, .duree", function(){
            let parent = $(this).parent().parent().parent().parent()
            updateItem(parent)
        })

        let target = $('.periode').parent().parent().parent().parent()
        initItem(target)


        //Gerer le cas ou le montant_total total peut etre negatif
        
        $('#section_versement').on('change', "#reduction", function(){
            init()
        })

        // Default
        $('.repeater').repeater({
            // (Optional)
            // start with an empty list of repeaters. Set your first (and only)
            // "data-repeater-item" with style="display:none;" and pass the
            // following configuration flag
            initEmpty: false,
            // (Optional)
            // "defaultValues" sets the values of added items.  The keys of
            // defaultValues refer to the value of the input's name attribute.
            // If a default value is not specified for an input, then it will
            // have its value cleared.
            defaultValues: {
                'periode': 'JOUR',
                'sous_total': '0',
                //'text-input': 'foo',
            },
            // (Optional)
            // "show" is called just after an item is added.  The item is hidden
            // at this point.  If a show callback is not given the item will
            // have $(this).show() called on it.
            show: function () {
                $(this).slideDown()

                /**date_debut
                duree
                prix_unitaire
                sous_total */

                initItem(this)

                $('#section_versement').on('change', '.prix_unitaire', function(){
                    let parent = $(this).parent().parent().parent().parent()
                    updateItem(parent, false)
                })

                $('#section_versement').on('change', "select.periode, .duree", function(){
                    let parent = $(this).parent().parent().parent().parent()
                    updateItem(parent)
                })

            },
            // (Optional)
            // "hide" is called when a user clicks on a data-repeater-delete
            // element.  The item is still visible.  "hide" is passed a function
            // as its first argument which will properly remove the item.
            // "hide" allows for a confirmation step, to send a delete request
            // to the server, etc.  If a hide callback is not given the item
            // will be deleted.
             hide: function (deleteElement) {

               if(confirm('Voulez vous supprimer cet élément ?')) {
                    $(this).slideUp(deleteElement)
                }
                setTimeout(function(){ init() }, 500)

            },
            // (Optional)
            // You can use this if you need to manually re-index the list
            // for example if you are using a drag and drop library to reorder
            // list items.
            /*ready: function (setIndexes) {
                $dragAndDrop.on('drop', setIndexes)
            },*/
            // (Optional)
            // Removes the delete button from the first list item,
            // defaults to false.
            isFirstItemUndeletable: true
        })
        init()

    })(window, document, jQuery)




/*
    //GESTION DE LA PREVISUALISATION

    var eleve_id;
    var eleve_matricule;
    var classe_id;
    var type_pension_id;
    var _montant_total = 0;
    var _est_mensuel = 0;
    var _mensualite = 0;
    var _reduction = 0;
    var _reste = 0;

    // var cantine_prix_mois = abonnement_cantine['montant_total'];
*/

    $(document).ready(function(){

        function update_etat(){

            $('#recap-body').html('')
            $('#recap-reference').text(reference)
            $('#recap-somme').text( $('#somme').text() )

            console.log("items")

            //Cantines
            let current = []
            items = $('.repeater').repeaterVal()
            let sum = 0
            if( items !== undefined && items.data != undefined ){
                current = items.data
            }
            let body = ''
            let i = 0

            let date_ref
            let total_day = 0
            let total = 0

            date_debut = $('#date_debut').val()
            date_fin
            console.log(date_debut)

            function addDays(date, days){
                let _date = new Date(date)
                _date.setDate(_date.getDate() + days)
                let str_date = _date.toLocaleDateString()

                console.log(date)
                console.log(days)
                console.log(_date)
                console.log(str_date)

                return  str_date
            }

            current.forEach( (item, index) =>{

                function addDays(date, days){
                    let _date = new Date(date)
                    _date.setDate(_date.getDate() + days)
                    return  _date.toLocaleDateString()
                }
                
                ++i
                
                let quantite = item.duree
                let periode = item.periode
                console.log(item)
                let dayCount = 0

                switch(periode){
                    case 'JOUR':
                        dayCount = 1
                        break
                    case 'SEMAINE':
                        dayCount = 7
                        break
                    case 'MOIS':
                        dayCount = 30
                        break
                    case 'ANNEE':
                        dayCount = 365
                        break
                    default:
                        dayCount = 1
                }

                let start_date = addDays(date_debut, total_day)
                total_day += (dayCount*quantite)
                let end_date = addDays(date_debut, total_day)
                
                let prix_unitaire = item.prix_unitaire
                let sub_total = prix_unitaire * quantite
   
                body += "<tr>"
                body += '   <th scope="row">'+i+'</th>'
                body += '       <td>'
                body += '           <p>Periode : '+ periode +' </p>'
                body += '           <em class="text-muted">Du : '+ start_date +' au '+ end_date +'.</em>'
                body += '       </td>'
                body += '       <td class="text-right">'+ prix_unitaire +' Fcfa</td>'
                body += '       <td class="text-right">'+ quantite +'</td>'
                body += '       <td class="text-right">'+ sub_total +' Fcfa</td>'

                body += '</tr>'
            
            })

            body += "<tr>"
            body += '       <td colspan="2">'
            body += '           <B>Nombre de jours : '+ total_day +' </B>'
            body += '       </td>'
            body += '       <td colspan="3">'
            body += '           <B><em class="text-muted">Du : '+ (date_debut = addDays(date_debut, 0)) +' au '+ (date_fin = addDays(date_debut, total_day)) +'.</em> </B>'
            body += '       </td>'
            body += '</tr>'

            $('#recap-body').html(body)

            $('#recap-nom').text( $('#eleve_nom_complet option:selected').text() )
            $('#recap-classe').text( $('#classe option:selected').text() )

            let date_versement = $( "#date_versement" ).text()

            let classe = $( "#classe option:selected" ).text()
            let type_paiement = $( "#type_paiement option:selected" ).text()
            let date_facture = "<?= Helpers::getFullDate(date("Y-m-d H:i:s")) ?>"

            $('#recap-date').text( date_facture )

            $('#recap-description').text( $('#motif').text() )
            $('#recap-prix').text( $('#montant_total').text() )
            $('#recap-quantite').text( $('#quantite').text() )
            $('#recap-somme').text( $('#somme').text() )

            $('#recap-mode_paiement').text( $('#type_paiement option:selected').text() )

            //NON PRIS EN COMPTE
            $('#recap-banque').hide()
            $('#recap-cheque').hide()
            $('#recap-nom_banque').hide()
            $('#recap-numero_cheque').hide()

            $('#recap-total-top').text( $('#montant_total').val())
            $('#recap-total-bottom').text( $('#montant_total').val())
            $('#recap-reduction').text( ""+ $('#reduction').val() )

            console.log("Les remise : "+  $('#reduction').val())
            
            $('#recap-sous_total').text( parseInt($('#montant_total').val() ) )

            $('#recap-signataire').text( "<?=  $signataire; ?>" )
            $('#recap-funtion_signataire').text(  "<?= $funtion_signataire; ?>" )
            // $('#recap-numero_ligne').text( 1 )

            $('#section_versement').hide()
            $('#section_recaputilatif').show()

        }

        
        $(btn_home).hide()
        $(btn_print).hide()


        $(btn_preview).click(function() {
            update_etat()
            reduction = $('#reduction').val()
            type_paiement = $('#type_paiement').val()
            eleve_nom_complet = $('#eleve_nom_complet').val()
            classe = $('#classe').val()
            montant_total = $('#montant_total').val()
            date_versement = $('#date_versement').val()
            $(section_versement).hide()
            $(section_recaputilatif).show()
            
        })

        $(btn_back).click(function() {
            $(section_recaputilatif).hide()
            $(section_versement).show()
        })

        $(btn_save).click(function() {
            sauvegarderVersement()
        })

    })


</script>