module Mutations
  class DeleteSkill < BaseLoginRequireMutation
    description 'スキルを削除する'

    field :skill, ObjectTypes::Skill, null: false, description: 'スキル'

    argument :id, ID, required: true, description: 'スキルID'

    def resolve(id:)
      skill = Skill.find(id)
      raise GraphQL::ExecutionError, skill.errors.full_messages unless skill.destroy

      { skill: }
    end
  end
end
