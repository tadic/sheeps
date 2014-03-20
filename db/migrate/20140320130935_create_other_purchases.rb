class CreateOtherPurchases < ActiveRecord::Migration
  def change
    create_table :other_purchases do |t|
      t.integer :activity_id
      t.text :what
      t.text :why

      t.timestamps
    end
  end
end
