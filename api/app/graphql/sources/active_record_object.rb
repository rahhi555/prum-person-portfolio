module Sources
  class ActiveRecordObject < GraphQL::Dataloader::Source
    def initialize(model_class)
      @model_class = model_class
    end

    def fetch(ids)
      records = @model_class.where(id: ids)
      ids.map { |id| records.detect { |r| r.id == id.to_i } }
    end
  end
end
