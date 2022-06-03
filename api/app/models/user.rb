# == Schema Information
#
# Table name: users
#
#  id                                  :bigint           not null, primary key
#  email(メールアドレス)               :string           not null
#  password_digest(パスワードハッシュ) :string           not null
#  profile(プロフィールの説明文)       :text
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  before_save { email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  def create_jwt_token
    JWT.encode({ user_id: id }, Rails.application.credentials.secret_key_base)
  end
end
