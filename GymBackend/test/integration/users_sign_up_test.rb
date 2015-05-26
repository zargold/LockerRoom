require 'test_helper'

class UsersSignUpTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "Invalid sign up info" do
  get new_user_path
  assert_no_difference 'User.count' do
    post users_path, user: {
      username:"",
      email: "user@invalid",
      password: "foo",
      password_confirmation: "bar"}
    end
    assert_template "users/new"
  end
  test "Validalited sign up info does work" do
    get new_user_path
    assert_difference 'User.count', 1 do
    post_via_redirect users_path, user: {
      username:"Example user",
      email: "example@example.com",
      password: "footsar",
      password_confirmation: "footsar"}
    end
    assert_template "users/show"
  end
end
