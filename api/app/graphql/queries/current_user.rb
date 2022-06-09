module Queries
  class CurrentUser < Queries::BaseQuery
    type ObjectTypes::User, null: true

    def resolve
      require_authorized
      context[:current_user]
    end
  end
end
