# frozen_string_literal: true

module Mutations
  class UpdateSkill < BaseLoginRequireMutation
    description 'スキル更新'

    field :skill, ObjectTypes::Skill, null: false, description: '更新後のスキル'

    argument :id, ID, required: true, description: 'id'
    argument :level, Integer, required: true, description: '更新後のレベル'

    def resolve(id:, level:)
      skill = context[:current_user].skills.find(id)
      raise GraphQL::ExecutionError, skill.errors.full_messages unless skill.update(level:)

      { skill: }
    end
  end
end
