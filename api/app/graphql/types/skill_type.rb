# frozen_string_literal: true

module Types
  class SkillType < Types::BaseObject
    description 'スキル'
    field :id, ID, null: false, description: 'id'
    field :user_id, Integer, null: false, description: 'ユーザーid'
    field :category_id, Integer, null: false, description: 'カテゴリーid'
    field :name, String, null: false, description: '習得スキル名'
    field :level, Integer, null: false, description: '習得スキルレベル'
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: '作成日時'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: '更新日時'
  end
end
