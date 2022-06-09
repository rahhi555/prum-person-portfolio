# frozen_string_literal: true

module ObjectTypes
  class Skill < Types::BaseObject
    description 'スキル'
    field :id, ID, null: false, description: 'id'
    field :user, ObjectTypes::User, null: false, description: 'このスキルを所持しているユーザー'
    field :category, ObjectTypes::Category, null: false, description: 'このスキルが所属しているカテゴリ'
    field :name, String, null: false, description: '習得スキル名'
    field :level, Integer, null: false, description: '習得スキルレベル'
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: '作成日時'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: '更新日時'

    def user = dataloader.with(Sources::ActiveRecordObject, ::User).load(object.user_id)
    def category = dataloader.with(Sources::ActiveRecordObject, ::Category).load(object.category_id)
  end
end
