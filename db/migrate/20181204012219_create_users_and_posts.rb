class CreateUsersAndPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, limit: 16, null:false

      t.timestamps
    end
    add_index :users, :username, unique: true

    create_table :posts do |t|
      t.string :title, null: false
      t.text :body
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
