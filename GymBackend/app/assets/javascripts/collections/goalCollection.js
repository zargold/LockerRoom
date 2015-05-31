var GoalCollection = Backbone.Collection.extend({
  model: Goal,
  url: "/goals"
});
var goalCollection= new GoalCollection;