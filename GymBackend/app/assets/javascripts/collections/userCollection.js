var UserCollection = Backbone.Collection.extend({
  model: User,
  url: "/users"
});

var userCollection= new UserCollection;