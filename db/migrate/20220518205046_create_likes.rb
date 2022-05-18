class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.string :liked_to_type, null: false
      t.integer :liked_to_id, null: false
      t.timestamps
    end

    add_index :likes, [:liked_to_type, :liked_to_id]
    add_index :likes, :user_id
  end
end
