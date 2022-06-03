# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation
    description '新規ユーザー作成'

    field :user, Types::UserType, null: false, description: 'ユーザー'

    argument :auth_input, Types::AuthInputType, required: true, description: 'メールアドレス及びパスワード'

    def resolve(auth_input:)
      user = ::User.new(**auth_input)
      raise GraphQL::ExecutionError.new 'ユーザー作成に失敗しました', extensions: user.errors.to_hash unless user.save

      { user: }
    end
  end
end
