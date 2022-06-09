module Types
  class QueryType < Types::BaseObject
    description 'クエリ'

    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :current_user, ObjectTypes::User, description: 'ログイン中のユーザー'
    field :categories, [ObjectTypes::Category], description: '全カテゴリー'

    def current_user
      require_authorized
      context[:current_user]
    end

    def categories
      require_authorized
      Category.all
    end
  end
end
