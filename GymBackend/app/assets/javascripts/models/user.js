var User = Backbone.Model.extend({
  url: '/users',
  initialize: function() {
      this.goals = new GoalCollection();
      this.goals.url = '/users/' + this.id + '/goals';
  }
});