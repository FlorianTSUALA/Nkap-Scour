<?php 

    use App\Helpers\HTMLHelper;
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
        var form = $("#form-inscription").show();

        form.validate({
            rules: {
                nom_eleve: "required",
                lieu_naissance_eleve: "required",
                date_naissance_eleve: "required",
                sexe_eleve: "required",
                pays_eleve: "required",
                classe_eleve: "required",
                statut_apprenant_eleve: "required",
            },
            messages: {
                nom_eleve: {
                    required: "Ce champs est obligatoire !",
                },
                lieu_naissance_eleve: {
                    required: "Ce champs est obligatoire !",
                },
                date_naissance_eleve: {
                    required: "Ce champs est obligatoire !",
                },
                sexe_eleve: {
                    required: "Ce champs est obligatoire !",
                },
                pays_eleve: {
                    required: "Ce champs est obligatoire !",
                },
                classe_eleve: {
                    required: "Ce champs est obligatoire !",
                },
                statut_apprenant_eleve: {
                    required: "Ce champs est obligatoire !",
                },
            },
        });
    
    
        // Validate steps wizard
        $("#form-inscription").steps({
            headerTag: "h6",
            bodyTag: "fieldset",
            transitionEffect: "fade",
            titleTemplate: '<span class="step">#index#</span> #title#',
            labels: {
                finish: 'Enregistrer'
            },
            onStepChanging: function(event, currentIndex, newIndex) {
                // Allways allow previous action even if the current form is not valid!
                if (currentIndex > newIndex) {
                    return true;
                }
                
                $('#recap-email').text($('#email').val()? $('#email').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-telephone').text($('#telephone').val()? $('#telephone').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-classe').text($('#classe').val()? $('#classe').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-ecole').text($('#ecole').val()? $('#ecole').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-autres').text($('#autres').val()? $('#autres').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-probleme_particulier').text($('#probleme_particulier').val()? $('#probleme_particulier').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-email_medecin').text($('#email_medecin').val()? $('#email_medecin').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-telephone_medecin').text($('#telephone_medecin').val()? $('#telephone_medecin').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-nom_medecin').text($('#nom_medecin').val()? $('#nom_medecin').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-maladie_recurrente').text($('#maladie_recurrente').val()? $('#maladie_recurrente').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-allergie').text($('#allergie').val()? $('#allergie').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-email_mere').text($('#email_mere').val()? $('#email_mere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-bureau_mere').text($('#bureau_mere').val()? $('#bureau_mere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-quartier_mere').text($('#quartier_mere').val()? $('#quartier_mere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-telephone_mere').text($('#telephone_mere').val()? $('#telephone_mere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-lieu_travail_mere').text($('#lieu_travail_mere').val()? $('#lieu_travail_mere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-profession_mere').text($('#profession_mere').val()? $('#profession_mere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-employeur_mere').text($('#employeur_mere').val()? $('#employeur_mere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-prenom_mere').text($('#prenom_mere').val()? $('#prenom_mere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-nom_mere').text($('#nom_mere').val()? $('#nom_mere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-telephone_personne_urgence').text($('#telephone_personne_urgence').val()? $('#telephone_personne_urgence').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-nom_personne_urgence').text($('#nom_personne_urgence').val()? $('#nom_personne_urgence').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-prenom_personne_urgence').text($('#prenom_personne_urgence').val()? $('#prenom_personne_urgence').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-lien').text($('#lien').val()? $('#lien').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-nom_eleve').text($('#nom_eleve').val()? $('#nom_eleve').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-nom_usage').text($('#nom_usage').val()? $('#nom_usage').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-prenom_eleve').text($('#prenom_eleve').val()? $('#prenom_eleve').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-prenom_usage').text($('#prenom_usage').val()? $('#prenom_usage').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-lieu_naissance_eleve').text($('#lieu_naissance_eleve').val()? $('#lieu_naissance_eleve').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-date_naissance_eleve').text($('#date_naissance_eleve').val()? $('#date_naissance_eleve').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-anciennete_eleve').text($('#anciennete_eleve').val()? $('#anciennete_eleve').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-nom_pere').text($('#nom_pere').val()? $('#nom_pere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-prenom_pere').text($('#prenom_pere').val()? $('#prenom_pere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-employeur_pere').text($('#employeur_pere').val()? $('#employeur_pere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-profession_pere').text($('#profession_pere').val()? $('#profession_pere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-lieu_travail_pere').text($('#lieu_travail_pere').val()? $('#lieu_travail_pere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-telephone_pere').text($('#telephone_pere').val()? $('#telephone_pere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-bureau_pere').text($('#bureau_pere').val()? $('#bureau_pere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-quartier_pere').text($('#quartier_pere').val()? $('#quartier_pere').val():'<?= HTMLHelper::repeatChar();?>');
                $('#recap-email_pere').text($('#email_pere').val()? $('#email_pere').val():'<?= HTMLHelper::repeatChar();?>');


                
                $('#recap-pays_eleve').text($('#pays_eleve :selected').val()? $('#pays_eleve :selected').val() : '<?= HTMLHelper::repeatChar();?>');
                $('#recap-statut_apprenant_eleve').text($('#statut_apprenant_eleve :selected').val()? $('#statut_apprenant_eleve :selected').val() : '<?= HTMLHelper::repeatChar();?>');
                $('#recap-classe_eleve').text($('#classe_eleve :selected').val()? $('#classe_eleve :selected').val() : '<?= HTMLHelper::repeatChar();?>');
                $('#recap-pays_pere').text($('#pays_pere :selected').val()? $('#pays_pere :selected').val() : '<?= HTMLHelper::repeatChar();?>'); 
                $('#recap-pays_mere').text($('#pays_mere :selected').val()? $('#pays_mere :selected').val() : '<?= HTMLHelper::repeatChar();?>');
                $('#recap-groupe_sanguin').text($('#groupe_sanguin :selected').val()? $('#groupe_sanguin :selected').val() : '<?= HTMLHelper::repeatChar();?>');
                
                // $('#recap-est_tuteur_pere').text($('input[type=radio][name=est_tuteur_pere]:checked').val()? $('input[type=radio][name=est_tuteur_pere]:checked').val() : '<?= HTMLHelper::repeatChar();?>');
                // $('#recap-est_tuteur_mere').text($('input[type=radio][name=est_tuteur_mere]:checked').val()? $('input[type=radio][name=est_tuteur_mere]:checked').val() : '<?= HTMLHelper::repeatChar();?>');
                $('#recap-sexe_eleve').text($('input[type=radio][name=sexe_eleve]:checked').val()? $('input[type=radio][name=sexe_eleve]:checked').val() : '<?= HTMLHelper::repeatChar();?>');
                $('#recap-sexe_eleve').val($('input[type=radio][name=sexe_eleve]:checked').val()? $('input[type=radio][name=sexe_eleve]:checked').val() : '<?= HTMLHelper::repeatChar();?>');
               

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