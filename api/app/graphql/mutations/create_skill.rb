# frozen_string_literal: true

module Mutations
  class CreateSkill < BaseLoginRequireMutation
    description 'ログイン中のユーザーのスキル作成'

    field :skill, Types::SkillType, null: false, description: '作成したスキル'

    argument :skill_input, Types::SkillInputType, required: true, description: 'スキル作成に必要な値'

    def resolve(skill_input:)
      current_user = context[:current_user]
      skill = current_user.skills.build(**skill_input)
      raise GraphQL::ExecutionError.new skill.errors.full_messages, extensions: skill.errors.to_hash unless skill.save

      { skill: }
    end
  end
end
