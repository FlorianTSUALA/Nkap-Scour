<?php 

    use Core\Routing\URL;
    include dirname(__DIR__)."/_common_lib/_select2_script.php";
?>


<script>
    function redirectTo(){
        let id = $('#recap-id')
        location.href = '<?= URL::link('modifier_personnel') ?>'+id
    
    }

    function initDataModal(id){
        $.ajax({
            url: '<?= URL::link('personnel_api_info');?>'+id,
            type: 'post',
            dataType: 'json',
            beforeSend:function(){
            },
            success:function(data){
                console.log(data)

                personnel = data
                $("#recap-id").text(personnel.id)
                $("#recap-nom").text(personnel.nom)
                $("#recap-prenom").text(personnel.prenom)
                $("#recap-telephone").text(personnetelephone)
                $("#recap-email").text(personneemail)
                $("#recap-date_prise_service").text(personnel.date_prise_service)
                $("#recap-adresse").text(personnel.adresse)
                $("#recap-pays").text(personnel.pays)
                $("#recap-type_personnel").text(personnel.type_personnel)
                $("#recap-login").text(personnel.login)
                $("#recap-sexe").text(personnel.sexe)
                $("#recap-assurance").text(personnel.assurance)
                $("#recap-autres").text(personnel.autres)
                $("#recap-fonciton").text(personnel.fonciton)
                $("#recap-autres").text(personnel.autres)

                $('#personnel_modal_info').modal('show')

            },
            error: function (textStatus, errorThrown) {
                Success = false;
                swal("Erreur", "Erreur de communication avec le serveur :)", "error");
                console.log(textStatus, errorThrown);
            }
        });    

        
    }

</script>