class AddIsAliveToLambings < ActiveRecord::Migration
  def change
    add_column :lambings, :is_alive, :boolean
  end
end
