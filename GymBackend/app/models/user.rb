class User < ActiveRecord::Base
  #required association, allows user.goals association and when a user is deleted by admin then all of their goal's are destroyed...
  has_many :goals, dependent: :destroy
  has_many :exercises, through: :goals
  has_many :workouts, through: :goals
  #used for the ability to actually keep permanent cookies this is the ability to access the generated token.
  attr_accessor :remember_token
  #converts to downcase email... to prevent duplication in db
  before_save {self.email = email.downcase}
  #regex for vaild email A-z at least 1 char then @ symbol then at least 1 letter then a dot then at least 1 letter..
  VALIDEMAIL = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  #username must be at least 5 chars and up to 50...
  validates :username, presence: true, length: { minimum: 5, maximum: 50 }
  #email... uses regex, minlength 5 max 200, casesensitive false
  validates :email,
  presence: true, 
  length: { minimum: 5, maximum: 200},
  format: { with: VALIDEMAIL },
  #allows user to login with any capitalization of their email but must be unique still...
  uniqueness: { case_sensitive: false}
  #min 5 -max 200  for password
  #ensure that updating allows for no password insertion.
  validates :password, length: {
    minimum: 5, maximum: 200 }, 
    allow_blank: true


  has_secure_password
  #Used in testing purposes it applies the BCrypt method to a given string
  #Returns a hash digest of any string! using bcrypt...
  #must be in model for availabity in test... Universally available to the that model.
  def User.digest(string)
    cost= ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
# applies the SecureRandom Gem to the token for the user so that nobody can hack it unless
#they go through 64bit encryption... 
  def User.new_token
    SecureRandom.urlsafe_base64
  end
#Remembers a user's authentication token in the database for persistence...
#As long as cookies are in your browser still you can login without password.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
#when the user signs out we want to get rid of that token from database.
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
