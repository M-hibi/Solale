class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :body, null: false
      t.boolean :is_active, null: false, default: 0
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
