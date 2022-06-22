# frozen_string_literal: true

module ObjectTypes
  class Category < Types::BaseObject
    description 'カテゴリー'
    field :id, ID, null: false, description: 'id'
    field :name, String, null: false, description: 'カテゴリー名'
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: '作成日時'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: '更新日時'
    field :skills, [ObjectTypes::Skill], description: 'ログイン中のユーザーの全所持スキル'

    # ログイン中のユーザーの全所持スキルを取得する
    def skills
      require_authorized
      user = context[:current_user]
      dataloader.with(::Sources::SkillsByUserId).load(user.id)
    end
  end
end
