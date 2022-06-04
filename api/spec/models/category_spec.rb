# == Schema Information
#
# Table name: categories
#
#  id                 :bigint           not null, primary key
#  name(カテゴリー名) :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:name).is_at_most(255) }

  it do
    FactoryBot.create(:category)
    expect(subject).to validate_uniqueness_of(:name)
  end
end
