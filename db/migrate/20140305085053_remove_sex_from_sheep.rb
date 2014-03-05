class RemoveSexFromSheep < ActiveRecord::Migration
  def change
    remove_column :sheep, :sex, :text
  end
end
