require 'test_helper'

class UsersSignUpTest < ActionDispatch::IntegrationTest

  #When you were signing up did you put correct info or did you mess up?
  test "Invalid sign up info" do
  get new_user_path
  #Try to sign up with wrong information does the number of Users stay how it was?
  #check to make sure there was no difference in User Count.
  assert_no_difference 'User.count' do
    #put in correct information to the post and make sure no user added.
    post users_path, user: {
      username:"",
      email: "user@invalid",
      password: "foo",
      password_confirmation: "bar"}
    end
    #make sure you go to the right path which is the sign up path again.
    assert_template "users/new"
  end
  #Now lets try with some good data?
  test "Validated sign up info does work" do
    #start at the login page
    get new_user_path
    #this time we check the USer count went up..
    assert_difference 'User.count', 1 do
    #Try with good data to post to the users path...
    post_via_redirect users_path, user: {
      username:"Example user",
      email: "example@example.com",
      password: "footsar",
      password_confirmation: "footsar"}
    end
    #Make sure you are in the correct route and you are logged in.
    assert_template "users/show"
    assert is_logged_in?
  end
end
