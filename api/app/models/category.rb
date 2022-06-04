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
class Category < ApplicationRecord
end
