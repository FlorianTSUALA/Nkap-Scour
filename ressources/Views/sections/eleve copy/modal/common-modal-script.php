<?php 

use Core\Routing\URL;

?>
<!-- 
    ******  VARIABLES *****

-->

<!-- create  -->
<script> 
     (function(){  
          
          $(document).on('click', '#button-create', function(e)
          {  
               e.preventDefault();
               form = $('#create-form')[0];
               if (form.checkValidity() === true) {
                    form = $('#create-form');
                    $.ajax({  
                         url: "<?= URL::link('pays-create'); ?>",  
                         method: "POST",  
                         data: form.serialize(),  
                         beforeSend:function(){
                              $('#button-form-create').hide();  
                              $('#loading').show();
                         },  
                         success:function(data){ 
                              form[0].reset();  
                              $('#button-form-update').show();  
                              $('#upt-loading').hide();

                              $('#modal-create').modal('hide');  
                              $('#data-table').html(data);  
                         }, 
                         error: function (textStatus, errorThrown) {
                              Success = false;
                         }
                    });  
               }else{
                    e.stopPropagation();
                    form.classList.add('was-validated'); 
               }
          });
     })(); 
</script>


<!-- update  -->
<script> 
     (function(){  

          //Get Data to Update
          $('#data-table').on('click', '.btn_update_data', function(e)
          {  
               var id = $(this).data("id");
               $.ajax({  
                    url: '<?= URL::link('pays-read'); ?>'+id,
                    method: 'GET',
                    dataType: 'json',  
                    success: function(data){ 
                         $('#upd-id').val(data.id);  
                         $('#upd-libelle').val(data.libelle);  
                         $('#upd-description').val(data.description);  
                         $('#modal-update').modal('show');  
                    }  
               });  
          });  


          //Store Data
          $('#button-update').click( function(e)
          {  
               e.preventDefault();
               form = $('#update-form')[0];
               if (form.checkValidity() === true) {
                    form = $('#update-form');
                    $.ajax({  
                         url: '<?= URL::link('pays-update'); ?>'+ $('#upd-id').val(),  
                         method: 'POST',  
                         data: form.serialize(),  
                         beforeSend:function(){
                              $('#button-form-update').hide();  
                              $('#upt-loading').show();  
                         },  
                         success:function(data){ 
                              form[0].reset();  
                              $('#button-form-update').show();  
                              $('#upt-loading').hide();  

                              $('#modal-update').modal('hide');  
                              $('#data-table').html(data);  
                         }, 
                         error: function (textStatus, errorThrown) {
                              Success = false;
                         }
                    });  
               }else{
                    e.stopPropagation();
                    form.classList.add('was-validated'); 
               }
          });
     })();  

</script>



<!-- delete  -->
<script> 
     (function(){  
          //Display modal delete
          var id = 0;
          $('#data-table').on('click', '.btn_delete_data', function()
          {    
               id = $(this).data("id");
               $('#modal-delete').modal('show');
               var $row = $(this).closest("tr"),
               $entity = $row.find("td:nth-child(2)");
   
               $.each($entity, function() {
                    $('#modal-delete-body').html('<h4>Voulez-vous vraiment supprimer le pays <strong>' + $(this).text() + ' </strong> ?</h4>');
               });

          });

          //Delete and update table
          $('#button-delete').on('click', function(e)
          {  
               //var id = $(this).data("id");  
               $.ajax({  
                    url: '<?= URL::link('pays-delete'); ?>'+id,  
                    method: 'GET',
                    beforeSend:function(){
                              $('#button-form-delete').hide();  
                              $('#del-loading').show();  
                    },  
                    success: function(data){  
                         $('#button-form-delete').show();  
                         $('#del-loading').hide(); 

                         $('#modal-delete').modal('hide');  
                         $('#data-table').html(data);  
                    },
                    error: function (textStatus, errorThrown) {
                              Success = false;
                    }  
               });  
          });  
     })();  
</script>

<!-- read  -->
<script> 
     (function(){  
          //Get Data to Update
          $('#data-table').on('click', '.btn_read_data', function(e)
          {  
               var id = $(this).data("id");
               $.ajax({  
                    url: '<?= URL::link('pays-detail'); ?>'+id,
                    method: 'GET',
                    //dataType: 'json',  
                    success: function(data){  
                         $("#modal-view-body").html(data);
                         
                         $('#modal-view').modal('show');  
                    } 
               });  
          });  
     })();  
</script>
