# frozen_string_literal: true

module ObjectTypes
  class User < Types::BaseObject
    description 'ユーザー'
    field :id, ID, null: false, description: '主キー'
    field :email, String, null: false, description: 'メールアドレス'
    field :profile, String, 'プロフィールの説明文'
    field :avatar, String, 'アバター画像のurl', method: :avatar_url
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: '作成時刻'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: '更新時刻'
    field :skills, [ObjectTypes::Skill], description: '全所持スキル'

    def skills
      require_authorized
      dataloader.with(::Sources::SkillsByUserId).load(object.id)
    end
  end
end
