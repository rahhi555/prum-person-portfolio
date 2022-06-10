# frozen_string_literal: true

module Mutations
  class CreateSkill < BaseLoginRequireMutation
    description 'ログイン中のユーザーのスキル作成'

    field :skill, ObjectTypes::Skill, null: false, description: '作成したスキル'

    argument :create_skill_input, InputTypes::CreateSkill, required: true, description: 'スキル作成に必要な項目'

    def resolve(create_skill_input:)
      current_user = context[:current_user]
      skill = current_user.skills.build(**create_skill_input)
      raise GraphQL::ExecutionError, skill.errors.full_messages unless skill.save

      { skill: }
    end
  end
end
