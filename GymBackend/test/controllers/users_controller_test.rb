require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user=       users(:mikey)
    @other_user= users(:georgy)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  #edit page OR update page verify that they are redirected

  test "should NOT get to edit if not logged" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end
#can we send a patch request with NO user logged in for that session? NO So we try without login to update a specific user and we have no success!
  test "should redirect from update when not logged" do
    patch :update, id: @user, user: { username: @user.username, email: @user.email}
    assert_not flash.empty?
    assert_redirected_to login_url
  end
#can we enter the edit page for a user different than ours?
  test "should redirect edit when logged into wrong user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end
  #can we send an update request for a user different than ours?
  test "should redirect from update when logged into wrong user" do
    log_in_as(@other_user)
    patch :update, id: @user, user: { username: @user.username, email: @user.email}
    assert flash.empty?
    assert_redirected_to root_url
  end

end
