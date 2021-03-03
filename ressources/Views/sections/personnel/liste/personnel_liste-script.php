<?php

use Core\Routing\URL;
use App\Helpers\Helpers;
use App\Model\Personnel;
use Core\HTML\Form\InputType;

include dirname(dirname(__DIR__))."/_common_lib/_select2_script.php";

?>
<!--
    ******  VARIABLES *****
     $base_route
     $fillables
     $msg_delete
-->


<script> 

  let msg  = 'Bienvenue à la gestion du Personnel'
  block_notification(msg)

  function init_data_table() {
        // $('#table-personnel').append('<caption style="caption-side: top-right">Table caption</caption>');

          table = $('#table-personnel').DataTable({
              //"serverSide": true,
              //Server-side processing is useful when working with large data sets (typically >50'000 records) as it means a database engine can be used to perform the sorting etc calculations - operations that modern database engines are highly optimised for, allowing use of DataTables with massive data sets (millions of rows).
              ajax:{
                  url: '<?= URL::link('personnel_api_get_all') ?>',
                  data: function(data){
                      // data.code =  code,
                  } ,
                  type: 'POST'
              },
              "columns": [<?= Personnel::getColumns() ?>],
             
             
              order: [[ 1, 'asc' ]],
              fixedColumns: true,
              "columnDefs": [
                {
                  "searchable": false,
                  // "orderable": false,
                  "class": "index",
                  "targets": 0
                },      
                
                {
                  "targets": -1,
                  "data": null,
                  "render": function(data, type, full, meta){ 
                      console.log(data);
                        return '<span class="dropdown">  '+
                                    '<button id="btnSearchDrop2" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-info dropdown-toggle"><i class="fa fa-cog"></i></button> <span aria-labelledby="btnSearchDrop2" class="dropdown-menu mt-1 dropdown-menu-right">  ' +
                                    '<a class="dropdown-item action action-voir" data-action="action-voir" onclick="initDataModal('+data.id+')"  ><i class="ft-eye"></i> voir</a>' +
                                    '<a class="dropdown-item action action-modifier" data-action="action-modifier" onclick="redirectTo('+data.id+')"  ><i class="ft-edit-2"></i> modifier</a>' +
                                    '<a class="dropdown-item action action-supprimer" data-action="action-supprimer"  ><i class="ft-trash"></i> supprimer</a>  </span> </span>' 
                    }
                }
            ],
            "createdRow": function(row, data, index) {
                  // let date = new Date(data.date).toLocaleDateString(window.navigator.language, {year: 'numeric',month: 'long',day: 'numeric',});
              },
              "fnDrawCallback": function( oSettings ) {
                  // $('#table-emprunt').append('<caption style="caption-side: top-right">Table caption</caption>');
              },
              "destroy" : true,
              dom: 'Blfrtip',
              "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Tout"]],
              stateSave: true,
            <?= Helpers::dataTableCommunOptions() ?>
              
          })

          table.on( 'order.dt search.dt', function () {
            table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                  cell.innerHTML = i+1;
              } );
          } ).draw();

          $('#table-personnel tbody').on( 'click', 'a.action', function () {
              var id = $(this).data('id');
              var action = $(this).data('action');
              alert('hello')
              console.log(id)
              console.log(action)
              var data = table.row( $(this).parents('tr') ).data()
              console.log(data)
              // let id = data.id
              // let num = data.num
              // let code_enregistrement = data.code_enregistrement
              // let titre = data.titre
              // let eleve = data.eleve
              // let date_emprunt = data.date_emprunt
              // let date_expiration = data.date_expiration
              // let classe = data.classe
              // let etat_document = data.etat_document

              switch(action){
                case 'action-voir':
                  break;
                case 'action-modifier':
                  break;
                case 'action-supprimer':
                  
                    // message de notification
                    swal({
                        title: "Suppression",
                        text: "Voulez vous supprimer ce personnel ?",
                        icon: "warning",
                        showCancelButton: true,
                        buttons: {
                            cancel: {
                                text: "Non, Annuler.",
                                value: null,
                                visible: true,
                                className: "btn-warning",
                                closeModal: true,
                            },
                            confirm: {
                                text: "Oui, Supprimer.",
                                value: true,
                                visible: true,
                                className: "",
                                closeModal: true
                            }
                        }
                    }).then(isConfirm => {
                        if (isConfirm) {
                            
                        } else {
                            
                        }
                    });

                  break;
              }

              // alert( id, num, code_enregistrement, titre, eleve, date_emprunt, date_expiration, classe, etat_document )
          } )

  }

  //Reload table data every 30 seconds (paging retained):
  setInterval( function () {
      table.ajax.reload( null, false ); // user paging is not reset on reload
  }, <?= REFRESH_TIME_DATATABLE ?> );

  (function(window, document, $){
    init_data_table()
  })(window, document, jQuery)

</script>



<script>
// https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_active_element
// Add active class to the current menu item (highlight it)
var menu = document.getElementById("menu");
var links = menu.getElementsByClassName("list-group-item");


for (var i = 0; i < links.length; i++) {
  links[i].addEventListener('click', function() {
      var current = document.getElementsByClassName('active')
      if (current.length > 0) { 
        current[0].className = current[0].className.replace(' active', '')
      }
      this.className += ' active'
      if(this.id.includes('ID_')){
        let current_id = this.id.replace('ID_', '')
        if(current_id.includes('SALL'))
          filter_by ='SALLE_CLASSE'
        else
          filter_by = 'CLASSE'
        code  =  current_id
      }else{
        filter_by = 'ALL'
        code = ''
      }

      table.ajax.reload()
  })
}
</script>