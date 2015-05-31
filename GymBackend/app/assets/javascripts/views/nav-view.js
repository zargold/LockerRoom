$(document).ready(function() {
  // View for Navigation Bar
  var NavView = Backbone.View.extend({
    el: 'nav',
    events: { 'click #users-index': 'showUsers',
      'click #compose-goal': 'composeGoal'
    },

    // renders the ComposeGoalView
    composeGoal: function() {
      currentUser = userCollection.get(signedInUserId).attributes.username;
      createGoalView.show();
    },

    // renders the UsersView
    showUsers: function() {
      userCollection.fetch({
        success: function() {
          new UsersView({collection: userCollection});
        }
      });
    }
  });

  new NavView(); // initializes a new NavView

  // get all users and set up createGoalView and UsersView
  userCollection.fetch({
    success: function(users) {
      createGoalView = new CreateGoalView({collection: users.get(signedInUserId).goals});
      new UsersView({collection: users});
    }
  });
});