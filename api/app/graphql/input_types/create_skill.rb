module InputTypes
  class CreateSkill < Types::BaseInputObject
    description 'スキル作成に必要な項目'
    argument :category_id, ID, required: true, description: 'カテゴリーid'
    argument :level, Integer, required: true, description: '習得レベル'
    argument :name, String, required: true, description: '習得スキル名'
  end
end
