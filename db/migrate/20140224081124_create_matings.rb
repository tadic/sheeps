class CreateMatings < ActiveRecord::Migration
  def change
    create_table :matings do |t|
      t.integer :male_id
      t.float :price
      t.integer :activity_id
      t.integer :sheep_id
      t.string :comment

      t.timestamps
    end
  end
end
