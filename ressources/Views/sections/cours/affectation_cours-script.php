<?php 

use Core\Routing\URL;

$base_route = isset($base_route)? $base_route : "";

?>



<script>
function reset_select2_size(obj)
{
    if (typeof(obj)!='undefined') {
        obj.find('.select2-container').parent().each(function() {
            $(this).find('.select2-container').css({"width":"10px"});
        });

        obj.find('.select2-container').parent().each(function() {
            var width = ($(this).width()-5)+"px";
            $(this).find('.select2-container').css({"width":width});
        });
        return;
    }

    $('.select2-container').filter(':visible').parent().each(function() {
        $(this).find('.select2-container').css({"width":"10px"});
    });
    $('.select2-container').filter(':visible').parent().each(function() {
        var width = ($(this).width()-5)+"px";
        $(this).find('.select2-container').css({"width":width});
    });
}

function onWindowResized( event )
{
    reset_select2_size();
}

window.addEventListener('resize', onWindowResized );

// $('#modal-create, #modal-update, #modal-delete').on('shown.bs.modal', function (event) {
//      onWindowResized( event )
// })


$('.modal').on('shown.bs.modal', function (event) {
     onWindowResized( event )
});




</script>

<script>
/**********************************
*      Custom View Scenario       *
    select2 https://github.com/tabalinas/jsgrid/issues/141
    http://js-grid.com/docs/#custom-field
    http://jsfiddle.net/tabalinas/8thcpey4/
**********************************/

  (function(jsGrid, $, undefined) {

    var NumberField = jsGrid.NumberField;

    function Select2Field(config) {
      this.items = [];
      this.selectedIndex = -1;
      this.valueField = "";
      this.textField = "";
      this.imgField = "";

      if (config.valueField && config.items.length)
        this.valueType = typeof config.items[0][config.valueField];
      this.sorter = this.valueType;
      NumberField.call(this, config);
    }

    Select2Field.prototype = new NumberField({
      align: "left",
      valueType: "number",

      itemTemplate: function(value) {
        var items = this.items,
          valueField = this.valueField,
          textField = this.textField,
          imgField = this.imgField,
          resultItem;

        if (valueField) {
          resultItem = $.grep(items, function(item, index) {
            return item[valueField] === value;
          })[0] || {};
        } else
          resultItem = items[value];

        var result = (textField ? resultItem[textField] : resultItem);
        return (result === undefined || result === null) ? "" : result;
      },

      filterTemplate: function() {
        if (!this.filtering)
          return "";

        var grid = this._grid,
          $result = this.filterControl = this._createSelect();
        this._applySelect($result, this);

        if (this.autosearch) {
          $result.on("change", function(e) {
            grid.search();
          });
        }

        return $result;
      },

      insertTemplate: function() {
        if (!this.inserting)
          return "";

        var $result = this.insertControl = this._createSelect();
        this._applySelect($result, this);
        return $result;
      },

      editTemplate: function(value) {
        if (!this.editing)
          return this.itemTemplate(value);

        var $result = this.editControl = this._createSelect();
        (value !== undefined) && $result.val(value);
        this._applySelect($result, this);
        return $result;
      },

      filterValue: function() {
        var val = this.filterControl.val();
        return this.valueType === "number" ? parseInt(val || 0, 10) : val;
      },

      insertValue: function() {
        var val = this.insertControl.val();
        return this.valueType === "number" ? parseInt(val || 0, 10) : val;
      },

      editValue: function() {
        var val = this.editControl.val();
        return this.valueType === "number" ? parseInt(val || 0, 10) : val;
      },

      _applySelect: function(item, self) {
        setTimeout(function() {
          var selectSiteIcon = function(opt) {
            var img = '';
            try {
              img = opt.element.attributes.img.value;
            } catch (e) {}
            if (!opt.id || !img)
              return opt.text;
            var res = $('<span><img src="' + img + '" class="img-flag"/> ' + opt.text + '</span>');
            return res;
          }
          item.select2({
            width: self.width,
            templateResult: selectSiteIcon,
            templateSelection: selectSiteIcon
          });
        });
      },

      _createSelect: function() {
        var $result = $("<select>"),
          valueField = this.valueField,
          textField = this.textField,
          imgField = this.imgField,
          selectedIndex = this.selectedIndex;

        $.each(this.items, function(index, item) {
          var value = valueField ? item[valueField] : index,
            text = textField ? item[textField] : item,
            img = imgField ? item[imgField] : '';

          var $option = $("<option>")
            .attr("value", value)
            .attr("img", img)
            .text(text)
            .appendTo($result);

          $option.prop("selected", (selectedIndex === index));
        });

        return $result;
      }
    });

    jsGrid.fields.select2 = jsGrid.Select2Field = Select2Field;

  }(jsGrid, jQuery));

  //Creatopn d'un controller javascript db
  var db = {
    // Cycle
    // Classe
    // Mateire
    // Enseignant
    // Coeficient
    // Commentaire

    // classe
    // matiere
    // salle_classe
    // volume_horaire
    // coefficient

    loadData: function(filter) {
      //console.log(filter);
      $.ajax({
        type: "GET",
        url: '<?= URL::link($base_route.'-all'); ?>',
        success:function(data){ 
          console.log(data);
          this.cours = data 
        }, 
        error: function (textStatus, errorThrown) {
            Success = false;
        }
      });
      

      return $.grep(this.cours, function(item) {
        console.log(!filter.coefficient || item.coefficient === filter.coefficient) ;
        return ( (!filter.libelle || item.libelle === "" || item.libelle.indexOf(filter.libelle) > -1) && (!filter.classe_id || item.classe_id === filter.classe_id) && (!filter.salle_classe_id || item.salle_classe_id === filter.salle_classe_id ) && (!filter.matiere_id || item.matiere_id === filter.matiere_id ) && (!filter.volume_horaire || item.volume_horaire === filter.volume_horaire) &&  (!filter.coefficient || item.coefficient === filter.coefficient) );
      });
    },
    
    insertItem: function(item) {
      //console.log(item);
      this.cours.push(item);
      return $.ajax({
              type: "POST",
              url: '<?= URL::link($base_route.'-create'); ?>',
              data: item
          });
    },

    updateItem: function(item) {
      //console.log(item);
      var coursIndex = $.inArray(item, this.cours);
      this.cours.splice(coursIndex, 1);
      this.cours.push
      
      return $.ajax({
                  type: "POST",
                  url: '<?= URL::link($base_route.'-update'); ?>'+ item.id,
                  data: item
              });

    },

    deleteItem: function(item) {
    
      //console.log(item);
      var coursIndex = $.inArray(item, this.cours);
      this.cours.splice(coursIndex, 1);


      return $.ajax({
                        type: "POST",
                        url: '<?= URL::link($base_route.'-delete'); ?>'+item.id,
                        data: item
                    });
      }

  };

  window.db = db;

  db.cours = <?= $cours; ?>;
  console.log(db.cours);
  db.cycles = <?= $cycles; ?>;
  db.matieres = <?= $matieres; ?>;
  db.classes = <?= $classes; ?>;
  db.salle_classes = <?= $salle_classes; ?>;
  db.personnels = <?= $personnels; ?>;
  db.type_personnels = <?= $type_personnels; ?>;


  $("#multi-data-select").jsGrid({
    width: "100%",

    heading: true,
    inserting: true,
    paging: true,
    selecting: true,
    filtering: true,
    editing: true,
    sorting: true,
    autoload: true,
    datatype: "json",
    locale: 'fr',
    pageSize: 15,
    pageButtonCount: 5,
    deleteConfirm: "Voullez vous supprimer cette affectation ?",
    controller: db,
    invalidMessage: "Veuillez renseigner les valeurs manquantes!!!",
    // invalidNotify: function(args) {
    //     $('#alert-error-not-submit').removeClass('hidden');
    // },

    /*
    fields: [{
            name: "sensorNumber",
            title: $('#title_meter_number').val(),
            type: "number",
            validate: "required"
        }, {
            name: "liters",
            title: $('#title_liters').val(),
            type: "number",
            validate: "required"
        }, {
            name: "measuredValue",
            title: $('#title_indication_of_the_meter').val(),
            type: "number",
            validate: "required"
        }, {
            
            */
    fields: [{
        name: "libelle",
        title: "Libellé",
        type: "text",
        autosearch: true,
        width: 80
      },
    
      // {   name: "cycle_id", title: "Cycle", type: "select2",  items: db.cycles, valueField: "id", textField: "value",
      //     validate: { 
      //         message: "Un cycle doit etre sélectionnée", 
      //         validator: function(value) 
      //         { 
      //              return value != undefined && value.length > 0; 
      //         } 
      //     } 
      // },
      {
        name: "salle_classe_id",
        title: "Salle",
        type: "select2",
        items: db.salle_classes,
        valueField: "id",
        textField: "value",
        validate: {
          message: "Une salle de classe doit etre sélectionnée",
          validator: function(value) {
             return value != undefined && value.length > 0;
          }
        }
      },
      {
        name: "classe_id",
        title: "Classe",
        type: "select2",
        items: db.classes,
        valueField: "id",
        textField: "value",
        validate: {
          message: "Une classe doit etre sélectionnée",
          validator: function(value) {
             return value != undefined && value.length > 0;
          }
        }
      },
      {
        name: "matiere_id",
        title: "Matiere",
        type: "select2",
        items: db.matieres,
        valueField: "id",
        textField: "value",
        validate: {
          message: "Une matiere doit etre sélectionnée",
          validator: function(value) {
             return value != undefined && value.length > 0;
          }
        }
      },
      {
        name: "personnel_id",
        title: "Personnel",
        type: "select2",
        width: 150,
        items: db.personnels,
        valueField: "id",
        textField: "value",
        validate: {
          message: "Un enseignant doit etre sélectionnée",
          validator: function(value) {
            return value != undefined && value.length > 0;
          }
        }
      },
      // {
      //   name: "type_personnel_id",
      //   title: "Type personnel",
      //   type: "select2",
      //   width: 150,
      //   items: db.type_personnels,
      //   valueField: "id",
      //   textField: "value",
      //   validate: {
      //     message: "Un enseignant doit etre sélectionnée",
      //     validator: function(value) {
      //       return value != undefined && value.length > 0;
      //     }
      //   }
      // },
      {
        name: "coefficient",
        title: "Coef",
        type: "number",
        width: 50,
        validate: {
          message: "Le coeficient doit etre compris entre 1 et 20",
          validator: "range",
          param: [1, 20]
        },
      },
      {
        name: "volume_horaire",
        title: "Volume Horaire",
        type: "number",
        width: 50,
        validate: {
          message: "Le Volume Horaire doit etre compris entre 1 et 100000",
          validator: "range",
          param: [1, 100000]
        },
      },
      // {
      //   name: "Commentaire",
      //   type: "textarea",
      //   autosearch: true,
      //   width: 150
      // },
      {
        type: "control",
        modeSwitchButton: false,
        editButton: true
      }
    ]
  });

</script>