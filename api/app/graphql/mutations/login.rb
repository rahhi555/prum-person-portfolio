module Mutations
  class Login < BaseMutation
    description 'ユーザーログイン関連'

    field :user, Types::UserType, null: false, description: 'ログインに成功したユーザー'
    field :token, String, null: false, description: 'ログイントークン'

    argument :auth_input, Types::AuthInputType, required: true, description: '認証に必要な項目'

    def resolve(auth_input:)
      auth_input.to_hash => { email:, password: }
      user = User.find_by(email:)
      raise GraphQL::ExecutionError, I18n.t('graphql.errors.messages.failed_auth') unless user&.authenticate(password)

      token = user.create_jwt_token
      { user:, token: }
    end
  end
end
