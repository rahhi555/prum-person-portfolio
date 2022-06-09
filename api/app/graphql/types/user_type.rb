# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    description 'ユーザー'
    field :id, ID, null: false, description: '主キー'
    field :email, String, null: false, description: 'メールアドレス'
    field :profile, String, 'プロフィールの説明文'
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: '作成時刻'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: '更新時刻'
    field :skills, [Types::SkillType], description: '全所持スキル'

    def skills
      require_authorized
      dataloader.with(::Sources::SkillsByUserId).load(object.id)
    end
  end
end
