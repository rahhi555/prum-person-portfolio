# frozen_string_literal: true

module Types
  class UserInputType < Types::BaseInputObject
    description 'ユーザー作成に必要な項目'
    argument :email, String, required: true, description: 'メールアドレス'
    argument :password, String, required: true, description: 'パスワード'
  end
end
