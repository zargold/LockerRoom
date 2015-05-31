// This view is referenced in other files, so I declare it outside of the document.ready 
var UsersView;

$(document).ready(function() { 
  // View for a single User
  UserView = Backbone.View.extend({
    tagName: 'li',
    template: _.template($('#user-template').html()),
    // When we click on a username, show their Goals
    events: {'click .username': 'showGoals'},

    // gets the Goals from a User and renders a GoalsView for that user's Goals
    showGoals: function() {
      var tweets = this.model.tweets;
      currentUser = this.model.attributes.username;
      tweets.fetch({
        success: function() {
          new GoalsView({collection: tweets});
        }
      });
    },

    // render the UserView
    render: function() {
      this.$el.html(this.template({user: this.model.toJSON()}));
      return this;
    }
  });

  // View for all Users
  UsersView = Backbone.View.extend({
    tagName: 'ul',
    id: 'users',
    initialize: function() {
      this.render();
    },

    // render the UsersView
    render: function() {
      var el = this.$el;
      $('#content-area').html(el);

      // render a UserView for each User
      this.collection.each(function(user) {
        el.append(new UserView({model: user}).render().el);
      });

      return this;
    }
  });
});