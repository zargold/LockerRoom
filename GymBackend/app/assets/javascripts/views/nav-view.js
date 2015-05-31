$(document).ready(function() {
  // View for Navigation Bar
  
  var NavView = Backbone.View.extend({
    el: 'nav#js-Nav',
    events: { 
      'click #users-index'    : 'showUsers',
      'click #compose-goal'   : 'composeGoal',
      'click #compose-workout': 'composeWorkout'
    },

    // renders the ComposeGoalView
    composeGoal: function() {
      console.log("composeGoal");
      currentUser = userCollection.get(signedInUserId).attributes.username;
      createGoalView.show();
    },

    composeWorkout: function(){
      console.log("composeWorkout");
      console.log(CreateGoalView)
      createWorkoutView.show();
    },
    // renders the UsersView
    showUsers: function() {
      console.log("showUsers");
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
      console.log(users);
      var userGoals = users.get(signedInUserId);
      console.log(userGoals);
      goalsView = new GoalsView({collection: userGoals});
      //new UserView({collection: users});
      goalsView.render();
    }
  });
});