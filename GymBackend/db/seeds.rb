# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'httparty'

response = HTTParty.get('https://wger.de/api/v2/exercise/?format=json')

response["results"].each do |exercise|
  Exercise.create(name: exercise["name"], description: exercise["description"])
end

Goal.create(exercise_id: 1, reps: 12, weight: 50, user_id: 1)
