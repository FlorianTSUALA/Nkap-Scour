
//REDIRECTION
    // similar behavior as an HTTP redirect
    window.location.replace("<?= URL::link('personnel-create');?>");

    // similar behavior as clicking on a link
    window.location.href = "<?= URL::link('personnel-create');?>";

//---

//NOTIFICATION
    flash_msg(data.data, 3)

    alert(data.data, 'Oupss.... ', 'error')
//---

$(document).ready(function() {

})

// Shorthand for $( document ).ready()
$(function() {
    console.log( "ready!" );
});

(function(window, document, $) {

})


//JQUERY SELECTOR 4 HTML SELECT 
    let class_name = 'a[b]'
    let options = $('select[name="' + class_name + '"] :not(option:selected)')
    let values = $.map(options ,function(option) {
        return option.value
    })
//---






//JQUERY

    $('#modal-emprunt').on('select2:open', 'select.code-livre', function(){
        mustUpdateY = true
        mustUpdateX = false
    })

    $('#modal-emprunt').on('change', 'select.titre-livre', function(){
        let parent = $(this).parent().parent()
        updateItem(parent, false)
    })



    $(document).on('click', '#modal-emprunt-save', function(e) {
            e.preventDefault();
            saveEmprunt();
    })
        



    onclick="window.location.href='<?= URL::link('versement') ?>'"   data-toggle="modal" data-target="#modal-emprunt"



//---