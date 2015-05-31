var GoalCollection = Backbone.Collection.extend({
  model: Goal,
  url: "/goals",
  initialize: function(){

  }
});
var goalCollection= new GoalCollection({

})