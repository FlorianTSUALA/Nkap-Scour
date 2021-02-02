<!-- http://jsfiddle.net/cLqv5bo8/1/ -->

<!-- <a href="index.html">
    <i class="icon-home"></i>
    <span class="menu-title" data-i18n="nav.dash.main">Dashboard</span>
    <span class="badge badge badge-info badge-pill float-right mr-2">5</span>
</a>

<button class="dropdown-item" type="button">
    <span class="mr-1 badge badge-pill badge-default badge-success badge-glow">10</span> More Options
</button>

ft-chevrons-right

ft-chevrons-down
ft-menu
ft-list

<button class="dropdown-item" type="button"><i class="ft-link float-right"></i> Another action</button>


<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-primary">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            <span class="glyphicon glyphicon-minus" ></span>
          Collapsible Group Item #1
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        Collapsible Body 1
      </div>
    </div>
  </div>
  <div class="panel panel-primary">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
            <span class="glyphicon glyphicon-plus" ></span>
          Collapsible Group Item #2
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        Collapsible Body 2
      </div>
    </div>
  </div>
  <div class="panel panel-primary">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
            <span class="glyphicon glyphicon-plus" ></span>
          Collapsible Group Item #3
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        Collapsible Body 3
      </div>
    </div>
  </div>
</div> -->


<script>
    $("#accordion").on("hidden.bs.collapse", function (e) {
        $(e.target).closest(".panel-primary")
            .find(".panel-heading span")
            .removeClass("glyphicon glyphicon-minus")
            .addClass("glyphicon glyphicon-plus");
    });
    $("#accordion").on("shown.bs.collapse", function (e) {
        $(e.target).closest(".panel-primary")
            .find(".panel-heading span")
            .removeClass("glyphicon glyphicon-plus")
            .addClass("glyphicon glyphicon-minus");
    });
</script>

<script>
  // C:\laragon\www\Nkap-Scour\_robust\_Robust\Robust\Robust\app-assets\js\scripts\pickers\dateTime\pick-a-datetime.js
  (function(window, document, $){
      // Basic date
      $('.pickadate').pickadate();

    	// Localization
      $('.localeRange').daterangepicker({
        ranges: {
          "Aujourd'hui": [moment(), moment()],
          'Hier': [moment().subtract('days', 1), moment().subtract('days', 1)],
          'Demain': [moment().add(1, 'days'), moment().add(1, 'days')],
          'Les 7 derniers jours': [moment().subtract('days', 6), moment()],
          'Les 7 prochains jours': [moment(), moment().add('days', 6)],
          'Les 30 derniers jours': [moment().subtract('days', 29), moment()],
          'Ce mois-ci': [moment().startOf('month'), moment().endOf('month')],
          'le mois dernier': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
        },
        locale: {
          applyLabel: "Vers l'avant",
          cancelLabel: 'Annulation',
          startLabel: 'Date initiale',
          endLabel: 'Date limite',
          customRangeLabel: 'Sélectionner une date',
          // daysOfWeek: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi','Samedi'],
          daysOfWeek: ['Di', 'Lu', 'Ma', 'Me', 'Je', 'Ve','Sa'],
          monthNames: ['Janvier', 'février', 'Mars', 'Avril', 'Маi', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Decembre'],
          firstDay: 1
        },
      
      onStart: function() {
        console.log('Hi there!!!');
      },
      onRender: function() {
        console.log('Holla... rendered new');
      },
      onOpen: function() {
        console.log('Picker Opened');
      },
      onClose: function() {
        console.log("I'm Closed now");
      },
      onStop: function() {
        console.log('Have a great day ahead!!');
      },
      onSet: function(context) {
        console.log('All stuff:', context);
      }
	});


  

  })(window, document, jQuery)
</script>