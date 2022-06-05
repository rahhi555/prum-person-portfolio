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
require 'rails_helper'

RSpec.describe Skill, type: :model do
  it { is_expected.to belong_to(:user).required }
  it { is_expected.to belong_to(:category).required }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(255) }

  it { is_expected.to validate_presence_of(:level) }
  it { is_expected.to validate_numericality_of(:level).only_integer }

  it {
    is_expected.to validate_inclusion_of(:level)
      .in_range(1..100)
      .with_message(I18n.t('activerecord.errors.messages.in', count: '1..100'))
  }
end
