== README

This README would normally document whatever steps are necessary to get the
application up and running.
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
* 
ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-darwin14]
Rails 4.2.1

* Configuration
`Development`
* Database creation
Currently SQLite3
* Database initialization
`rake db:migrate db:seed`
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
`git clone`
`bundle`
`bundle update` -just to be safe
`rake db:migrate db:seed`
`rails s`
Enter Web-browser: `http://localhost:3000/`
Ensure Cookies are enabled...
