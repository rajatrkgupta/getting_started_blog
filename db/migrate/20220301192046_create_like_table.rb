class CreateLikeTable < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.bigint :article_id, null: false
      t.bigint :user_id, null:false
      t.timestamps
    end

    add_index :likes, :article_id
    add_index :likes, :user_id
  end
end
