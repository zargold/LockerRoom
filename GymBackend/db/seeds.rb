require 'httparty'


# for i in 2..15
# 	response = HTTParty.get("https://wger.de/api/v2/exercise/?page=#{i}&format=json")
	
# 	response["results"].each do |exercise|
# 		descrip = exercise["description"].gsub("<p>", "")
# 		descrips = descrip.gsub("</p>", "")
# 			Exercise.create(name: exercise["name"], description: descrips)
# 	end	
# end
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

99.times do |n|
  name = Faker::Name.name
  f_email = "example-#{n+1}@railstutorial.org"
  password= "password"
  User.create!(username: name, email: f_email, password: password, password_confirmation: password)
end


Goal.create(exercise_id: 1, reps: 12, weight: 50, user_id: 1)