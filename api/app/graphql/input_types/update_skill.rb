module InputTypes
  class UpdateSkill < Types::BaseInputObject
    description 'スキル更新に必要な項目'
    argument :id, ID, required: true, description: 'id'
    argument :level, Integer, required: true, description: '更新後のレベル'
  end
end
