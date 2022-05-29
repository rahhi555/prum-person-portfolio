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
require 'rails_helper'

RSpec.describe User, type: :model do
  # validate_uniqueness_ofは事前にデータが1件も存在しないと失敗するため、あらかじめuserを作成する
  let!(:user) { create(:user) }
  let(:build_user) { build(:user) }

  context 'メールアドレス' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to(validate_length_of(:email).is_at_most(255)) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    it 'フォーマットが正しい場合、検証に成功すること' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid, "#{valid_address.inspect} should be valid"
      end
    end

    it 'フォーマットが正しくない場合、検証に失敗すること' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid, "#{invalid_address.inspect} should be invalid"
      end
    end

    it '保存前に小文字になること' do
      mixed_case_email = 'Foo@ExAMPle.CoM'
      build_user.email = mixed_case_email
      build_user.save
      expect(build_user.reload.email).to eq mixed_case_email.downcase
    end
  end

  context 'password' do
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    it { is_expected.to have_secure_password }
  end
end
