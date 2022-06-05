# == Schema Information
#
# Table name: skills
#
#  id                        :bigint           not null, primary key
#  level(習得レベル)         :integer
#  name(習得スキル名)        :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  category_id(カテゴリーid) :bigint           not null
#  user_id(ユーザーid)       :bigint           not null
#
# Indexes
#
#  index_skills_on_category_id  (category_id)
#  index_skills_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true, length: { maximum: 255 }
  validates :level, presence: true, numericality: { only_integer: true, in: 1..100 }
end
