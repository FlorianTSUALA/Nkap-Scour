<?php 

    use App\Helpers\Helpers;
?>

<script>
    function readURL(input, selector) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $(selector)
                    .attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

<script>
    $(document).ready(function(){
        // Show form
        var form = $("#form-ajout_personnel").show();
              

        //https://jqueryvalidation.org/validate
        form.validate({
            rules: {
                nom: "required",
                lieu_naissance: "required",
                password: {
                   required: true,
                   minlength: 5
                },
                password_confirm : {
                    equalTo : '[name="password"]'
                },
                sexe: "required",
                pays: "required",
                type_personnel: "required",
                telephone: "required",
                fonction: "required",
            },
            messages: {
                nom: {
                    required: "Ce champs est obligatoire !",
                },
                lieu_naissance: {
                    required: "Ce champs est obligatoire !",
                },
                password: {
                    required: "Ce champs est obligatoire !",
                    minlength: "Le mot de passe doit avoir 5 caracteres minimun",
                },
                password_confirm: {
                    equalTo: "Les mots de passe doivent etre identiques",
                },
                sexe: {
                    required: "Ce champs est obligatoire !",
                },
                pays: {
                    required: "Ce champs est obligatoire !",
                },
                type_personnel: {
                    required: "Ce champs est obligatoire !",
                },
                telephone: {
                    required: "Ce champs est obligatoire !",
                },
                fonction: {
                    required: "Ce champs est obligatoire !",
                },
            },
        });
    
    
        // Validate steps wizard
        $("#form-ajout_personnel").steps({
            headerTag: "h6",
            bodyTag: "fieldset",
            transitionEffect: "fade",
            titleTemplate: '<span class="step">#index#</span> #title#',
            labels: {
                finish: 'Submit'
            },
            onStepChanging: function(event, currentIndex, newIndex) {
                // Allways allow previous action even if the current form is not valid!
                if (currentIndex > newIndex) {
                    return true;
                }
                /*
                photo
                nom
                prenom
                telephone
                email
                date_prise_service
                adresse
                pays
                type_personnel
                login
                sexe
                password
                fonction
                assurance
                photo_autres
                autres*/

                $('#recap-login').text($('#login').val()? $('#login').val():'<?= Helpers::repeatChar();?>');
                $('#recap-nom').text($('#nom').val()? $('#nom').val():'<?= Helpers::repeatChar();?>');
                $('#recap-prenom').text($('#prenom').val()? $('#prenom').val():'<?= Helpers::repeatChar();?>');
                $('#recap-telephone').text($('#telephone').val()? $('#telephone').val():'<?= Helpers::repeatChar();?>');
                $('#recap-pays').text($('#pays :selected').val()? $('#pays :selected').val() : '<?= Helpers::repeatChar();?>');
                $('#recap-email').text($('#email').val()? $('#email').val():'<?= Helpers::repeatChar();?>');
                $('#recap-date_prise_service').text($('#date_prise_service').val()? $('#date_prise_service').val():'<?= Helpers::repeatChar();?>');
                $('#recap-type_personnel').text($('#type_personnel :selected').val()? $('#type_personnel :selected').val() : '<?= Helpers::repeatChar();?>');
                $('#recap-adresse').text($('#adresse').val()? $('#adresse').val():'<?= Helpers::repeatChar();?>');
                $('#recap-fonction').text($('#fonction').val()? $('#fonction').val():'<?= Helpers::repeatChar();?>');
                $('#recap-assurance').text($('#assurance').val()? $('#assurance').val():'<?= Helpers::repeatChar();?>');
                $('#recap-autres').text($('#autres').val()? $('#autres').val():'<?= Helpers::repeatChar();?>');
                $('#recap-sexe').val($('input[type=radio][name=sexe]:checked').val()? $('input[type=radio][name=sexe]:checked').val() : '<?= Helpers::repeatChar();?>');
               
                if (currentIndex < newIndex) {
                    // To remove error styles
                    form.find(".body:eq(" + newIndex + ") label.error").remove();
                    form.find(".body:eq(" + newIndex + ") .error").removeClass("error");
                }
                form.validate().settings.ignore = ":disabled,:hidden";
                return form.valid();
            },
            onFinishing: function(event, currentIndex) {
                form.validate().settings.ignore = ":disabled";
                return form.valid();
            },
            onFinished: function(event, currentIndex) {
                form.submit();
            }
        });
    
    });

</script>

<script>
    $(document).ready(function(){
        var $select = $(".select2").select2();
    });
</script>