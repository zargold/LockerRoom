$(document).ready(function() {
  // View for Navigation Bar
  var NavView = Backbone.View.extend({
    el: 'nav#jsNav',
    events: { 
      'click #users-index'    : 'showUsers',
      'click #compose-goal'   : 'composeGoal',
      'click #compose-workout': 'composeWorkout'
    },

    // renders the ComposeGoalView
    composeGoal: function() {
      currentUser = UserCollection.get(signedInUserId).attributes.username;
      createGoalView.show();
    },

    composeWorkout: function(){
      createWorkoutView.show();
    },
    // renders the UsersView
    showUsers: function() {
      userCollection.fetch({
        success: function() {
          new UsersView({collection: UserCollection});
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