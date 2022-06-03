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
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email_#{n}@example.com" }
    password { 'password' }
    profile { 'Profile Text' }
  end
end
