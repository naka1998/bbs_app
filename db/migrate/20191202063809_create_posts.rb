class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :topic, foreign_key: true
      t.integer :user_id
      t.integer :reply_post_id
      t.string :body

      t.timestamps
    end
  end
end
