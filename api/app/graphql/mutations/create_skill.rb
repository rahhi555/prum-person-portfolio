# frozen_string_literal: true

module Mutations
  class CreateSkill < BaseLoginRequireMutation
    description 'ログイン中のユーザーのスキル作成'

    field :skill, Types::SkillType, null: false, description: '作成したスキル'

    argument :category_id, ID, required: true, description: 'カテゴリーid'
    argument :level, Integer, required: true, description: '習得レベル'
    argument :name, String, required: true, description: '習得スキル名'

    def resolve(category_id:, name:, level:)
      current_user = context[:current_user]
      skill = current_user.skills.build(category_id:, name:, level:)
      raise GraphQL::ExecutionError, skill.errors.full_messages unless skill.save

      { skill: }
    end
  end
end
