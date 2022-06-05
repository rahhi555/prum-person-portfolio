class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.references :user, null: false, foreign_key: true, comment: 'ユーザーid'
      t.references :category, null: false, foreign_key: true, comment: 'カテゴリーid'
      t.string :name, null: false, comment: '習得スキル名'
      t.integer :level, null: false, comment: '習得レベル'

      t.timestamps
    end
  end
end
