class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.references :genre, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
