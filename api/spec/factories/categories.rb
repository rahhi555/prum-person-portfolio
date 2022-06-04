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
FactoryBot.define do
  factory :category do
    sequence(:name, 'Category Name 1')
  end
end
