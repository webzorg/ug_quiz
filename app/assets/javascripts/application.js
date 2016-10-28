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
//= require jquery_ujs
//= require bootstrap
//= require select2
//= require bootstrap-switch
//= require cocoon
//= require_tree .

$("#dropdown").select2({
    theme: "bootstrap"
});

$(document).ready(function() {

  $("#include_students_in_group").select2();
  $("#include_groups_in_quiz").select2();

  $('.js-switch').bootstrapSwitch({
    onText: "Fall",
    offText: "Spring",
    onColor: "warning",
    offColor: "success",
    size: "large",
    handleWidth: 150,
    labelWidth: 10
  });

  // let toggleQuizSwitch = $('.toggle-quiz').bootstrapSwitch('toggleReadonly');
  //let printasd = function(){ console.log(123)};

  function clearNotice(){
    $(".alert").animate({opacity:'0'}, 2500);
  }
  var ready = function() {
    setTimeout(clearNotice, 1000);  //Flash fade
  };

  $('.toggle-quiz').bootstrapSwitch({
    onColor: "success",
    offColor: "warning",
    size: "small",
    handleWidth: 30,
    labelWidth: 10,
    animate: true,
    onSwitchChange: function(event, state) {
      $.ajax({
        url: '/quizzes/' + this.value + '/toggle_quiz',
        type: 'PATCH',
        data: {'active': this.checked}
      });
      setTimeout(function(){
        $('.toggle-quiz').bootstrapSwitch('toggleReadonly');
      }, 300);
      setTimeout(function(){
        $('.toggle-quiz').bootstrapSwitch('toggleReadonly');
      }, 3000);
      ready();
    }
  });

});
