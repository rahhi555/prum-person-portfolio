module Types
  class QueryType < Types::BaseObject
    description 'クエリ'

    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [UserType], description: '全ユーザー'
    field :current_user, UserType, description: 'ログイン中のユーザー'
    field :categories, [CategoryType], description: '全カテゴリー'

    def users = User.all

    def categories
      require_authorized
      Category.all
    end

    def current_user
      require_authorized
      context[:current_user]
    end

    private

    def require_authorized
      raise GraphQL::ExecutionError, I18n.t('graphql.errors.messages.not_login') if context[:current_user].blank?
    end
  end
end
