require 'test_helper'

class UserTest < ActiveSupport::TestCase
#for use in the rest of these validation tests..
  def setup
    @user= User.new(username: "Example User", email: "user@example.net", password:"asdfgi")
  end
#ensure that the original user is valid
  test "should be valid" do
    assert @user.valid?
  end
#ensure that once username is set to "" it is no longer valid
  test "name should be present" do
    @user.username = ""
    assert_not @user.valid?
  end
#Ensure that once the user's email is set to "" it isn't valid anymore
  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
#ensure the password is of a at least a certain length and is not valid if
#you try something 1 less than minimum length.
  test "password should be long" do
    @user.password = "asdf"
    assert_not @user.valid?
  end
#UserName should not be longer than 50 characters long
  test "Username should not be too long" do
    @user.username = "a"*51
    assert_not @user.valid?
  end
#Email should be less than 200 characters..
  test "email should not be too long" do
    @user.email= "a"*201
    assert_not @user.valid?
  end
# Email should accept actually valid yet strange email addresses.
  test "email validation should accept valid addresses" do
    valids = %w[user@example.com r@r.c user.user@r.c USER@f.c]
    valids.each do |val|
      @user.email = val
      assert @user.valid?, "Address #{val.inspect} should be valid"
    end
  end
#email should reject almost valid emails that are not valid
  test "email validation should reject invalid addresses" do
    invalids = %w[user@example,com user_at_foo.org user.username@example. foo@bar_baz.com foo@bar+baz.com]
    invalids.each do |invalid|
      @user.email = invalid
      assert_not @user.valid?
    end
  end
#We check that the email doesn't have duplicates
# by creating duplicate to the above @user
  test "email may not have duplicates!" do
    #create a ruby copy to the object rather than referring to same object.
    duplicate = @user.dup
    duplicate.email = @user.email.upcase 
    @user.save
    #it is not valid because it is copied
    assert_not duplicate.valid?
  end

#that it returns false for authentication when blank
  test "authenticated? false for nil digest" do
    assert_not @user.authenticated?('')
  end

  test "goals should be destroyed with user" do
    @user.save
    @user.goals.create!(exercise_id: 5, reps: 20, weight: 30)
    assert_difference "Goal.count", -1 do
      @user.destroy
    end
  end

  test "should follow and unfollow a user" do
    mikey  = users(:mikey)
    georgy = users(:georgy)
    assert_not mikey.following?(georgy)
    mikey.follow(georgy)
    assert mikey.following?(georgy)
    mikey.unfollow(georgy)
    assert_not mikey.following?(georgy)

  end

end
