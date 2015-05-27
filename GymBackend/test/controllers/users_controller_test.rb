require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user= users(:mikey)
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
    assert_redirected_to login_url
  end

  test "should redirect from update when not logged" do
    patch :update, id: @user, user: { username: @user.username, email: @user.email}
    assert_redirected_to login_url
  end
end
