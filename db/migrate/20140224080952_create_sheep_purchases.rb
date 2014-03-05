class CreateSheepPurchases < ActiveRecord::Migration
  def change
    create_table :sheep_purchases do |t|
      t.float :price
      t.string :place
      t.integer :activity_id
      t.integer :sheep_id
      t.string :comment

      t.timestamps
    end
  end
end
