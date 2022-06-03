module Mutations
  class BaseLoginRequireMutation < BaseMutation
    def authorized?(_)
      raise GraphQL::ExecutionError, t('graphql.errors.messages.not_login') if context[:current_user].blank?
    end
  end
end
