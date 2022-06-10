# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation
    description '新規ユーザー作成'

    field :user, ObjectTypes::User, null: false, description: 'ユーザー'

    argument :auth_input, InputTypes::Auth, required: true, description: 'メールアドレス及びパスワード'

    def resolve(auth_input:)
      user = ::User.new(**auth_input)
      raise GraphQL::ExecutionError, user.errors.full_messages unless user.save

      { user: }
    end
  end
end
