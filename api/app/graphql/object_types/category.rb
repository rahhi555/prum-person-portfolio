# frozen_string_literal: true

module ObjectTypes
  class Category < Types::BaseObject
    description 'カテゴリー'
    field :id, ID, null: false, description: 'id'
    field :name, String, null: false, description: 'カテゴリー名'
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: '作成日時'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: '更新日時'
    field :skills, [ObjectTypes::Skill], description: '全所属スキル'

    def skills
      require_authorized
      dataloader.with(Sources::SkillsByCategoryId).load(object.id)
    end
  end
end