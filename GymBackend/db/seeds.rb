# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Goal.create(exercise_id: 1, reps: 12, weight: 50, user_id: 1)
Exercise.create(name: "Curl", description: "Stand up straight with a dumbbell in each hand. Curl the the weights while contracting your biceps.")
