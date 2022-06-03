class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, comment: 'メールアドレス'
      t.string :password_digest, null: false, comment: 'パスワードハッシュ'
      t.text :profile, comment: 'プロフィールの説明文'

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
