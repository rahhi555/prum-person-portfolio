module Sources
  class SkillsByUserId < GraphQL::Dataloader::Source
    def initialize
      @model_class = ::Skill
    end

    def fetch(ids)
      records = @model_class.where(user_id: ids)
                            .group_by(&:user_id)
      ids.map { |id| records[id] || [] }
    end
  end
end
