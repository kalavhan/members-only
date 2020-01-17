class User < ApplicationRecord
  before_create :generate_token
  before_save :downcase_email
  validates :name, presence: true, length: { minimum: 3 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: { maximum: 255},
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  def remember
    token = User.new_token
    update_attribute(:remember_token, User.digest(token))
  end

  private
    def downcase_email
      self.email.downcase!
    end

    def self.new_token
      SecureRandom.urlsafe_base64
    end

    def self.digest(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

    def generate_token
      token = User.new_token
      self.remember_token = User.digest(token)
    end
end
