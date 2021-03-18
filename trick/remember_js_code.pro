
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






