class AddForeignKeyToPosts < ActiveRecord::Migration[5.0]
  change_table :posts do |t|
    t.remove :name
    t.integer :user_id
    add_foreign_key :posts, :users
  end
end
