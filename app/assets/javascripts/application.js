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

let alertTimeout;
function clearFlash(){
  clearTimeout(alertTimeout);
  alertTimeout = setTimeout(function(){
    $(".alert-general").slideUp(1500);
  }, 8500);  //Flash fade
}
clearFlash();

$(document).ready(function() {

  $("#include_students_in_group").select2();
  $("#include_groups_in_quiz").select2();

  $('.js-switch').bootstrapSwitch({
    onColor: "success",
    offColor: "warning",
    size: "large",
    handleWidth: 150,
    labelWidth: 10
  });

  $('.toggle-quiz').bootstrapSwitch({
    onColor: "success",
    offColor: "warning",
    size: "small",
    handleWidth: 30,
    labelWidth: 10,
    animate: true,
    onSwitchChange: function(event, state) {
      clearFlash();
      $.ajax({
        url: '/quizzes/' + this.value + '/toggle_quiz',
        type: 'PATCH',
        data: {'active': this.checked}
      });
    }
  });

});
