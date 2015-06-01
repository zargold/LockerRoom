// var currentUser; // sets the "current user" for display purposes

// // these Views are referenced in other files, so I declare them outside of the document.ready 

// var CreateWorkoutView;
// var WorkoutsView;

// $(document).ready(function() {
//   // Create Goal View
//   CreateWorkoutView = Backbone.View.extend({
//     // attaches to create-goal-area div
//     el: "#create-workout-area",

//     initialize: function(){
//       console.log(this.goal_id);
//     },
//     // createWorkoutView will appear
//     show: function() {
//       this.$el.show();
//     },

//     // when we click the compose button, we can create a Goal
//     events: { 'click #record': 'createWorkout' },

//     // create a Workout using the contents of the createWorkout Form...
//     createWorkout: function() {
//       // grab the contents from the field
//       var weightField = this.$('#weight');
//       var repsField = this.$('#reps');
//       var weight = weightField.val();
//       var reps = repsField.val();

//       // reset the field
//       weightField.val('');
//       repsField.val('');
//       el = this.$el;

//       // create the Workout
//       this.collection.create({ weight: weight, reps: reps, goal_id: goal_id});

//       // hide the compose form
//       el.hide();

//       goal = goalCollection.get(signedInUserId);
//       currentUser = user.attributes.username;

//       // grab the user's Workouts for their graphical render.
//       goal.workouts.fetch({
//         success: function(workouts) {
//           new GoalsView({collection: workouts});
//         }
//       });
//     }
//   });


//   // View for an individual Goal
//   var WorkoutView = Backbone.View.extend({
//     tagName: 'li',
//     template: _.template($('#workout-template').html()),

//     // add events to edit a Goal, update a Goal, and destroy a Goal.
//     events: {'click .edit-workout-link': 'editWorkout',
//       'click .update-workout-button': 'updateWorkout',
//       'click .delete-workout-link': 'destroyWorkout'},

//     // hide the Workout and show the edit form
//     editGoal: function() {
//       this.$('.workout').hide();
//       this.$('.edit-workout-form').show();
//     },

//     // update a Workout with the message in the text field
//     updateGoal: function() {
//       var newWeight = this.$('.updated-weight').val();
//       var newReps = this.$('.updated-reps').val();
//       this.model.set({weight: newWeight, reps: newReps});
//       this.model.save();
//     },

//     // destroy a Workout
//     destroyWorkout: function() {
//       this.model.destroy();
//     },

//     // render the WorkoutView
//     render: function() {
//       this.$el.html(this.template({workout: this.model.toJSON()}));
//       return this;
//     }
//   });

//   // View for all of the Workouts
//   WorkoutsView = Backbone.View.extend({
//     tagName: 'ul',
//     id: 'workouts',

//     initialize: function() {
//       // Whenever we add, remove, or update a Goal, we re-render the view
//       this.listenTo(this.collection, 'sync add remove', this.render);
//     },

//     // render all the Goals
//     render: function() {
//       var el = this.$el;
//       // remove whatever is in the content-area and the element itself
//       $('#content-area').html('');
//       el.html('');

//       // add a header
//       el.append('<h1>Workouts for ' + currentUser + '</h1>');

//       // render a GoalView for each Goal
//       this.collection.each(function(workout) {
//         el.append(new WorkoutView({model: workout}).render().el);
//       });

//       // add the view to the content-area
//       $('#content-area').html(el);
//       return this;
//     }
//   });
// });