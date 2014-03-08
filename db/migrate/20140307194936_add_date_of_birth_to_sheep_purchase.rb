class AddDateOfBirthToSheepPurchase < ActiveRecord::Migration
  def change
    add_column :sheep_purchases, :date_of_birth, :integer
  end
end
