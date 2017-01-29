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
//= require jquery.countdown
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
  // rows for quizzes index
  let rows = $('table').find('tr');

  $("#include_semesters_in_course").select2();
  $("#include_students_in_group").select2();
  $("#include_groups_in_quiz").select2();
  $("#include_others_groups_in_quiz").select2();

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
    handleWidth: 80,
    labelWidth: 10,
    animate: true
  });

  function disableSwitchOnStateUp(disabledTime, index_of_timer) {
    setTimeout(function() {
      // $('.async-toggle-quiz').bootstrapSwitch('disabled', false);// Remove disabled.
      $('#async-toggle-quiz' + index_of_timer).bootstrapSwitch('disabled', false);// Apply disabled.
      $('#async-toggle-quiz' + index_of_timer).bootstrapSwitch('state', false);// Success!
      $('#countdown' + index_of_timer).countdown('destroy');
    }, disabledTime);
  }
  function initCounter(quiz_duration, index_of_timer) {
    $('#countdown'+index_of_timer).countdown({until: quiz_duration, compact: true});
  }
  $('.async-toggle-quiz').bootstrapSwitch({
    onColor: "success",
    offColor: "warning",
    size: "small",
    handleWidth: 80,
    labelWidth: 10,
    animate: true,
    onSwitchChange: function(event, state) {
      // get index of a row containing the switch.
      let index_of_switch = rows.index($(this).parents().eq(4));
      let this_quiz_duration = $('#quiz_duration' + index_of_switch).val();
      clearFlash();

      // only for state up
      if (state == true) {
        $(this).bootstrapSwitch('disabled', true);
        disableSwitchOnStateUp(this_quiz_duration*1000, index_of_switch);
        initCounter(this_quiz_duration, index_of_switch);
      }

      $.ajax({
        url: '/ka/quizzes/' + this.value + '/toggle_quiz',
        type: 'PATCH',
        data: {'active': state, 'quiz_duration': this_quiz_duration},
      });
    }
  });

});
