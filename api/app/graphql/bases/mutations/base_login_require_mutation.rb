module Mutations
  class BaseLoginRequireMutation < BaseMutation
    def authorized?(_)
      raise GraphQL::ExecutionError, I18n.t('graphql.errors.messages.not_login') if context[:current_user].blank?

      true
    end
  end
end
