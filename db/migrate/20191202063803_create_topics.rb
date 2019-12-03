class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :genre_id
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
