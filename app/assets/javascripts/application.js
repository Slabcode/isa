// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require highcharts
//= require chartkick
//= require_tree .

Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
    return {
        radialGradient: {
            cx: 0.5,
            cy: 0.3,
            r: 0.7
        },
        stops: [
            [0, color],
            [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
        ]
    };
});

$(document).ready(function(){
    $("#nivel_one").change(function() {
      var inmuebles_options = {"Seleccionar categoria nivel 2": "0",
        "Rural": "1",
        "Urbano": "2"
      };
      var value = $("#nivel_one").val();
      var $el = $("#nivel_two");
      $el.empty(); // remove old options
      $.each(inmuebles_options, function(key,value) {
        $el.append($("<option></option>")
           .attr("value", value).text(key));
      });

    });
    $("#nivel_two").change(function(){
      var rural_options = {"Seleccionar categoria nivel 3": "0",
        "Casa rural": "1",
        "Lote": "2"
      };
      var urbano_options = {"Seleccionar categoria nivel 3": "0",
        "Apartamento": "1",
        "Bodega": "2",
        "Casa": "3",
        "Local": "4",
        "Lote urbano": "5",
        "Oficina": "6"
      };
      var value = $("#nivel_two").val();
      var $el = $("#nivel_three");
      $el.empty(); // remove old options
      if(value === "1"){
        $.each(rural_options, function(key,value) {
          $el.append($("<option></option>")
             .attr("value", value).text(key));
        });
      }else{
        $.each(urbano_options, function(key,value) {
          $el.append($("<option></option>")
             .attr("value", value).text(key));
        });
      }

    });
    $("#avaluo").submit(function(e){
        if($("#nivel_one").val() === "0"){
          alert("Debes selecionar al menos uno de nivel uno");
          e.preventDefault();
        }else if($("#nivel_two").val() === "0"){
          alert("Debes selecionar al menos uno de nivel dos");
          e.preventDefault();
        }else if($("#nivel_three").val() === "0"){
          alert("Debes selecionar al menos uno de nivel dos");
          e.preventDefault();
        }
    });
});
