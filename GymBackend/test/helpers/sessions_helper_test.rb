require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
#On initialization of the Sessions Test we want to grab the user from our user.yml
  def setup
    @user = users(:mikey)
    #we grab the user as @user and set them to remember...
    remember(@user)
  end
#This will check that mikey is still logged in... and equals current user
  test "current_user returns CORRECT user when logged in" do
   assert_equal @user, current_user
   assert is_logged_in?
  end
#oppposit to above if they have a new remember digest 
#attribute current user shouldn't exist

  test "current_user returns nil if remember_digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end

end