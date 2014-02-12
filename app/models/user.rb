class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :remember_token
  has_and_belongs_to_many :projects
  has_secure_password

  before_save {|user| user.email = email.downcase}
  before_create :create_remember_token

  validates :name, presence: true, length: {maximum: 30}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
