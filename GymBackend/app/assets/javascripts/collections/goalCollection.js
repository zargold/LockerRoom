var GoalCollection = Backbone.Collection.extend({
  model: Goal,
  initialize: function () {
  console.log('new goalCollection created');

  this.on('add', function (model, collection) {
   console.log("added");
  });
  this.on('remove', function (model, collection) {
   console.log(JSON.stringify(model) + " dish col removed");
  });
 }
});
var goalCollection= new GoalCollection({

})