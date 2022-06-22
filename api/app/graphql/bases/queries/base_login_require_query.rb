module Queries
  class BaseLoginRequireQuery < GraphQL::Schema::Resolver
    def authorized?(**any)
      raise GraphQL::ExecutionError, I18n.t('graphql.errors.messages.not_login') if context[:current_user].blank?

      true
    end
  end
end
