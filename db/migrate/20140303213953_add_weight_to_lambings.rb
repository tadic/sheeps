class AddWeightToLambings < ActiveRecord::Migration
  def change
    add_column :lambings, :weight, :float
  end
end
