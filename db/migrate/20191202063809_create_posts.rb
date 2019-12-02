class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :topic, foreign_key: true
      t.references :user, foreign_key: true
      t.string :poster_name
      t.string :body

      t.timestamps
    end
  end
end
