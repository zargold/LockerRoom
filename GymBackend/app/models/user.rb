class User < ActiveRecord::Base
  attr_accessor :remember_token
  before_save {self.email = email.downcase}
  VALIDEMAIL = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i

  validates :username, presence: true, length: { minimum: 5, maximum: 50 }

  validates :email,
  presence: true, 
  length: { minimum: 5, maximum: 200},
  format: { with: VALIDEMAIL },
  uniqueness: { case_sensitive: false}

  validates :password, length: {
    minimum: 5, maximum: 200 }, 
    presence: true


  has_secure_password
#Returns a hash digest of any string! using bcrypt...
  def User.digest(string)
    cost= ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end
#Remembers a user's authentication token in the database for persistence...
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
  #Checks whether something is authentic based on the Remember token From the cookie!
  def authenticated?(remember_token)
    #this is required to prevent certain multibrowser usage edge case where a user logged out in one browser but they were still signed in, for another...
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
