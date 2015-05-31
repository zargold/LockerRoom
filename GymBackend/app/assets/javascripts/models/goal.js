var Goal = Backbone.Model.extend({
  url: '/goals',
  initialize: function() {
      this.workouts = new WorkoutCollection();
      this.workouts.url = '/goals/' + this.id + '/workouts';
  }
});