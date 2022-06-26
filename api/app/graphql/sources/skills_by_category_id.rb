module Sources
  class SkillsByCategoryId < GraphQL::Dataloader::Source
    def initialize
      @model_class = ::Skill
    end

    def fetch(ids)
      category_ids = ids.pluck(:category_id)
      user_ids = ids.pluck(:user_id)
      records = @model_class.where(category_id: category_ids, user_id: user_ids)
                            .group_by(&:category_id)
      category_ids.map { |id| records[id] || [] }
    end
  end
end
