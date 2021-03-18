<script>
    $(document).ready(function(){
        // var trHead = $("thead:first tr");
        // $("thead:first tr th").height("100px");
        // $("th div", trHead).addClass("rotate").css('margin-left', '2px').css('position', 'absolute');

        var trHead = $("#basicScenario > div.jsgrid-grid-header.jsgrid-header-scrollbar > table > tr.jsgrid-header-row");
        $("#basicScenario > div.jsgrid-grid-header.jsgrid-header-scrollbar > table > tr.jsgrid-header-row th").height("100px");
        $("#basicScenario > div.jsgrid-grid-header.jsgrid-header-scrollbar > table > tr.jsgrid-header-row > th.jsgrid-header-cell", trHead).addClass("rotate").css('margin-left', '2px').css('position', 'absolute');
        // $("#basicScenario > div.jsgrid-grid-header.jsgrid-header-scrollbar > table > tr.jsgrid-header-row:first th", trHead).addClass("rotate").css('margin-left', '2px').css('position', 'absolute');
        



        

    /*************************************
    *        Default Score Rating        *
    **************************************/
        $.fn.raty.defaults.path = '../../../app-assets/images/raty/';

        $('#score-rating').raty({
            score: 3
        });

        if($(".sidebar-sticky").length){
            var headerNavbarHeight,
                footerNavbarHeight;

            // Header & Footer offset only for right & left sticky sidebar
            if($("body").hasClass('content-right-sidebar') || $("body").hasClass('content-left-sidebar')){
                headerNavbarHeight = $('.header-navbar').height();
                footerNavbarHeight = $('footer.footer').height();
            }
            // Header & Footer offset with padding for detached right & left dsticky sidebar
            else{
                headerNavbarHeight = $('.header-navbar').height()+24;
                footerNavbarHeight = $('footer.footer').height()+10;
            }

            $(".sidebar-sticky").sticky({
                topSpacing: headerNavbarHeight,
                bottomSpacing: footerNavbarHeight
            });

        }
    })
</script>