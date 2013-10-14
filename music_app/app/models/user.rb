require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :session_token, :password
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  before_validation(on: :create) do
    self.reset_session_token! unless self.session_token
  end
  
  def self.generate_session_token
    token = SecureRandom.urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
  end
  
  def password=(secret)
    self.password_digest = BCrypt::Password.create(secret)
    self.save!
  end
  
  def is_password?(secret)
    # use BCrypt::Password.new not BCrypt::Password.create
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end
  
  def self.find_by_credentials(email, secret)
    user = User.find_by_email(email)
    if user
      user if user.is_password?(secret)
    end
  end
end
