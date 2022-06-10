module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    def require_authorized
      raise GraphQL::ExecutionError, I18n.t('graphql.errors.messages.not_login') if context[:current_user].blank?
    end
  end
end
