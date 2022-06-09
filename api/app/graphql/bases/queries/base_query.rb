module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    def require_authorized
      raise GraphQL::ExecutionError, I18n.t('graphql.errors.messages.not_login') if context[:current_user].blank?
    end
  end
end
