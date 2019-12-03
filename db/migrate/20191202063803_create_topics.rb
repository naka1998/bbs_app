class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :genre
      t.integer :user
      t.string :name

      t.timestamps
    end
  end
end
