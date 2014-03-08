class AddMotherCodeToSheepPurchase < ActiveRecord::Migration
  def change
    add_column :sheep_purchases, :mother_code, :text
  end
end
