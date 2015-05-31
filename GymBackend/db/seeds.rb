require 'httparty'

filtered=[]
REMOVELANG=/([äßÜüäöБгпдляшиэбчыжющцфČúéýšžęłś]|schritt|schenk|Raz|setz|der\b|die\b|mit\b|sbarra\b|de\b|Grudi\b|Auf\b)/

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
users = User.order(:created_at).take(10)
50.times do |n|
  rando= n+1
  users.each{ |user| user.goals.create!(exercise_id: rando, weight: rando, reps: rando)}
end

goals = Goal.all
15.times do |n|
  ran= n+1
  goals.each{ |goal| goal.workouts.create!(weight: ran, reps: ran)}
end