# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'httparty'

	for i in 2..15
		response = HTTParty.get("https://wger.de/api/v2/exercise/?page=#{i}&format=json")
		
		response["results"].each do |exercise|
			descrip = exercise["description"].gsub("<p>", "")
			descript2 = descrip.gsub("</p>", "")
			descript3 = descript2.gsub("<ul>", "")
			descript4 = descript3.gsub("</ul>", "")
			descript5 = descript4.gsub("<li>", "")
			descript6 = descript5.gsub("</li>", "")

  			Exercise.create(name: exercise["name"], description: descript6)
		end	
	end



Goal.create(exercise_id: 1, reps: 12, weight: 50, user_id: 1)