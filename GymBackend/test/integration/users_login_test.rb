require('test_helper')

class UsersLoginTest < ActionDispatch::IntegrationTest
#again we retreive mikey as the user from our user.yml
  def setup
    @user = users(:mikey)
  end
#we try to login with incorrect data...
  test "login with invalid info" do
    #step 1 we go to login path
    get login_path
    #step 2 we submit empty strings to the login page 
    post login_path, session: {email: "", password: ""}

    #we should see now again the new path for login because we failed to 
    #meet authentication standards...
    assert_template "sessions/new"
    #we are checking whether the flash message is empty.. it shouldn't be
    assert_not flash.empty?
    #do we go to right place
    #Now that you messed up are you still going to get message?
    get root_path
    #after going to hompage is the flash message empty...
    #this is why we must do flash.now
    assert flash.empty?
  end
#Try to login then log out what happens.
  test "login with valid info followed by logout" do
    get login_path
    #we try valid information this time
    post login_path, session: {email: @user.email, password: "password"}
    #do we go to the right place?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    #after we log in does the nav bar change ensures you see my account+settings
    assert_select "a[href=?]", login_path, count:0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    #then once you do a log out are you logged out and do you once again see the 
    #login path and not the user path and edit user path.
    assert_not is_logged_in?
    assert_redirected_to root_url
    #simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "login with remember me" do
    #ensure remember me actually works we do check the box
    log_in_as(@user, remember_me: "1")
    # weak test do you have a cookie in general that is called remember_token
    #we are not checking if it is the correct remember token
    # we are trusting that because its a 64-bit encryption you have the right one.
    assert_not_nil cookies["remember_token"]
  end
# we do the opposite this time log in without checking the box.
  test "login without remember me" do
    log_in_as(@user, remember_me: "0")
      #remember_token == the same as the one currently on the user's session is ideal...
     #ensure that you don't have a cookie anymore called remember token for this site.
      assert_nil cookies["remember_token"]
  end

end
