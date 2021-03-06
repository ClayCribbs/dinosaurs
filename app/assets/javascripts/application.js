// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  $("img.lazy").lazyload({skip_invisible : false, failure_limit : 999, effect: "fadeIn"}).removeClass("lazy");

  $(function(){
    var sPositions = localStorage.positions || "{}",
    positions = JSON.parse(sPositions);

    $.each(positions, function (id, pos) {
      $("#" + id).css(pos)
    })
  });

  $("#draggable").draggable({
    containment: "#myModal",
    revert : "valid",

    scroll: false,
    stop: function (event, ui) {
        positions[this.id] = ui.position
        localStorage.positions = JSON.stringify(positions)
    }
  })

  $("#draggable2").draggable({
    containment: "#myModal",
    revert : "valid",

    scroll: false,
    stop: function (event, ui) {
        positions[this.id] = ui.position
        localStorage.positions = JSON.stringify(positions)
    }
  })
});

