module Queries
  class Categories < Queries::BaseQuery

    type [ObjectTypes::Category], null: true

    def resolve
      require_authorized
      Category.all
    end
  end
end
