module Sources
  class SkillsByCategoryId < GraphQL::Dataloader::Source
    def initialize
      @model_class = ::Skill
    end

    def fetch(ids)
      records = @model_class.where(category_id: ids)
                            .group_by(&:category_id)
      ids.map { |id| records[id] || [] }
    end
  end
end
