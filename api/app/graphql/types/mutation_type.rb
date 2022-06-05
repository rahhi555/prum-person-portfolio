module Types
  class MutationType < Types::BaseObject
    description 'ミューテーション'
    field :login, mutation: Mutations::Login, description: 'ログイン'
    field :create_user, mutation: Mutations::CreateUser, description: 'ユーザー作成'
    field :create_skill, mutation: Mutations::CreateSkill, description: 'スキル作成'
  end
end
