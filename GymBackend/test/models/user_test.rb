require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user= User.new(username: "Example User", email: "user@example.net", password:"asdfgi")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "password should be long" do
    @user.password = "asdf"
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.username = "a"*51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email= "a"*201
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valids = %w[user@example.com r@r.c user.user@r.c USER@f.c]
    valids.each do |val|
      @user.email = val
      assert @user.valid?, "Address #{val.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalids = %w[user@example,com user_at_foo.org user.username@example. foo@bar_baz.com foo@bar+baz.com]
    invalids.each do |invalid|
      @user.email = invalid
      assert_not @user.valid?
    end
  end
  test "email may not have duplicates!" do
    duplicate = @user.dup
    duplicate.email = @user.email.upcase 
    @user.save
    assert_not duplicate.valid?
  end

  test "authenticated? should return false for user with nil digest" do
  assert_not @user.authenticated?('')
  end
end
