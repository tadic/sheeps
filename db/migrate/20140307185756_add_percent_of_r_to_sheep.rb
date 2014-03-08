class AddPercentOfRToSheep < ActiveRecord::Migration
  def change
    add_column :sheep, :percent_of_r, :float
  end
end
