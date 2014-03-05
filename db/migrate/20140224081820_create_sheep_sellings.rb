class CreateSheepSellings < ActiveRecord::Migration
  def change
    create_table :sheep_sellings do |t|
      t.integer :activity_id
      t.integer :sheep_id
      t.float :weight
      t.float :price
      t.string :place
      t.string :comment

      t.timestamps
    end
  end
end
