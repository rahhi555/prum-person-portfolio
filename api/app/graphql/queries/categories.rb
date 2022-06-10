module Queries
  class Categories < Queries::BaseLoginRequireQuery
    type [ObjectTypes::Category], null: true

    def resolve
      Category.all
    end
  end
end
