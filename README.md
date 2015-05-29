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



* Deployment instructions

1 `git clone`
2 `bundle`
3 `bundle update` -just to be safe
4 `rake db:migrate db:seed`
5 `rails s`
6 Enter Web-browser: `http://localhost:3000/`
7 Ensure Cookies are enabled...
