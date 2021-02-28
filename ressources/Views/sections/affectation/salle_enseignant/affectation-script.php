<?php

use Core\Routing\URL;

?>


<script>

$(document).ready(function() {
    var lastPrevItem
    var lastCurItem

    var db = {

        loadData: function(filter) {
            return $.grep(this.personnels_salle_classes, function(item) {
                return ( (!filter.SalleClasse || item.SalleClasse === filter.SalleClasse)
                    && (!filter.Personnel || item.Personnel === filter.Personnel))
            });

        },

        insertItem: function(insertingAffectation) {
            this.personnels_salle_classes.push(insertingAffectation);
        },

        updateItem: function(updatingAffectation) { 
            var result = $.Deferred();
                
            // your ajax call instead of rejected
            // var ajaxDeferred = $.Deferred()//.reject();
            let data = {}
            // let result = false
            data['salle_classe_id'] = lastCurItem.salle_classe
            data['personnel_id'] = lastCurItem.personnel
            if(lastCurItem.personnel == "Non affecté")
                data['personnel_id'] = null

            $.blockUI({
                message: '<div class="semibold"><span class="ft-refresh-cw icon-spin text-left"></span>&nbsp; Enregistrement en cours ...</div>',
                fadeIn: 1000,
                timeout: 3000, //unblock after 2 seconds
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
                        url: '<?= URL::link('affectation_salle_enseignant_update');?>',
                        type: 'post',
                        data: data,
                        dataType: 'json',
                    
                        success:function(data){
                            
                            if(data.report){
                                flash_msg(data.data, 3)
                                result.resolve(lastCurItem)
                            }else{
                                // d = true
                                result.resolve(lastPrevItem)

                                // args.cancel = true;
                                alert(data.data)
                            }
                            

                            console.log(data)

                        },
                        error: function (textStatus, errorThrown) {
                            Success = false;
                            result.resolve(lastPrevItem)

                            console.log(textStatus, errorThrown);
                        }
                    });               
                }
            });

            // ajaxDeferred.done(function(updatedItem) {
            //     console.log("yo")
            //     result.resolve(updatedItem)
            // }).fail(function() {
            //     console.log("hey")
            //     result.resolve(lastPrevItem)
            // });
            
            return result.promise();
        },
        

        deleteItem: function(deletingAffectation) {
            var AffectationIndex = $.inArray(deletingAffectation, this.personnels_salle_classes);
            this.personnels_salle_classes.splice(AffectationIndex, 1);
        }

    };

    window.db = db;

    db.personnels = <?= $personnels ?>;
    
    db.personnels.unshift(    {
        id: null,
        value: 'Non affecté'
    })

    console.log(db.personnels)
    
    db.salle_classes = <?= $salle_classes ?>;

    db.personnels_salle_classes = <?= $affection_personnel_salle_classes ?>;

    
    $("#table_affectation_personnel_salle_classe").jsGrid({
        width: "100%",
        filtering: false,
        editing: true,
        inserting: false,
        sorting: true,
        paging: true,
        autoload: true,
        pageSize: 15,
        pageButtonCount: 5,
        controller: db,
        fields: [
            { name: "salle_classe", title: "Salle de classe", type: "select", items: db.salle_classes, valueField: "id", textField: "value" , editing: false},
            { name: "personnel", title: "personnel", type: "select", items: db.personnels, valueField: "id", textField: "value" },
            { type: "control", deleteButton: false }
        ],
        onItemUpdating: function(args) {
            lastPrevItem = args.previousItem;
            lastCurItem = args.item;
        },
    
        
    })


}())

</script>