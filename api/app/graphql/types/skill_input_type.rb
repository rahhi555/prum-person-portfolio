# frozen_string_literal: true

module Types
  class SkillInputType < Types::BaseInputObject
    description 'スキル作成に必要な項目'
    argument :category_id, Integer, required: true, description: 'カテゴリーid'
    argument :level, Integer, required: true, description: '習得スキルレベル'
    argument :name, String, required: true, description: '習得スキル名'
  end
end
