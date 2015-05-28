require 'httparty'


# for i in 2..15
# 	response = HTTParty.get("https://wger.de/api/v2/exercise/?page=#{i}&format=json")
	
# 	response["results"].each do |exercise|
# 		descrip = exercise["description"].gsub("<p>", "")
# 		descrips = descrip.gsub("</p>", "")
# 			Exercise.create(name: exercise["name"], description: descrips)
# 	end	
# end
filtered=[]
REMOVELANG=/([äßÜüäöБгпдляшиэбчыжющцфČúéýšžęłś]|der\b|die\b|mit\b|sbarra\b|Raz|de\b|Grudi\b|schenk|Auf\b)/

for i in 2..15
	response = HTTParty.get("https://wger.de/api/v2/exercise/?page=#{i}&format=json")
	filtered+=response["results"]
  .compact
  .reject {|exercise| 
    (exercise["description"].length<1)||
    exercise["description"].match(REMOVELANG)||exercise["name"].match(REMOVELANG)}
end
filtered.uniq.each{|ex| 
  descrip = ex["description"].gsub(/<(\/[a-z]{1,}|[a-z]{1,})>/, "") 
  Exercise.create(name: ex["name"], description: descrip)
}
#Create an admin!
User.create!(username: "sudoroot", password: "asdf1234", password_confirmation: "asdf1234", email: "cyberninjajuice@gmail.com", admin: true)

99.times do |n|
  name = Faker::Name.name
  f_email = "example-#{n+1}@example.com"
  password= "password"
  User.create!(username: name, email: f_email, password: password, password_confirmation: password)
end


Goal.create(exercise_id: 1, reps: 12, weight: 50, user_id: 1)