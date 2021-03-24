<?php 
    use Core\Routing\URL;
    include 'index-script_search_menu.php';          
    include dirname(__DIR__)."/_common_lib/_select2_script.php"; 
?>

<script>

    var session = 'ALL'
    var periode = 'ALL'
    var salle_classe = 'ALL'

    // 

    $(document).ready(function(){
        // var trHead = $("thead:first tr");
        // $("thead:first tr th").height("100px");
        // $("th div", trHead).addClass("rotate").css('margin-left', '2px').css('position', 'absolute');

        var trHead = $("#basicScenario > div.jsgrid-grid-header.jsgrid-header-scrollbar > table > tr.jsgrid-header-row");
        $("#basicScenario > div.jsgrid-grid-header.jsgrid-header-scrollbar > table > tr.jsgrid-header-row th").height("100px");
        $("#basicScenario > div.jsgrid-grid-header.jsgrid-header-scrollbar > table > tr.jsgrid-header-row > th.jsgrid-header-cell", trHead).addClass("rotate").css('margin-left', '2px').css('position', 'absolute');
        // $("#basicScenario > div.jsgrid-grid-header.jsgrid-header-scrollbar > table > tr.jsgrid-header-row:first th", trHead).addClass("rotate").css('margin-left', '2px').css('position', 'absolute');
    
        //CHANGE SESSION UPDATE PERIODE THEN UPDATE PERIODE WHO REFRESH JSGRID
        $(document).on('change', 'select.session', function(){

            session = $(this).find(':selected')[0].id

            $.ajax({
                type: 'POST',
                url: '<?= URL::link('api_liste_periode_session') ?>',
                data: {
                    'session_id': session
                },
                success: function (data) {
                    var $periode = $('#periode')
                    
                    console.log(data)
                    
                    return

                    $periode.empty()

                    $('#periode').empty()

                    for (var i = 0; i < data.length; i++) {
                        let item = data[i]
                        $periode.append('<option data-id=' + item.periode_id + ' value=' + item.periode_id + '>' + item.periode + '</option>')
                    }

                    $periode.change()
                },
                complete: function() {
                    console.log('Yes')
                    // updateJsGrid()
                }
            })

        })
        
        //SALLE CLASSE EVENT CHANGE
        $(document).on('change', 'select.periodoe', function(){
            periode = $(this).find(':selected')[0].id
            updateJsGrid()
        })

        //SALLE CLASSE EVENT CHANGE
        $(document).on('change', 'select.salle_classe', function(){
            salle_classe = $(this).find(':selected')[0].id
            updateJsGrid()
        })

        function updateJsGrid(){
            
        }

    })
</script>

