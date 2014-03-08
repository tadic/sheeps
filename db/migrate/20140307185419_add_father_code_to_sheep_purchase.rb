class AddFatherCodeToSheepPurchase < ActiveRecord::Migration
  def change
    add_column :sheep_purchases, :father_code, :text
  end
end
