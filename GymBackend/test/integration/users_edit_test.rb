require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
     @user= users(:mikey)
  end

  test "User inputted invalid Edit Info" do
    get edit_user_path(@user)
    patch user_path(@user), user: {
      user_name: "",
      email: "user@invalid.com",
      password: "asdf",
      password_confirmation: "asdf asdf"
    }
    assert_template "users/edit"
  end

  test "User has inputted valid Edit information" do
    
    get login_path
    # @user.sign_in
    get edit_user_path(@user)
    patch user_path(@user), user: {
      user_name: "mikeygun",
      password: "asdfghi",
      password_confirmation: "asdfghi",
      email: "mikeyg@asdfasdf.com"
      }
    assert_redirected_to @user
    assert_not flash.empty?
    @user.reload 
    assert_equal @user.user_name, "mikeygun"
    assert_equal @user.password, "asdfghi"
    assert_equal @user.email, "mikeyg@asdfasdf.com"

  end

end
