module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser, description: 'ユーザー作成'
  end
end
