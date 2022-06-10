# frozen_string_literal: true

module Mutations
  class UpdateSkill < BaseLoginRequireMutation
    description 'スキル更新'

    field :skill, ObjectTypes::Skill, null: false, description: '更新後のスキル'

    argument :update_skill_input, InputTypes::UpdateSkill, required: true, description: '更新に必要な項目'

    def resolve(update_skill_input:)
      update_skill_input.to_hash => { id:, level: }
      skill = context[:current_user].skills.find(id)
      raise GraphQL::ExecutionError, skill.errors.full_messages unless skill.update(level:)

      { skill: }
    end
  end
end
