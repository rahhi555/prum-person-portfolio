module Queries
  class CurrentUser < Queries::BaseLoginRequireQuery
    type ObjectTypes::User, null: false

    def resolve
      context[:current_user]
    end
  end
end
