class CreateLambings < ActiveRecord::Migration
  def change
    create_table :lambings do |t|
      t.integer :date
      t.integer :sheep_id
      t.string :comment

      t.timestamps
    end
  end
end
