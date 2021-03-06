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
  has_many :skills, dependent: :destroy
  has_one_attached :avatar

  before_save { email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png] },
                     size: { less_than: 5.megabytes }

  has_secure_password

  def create_jwt
    JWT.encode({ user_id: id }, Rails.application.credentials.secret_key_base)
  end

  def avatar_url
    avatar.attached? ? Rails.application.routes.url_helpers.url_for(avatar) : nil
  end
end
