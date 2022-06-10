module Types
  class QueryType < Types::BaseObject
    description 'クエリ'

    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :current_user, resolver: Queries::CurrentUser, description: 'ログイン中のユーザー'
    field :categories, resolver: Queries::Categories, description: '全カテゴリー'
  end
end
