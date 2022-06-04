# frozen_string_literal: true

module Types
  class CategoryType < Types::BaseObject
    description 'カテゴリー'
    field :id, ID, null: false, description: 'id'
    field :name, String, null: false, description: 'カテゴリー名'
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: '作成日時'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: '更新日時'
  end
end
