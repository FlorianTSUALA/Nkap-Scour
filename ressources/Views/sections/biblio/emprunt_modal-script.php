<?php 

use App\Helpers\Helpers;
    use Core\Routing\URL;
    include dirname(__DIR__)."/_common_lib/_select2_script.php";
?>


<script>
    //Restreindre l'emprunt d'un meme livre

    // var etat_documents = <?php echo Helpers::toJSON($etat_documents) ; ?>;
    // var documents = <?php echo Helpers::toJSON($documents) ; ?>;
    var exemplaires = <?php echo Helpers::toJSON($exemplaires) ; ?>;
    
    <?php die("stop"); ?>
    
    //Initialisation des composant de base
    (function(window, document, $) {
        //'use strict'

        $('#modal-emprunt').on('change', 'select.code-livre, select.titre-livre, select.etat-livre', function(){
            let parent = $(this).parent().parent()
            updateItem(parent)
        })

        let target = $('.code-livre').parent().parent()
        initItem(target)

        // target = $('.titre-livre').parent().parent()
        // initItem(target)

        // target = $('.etat-livre').parent().parent()
        // initItem(target)

    })(window, document, jQuery)

    var items = []

    $(document).ready(function () {

        $(document).on('click', '#modal-emprunt-save', function(e) {
                e.preventDefault();
            // alert(items.repeaterVal());
                console.log(items.repeaterVal());
                //return;
                saveEmprunt();
        })
        
        // Custom Show / Hide Configurations
        items = $('.item-repeater').repeater({
            
            show: function () {
                $(this).slideDown();

                $('.select2-container').remove();

                $('select').select2({
                    width: '100%',
                    // placeholder: "Placeholder text",
                    // allowClear: true
                });

                // initItem(this)
                
                $('#modal-emprunt').on('change', 'select.code-livre, select.titre-livre, select.etat-livre', function(){
                    let parent = $(this).parent().parent()
                    updateItem(parent)
                })

            },
                
            hide: function(remove) {
                if (confirm('Etes vous sûre de supprimer cette élément?')) {
                    $(this).slideUp(remove);
                    // $(this).hide(remove);
                }
            }
        });
    })

    function updateItem(parent, isCode=true){
        let css_class = (isCode)? 'code-livre' : 'titre-livre'
        let selected = parent.find("." + css_class).val()
        if(exemplaires.length === 0) return
        let tmp = exemplaires.filter((item)=>{
            return String(item.exemplaire_id) === String(selected)
        })
        let current = tmp[0]
        parent.find(".titre-livre").val( current.document_id )
        parent.find(".code-livre").val( current.exemplaire_id )
        parent.find(".etat-livre").val( current.etat_document_id )
    }
    
    function initItem(target){
        let selected = $(target).find('.code-livre').val()
        if(exemplaires.length === 0) return
        console.log("Code-livre "+selected)
        let tmp = exemplaires.filter((item)=>{
            return String(item.code_livre) === String(selected)
        })
    
        let current = tmp[0]
        $(target).find('.prix_unitaire').val( parseFloat(current.montant) )
    }


    function updateSelectItem(){

    }

    function saveEmprunt(){
        let livres = []
        // $('.item-repeater').repeaterVal().forEach( (item, index) =>{
        //     // console.log(item)
        //     livres += item.livre

        // })
        items = $('.item-repeater').repeaterVal()['data']
        for (index = 0; index < items.length; index++){
            livres[index] = items[index].livre
        }
        console.log(livres)
        return

        data = {
                "nom":  $('#eleve option:selected').text(),
                'id_eleve':  $('#eleve option:selected').val(),
                'livres':  $('#reste').val(),
                'date_paiement': $('#eleve_nom_complet option:selected').val()
        };

        $.blockUI({
            message: '<div class="semibold"><span class="ft-refresh-cw icon-spin text-left"></span>&nbsp; Enregistrement en cours ...</div>',
            fadeIn: 1000,
            timeout: 10000, //unblock after 2 seconds
            overlayCSS: {
                backgroundColor: '#FFF',
                opacity: 0.8,
                cursor: 'wait'
            },
            css: {
                border: 0,
                padding: '10px 15px',
                color: '#fff',
                width: 'auto',
                left: '45%',
                backgroundColor: '#333'
            },
            onBlock: function() {
                $.ajax({
                    url: '<?= URL::link('biblio_api_emprunt');?>',
                    type: 'post',
                    data: data,
                    dataType: 'json',
                    // beforeSend:function(){
                    //     $(loading).show();
                    // },
                    success:function(data){

                        $('#btn_home').show()
                        $('#btn_print').show()

                        $(loading).hide()
                        // message de notification

                        flash_msg(data)

                        console.log(data)

                    },
                    error: function (textStatus, errorThrown) {
                        Success = false;
                        console.log(textStatus, errorThrown);
                    }
                });               
            }
        });
    }

</script>