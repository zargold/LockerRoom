require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
     @user= users(:mikey)
  end

  test "User inputted invalid Edit Info" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template "users/edit"
    patch user_path(@user), user: {
      username: "",
      email: "user@invalid.com",
      password: "asdf",
      password_confirmation: "asdf asdf"
    }
    assert_template "users/edit"
  end 

  test "User has inputted valid Edit information" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template "users/edit"
    uname= "mikeygun"
    uemail= "mikeyg@asdfasdf.com"
    patch user_path(@user), user: {
      username: uname,
      password: "",
      password_confirmation: "",
      email: uemail
    }
    assert_redirected_to @user
    assert_not flash.empty?
    @user.reload 
    assert_equal @user.username, uname
    assert_equal @user.email, uemail


  end

  test "Friendly forwarding should apply to attempt for edit" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    assert_template "users/edit"
    patch user_path(@user), user: {
      username: "",
      email: "user@invalid.com",
      password: "asdf",
      password_confirmation: "asdf asdf"
    }
    assert_template "users/edit"
  end 

end
