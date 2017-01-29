App.quiz = App.cable.subscriptions.create("QuizChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log(data["timer"]);
  },

  time: function(time) {
    return this.perform('timer_set', {
      timer: time
    });
  }
});
