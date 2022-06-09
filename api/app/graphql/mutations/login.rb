module Mutations
  class Login < BaseMutation
    description 'ユーザーログイン関連'

    field :user, ObjectTypes::User, null: false, description: 'ログインに成功したユーザー'
    field :jwt, String, null: false, description: 'ログインjwt'

    argument :auth_input, Types::AuthInputType, required: true, description: '認証に必要な項目'

    def resolve(auth_input:)
      auth_input.to_hash => { email:, password: }
      user = User.find_by(email:)
      raise GraphQL::ExecutionError, I18n.t('graphql.errors.messages.failed_auth') unless user&.authenticate(password)

      jwt = user.create_jwt
      { user:, jwt: }
    end
  end
end
