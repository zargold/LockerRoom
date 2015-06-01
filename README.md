# GYM LOCKER ROOM!

User can :
-Sign up and sign in with user namme, email, password
-Set and view current goals
-View past goals
-View excercises (name, description)
-Add excercises	
-Log actual workout data
-Compare actual workout data to goals
-View a graphical representation of goal progress and/or completion
***Future Versions***
-Add and select excercises by tag, difficulty, type, category. 
-View video reference of excercise
-Search excercise by name.

* Ruby version


ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-darwin14]
Rails 4.2.1

* Configuration
 

`Development`
* Database creation


Currently SQLite3
* Database initialization


`rake db:migrate db:seed`

* How to run the test suite
`rake test`
(Runs over 60 MiniTests)
* Services (job queues, cache servers, search engines, etc.)



Deployment instructions


* Ensure Cookies are enabled...
Guide to deploy:

Initial Guide:

* cd into ~/LockerRoom/Gymbackend
* type bundle
* If you receive an error you may have to gem install individual gems or even brew install pg
* type bundle update (just to be sure)
* If everything is good type rake db:migrate db:seed
* This will take a while because we are seeding a lot of data that is filtered thoroughly.

Next:

* cd into ~/LockerRoom/GymBackend/app/assets/javascripts
* type: mkdir libraries
* cd libraries
* curl -O http://backbonejs.org/backbone.js
* curl -O http://underscorejs.org/underscore.js

You now have all of the dependencies for the code. You may choose to rails s from ~/LockerRoom/GymBackend or if on digital ocean/heroku:

* cd ~/LockerRoom/GymBackend
* puma server -p80
* Enter your IP address into a browser and enjoy!
