class User < ActiveRecord::Base
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

end
