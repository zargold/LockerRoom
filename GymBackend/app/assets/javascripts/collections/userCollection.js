var UserCollection = Backbone.Collection.extend({
  model: User,
  url: "/users",
  initialize: function () {
  console.log('User created');

  this.on('add', function (model, collection) {
   console.log(JSON.stringify(model) + " added col")
  });
  this.on('remove', function (model, collection) {
   console.log(JSON.stringify(model) + " col removed");
  });
 }
});

var users = new UserCollection();