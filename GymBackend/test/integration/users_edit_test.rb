require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
     @user= users(:mikey)
  end

  test "User inputted invalid Edit Info" do
    get edit_user_path(@user)
    patch user_path(@user), user: {
      username: "",
      email: "user@invalid.com",
      password: "asdf",
      password_confirmation: "asdf asdf"
    }
    assert_template "users/edit"
  end

  test "User has inputted valid Edit information" do
    
    get login_path
    # @user.sign_in
    uname= "mikeygun"
    uemail= "mikeyg@asdfasdf.com"
    get edit_user_path(@user)
    patch user_path(@user), user: {
      username: uname,
      password: "",
      password_confirmation: "",
      email: uemail
    assert_redirected_to @user
    assert_not flash.empty?
    @user.reload 
    assert_equal @user.username, uname
    assert_equal @user.email, uemail


  end

end
