class CreateSheep < ActiveRecord::Migration
  def change
    create_table :sheep do |t|
      t.string :code
      t.integer :mother_id
      t.integer :father_id
      t.integer :weight_100_days

      t.timestamps
    end
  end
end
