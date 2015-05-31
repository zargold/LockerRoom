var User = Backbone.Model.extend({
  url: '/users',
  initialize: function() {
      this.workouts = new WorkoutCollection();
      this.workouts.url = '/goals/' + this.id + '/workouts';
  }
});